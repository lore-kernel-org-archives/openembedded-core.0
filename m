Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A41CE7AA5
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:49:14 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.66097.1695660550791787385
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 09:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHJ+zY2M;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1dcead29b3eso2133405fac.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 09:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695660550; x=1696265350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAdm7ZUKfzoRSgSD/JRxqGYREh0NK9WekYYHlqiJUSw=;
        b=hHJ+zY2MsZW41nibornIf6LShpTtXkpW2FKV+Zq16jIl8p5EqunoElF3Ede1evm9sG
         T3Hdt38qp4LiYPBlT3RBLVShYMrCwuePpgtEVOtNypSk2b4I61xzvTjBf8flvsbu6n4y
         vAVN6APzoImbbENnufXmo1E4kLITqzyOYLr3oPvtzIHa9vDddhTZXq8cDIIdKzZI7hl1
         RsAsllCdnuHhLSLTKzm0AH6X5dzZxvJ6V7CbcPtFL+rTsfQz/T99wqzChCO8rXFT1im3
         1311OCOuW8AMA0kRaoZ2o5LSlxnUEyGE32KeGvpFQO3jO0xC8+clhXx9TkuA2P+Di5ln
         6IJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695660550; x=1696265350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAdm7ZUKfzoRSgSD/JRxqGYREh0NK9WekYYHlqiJUSw=;
        b=HoRB8FVbCAKpluBOM0QhDvCzNYkEs19QB51WPF3MWQJWvYifh8mUdazlJeEWIgwn81
         9MxMnoleRz4rtd5M5BMLHmq3tOwHHLSz/9X+6PFMmXrjuWEE99woX2XOWTihNhyQxDiS
         ZuYLNYd9N37KdhXK/K7J/5YfNSjQ/xEHHBhf/NMfivCK/BL49rB4k70C/OanoTdVegtA
         F69g39HmDQkiNIDIK1kbIU0fmaKwDH8+SDVlu1uCHvYUrGxUCP2tE/pc2Btf1L2frhq+
         8rSYzyC2GPyhMj9MI2PDWshxoWGrIHZGp35rF3m2AqBsNzAu6CC6iS7mbUwtovtIe0rP
         tKVg==
X-Gm-Message-State: AOJu0Yy5ETv0FV6UszN6GMjWaCpDp1szXIn4beoT64A+0RF+KrTRQslT
	By+5UpsW37wEGWbaH2xIZNHGV1/XqL2aiaQjRbQ=
X-Google-Smtp-Source: AGHT+IH8rf2OUrNkoXSw2Yr7RzUYYFkc7B3k6oszJMNZGussvLyJLJxKj38ouJu4y4p4A6Yu5MgFASc753wPrZHMe58=
X-Received: by 2002:a05:6870:c114:b0:1bb:8d8f:9c6e with SMTP id
 f20-20020a056870c11400b001bb8d8f9c6emr7682586oad.10.1695660550009; Mon, 25
 Sep 2023 09:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230922072431.1481743-1-alex@linutronix.de> <20230922072431.1481743-11-alex@linutronix.de>
In-Reply-To: <20230922072431.1481743-11-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Sep 2023 09:48:44 -0700
Message-ID: <CAMKF1srkcEn93TSxxFtg8Bh38haC0Seo-iQRyS+4HRo3bk1vjg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 11/40] createrepo-c: upgrade 0.21.1 -> 1.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 16:49:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188196

This fails with clang - https://errors.yoctoproject.org/Errors/Details/7381=
94/
GCC perhaps reports it as warning only

