Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9E7ECAAA7
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 18:01:59 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.1505.1661796117352117462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 11:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FcxNZVQp;
 spf=pass (domain: gmail.com, ip: 209.85.208.178,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id z23so5977120ljk.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 11:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=t75tyfhHfeDXLQI9Nv04uQkj0zYK/unYLa1HOBKLj8k=;
        b=FcxNZVQptEvnswW7Ap6RWnQsidf9lxxn+AkyyB750AxmoyVgsN5ftD/0aDIvl5e+Q6
         6DAWzC5wkiRPLPxoMb7MCwJvgbvJwL5haTiASPJ8zD2/sUKX9RAUBDFkLSIKpV5loAnp
         zPkMvQ9kjJst6Ll/ak/8xYV9CgET/OLCp8tvlQ8h7ffJO+Rdzzoq0iOp/UywRIXTAM5X
         EVD/k7EzTlbydtKpEcWc+V5iUikL80U/kmYUg4+c1evsN5y+jKI0SQEndaBANdXxCKn4
         pQXRyJs4faHCKKU/hy1qGTAKYXJPRf3paEOwefyuoBB8mZ8dlfTgnKqeR6/s3ZlP36hm
         wXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=t75tyfhHfeDXLQI9Nv04uQkj0zYK/unYLa1HOBKLj8k=;
        b=OjIQJwCUlybljgYKcfgkV/K/Z9K/HEeBXUZYmdaicfq1zmJwGoJNN5iJkDt265cidi
         8jBuQwwkDBMy+YD836b5WZ6JLdupf7mKgFBqKLqN/sX+WU9J4G/gJ9nKsJNwPLdfVKR/
         czulJ3w21vc+0cQN6OQG/Q3qfkpdvaulhvxM924UaWn4+GB9HGUEJ6+MpCCcs+NSCF6V
         efH2+VpFXPJjoq4llqSNpQ7MGOfiAxl9qnoL3+WYteC64l2O5+M93tb00uUNqzeoBDrl
         xTMQpj8Vy/AhoIYxRfXaHQEzhXpECV7wbepMk63R38SAkQucl94wyfyPRxhf0AKysQjn
         jXww==
X-Gm-Message-State: ACgBeo2jq8ERbIuHCHOr7dWdH01ETiRRBqlGCFbJPFm/YleF/UytRGBl
	F5xUPBIqA+4UBIRBYw3bBUAYBXMABqBGEaXWym0=
X-Google-Smtp-Source: 
 AA6agR4/Ibbl0wt07mosTxJmBYE/OO22usYDPQr406QQjPI0nEcNdgWdCfUrVWGu2SgiQYwS0GCvnWtUFt9T3R9yWto=
X-Received: by 2002:a2e:9e50:0:b0:261:e3fd:cdc5 with SMTP id
 g16-20020a2e9e50000000b00261e3fdcdc5mr5920163ljk.56.1661796115527; Mon, 29
 Aug 2022 11:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220827174633.2772165-1-ptsneves@gmail.com>
 <CANNYZj98LVhAGHDdKzbZCw-OytMc+7J+p4__Cuc9wFMnjx4G7g@mail.gmail.com>
 <6f6b8ba3-5564-11f9-93cd-e511375141a7@gmail.com>
 <15785108-b6fe-fa44-8753-04b8a2d78a54@gmail.com>
In-Reply-To: <15785108-b6fe-fa44-8753-04b8a2d78a54@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Aug 2022 20:01:43 +0200
Message-ID: 
 <CANNYZj8k38H2wrYTod6PxmDBkQiB2eibdp=68Py52HWyEsNjQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] ntirpc: Add ntirpc recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Paulo Neves <ptsneves@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 18:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170018

I think the rationale is that the implementation it replaces is not
anymore maintained?

Alex

