Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAnuW-0005Hc-Rr
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 20:43:00 +0100
Received: by wibhj13 with SMTP id hj13so1083431wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 12:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=aFHH0/klUSlI0Lu3KOFwfDS9trWpbMpfy2PoGT/cxKA=;
	b=dZ+IDQ4U1kPS0ij3lpWbzj/vouqjJfrD9PtzsmxWdFWazir5mJlXSac21rnQ2lV8c6
	zqvI6RQU8pwDpzmDpbgGecAOI3hXRHzNMQaTq46MgnSgDhppOoLJlQP9TyNPmodTBK89
	cACFO3BnmCkQ3jpgXoSp62ZQ21gJp6QImZv3ta3x3k9FrY4nqjrps+F1nt5xbm2VxTrQ
	l7rBDF1Lfb2mXLHuQXevTacxliNdbzH6c0gvXh11t2y2FoYYqy2bRSjXgd0ArrQTyd5t
	ojgiGcnVtJw4IIIbszQOgVftjMilmr0VjjOGnBJz4h+Jy6wyUgL3K2NfZSyd6KMjR4No
	SOQQ==
Received: by 10.180.107.101 with SMTP id hb5mr260869wib.7.1332444845624;
	Thu, 22 Mar 2012 12:34:05 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id e6sm7505020wix.8.2012.03.22.12.34.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 12:34:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 22 Mar 2012 20:34:10 +0100
Message-Id: <E67D3882-EE14-4CEB-9FDC-E8E99EA0ADB0@dominion.thruhere.net>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkvsSP04FrkJWV4r+vnJy/Y79DCpIIcdG/oJd7e1oEe6g8ZQBhNQltARQr+yn6LevwlZv3b
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 19:43:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 20:15 heeft Andreas M=FCller het volgende =
geschreven:

> * Before this patch every inheritance of this class rebuilt the full =
icon cache at the first boot.
> * With this patch the icon cache will only be build once at the first =
boot and on pkg installations that require it.
> * This patch reduces the time needed for the first boot from 96 =
minutes to 5 minutes on the test machine.
> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") & =
from scratch
> * Run-tested with systemd and opkg

Wouldn't adding it to the opkg intercept code (and likely rpm as well) =
be a better idea?

regards,

Koen=


