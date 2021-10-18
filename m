Return-Path: <yuka@yuka.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7042EC433FE
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 13:43:58 +0000 (UTC)
Received: from mail.yuka.dev (mail.yuka.dev [195.39.247.168])
 by mx.groups.io with SMTP id smtpd.web12.36739.1634564636233989634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 06:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@yuka.dev header.s=mail
 header.b=I3Pw55ZR;
 spf=pass (domain: yuka.dev, ip: 195.39.247.168, mailfrom: yuka@yuka.dev)
Content-Type: multipart/alternative;
 boundary="------------HSNAZUYjmZILoWnvtF0H0RG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yuka.dev; s=mail;
	t=1634564628; bh=gQkzTVsq3HbDjTuMXSSVKRiwEEODEJYoFnCY97xHL8I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=I3Pw55ZRQLzskGgCMpX29bxFFwj3X1rbRpXyYX8GJ16J6222jofEbBwerYjM1/jUG
	 tLgK21LSEnaYdL6Xjnxt2J8flgv5jWZsaL1pKk5QbUJY21BBYZUoif3ehgIjGXZ41h
	 MQyCnYx4WzGOk7xtXYKBuz0HYAR4tsUMOoMOi0do=
Message-ID: <084bf217-0846-1af2-651a-9602fd9ec409@yuka.dev>
Date: Mon, 18 Oct 2021 15:43:47 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] systemd: add missing include for musl
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211018120251.1203204-1-yuka@yuka.dev>
 <CANNYZj-n25b2=M5Lnqaq5HLKcDBredEg2dZsh_gtqUKs8z1Gow@mail.gmail.com>
From: Yureka <yuka@yuka.dev>
In-Reply-To: 
 <CANNYZj-n25b2=M5Lnqaq5HLKcDBredEg2dZsh_gtqUKs8z1Gow@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 13:43:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157058

This is a multi-part message in MIME format.
--------------HSNAZUYjmZILoWnvtF0H0RG3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I don't think so, this change an existing related patch instead of
adding a new one.