On Mon, 29 Aug 2022 at 19:48, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On 8/28/22 10:40 AM, Paulo Neves wrote:
> > Hello Alexander,
> >
> > Thank you for your review
> >
> > I updated the commit message for v2 to contain the following text:
> >
> > We cannot completely  remove libtirpc due to arising circular
> > dependencies where ntirpc depends on libnsl2, which  in turn depends
> > on an RPC implementation.
> >
>
> is it core enough to be included into core right away ?
>
>
> > Paulo Neves
> >
> > On 8/27/22 20:07, Alexander Kanavin wrote:
> >> Can you please explain where the circular dependencies are?
> >>
> >> Alex
> >>
> >> On Sat, 27 Aug 2022 at 19:46, Paulo Neves <ptsneves@gmail.com> wrote:
> >>> ntirpc is an actively maintained rpc implementation. We cannot
> >>> completely
> >>> remove libtirpc due to arising circular dependencies. libtirpc and
> >>> ntirpc
> >>> are not mutually exclusive.
> >>>
> >>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> >>> ---
> >>>   meta/recipes-extended/ntirpc/ntirpc_4.0.bb    | 30
> >>> +++++++++++++++++++
> >>>   meta/recipes-extended/quota/quota_4.06.bb     |  2 +-
> >>>   .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  2 +-
> >>>   .../watchdog/watchdog_5.16.bb                 |  2 +-
> >>>   .../xorg-xserver/xserver-xorg.inc             |  2 +-
> >>>   .../recipes-support/liburcu/liburcu_0.13.1.bb |  1 +
> >>>   6 files changed, 35 insertions(+), 4 deletions(-)
> >>>   create mode 100644 meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> >>>
> >>> diff --git a/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> >>> b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> >>> new file mode 100644
> >>> index 0000000000..edebcb8ca9
> >>> --- /dev/null
> >>> +++ b/meta/recipes-extended/ntirpc/ntirpc_4.0.bb
> >>> @@ -0,0 +1,30 @@
> >>> +LICENSE = "BSD"
> >>> +LIC_FILES_CHKSUM =
> >>> "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3"
> >>> +
> >>> +SRC_URI =
> >>> "https://download.nfs-ganesha.org/4/${PV}/ntirpc-${PV}.tar.gz"
> >>> +SRC_URI[md5sum] = "17b0baada54936dcde80eba27bb6d88d"
> >>> +SRC_URI[sha256sum] =
> >>> "6a7921cd48d02077b394a02be42bf4f9b4678d4ebfd86a7ae4385bbcdce55462"
> >>> +
> >>> +DEPENDS = "liburcu libnsl2"
> >>> +
> >>> +inherit cmake pkgconfig
> >>> +
> >>> +PACKAGECONFIG[gss] = "-DUSE_GSS=true,-DUSE_GSS=false,krb5"
> >>> +PACKAGECONFIG[rdma] =
> >>> "-DUSE_RPC_RDMA=true,-DUSE_RPC_RDMA=false,rdma-core"
> >>> +PACKAGECONFIG[winbind] =
> >>> "-D_MSPAC_SUPPORT=true,-D_MSPAC_SUPPORT=false,samba"
> >>> +PACKAGECONFIG[profile] =
> >>> "-DUSE_PROFILE=true,-DUSE_PROFILE=false,gperftools"
> >>> +PACKAGECONFIG[lttng] =
> >>> "-DUSE_LTTNG=true,-DUSE_LTTNG=false,lttng-ust lttng-tools"
> >>> +
> >>> +# Sort out the brain-dead cmake file
> >>> +# (https://github.com/nfs-ganesha/ntirpc/issues/150)
> >>> +do_install:append() {
> >>> +    if [ "${prefix}/lib64" != "${libdir}" -a -d ${D}${prefix}/lib64
> >>> ]; then
> >>> +        mv ${D}${prefix}/lib64 ${D}${libdir}
> >>> +    fi
> >>> +}
> >>> +
> >>> +BBCLASSEXTEND = "native nativesdk"
> >>> +EXTRA_OECMAKE:armv5 += '-DSYSTEM_LIBRARIES="-latomic"'
> >>> +EXTRA_OECMAKE:riscv32 += '-DSYSTEM_LIBRARIES="-latomic"'
> >>> +EXTRA_OECMAKE:riscv64 += '-DSYSTEM_LIBRARIES="-latomic"'
> >>> +EXTRA_OECMAKE:powerpc += '-DSYSTEM_LIBRARIES="-latomic"'
> >>> diff --git a/meta/recipes-extended/quota/quota_4.06.bb
> >>> b/meta/recipes-extended/quota/quota_4.06.bb
> >>> index 0535d14c20..304477d72b 100644
> >>> --- a/meta/recipes-extended/quota/quota_4.06.bb
> >>> +++ b/meta/recipes-extended/quota/quota_4.06.bb
> >>> @@ -30,6 +30,6 @@ PACKAGECONFIG ??= "tcp-wrappers rpc bsd"
> >>>   PACKAGECONFIG:libc-musl = "tcp-wrappers rpc"
> >>>
> >>>   PACKAGECONFIG[tcp-wrappers] =
> >>> "--enable-libwrap,--disable-libwrap,tcp-wrappers"
> >>> -PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
> >>> +PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,ntirpc"
> >>>   PACKAGECONFIG[bsd] =
> >>> "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
> >>>   PACKAGECONFIG[ldapmail] =
> >>> "--enable-ldapmail,--disable-ldapmail,openldap"
> >>> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >>> b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >>> index dd89726afc..e30a23909c 100644
> >>> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >>> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >>> @@ -4,7 +4,7 @@ DESCRIPTION = "The rpcbind utility is a server that
> >>> converts RPC \
> >>>   SECTION = "console/network"
> >>>   HOMEPAGE = "http://sourceforge.net/projects/rpcbind/"
> >>>   BUGTRACKER =
> >>> "http://sourceforge.net/tracker/?group_id=201237&atid=976751"
> >>> -DEPENDS = "libtirpc quota"
> >>> +DEPENDS = "ntirpc quota"
> >>>
> >>>   LICENSE = "BSD-3-Clause"
> >>>   LIC_FILES_CHKSUM =
> >>> "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
> >>> diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >>> b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >>> index 26fcc10487..5f5fd4dc87 100644
> >>> --- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >>> +++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
> >>> @@ -28,7 +28,7 @@ UPSTREAM_CHECK_REGEX =
> >>> "/watchdog/(?P<pver>(\d+[\.\-_]*)+)/"
> >>>
> >>>   inherit autotools update-rc.d systemd pkgconfig
> >>>
> >>> -DEPENDS += "libtirpc"
> >>> +DEPENDS += "ntirpc"
> >>>   CFLAGS += "-I${STAGING_INCDIR}/tirpc"
> >>>   LDFLAGS += "-ltirpc"
> >>>
> >>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >>> b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >>> index 057a1ba6ad..2085f742d6 100644
> >>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >>> @@ -36,7 +36,7 @@ inherit meson pkgconfig
> >>>   inherit features_check
> >>>   REQUIRED_DISTRO_FEATURES = "x11"
> >>>
> >>> -LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> >>> libxkbfile libpciaccess libxcvt libtirpc"
> >>> +LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm
> >>> libxkbfile libpciaccess libxcvt ntirpc"
> >>>   DEPENDS = "xorgproto ${LIB_DEPS} font-util"
> >>>
> >>>   # Split out some modules and extensions from the main package
> >>> diff --git a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> >>> b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> >>> index 66763349d2..d7e831e803 100644
> >>> --- a/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> >>> +++ b/meta/recipes-support/liburcu/liburcu_0.13.1.bb
> >>> @@ -22,3 +22,4 @@ CPPFLAGS:append:riscv64  = " -pthread -D_REENTRANT"
> >>>   do_install:append() {
> >>>       oe_multilib_header urcu/config.h
> >>>   }
> >>> +BBCLASSEXTEND = "native nativesdk"
> >>> --
> >>> 2.25.1
> >>>
> >>>
> >>>
> >>>
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169991): https://lists.openembedded.org/g/openembedded-core/message/169991
> > Mute This Topic: https://lists.openembedded.org/mt/93293557/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

