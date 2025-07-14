Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C94C83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 17:23:54 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.83897.1752513827081022232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 10:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VJfvaEN7;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235ef62066eso68961315ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513826; x=1753118626; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DsWdVGBMnbIEkPpwoELGxYwC1kOn8r/pJtTcDWGma0U=;
        b=VJfvaEN7CGtHurCi1NZ+zt0BW2jehIv2b5nSgWROVtKYUABt4tcna4lmOsMY1VPMy2
         Eq7l8oqZ+IZRrD+VA5J/wu4EO/qD1Sn3aGGm9KtmskdaKyxx//GvQGzK2TvArhrT1sYq
         bS3bSr3ihWBGgVAYve2h5R7EuJ462bK37U4U697b+Lym2LPLpXAhbBlr4rx6KJbf4aJt
         675Pq7dqyFgSnI5uzd35yKVqNopZzBUwHsQm3RGWDb6wMsjqaBcSXnPQzh2QsUNVwL5k
         lzpnI/EOZ2vtUk8Yb8NVqvcmBlSMubSzHpGckjaCu+G57wt/GG8UfUtNWwNtydstoXIa
         +oXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513826; x=1753118626;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DsWdVGBMnbIEkPpwoELGxYwC1kOn8r/pJtTcDWGma0U=;
        b=Tvpt2daw4fRiLMXRVzh6gsAbYKbzPWz6n/ibL1G8s6xUBDdmz9Owboxty3a/v3ubIW
         LjANe4tQoCn1VW5VF97daN0tEBoN7ve/Vo2eGxwOQUoCJP8WU/FH/r93Ps6FRyovB3T9
         hZ1RUrNgSIMfa9O/XwItsh5LYn0PMj9zpp0lNyuAgfPdx60GixELJtya11bXi1BpunCM
         YPSCW2s1KTcjeLeeNtb1aX83ZmgaKr8PlJuhWlNVdjhdBmdNIcV3S15admzMKB1hcD71
         eaSf0NmdcUWDXXvtThpytxbNaFTrNVBLPH8cZax/aR5QXG8QAHT24TpYQ1lKy39yq+sH
         eerw==
X-Gm-Message-State: AOJu0YybXd1+bzFvvGn9n33CDd6+HCD2TB88qow926D/BNKs07JK2Buj
	k82PiucdOSp81mGrLtIc842H/n5BI0tJYu3G1G8urddP91KwW0j9oJ7R
X-Gm-Gg: ASbGncsqN4KtEZiX3BOfPsFMgbqxLOMK5s6lz58Wi9bsIbFqUgUhp9MdMBjtx0nm68n
	zMUBxwlVgsziYPfYxCBM+ZHce5sI3oXdhIoCUrCte9cP8v50iOH/lOj2WRdH86R9qgzaVobu3wF
	S7+3UxfvBhtSFK+rXEcaOBmr+yqxR9fzYN7D8grZ6BWZmTGw/RN9Pe6U6zLIEaOc+OCZ5BPClJA
	4+aix0vVgnzqbWGnzMapF7hpyKEjIBGk0pqeLrWeXF2GQ2zWu185aWSAbG0wtxMn/P1Y2ra63qX
	8uDgt+OhiCgYB0fDuTxk2rECd4dEQxBUwm2ETrR5fNvkMB6Z5m8XQop6Zy+HiQJQbePN38uAXFS
	FxSa4k/c3spa7YCgSHz4=
X-Google-Smtp-Source: AGHT+IGu+IsQe5MoJ5Fep2AdzGqU5PqiOkGFMoBKXcHbhjQqbAxw32qkeBXLPG5FOxVwSPMnVbxoTg==
X-Received: by 2002:a17:90b:57e7:b0:311:e8cc:4253 with SMTP id 98e67ed59e1d1-31c4ca66f9amr22386149a91.2.1752513826312;
        Mon, 14 Jul 2025 10:23:46 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4345cbbsm101256815ad.194.2025.07.14.10.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:23:45 -0700 (PDT)
Date: Mon, 14 Jul 2025 14:23:42 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denis@denix.org>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH] mtd-utils: add optional systemd service for
 ubihealthd
Message-ID: <20250714172342.4zqvdugrcpyin2pm@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS1PR10MB56977B0B73EDD7AC5361A17FFD54A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <56b917893bea829074e4727fc716f939000842f0.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220256

Hi Peter, Richard,

