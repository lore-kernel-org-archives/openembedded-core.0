Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B05C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 10:47:49 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.4954.1660214862060095576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyUfkMt2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so2474509wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=s7VHMl/e8/lBw/GH0gpSb0bJTlH4XwSotRLoaEvN+jI=;
        b=MyUfkMt2SUJkIUil7eBcJ8v9lGv7HWMIfyFN0GOQEqVgltCgdNHYOFGSBLhsDw2Owv
         o7Q8VFNBJpEZ6VZtJzKXgQUU6bT6sSHES/7V+Qr+taxQVxQw2hPG4yQ1cvVhZd4K0Klk
         nr0t+SQtgPBCHxZW9STJOgq9OEuX7n7fySlKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=s7VHMl/e8/lBw/GH0gpSb0bJTlH4XwSotRLoaEvN+jI=;
        b=sWuBTEwA6F/OSQ+jj/fMlJnPHnWelGP2kfD6bKkX9HVfcNdXOKMRjrppIJ/otAT+HB
         y7mbDMsDoijUFwromTDJph3eQ/iICGEZSQXDYnp9ROO9dAvgfVWE0wFYRLKolm5CyPeU
         Llz2S7E2RXcFCIjy2WqkcYRW0+W1zyDRt/8MR3yEgHySmkGODMcSq4WBDpQqOMI0lKZb
         GYCkFcpY0RpUcGSNecP3uRp6Ut5VYs1xTUtQtbUWvUK+2Sh/zaKBY3jWLLohHiQGTiyt
         sYfjPuNrhkxRf+X5562O1A9aDfzhm4tm2YdFdpsYvA9R1o85Et7VQvZXNrn6xJ8J4VrM
         4X3w==
X-Gm-Message-State: ACgBeo1qarELRNV+KBO25Xuo5cKXIk2rCe0l5ZcmwnUm9h6JUyh4eu4E
	UVcFhE66lp9cCa/3OzQXMdqVJQ==
X-Google-Smtp-Source: 
 AA6agR423QZVlZbVy8HLUwIKP8W+92lHs1HPR7jTtiv+iUpIidwwgP6Q4o2AO5AloHnSwPcKrymj8Q==
X-Received: by 2002:a05:600c:35d5:b0:3a3:2490:c984 with SMTP id
 r21-20020a05600c35d500b003a32490c984mr5437985wmq.162.1660214860413;
        Thu, 11 Aug 2022 03:47:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7?
 ([2001:8b0:aba:5f3c:95c7:ec9:dfa1:7b7])
        by smtp.gmail.com with ESMTPSA id
 t11-20020a5d534b000000b00222c96d8656sm11199795wrv.114.2022.08.11.03.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 03:47:39 -0700 (PDT)
Message-ID: 
 <8d27b7997f2b50e1119dd309ff0acbc29f9b2ee9.camel@linuxfoundation.org>
Subject: Re: [oe][OE-core][Patch 1/1] perf: depend on setuptools if building
 python scripting
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Max Krummenacher <max.oss.09@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Thu, 11 Aug 2022 11:47:34 +0100
In-Reply-To: <YvTFebDB3jqWSeER@mail.local>
References: <20220810072138.2440138-1-max.oss.09@gmail.com>
	 <YvTFebDB3jqWSeER@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 10:47:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169240

On Thu, 2022-08-11 at 11:01 +0200, Alexandre Belloni via
lists.openembedded.org wrote:
> Hello Max,
>=20
> On 10/08/2022 09:21:38+0200, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >=20
> > Starting with kernel 5.19-rc7 perf changed from using distutils
> > to setuptools.
> > Add this to the dependencies to be prepared.
> >=20
>=20
> Unfortunately, this causes the following reproducibility issues:
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220810-ikgt=
3whb/packages/diff-html/
>=20
>=20
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/tools/perf?id=3Dee87a0841aa538ab7ad49cf5679ac5ea2682c909
> >=20
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index 95e7eae9fe..4b15b11462 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -13,7 +13,7 @@ PR =3D "r9"
> > =20
> >  PACKAGECONFIG ??=3D "scripting tui libunwind"
> >  PACKAGECONFIG[dwarf] =3D ",NO_DWARF=3D1"
> > -PACKAGECONFIG[scripting] =3D ",NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl py=
thon3"
> > +PACKAGECONFIG[scripting] =3D ",NO_LIBPERL=3D1 NO_LIBPYTHON=3D1,perl py=
thon3 python3-setuptools-native"
> >  # gui support was added with kernel 3.6.35
> >  # since 3.10 libnewt was replaced by slang
> >  # to cover a wide range of kernel we add both dependencies
> > --=20
> > 2.35.3

I think this needs something like:

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/pe=
rf.bb
index 4b15b114620..2fdb99361fa 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -203,7 +203,7 @@ do_configure:prepend () {
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i -e 's,\ .config-detected, $(OUTPUT)/config-detected,g' \
             ${S}/tools/perf/Makefile.perf
-        sed -i -e "s,prefix=3D'\$(DESTDIR_SQ)/usr'$,prefix=3D'\$(DESTDIR_S=
Q)/usr' --install-lib=3D'\$(DESTDIR)\$(PYTHON_SITEPACKAGES_DIR)',g" \
+        sed -i -e "s,prefix=3D'\$(DESTDIR_SQ)/usr'$,prefix=3D'\$(DESTDIR_S=
Q)/usr' --install-lib=3D'\$(PYTHON_SITEPACKAGES_DIR)' --root=3D'\$(DESTDIR)=
',g" \
             ${S}/tools/perf/Makefile.perf
         # backport https://github.com/torvalds/linux/commit/e4ffd066ff440a=
57097e9140fa9e16ceef905de8
         sed -i -e 's,\($(Q)$(SHELL) .$(arch_errno_tbl).\) $(CC) $(arch_err=
no_hdr_dir),\1 $(firstword $(CC)) $(arch_errno_hdr_dir),g' \

to work with 5.19 but we also need to keep older versions working :/

Cheers,

Richard