On Fri, Sep 22, 2023 at 12:25=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Enable zstd in libsolv, as new createrepo_c is using that instead of
> zlib for repo metadata compression.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...arser.c-add-a-missing-parameter-name.patch | 39 -------------------
>  ...repo-c_0.21.1.bb =3D> createrepo-c_1.0.0.bb} |  3 +-
>  .../libsolv/libsolv_0.7.24.bb                 |  4 +-
>  3 files changed, 3 insertions(+), 43 deletions(-)
>  delete mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-=
src-cmd_parser.c-add-a-missing-parameter-name.patch
>  rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.21.1.bb =3D> c=
reaterepo-c_1.0.0.bb} (92%)
>
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd=
_parser.c-add-a-missing-parameter-name.patch b/meta/recipes-devtools/create=
repo-c/createrepo-c/0001-src-cmd_parser.c-add-a-missing-parameter-name.patc=
h
> deleted file mode 100644
> index 0d1c6b08fbc..00000000000
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-src-cmd_parser=
.c-add-a-missing-parameter-name.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 970b901e1999f415da8bac205f526c808ddad0ba Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 8 May 2023 10:40:43 +0200
> -Subject: [PATCH] src/cmd_parser.c: add a missing parameter name
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -This resolves the following error with older versions of gcc:
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-na=
tive/0.21.1-r0/git/src/cmd_parser.c: In function =E2=80=98duplicated_nevra_=
option_parser=E2=80=99:
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-na=
tive/0.21.1-r0/git/src/cmd_parser.c:76:32: error: parameter name omitted
> -|    76 | duplicated_nevra_option_parser(const gchar *,
> -|       |                                ^~~~~~~~~~~~~
> -| /srv/storage/alex/yocto/build-32/tmp/work/x86_64-linux/createrepo-c-na=
tive/0.21.1-r0/git/src/cmd_parser.c:78:32: error: parameter name omitted
> -|    78 |                                gpointer,
> -|       |                                ^~~~~~~~
> -
> -Upstream-Status: Submitted [https://github.com/rpm-software-management/c=
reaterepo_c/pull/366]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - src/cmd_parser.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/cmd_parser.c b/src/cmd_parser.c
> -index 97c9ea7..63af7ea 100644
> ---- a/src/cmd_parser.c
> -+++ b/src/cmd_parser.c
> -@@ -73,9 +73,9 @@ struct CmdOptions _cmd_options =3D {
> -
> -
> - gboolean
> --duplicated_nevra_option_parser(const gchar *,
> -+duplicated_nevra_option_parser(const gchar *option_name,
> -                                const gchar *value,
> --                               gpointer,
> -+                               gpointer data,
> -                                GError **error)
> - {
> -     if (!g_strcmp0(value, "keep"))
> diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb b/=
meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> index 57f23b8dfdb..9b109327c8f 100644
> --- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.21.1.bb
> +++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.0.0.bb
> @@ -7,11 +7,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
>  SRC_URI =3D "git://github.com/rpm-software-management/createrepo_c;branc=
h=3Dmaster;protocol=3Dhttps \
>             file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.p=
atch \
>             file://0001-include-rpm-rpmstring.h.patch \
> -           file://0001-src-cmd_parser.c-add-a-missing-parameter-name.pat=
ch \
>             file://time64fix.patch \
>             "
>
> -SRCREV =3D "0652d7303ce236e596c83c29ccc9bee7868fce6e"
> +SRCREV =3D "0cc13920991b2fb8f87fb9d352bd3394c2983289"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb b/meta/recip=
es-extended/libsolv/libsolv_0.7.24.bb
> index 7c8f1fd372d..11825270147 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.7.24.bb
> @@ -6,7 +6,7 @@ SECTION =3D "devel"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.BSD;md5=3D62272bd11c97396d4aaf1c41b=
c11f7d8"
>
> -DEPENDS =3D "expat zlib"
> +DEPENDS =3D "expat zlib zstd"
>
>  SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
> @@ -23,7 +23,7 @@ inherit cmake
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm=
','rpm','',d)}"
>  PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON,,rpm"
>
> -EXTRA_OECMAKE =3D "-DMULTI_SEMANTICS=3DON -DENABLE_COMPLEX_DEPS=3DON"
> +EXTRA_OECMAKE =3D "-DMULTI_SEMANTICS=3DON -DENABLE_COMPLEX_DEPS=3DON -DE=
NABLE_ZSTD_COMPRESSION=3DON"
>
>  PACKAGES =3D+ "${PN}-tools ${PN}ext"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188083): https://lists.openembedded.org/g/openembedde=
d-core/message/188083
> Mute This Topic: https://lists.openembedded.org/mt/101516887/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

