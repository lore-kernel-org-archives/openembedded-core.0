Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC2870257
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:20:34 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so1230696oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2PvzfJyimSt9kzejHI03tAlHggUTZul9HJkvklpF28Q=;
	b=HauFQrlSZvdkko7Pi+6bv2EnT9a258XLCXnxj4tB4KitPLVyUvN93UQZ4Ze4vYToLW
	Z2juTUvj1F1YI/aI2tUbl3oLpL8B9wM4JB44VFpniHxW0mXfjMkCK+4bQcBfi/YWnJcB
	uOnk1V7z9PPGSxEiCZ7W2TBnXP65GYPYD72VSmgeSLy0j7tPmpHIPCHLH2XEkG5JGwdv
	x3HBcaxIeXyUchzU/fACrpG5iEs1avM3w+r2XYzQJCvxNmcS9Ug5EmoeVATpTqA9eWiA
	o4fu3oXL58tfgDoAlGNcc3n5VYYnoAnGpEK0zgGwzdy3/OgjrCkhAuxuQWxuUNUnMOWa
	KtJg==
MIME-Version: 1.0
X-Received: by 10.182.121.170 with SMTP id ll10mr37690972obb.58.1405527635121; 
	Wed, 16 Jul 2014 09:20:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Wed, 16 Jul 2014 09:20:35 -0700 (PDT)
In-Reply-To: <CAJTo0LZsyR6W_jYvAg9PJ3R-14bb2r962o1TLESQ7nRReKH_PA@mail.gmail.com>
References: <1405460022-20428-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LZsyR6W_jYvAg9PJ3R-14bb2r962o1TLESQ7nRReKH_PA@mail.gmail.com>
Date: Wed, 16 Jul 2014 13:20:35 -0300
X-Google-Sender-Auth: jRF1CBWhKReR4U-HHy1QHUvugfY
Message-ID: <CAP9ODKq1B+u4oAGJyrtmAA-UQ9_sCcghpUxqT63XLD3BuQwSzA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 16 Jul 2014 16:20:36 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 12:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 15 July 2014 22:33, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> -PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland directfb', 'gtk+', '', d)}"
>> +PACKAGECONFIG ??= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk+', '', d)}"
>>  PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
>
> Some tools use GTK+2 and some use GTK+3, so as GTK+ 2 has DirectFB
> support you could add pkgconfigs for gtk2 and gtk3, and still get some
> tools when using directfb.
>
> Then again, the packageconfig doesn't add any determinism so this is
> fairly broken anyway.

Yes I know but I don't think it is worth it at this moment. The build
is broken now and most users been using X11 so I think it is not a
blocker.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