On Mon, Jul 14, 2025 at 10:24:15AM +0000, Marko, Peter wrote:
> 
> 
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Hiago De Franco via
> > lists.openembedded.org
> > Sent: Saturday, July 12, 2025 3:56
> > To: openembedded-core@lists.openembedded.org
> > Cc: Denys Dmytriyenko <denis@denix.org>; Hiago De Franco
> > <hiago.franco@toradex.com>
> > Subject: [OE-core] [PATCH] mtd-utils: add optional systemd service for ubihealthd
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Add support for deploying a ubihealthd.service systemd unit through a
> > new 'ubihealthd-service' PACKAGECONFIG option.
> > 
> > This change allows systems using systemd to easily enable and manage the
> > UBI health monitoring daemon as a background service.
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> >  .../mtd/files/ubihealthd.service              | 10 +++++++++
> >  meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb  | 21 ++++++++++++++++---
> >  2 files changed, 28 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-devtools/mtd/files/ubihealthd.service
> > 
> > diff --git a/meta/recipes-devtools/mtd/files/ubihealthd.service b/meta/recipes-
> > devtools/mtd/files/ubihealthd.service
> > new file mode 100644
> > index 000000000000..74b8df655b5c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/mtd/files/ubihealthd.service
> > @@ -0,0 +1,10 @@
> > +[Unit]
> > +Description=UBI health daemon
> > +After=multi-user.target
> > +
> > +[Service]
> > +Type=forking
> > +ExecStart=@SBINDIR@/ubihealthd
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-
> > devtools/mtd/mtd-utils_2.3.0.bb
> > index 47f0b01abe0f..d99a1d5c7b70 100644
> > --- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> > +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> > @@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> > 
> > file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409
> > 380049c"
> > 
> > -inherit autotools pkgconfig update-alternatives
> > +inherit autotools pkgconfig systemd update-alternatives
> > 
> >  DEPENDS = "zlib e2fsprogs util-linux"
> >  RDEPENDS:mtd-utils-tests += "bash"
> > @@ -17,7 +17,8 @@ SRC_URI = "git://git.infradead.org/mtd-
> > utils.git;branch=master \
> >             file://0002-ubifs-utils-journal-Include-sys-stat.h.patch \
> >             file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch \
> >             file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch \
> > -           file://0001-Improve-check-for-GCC-compiler-version.patch"
> > +           file://0001-Improve-check-for-GCC-compiler-version.patch \
> > +           file://ubihealthd.service"
> > 
> >  # xattr support creates an additional compile-time dependency on acl because
> >  # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> > @@ -29,6 +30,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-
> > crypto,openssl"
> >  PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
> >  PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
> >  PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> > +PACKAGECONFIG[ubihealthd-service] = ",,systemd"
> 
> This seems to be wrong:
> 1. depending on systemd is allowed only with REQUIRED_DISTRO_FEATURES = "systemd"
> 2. the recipe build does not depend on systemd
> 
> I believe that you can just leave out the systemd from this line and it should be fine.
> Systemd bbclass will make sure that the service is installed/excluded based on distro.

Thanks for the review, I will fix this on the v2 patch. I tested with
only

PACKAGECONFIG[ubihealthd-service] = ",,"

and seems to be working fine.

> 
> Peter 

