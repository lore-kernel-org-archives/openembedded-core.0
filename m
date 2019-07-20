Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id B878D7D3A6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 02:31:26 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id t8so24730867qkt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 19:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5HzprUwsY5fqZMG8J9nL9Av6QYmMZ5eJ1Kde+GOcaDU=;
	b=gFyUhPHny4pX7zNBBWRo0FP7/HElTTUTkjp0m6nCp/JmDuZlxEJLiMGBykTatjpMl3
	KWGSfdY08Nl5jglsKG64Q/szHaAzJrdkKUmFrc/mOlGvY4c4Q2WxF5SR64Te6/MJxKq/
	xiuKYGpd2ZZwAFMnBqC3diZqF588rIqpQV2RhT3d3vbdJ3noJ4c1kjXjr20xj1hjxo4O
	bpVmGyrlvDgVVKBcH2H6Qwmeec7Yim1fYKqjMnQTmheqTRObqV0AKjZ5eZ1KFEDp26Fv
	fdfQgtw5bwgxVrEHhOjn0pjJUJmVXqqWzRJQkoJOQOuZhgG12LCvb0iox9KDsqQGa+SL
	ttmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5HzprUwsY5fqZMG8J9nL9Av6QYmMZ5eJ1Kde+GOcaDU=;
	b=Ffbbs4T1oIqR5vo+Wtnq9tN4zHEL9PxRvua4NvfpISRIHBJCMkjq/yNuvwSJow/KKS
	WMSMbRE/xzrBEGfUdtfAtQGQWCfPiOPiWe6cWvJThk5zJL6Qt73VA1RqSwlYYBEbrNCB
	BDEi9jf4bRvxT3UyZ7mgNP7s1Bv2Jx8ruRuwSyAXFvYY+5cXRnvBWqBcKzSvvq3KQtZy
	Kt1WIcWokBnNqwAAhkfPbGKU+18zp0aDcyHz0OWKVeYohUk3Z7cdhWbLEnDKcFglZiiM
	ZyZy+DXGGShJ3E9UNDh2ySRxPum5+65WuC10NEElmw02CjmDCWrKXlUUc7VtuF1ODp1Z
	gT3A==
X-Gm-Message-State: APjAAAWidC0JwRek1ZkWNd+2m1r8dbCeVSGUs/iP/butP8NuUg9NVj3b
	n04DEwunV6hGXhS2ozNSQ8VAT1IR0YJe0AUaBYs=
X-Google-Smtp-Source: APXvYqw4QsTjMxRF3YfiG9m6bYiwPkUmTcR15a6pCAjjhVwiepQldtvnXGwGVkL+g9bsh99N7cQS9BCuNERP+UrARVo=
X-Received: by 2002:a37:7083:: with SMTP id l125mr36261500qkc.71.1563589887327;
	Fri, 19 Jul 2019 19:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <1563354517-31850-1-git-send-email-mikko.rapeli@bmw.de>
	<a098852b41fcdb4adcda5060a3fd87694391e0ea.camel@linuxfoundation.org>
	<20190717122439.GD3459@hiutale>
In-Reply-To: <20190717122439.GD3459@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Jul 2019 19:31:12 -0700
Message-ID: <CAMKF1spxD5J1iCxnvvAfZWHg2W=_i7wciFyBtiZLssCATCfUMg@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: enable unicode support
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
X-List-Received-Date: Sat, 20 Jul 2019 02:31:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 17, 2019 at 5:24 AM <Mikko.Rapeli@bmw.de> wrote:
>
> On Wed, Jul 17, 2019 at 12:44:54PM +0100, Richard Purdie wrote:
> > On Wed, 2019-07-17 at 12:08 +0300, Mikko Rapeli wrote:
> > > While creating and deleting files with unicode or other
> > > encodings works, it's annoying when ls and other core utils
> > > show questionmarks instead of the unicode characters.
> > > In 2019, it's quite common that users of embedded devices
> > > based on yocto need unicode support. Debugging a box with
> > > unicode encoded file names is a bit annoying when core utils
> > > from busybox don't support them.
> > >
> > > The unicode config fragment has the same config as Debian in their
> > > deb and udeb builds of version 1:1.30.1-4.
> > >
> > > If developers do not want this or other default yocto features in
> > > busybox,
> > > or optimize the configuration for size, then they likely run a
> > > completely
> > > custom configuration. Thus I think it's safe to enable unicode
> > > support
> > > by default.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
> > > ---
> > >  meta/recipes-core/busybox/busybox/unicode.cfg | 10 ++++++++++
> > >  meta/recipes-core/busybox/busybox_1.31.0.bb   |  1 +
> > >  2 files changed, 11 insertions(+)
> > >  create mode 100644 meta/recipes-core/busybox/busybox/unicode.cfg
> >
> > Can you give an idea of the size implications of this change?
>
> buildhistory isn't working for me, or maybe it is since the size difference
> is zero bytes for busybox binaries and package. tmp has this patch,
> tmp_master doesn't:
>
> $ ls -l tmp*/deploy/images/qemux86/tmp/bin/busybox.*
> -rwxr-xr-x 1 mcfrisk mcfrisk 612024 Jul 17 10:45 tmp/deploy/images/qemux86/tmp/bin/busybox.nosuid
> -rwxr-xr-x 1 mcfrisk mcfrisk  54656 Jul 17 10:45 tmp/deploy/images/qemux86/tmp/bin/busybox.suid
> -rwxr-xr-x 1 mcfrisk mcfrisk 612024 Jul 17 13:56 tmp_master/deploy/images/qemux86/tmp/bin/busybox.nosuid
> -rwxr-xr-x 1 mcfrisk mcfrisk  54656 Jul 17 13:56 tmp_master/deploy/images/qemux86/tmp/bin/busybox.suid
>
> Just to be sure, the files differ:
>
> $ sha1sum tmp*/deploy/images/qemux86/tmp/bin/busybox.*
> 8866ced8ad8aa335bb5dfc8b229851b6e09397d7  tmp/deploy/images/qemux86/tmp/bin/busybox.nosuid
> 01cb28f1254f4200b005122ce03114b034b3aaec  tmp/deploy/images/qemux86/tmp/bin/busybox.suid
> 91ed5b26083c9b6f944344036b04ebf2aa5af6ff  tmp_master/deploy/images/qemux86/tmp/bin/busybox.nosuid
> d4a3ee35246c0f42ba4f0a8a34cd96269b89e906  tmp_master/deploy/images/qemux86/tmp/bin/busybox.suid
>
> buildhistory shows that busybox-dbg PKGSIZE increases from 4523596 to 4546396,
> busybox-ptest PKGSIZE decreases from 458949 to 458908 even when
> /usr/lib/busybox/ptest/testsuite/tar.utf8.tar.bz2 is added, busybox-src
> PKGSIZE increases from 4130952 to 4163274.
>
> I found that hard to believe so I didn't trust buildhistory anymore.
>

I think its fine to enable it, but we need to understand the size implications
maybe rename busybox build dir to something and with without so you
have two dirs to compare.

> -Mikko
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

