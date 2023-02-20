Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078D0C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:19:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.17485.1676909985095758254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LvE7Pr81;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id j17so1868950ljq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erqx9jNy5V2XJWgt64EsPpyMgloPe+lbPX8Yj2Hm0DM=;
        b=LvE7Pr81qR0Wl28hIiOBJ8bgW91vIUHK5FjTkheDagPtKPxcRDw1tx+HsAf9jpOUPC
         kHgj71mu8sLb5NlD+zCE0lWaDjY2cF22lsxoIoVAOHTIdTdlRQGGXww5uRgodjKg7NbK
         JmWvvkUlspmwVRc2tOmjxl3wlyus0uRcc9VfHJXQkCeW1iUVetjrg42bAPfvO/eRM7O5
         ji8tVrnmoO7gtm0AeW3EmRiqWNFjzAg5ccEVwz4e8jCWmeC9JhI1b7zKx9yTKFsPA/Kd
         67t50O+lIYTt1boSt3fcabvfrD7xGK24of5iV0WkSWkKO5VBNfHJkVt92TQGrBfJ8PAT
         44jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erqx9jNy5V2XJWgt64EsPpyMgloPe+lbPX8Yj2Hm0DM=;
        b=ia9pJsnNN6amBooc0mNCA/B7VzG9PDHPOgg/AkWTQ2Ie72cfkra1nKAaZ1wAArMQMi
         Z3xJZ4L75yGHjMuWQSDAL2yPe6eVrySuXP8g4pFyRbb4MJ5tGjsZktiUW1ePCvjgXnq5
         et9lUXi1kSbjLhCk2qMccte7jjBZhgPjbwYIO049OezpwoNgxxcxe6ODm7yHfmPxaHqw
         Usa/dTFhITzWriRUu+UGQtYNMbZbwuf36unpDAJPgniCynOZSHsMnj8pt9AlhnkCk3oH
         yTK26Fbyw45wY+2d+BuL2nSi+DaN30YM7xeLxm7woLxPRveIyou8vdcTVgELa92SSryL
         xPCg==
X-Gm-Message-State: AO0yUKVhbwd30h5ZkzDKlHJp9vyMHRDUrP/xzapnlXSNUK2QzNu2vsON
	U+CsP7OY3DKAuRnKmle/J0enll/UOWImnYWvKeo=
X-Google-Smtp-Source: AK7set8slV1/h19TBWbsjuWmcXwAp9K8MzRpyuHzVVtFMZqxp+aDI4A6Gmr/N/ejLvKK4ou0ZDvN0EIdyDB8/lfgFHM=
X-Received: by 2002:a2e:a4d1:0:b0:293:5169:6cc6 with SMTP id
 p17-20020a2ea4d1000000b0029351696cc6mr804158ljm.7.1676909983119; Mon, 20 Feb
 2023 08:19:43 -0800 (PST)
MIME-Version: 1.0
References: <20230219193101.338397-1-alex@linutronix.de> <20230219193101.338397-31-alex@linutronix.de>
 <0A05E655-C979-4820-B2D4-011C03A3CD5B@arm.com>
In-Reply-To: <0A05E655-C979-4820-B2D4-011C03A3CD5B@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Feb 2023 17:19:31 +0100
Message-ID: <CANNYZj8QHhsh+a7cwanpbm_nMkCe86tngqH2k9eBttXqnveuww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 31/39] harfbuzz: upgrade 6.0.0 -> 7.0.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177435

Yes, and it will be picked up by the next AUH round, just like this
one was :-) I'm not chasing the hottest updates, for the sake of
personal sanity.

Alex