On Mon, Jul 14, 2025 at 12:50:20PM +0100, Richard Purdie wrote:
> On Fri, 2025-07-11 at 22:56 -0300, Hiago De Franco via lists.openembedded.org wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Add support for deploying a ubihealthd.service systemd unit through a
> > new 'ubihealthd-service' PACKAGECONFIG option.
> > 
> > This change allows systems using systemd to easily enable and manage the
> > UBI health monitoring daemon as a background service.
> > 
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > �.../mtd/files/ubihealthd.service������������� | 10 +++++++++
> > �meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb� | 21 ++++++++++++++++---
> > �2 files changed, 28 insertions(+), 3 deletions(-)
> > �create mode 100644 meta/recipes-devtools/mtd/files/ubihealthd.service
> > 
> > diff --git a/meta/recipes-devtools/mtd/files/ubihealthd.service b/meta/recipes-devtools/mtd/files/ubihealthd.service
> > new file mode 100644
> > index 000000000000..74b8df655b5c
> > --- /dev/null
> > +++ b/meta/recipes-devtools/mtd/files/ubihealthd.service
> > @@ -0,0 +1,10 @@
> > +[Unit]
> > +Description=UBI health daemon
> > +After=multi-user.target
> > +
> > +[Service]
> > +Type=forking
> > +ExecStart=@SBINDIR@/ubihealthd
> > +
> > +[Install]
> > +WantedBy=multi-user.target
> > diff --git a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> > index 47f0b01abe0f..d99a1d5c7b70 100644
> > --- a/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> > +++ b/meta/recipes-devtools/mtd/mtd-utils_2.3.0.bb
> > @@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-or-later"
> > �LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3�\
> > �������������������� file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
> > �
> > -inherit autotools pkgconfig update-alternatives
> > +inherit autotools pkgconfig systemd update-alternatives
> > �
> > �DEPENDS = "zlib e2fsprogs util-linux"
> > �RDEPENDS:mtd-utils-tests += "bash"
> > @@ -17,7 +17,8 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
> > ����������� file://0002-ubifs-utils-journal-Include-sys-stat.h.patch�\
> > ����������� file://0003-ubifs-utils-link-libmissing.a-in-case-execinfo.h-isn.patch�\
> > ����������� file://0004-ubifs-utils-extract_files-Include-linux-limits.h.patch�\
> > -���������� file://0001-Improve-check-for-GCC-compiler-version.patch"
> > +���������� file://0001-Improve-check-for-GCC-compiler-version.patch�\
> > +���������� file://ubihealthd.service"
> > �
> > �# xattr support creates an additional compile-time dependency on acl because
> > �# the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
> > @@ -29,6 +30,7 @@ PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
> > �PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
> > �PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
> > �PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
> > +PACKAGECONFIG[ubihealthd-service] = ",,systemd"
> > �
> > �CPPFLAGS:append:riscv64� = " -pthread -D_REENTRANT"
> > �
> > @@ -54,6 +56,9 @@ ALTERNATIVE_LINK_NAME[flash_lock] = "${sbindir}/flash_lock"
> > �ALTERNATIVE_LINK_NAME[flash_unlock] = "${sbindir}/flash_unlock"
> > �ALTERNATIVE_LINK_NAME[flashcp] = "${sbindir}/flashcp"
> > �
> > +SYSTEMD_SERVICE:${PN} = "ubihealthd.service"
> > +SYSTEMD_AUTO_ENABLE = "disable"
> > +
> > �do_install () {
> > �	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> > �	install -d ${D}${includedir}/mtd
> > @@ -64,6 +69,12 @@ do_install () {
> > �	install -m 0644 ${S}/include/libubigen.h ${D}${includedir}
> > �	oe_libinstall -a libubi ${D}${libdir}/
> > �	oe_libinstall -a libmtd ${D}${libdir}/
> > +
> > +	if ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', 'true', 'false', d)}; then
> > +		install -d ${D}${systemd_system_unitdir}
> > +		install -m 0644 ${UNPACKDIR}/ubihealthd.service ${D}${systemd_system_unitdir}
> > +		sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_system_unitdir}/ubihealthd.service
> > +	fi
> > �}
> > �
> > �PACKAGES =+ "mtd-utils-misc mtd-utils-tests"
> > @@ -71,7 +82,11 @@ PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "jffs", "mtd-utils-jffs2", ""
> > �PACKAGES =+ "${@bb.utils.contains("PACKAGECONFIG", "ubifs", "mtd-utils-ubifs", "", d)}"
> > �
> > �FILES:mtd-utils-jffs2 = "${sbindir}/mkfs.jffs2 ${sbindir}/jffs2dump ${sbindir}/jffs2reader ${sbindir}/sumtool"
> > -FILES:mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
> > +FILES:mtd-utils-ubifs = "\
> > +��� ${sbindir}/mkfs.ubifs \
> > +��� ${sbindir}/ubi* \
> > +��� ${@bb.utils.contains('PACKAGECONFIG', 'ubihealthd-service', '${systemd_system_unitdir}/ubihealthd.service', '', d)} \
> > +��� "
> > �FILES:mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
> > �FILES:mtd-utils-tests = "${libexecdir}/mtd-utils/*"
> 
> As well as the feedback from Peter, there were autobuilder testing failures:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/2029
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1875

Thanks Richard, I believe I missed the proper package name into
SYSTEMD_SERVICE override. I will fix it on the v2 and add a check for
the proper PACKAGECONFIG to add the '.service' file. 

> 
> Cheers,
> 
> Richard

Best Regards,
Hiago.

