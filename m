Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4044660234
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2019 18:45:51 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id i10so37532739iol.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Jul 2019 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KCgs0Z45/LSkdVRAycS8raleBqCiFEverUMsJ4WVM0E=;
	b=G7OsxiLWiB07pVILtLalYwvkfCGgaZZqNgjHVT/lZyZmL9vOJo2QtYVl58nDD58Sdh
	qlwNB1SfakWjLExwl4zMiqI+ihcQ3B+AXkSUcOlEHhWi1dI0p7HeQxH5Vrgos+bmcanA
	JwTHHMN60TL2eTiMSxnscCp5pvON2unGwo0KvrLbCtD1EcWQPAl34xBIXhFC+e2x06ui
	trKu4gO5Wt9C77Hm0K30bb7SrQYK5YPqU2NzrDfD4GBItCRlJXkDNroCH3P4XMeBySN2
	OJXkhWCdRMYlfaYeTrRxS2D7RAlUwbvH7x5qcn9t8FNn0oR6ljulxFMcXcbqkb5vdBMG
	CIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KCgs0Z45/LSkdVRAycS8raleBqCiFEverUMsJ4WVM0E=;
	b=kyD7gcLTiyhq18o/fPR8yjGzpASV1846Exhrsp+EbPL1Ak9sp+lShjy0+uUnpnNocW
	MG+hGIyw5S8zPle6BWwJFaeltEFtxC9zC7MIz/LFgYrypdWqGPqASF/lBmQVfNBTegEV
	qvZeKEj7Ji5KdpMkWzSYFzOkEJ4KgT3TY8XADP7xSlyrAKc2a+mLm/Gw11lcFPj8Xlqv
	Vc6wqNGwJ+MfS3PV3t0aHqCLsipR9ggunO+dwVo9xjAwZ1X/CMTOQJ8PqAYKmeZQm4WX
	ch6waQPJQYqc4MwJc8pFS/8Dss8wJfYrOay4XfqG7yuzURzP60TAgOB/LYyITNFqOzOZ
	eyvw==
X-Gm-Message-State: APjAAAUGLPSteE0qVA3BkGANgkoDnomy0oOUNpzB0zUXclh1fyvrhA65
	5upyeAbs21AGnWt+v62/6quMC4d1TE4P5Os3GcVmww==
X-Google-Smtp-Source: APXvYqw6bJGHyfmhf0IbBEfRtFMMSkzHrBS6B72vandNkxxD9rlgW/ikI6A+ejFy03jtydsnSHAtf0T/BS413FMd0WI=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr22473656jao.82.1562611553083; 
	Mon, 08 Jul 2019 11:45:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562570956.git.Qi.Chen@windriver.com>
	<0dee845494880f0c201e79d6ee0f50390f183465.1562570957.git.Qi.Chen@windriver.com>
	<bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
In-Reply-To: <bffaaf84031568a924656bf092d9d17405fbef2f.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Jul 2019 19:45:41 +0100
Message-ID: <CAJTo0LY3r=FTLoYhBXCNt00qhuHpuD-2bqaBfKKr851OsRd0tA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libxml2-utils
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
X-List-Received-Date: Mon, 08 Jul 2019 18:45:52 -0000
Content-Type: text/plain; charset="UTF-8"

Agreed, making it a non-fatal dependency just means that some eSDKs
break, not all.  There needs to be a better fix.

Ross

On Mon, 8 Jul 2019 at 17:53, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-07-08 at 15:37 +0800, Chen Qi wrote:
> > For build-sysroots.bb, the xmlcatalog would not be in its
> > staging directory. Causing the following error for eSDK.
> >
> > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Command
> > '/PATH/TO/IMAGE/testsdkext/tmp/sysroots/x86_64/usr/bin/postinst-
> > docbook-xml-dtd4-native-xmlcatalog' returned non-zero exit status
> > 127.
> > ERROR: build-sysroots-1.0-r0 do_build_native_sysroot: Function
> > failed: do_build_native_sysroot
> >
> > The problem could be reproduced by the following steps.
> > 1. Add in local.conf:
> >    IMAGE_INSTALL_append = " btrfs-tools"
> >    DISTRO_FEATURES_append = " api-documentation"
> >    INHERIT += "testsdk"
> > 2. bitbake core-image-minimal -c populate_sdk_ext
> > 3. bitbake core-image-minimal -c testsdkext
> >
> > So we add nativesdk-libxml2-utils to buildtools-tarball
> > to ensure the existence of xmlcatalog. Also add it
> > to HOSTTOOLS_NONFATAL so it could be seen by bitbake.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/conf/bitbake.conf                       | 3 +++
> >  meta/recipes-core/meta/buildtools-tarball.bb | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 5e93f5c..2f64eae 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -517,6 +517,9 @@ HOSTTOOLS_NONFATAL += "scp"
> >  # Link to git-lfs if present
> >  HOSTTOOLS_NONFATAL += "git-lfs"
> >
> > +# build-sysroot needs xmlcatalog in order for eSDK installation
> > +HOSTTOOLS_NONFATAL += "xmlcatalog"
>
> I don't mind the buildtools-tarball change but HOSTTOOLS is starting to
> grow to contain far too much random stuff which could impact
> reproduciblity.
>
> Is there some other way we could fix this? It still feels like a
> dependency problem which we chould fix by adding a missing dependency
> although I appreciate its far from being that simple.
>
> I wonder if there is a way we could teach build-sysroots to be cleverer
> about dependencies?
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