On 10/18/21 14:18, Alexander Kanavin wrote:
> The recipe needs to be adjusted as well?
>
> Alex
>
> On Mon, 18 Oct 2021 at 14:03, Yureka via lists.openembedded.org
> <http://lists.openembedded.org> <yuka=3Dyuka.dev@lists.openembedded.org=
>
> wrote:
>
>     Fixes "error: =E2=80=98FTW_ACTIONRETVAL=E2=80=99 undeclared (first =
use in this
>     function)" in src/shared/mount-setup.c.
>
>     Signed-off-by: Yureka <yuka@yuka.dev>
>     ---
>     =C2=A0.../0008-add-missing-FTW_-macros-for-musl.patch=C2=A0 | 16
>     ++++++++++++++--
>     =C2=A01 file changed, 14 insertions(+), 2 deletions(-)
>
>     diff --git
>     a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-fo=
r-musl.patch
>     b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-fo=
r-musl.patch
>     index 95c3000aa1..792727ed8e 100644
>     ---
>     a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-fo=
r-musl.patch
>     +++
>     b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-fo=
r-musl.patch
>     @@ -10,10 +10,10 @@ This is to avoid build failures like below for
>     musl.
>     =C2=A0Upstream-Status: Inappropriate [musl specific]
>
>     =C2=A0Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>     -
>     =C2=A0---
>     =C2=A0 src/basic/missing_type.h | 20 ++++++++++++++++++++
>     - 1 file changed, 20 insertions(+)
>     + src/shared/mount-setup.c |=C2=A0 1 +
>     + 2 files changed, 21 insertions(+)
>
>     =C2=A0diff --git a/src/basic/missing_type.h b/src/basic/missing_typ=
e.h
>     =C2=A0index aeaf6ad5ec..3df1084ef2 100644
>     @@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644
>     =C2=A0+#ifndef FTW_SKIP_SIBLINGS
>     =C2=A0+#define FTW_SKIP_SIBLINGS 3
>     =C2=A0+#endif
>     +diff --git a/src/shared/mount-setup.c b/src/shared/mount-setup.c
>     +index ef3527e9a7..c1cab40eb8 100644
>     +--- a/src/shared/mount-setup.c
>     ++++ b/src/shared/mount-setup.c
>     +@@ -32,6 +32,7 @@
>     + #include "strv.h"
>     + #include "user-util.h"
>     + #include "virt.h"
>     ++#include "missing_type.h"
>     +
>     + typedef enum MountMode {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MNT_NONE=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D 0,
>     --=20
>     2.33.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#157055):
>     https://lists.openembedded.org/g/openembedded-core/message/157055
>     Mute This Topic: https://lists.openembedded.org/mt/86411771/1686489
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [alex.kanavin@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------HSNAZUYjmZILoWnvtF0H0RG3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>I don't think so, this change an existing related patch instead
      of adding a new one.<br>
    </p>
    <div class=3D"moz-cite-prefix">On 10/18/21 14:18, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANNYZj-n25b2=3DM5Lnqaq5HLKcDBredEg2dZsh_gtqUKs8z1Gow@mail.gm=
ail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div>The recipe needs to be adjusted as well?</div>
        <div><br>
        </div>
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, 18 Oct 2021 at 14:0=
3,
          Yureka via <a href=3D"http://lists.openembedded.org"
            moz-do-not-send=3D"true">lists.openembedded.org</a> &lt;yuka=3D=
<a
            href=3D"mailto:yuka.dev@lists.openembedded.org"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yuka=
.dev@lists.openembedded.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Fixes
          "error: =E2=80=98FTW_ACTIONRETVAL=E2=80=99 undeclared (first us=
e in this<br>
          function)" in src/shared/mount-setup.c.<br>
          <br>
          Signed-off-by: Yureka &lt;<a href=3D"mailto:yuka@yuka.dev"
            target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">yuka@yuka.dev</a>&gt;<br>
          ---<br>
          =C2=A0.../0008-add-missing-FTW_-macros-for-musl.patch=C2=A0 | 1=
6
          ++++++++++++++--<br>
          =C2=A01 file changed, 14 insertions(+), 2 deletions(-)<br>
          <br>
          diff --git
a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch
b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch<br>
          index 95c3000aa1..792727ed8e 100644<br>
          ---
a/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch<br>
          +++
b/meta/recipes-core/systemd/systemd/0008-add-missing-FTW_-macros-for-musl=
.patch<br>
          @@ -10,10 +10,10 @@ This is to avoid build failures like below
          for musl.<br>
          =C2=A0Upstream-Status: Inappropriate [musl specific]<br>
          <br>
          =C2=A0Signed-off-by: Chen Qi &lt;<a
            href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Qi.C=
hen@windriver.com</a>&gt;<br>
          -<br>
          =C2=A0---<br>
          =C2=A0 src/basic/missing_type.h | 20 ++++++++++++++++++++<br>
          - 1 file changed, 20 insertions(+)<br>
          + src/shared/mount-setup.c |=C2=A0 1 +<br>
          + 2 files changed, 21 insertions(+)<br>
          <br>
          =C2=A0diff --git a/src/basic/missing_type.h
          b/src/basic/missing_type.h<br>
          =C2=A0index aeaf6ad5ec..3df1084ef2 100644<br>
          @@ -43,3 +43,15 @@ index aeaf6ad5ec..3df1084ef2 100644<br>
          =C2=A0+#ifndef FTW_SKIP_SIBLINGS<br>
          =C2=A0+#define FTW_SKIP_SIBLINGS 3<br>
          =C2=A0+#endif<br>
          +diff --git a/src/shared/mount-setup.c
          b/src/shared/mount-setup.c<br>
          +index ef3527e9a7..c1cab40eb8 100644<br>
          +--- a/src/shared/mount-setup.c<br>
          ++++ b/src/shared/mount-setup.c<br>
          +@@ -32,6 +32,7 @@<br>
          + #include "strv.h"<br>
          + #include "user-util.h"<br>
          + #include "virt.h"<br>
          ++#include "missing_type.h"<br>
          + <br>
          + typedef enum MountMode {<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MNT_NONE=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0=3D 0,<br>
          -- <br>
          2.33.0<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#157055): <a
            href=3D"https://lists.openembedded.org/g/openembedded-core/me=
ssage/157055"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.openembedded.or=
g/g/openembedded-core/message/157055</a><br>
          Mute This Topic: <a
            href=3D"https://lists.openembedded.org/mt/86411771/1686489"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.openembedded.or=
g/mt/86411771/1686489</a><br>
          Group Owner: <a
            href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.o=
rg"
            target=3D"_blank" moz-do-not-send=3D"true">openembedded-core+=
owner@lists.openembedded.org</a><br>
          Unsubscribe: <a
            href=3D"https://lists.openembedded.org/g/openembedded-core/un=
sub"
            rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"
            class=3D"moz-txt-link-freetext">https://lists.openembedded.or=
g/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank"
            moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">alex=
.kanavin@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>
--------------HSNAZUYjmZILoWnvtF0H0RG3--


