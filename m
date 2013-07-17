Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 590F86B271
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 12:07:51 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so1310788vbe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=EThDl+9PnIWF1wb9blhFNRd4UZ8kNJ6AQ2tRy/z6bqw=;
	b=pKn7/yj7o1ABQ9pXW08S8+lLv3eZP26MJgELOR2alqFBF7vNdn+HUhHsB2/AUET2NE
	FNdZfHI7BI64TYjjaAWgAKFI7qBv9E5A2ErWGliiBopwPXuabbzZSyIQWYEl+xLr15e9
	kS/RIg73rvxjoEjcKlt3z1CVtk1m/TC9VToQKaeU/Cks9+4BSdecGt9pXa5R88ekhHj7
	nx17eZpxj1Zxqa++XfRDIeZ3eiDheBnz/uBnl70b8fhA6+nd+VIedNmGgOZiizbLJSi5
	vK+dr7fqwZqc/Klz9k15vSTvFpF26VbAHTxcV7YjbW0mlEQSBZ80GY1OVP34ZtuKAu2w
	YVYg==
X-Received: by 10.58.233.8 with SMTP id ts8mr1943805vec.44.1374062871846; Wed,
	17 Jul 2013 05:07:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 17 Jul 2013 05:07:31 -0700 (PDT)
In-Reply-To: <1374050497-20809-1-git-send-email-ming.liu@windriver.com>
References: <1374050497-20809-1-git-send-email-ming.liu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 17 Jul 2013 13:07:31 +0100
Message-ID: <CAJTo0LZ+FnMvQ+b0orzchp2Aez4TB6_DYgCgr3wugc5ZDM4P7g@mail.gmail.com>
To: Ming Liu <ming.liu@windriver.com>
X-Gm-Message-State: ALoCoQnVtmfCJ+ZwQmeep4+NiN//FfxR1ZG53tVBt8Q8gYCSAZ+DRoHv0pZpucf22CHwF1pRcE6H
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] util-linux: replace += with _append to EXTRA_OECONF_class-native
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
X-List-Received-Date: Wed, 17 Jul 2013 12:07:51 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2013 09:41, Ming Liu <ming.liu@windriver.com> wrote:
> +EXTRA_OECONF_append_class-native = "--disable-fallocate --disable-use-tty-group"
> +EXTRA_OECONF_append_class-nativesdk = "--disable-fallocate --disable-use-tty-group"

_append won't add a leading space so you're making a massive
assumption here, please add a leading space for safety.

Ross