On Mon, 20 Feb 2023 at 17:02, Ross Burton <Ross.Burton@arm.com> wrote:
>
> FYI there=E2=80=99s a 7.0.1 now too.
>
> Ross
>
> > On 19 Feb 2023, at 19:30, Alexander Kanavin via lists.openembedded.org =
<alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > License-Update: copyright years
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> > ...subset-threads.cc-add-missing-cstdio.patch | 34 -------------------
> > .../{harfbuzz_6.0.0.bb =3D> harfbuzz_7.0.0.bb}  |  7 ++--
> > 2 files changed, 3 insertions(+), 38 deletions(-)
> > delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-th=
reads-hb-subset-threads.cc-add-missing-cstdio.patch
> > rename meta/recipes-graphics/harfbuzz/{harfbuzz_6.0.0.bb =3D> harfbuzz_=
7.0.0.bb} (87%)
> >
> > diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-=
hb-subset-threads.cc-add-missing-cstdio.patch b/meta/recipes-graphics/harfb=
uzz/harfbuzz/0001-test-threads-hb-subset-threads.cc-add-missing-cstdio.patc=
h
> > deleted file mode 100644
> > index 13819f5cf8..0000000000
> > --- a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-test-threads-hb-subs=
et-threads.cc-add-missing-cstdio.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From 7dfa672dac958bdbc7703ab0920e167eaa126754 Mon Sep 17 00:00:00 2001
> > -From: Sergei Trofimovich <slyich@gmail.com>
> > -Date: Mon, 16 Jan 2023 19:49:53 +0000
> > -Subject: [PATCH] test/threads/hb-subset-threads.cc: add missing <cstdi=
o> include
> > -
> > -This week's `gcc-13` snapshot cleaned further up it's standard headers
> > -and exposed missing declaration as a build failure:
> > -
> > -    ../test/threads/hb-subset-threads.cc: In function 'void test_opera=
tion(operation_t, const char*, const test_input_t&)':
> > -    ../test/threads/hb-subset-threads.cc:127:3: error: 'printf' was no=
t declared in this scope
> > -
> > -    ../test/threads/hb-subset-threads.cc: In function 'int main(int, c=
har**)':
> > -    ../test/threads/hb-subset-threads.cc:157:19: error: 'atoi' was not=
 declared in this scope
> > -
> > -Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit=
/7dfa672dac958bdbc7703ab0920e167eaa126754]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - test/threads/hb-subset-threads.cc | 2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > -diff --git a/test/threads/hb-subset-threads.cc b/test/threads/hb-subse=
t-threads.cc
> > -index 9d86d8d51..f0e4b7e2a 100644
> > ---- a/test/threads/hb-subset-threads.cc
> > -+++ b/test/threads/hb-subset-threads.cc
> > -@@ -1,4 +1,6 @@
> > - #include <cassert>
> > -+#include <cstdio>
> > -+#include <cstdlib>
> > - #include <cstring>
> > - #include <thread>
> > - #include <condition_variable>
> > ---
> > -2.39.1
> > -
> > diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb b/meta/re=
cipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
> > similarity index 87%
> > rename from meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
> > rename to meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
> > index 1fce127d07..a85c4ca1ce 100644
> > --- a/meta/recipes-graphics/harfbuzz/harfbuzz_6.0.0.bb
> > +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_7.0.0.bb
> > @@ -4,13 +4,12 @@ HOMEPAGE =3D "http://www.freedesktop.org/wiki/Softwar=
e/HarfBuzz"
> > BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3DHa=
rfBuzz"
> > SECTION =3D "libs"
> > LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6ee0f16281694fb6aa689cca1e0=
fb3da \
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a67cfef01e99e=
4893d \
> >                     file://src/hb-ucd.cc;beginline=3D1;endline=3D15;md5=
=3D29d4dcb6410429195df67efe3382d8bc \
> >                     "
> >
> > -SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
> > -           file://0001-test-threads-hb-subset-threads.cc-add-missing-c=
stdio.patch"
> > -SRC_URI[sha256sum] =3D "1d1010a1751d076d5291e433c138502a794d679a7498d1=
268ee21e2d4a140eb4"
> > +SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
> > +SRC_URI[sha256sum] =3D "7b4685b7066c5c6b8dc6cd7b02f63c554fb8cc1c4ddcfc=
44bc284efa3c20cf28"
> >
> > inherit meson pkgconfig lib_package gtk-doc gobject-introspection githu=
b-releases
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177374): https://lists.openembedded.org/g/openembed=
ded-core/message/177374
> > Mute This Topic: https://lists.openembedded.org/mt/97072168/6875888
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
ross.burton@arm.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

