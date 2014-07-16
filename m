Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 419CE70589
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:43:18 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id s7so826992qap.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O9xoJMHTjkjsh8o7rEBXlxd1UliEwJ6jcEA0MR/PVRs=;
	b=GP8I0DQgh3211Vqhy4CTQt7p+FHZVzPVADNXOoj3xPsefj6NYO510Lyofj1fOag7Jh
	EVm6hX0bxIquf83LawPMTRHtgAn4rdwKibhDErIheYeDu3pIucZnNuXkOORQ6j5U8L02
	2bXA2mX89V8NthdX9TiZ8zISksVtYcZ6tCpKfP7ipsv7z6S+QXTS26UjCDMc7TMU6cET
	J0pbZDE+in8kpn3/W9HIwsr/TGhqqOFvLRUaeT1rJIc6aOa9JD2KWtDs8eXlgZ9x/25i
	XhZPFQx8knMSoB+a8GYZ6JR5lGZc9sK7u+qz6Rlgsux8RVYN19rnj/lyhBWHe1kjKEl5
	EN2g==
X-Gm-Message-State: ALoCoQn8ldMPMiAGFOK7cIMhyEKy/6OgzzqM+F0nDdUerLRouyNsPQ/xg0EykbKiGia4QpTWGS3B
X-Received: by 10.224.167.136 with SMTP id q8mr45834259qay.35.1405525399108;
	Wed, 16 Jul 2014 08:43:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 16 Jul 2014 08:42:59 -0700 (PDT)
In-Reply-To: <1405460022-20428-1-git-send-email-otavio@ossystems.com.br>
References: <1405460022-20428-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 16:42:59 +0100
Message-ID: <CAJTo0LZsyR6W_jYvAg9PJ3R-14bb2r962o1TLESQ7nRReKH_PA@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-tools: Disable use of GTK+ when using DirectFB
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jul 2014 15:43:19 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 22:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
> -PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', 'gtk+', '', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"
>  PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"

Some tools use GTK+2 and some use GTK+3, so as GTK+ 2 has DirectFB
support you could add pkgconfigs for gtk2 and gtk3, and still get some
tools when using directfb.

Then again, the packageconfig doesn't add any determinism so this is
fairly broken anyway.

Ross

