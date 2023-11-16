Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABA3C54FB9
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 10:30:27 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.4033.1700130620188056054
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 02:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EXOgFR1G;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso5375025e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 02:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700130618; x=1700735418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W5oifRl6fOGF1f73GizA6mhnsOcY1W7jEvmJKxTjCZ4=;
        b=EXOgFR1GXmIuMR26Afciz5C2LjfrG/hgnRVg+cwj8gmxJZusVtE21kofbsXHjaXu1K
         2KGaIl+4bmwyaZgRhao9LLuKx959JVHnkVPhhQG2LQcrc3IrpxE4qPbRVuoUi2TfRN1t
         UfPlKoefJLnAUCErx2TifL99c717KsyvZJ4aWjynMoVyicJJhKDfqE7/QtfQCfVQ6gW4
         84n/Nd/SRY/7VziaKDhA2w/Ka0BVVyxiYybU8S1XB27lMBNUcvV0/4JXp31TWffEiJiW
         yOXOuwMkgz03aKRPl5gZswEZAH1dVBxgD9VHXWw6OznOX0kx+EEXOW8tmPHsPyXhe8Ys
         0uDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700130618; x=1700735418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5oifRl6fOGF1f73GizA6mhnsOcY1W7jEvmJKxTjCZ4=;
        b=DijmM+b8Z5rnlSffPEkVMZesyghtdlzX70ISaGiQOdF5ZHugECHpjrFSogjcAAsUNO
         vCThBqutVJDIxI3okwDS2Z+0VQtkpTZu9857DmAeQZKJirarz/0r9nb3xv8vwa9CgHGs
         FVvZuBaW+MeG91/0RqKk052gwsAIZ0IcncmuHboyzKrccU3UnbbR3u+m5mQ62lXu3+P2
         Ukv7oi8yMSMy8vrX5gJ5LCwG5MbeBvnaNy6mO+ueeLWZmw2c1YLQpstySb8uhkaQFsIb
         UfU/+vBVPYx2jEaPQiBcjnemzFY5iQOgywecWywBov9dcqfq6r5fkULNid8xI56HE49w
         AiOw==
X-Gm-Message-State: AOJu0Yyyqo1UMq+I3Xgqxcg/8fV4pXrUx/tKhJ05+sdta8ZOS0g9TgoG
	xBXC4LElDuL6ES6CwVQ95lIGAKZe1WXe//fcUS8=
X-Google-Smtp-Source: AGHT+IGYpgIMCOzJSOEBKNs/VJx/PC666SmdCDgP6HtZE4B6WeTwMzmYDD/AkGQiEeKdFTX49BdbBGyBO7XIrHi09Mk=
X-Received: by 2002:adf:a3d5:0:b0:313:f463:9d40 with SMTP id
 m21-20020adfa3d5000000b00313f4639d40mr9438825wrb.65.1700130618310; Thu, 16
 Nov 2023 02:30:18 -0800 (PST)
MIME-Version: 1.0
References: <17980A549B19C5AB.23420@lists.openembedded.org>
In-Reply-To: <17980A549B19C5AB.23420@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Nov 2023 11:30:06 +0100
Message-ID: <CA+chaQfUHPdaMJA93bYpSi5ezQhjcNR4_86YCc7sX=PeX6bO2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 01/11] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000093844d060a42810c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 10:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190769

--00000000000093844d060a42810c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

RP asked on #yocto to add TARGET_DBGSRC_DIR variable for
/usr/src/debug/${PN}/${PV} so that all recipes fixed in follow up changes
(and 10+ more for meta-oe layers) can use this instead of hardcoding the
/usr/src/debug/${PN}/${PV} value.

Will send v4 later today.

On Thu, Nov 16, 2023 at 8:36=E2=80=AFAM Martin Jansa via lists.openembedded=
.org
<martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
>   https://lists.openembedded.org/g/openembedded-core/message/185818
>   adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
>   As we don't depend on PR in WORKDIR maybe we don't need it in
>   /usr/src/debug paths as well anymore.
>
> * The interesting side-effect of this is that for DISTROs which still
>   use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
>   all binaries to be slightly different when rebuilt with different PR
>   (due to this path, even when otherwise they are binary reproducible)
>   and when the number of digits in PR changes (e.g. from r9 to r10) it
>   also results in slightly bigger binaries (and more unnecessary changes
>   in buildhistory diffs).
>
>   For example this foo binary, the difference between "new" and "old" is
>   extra patch applied in SRC_URI (which doesn't affect the foo binary,
>   but was the reason for PR bump).
>
>   And the binary is bigger with r10, identical with r6 and slightly
>   different due to debug-prefix-map between r6 and r7:
>
>   $ ls -la 1.0.0-175-*/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29
> 1.0.0-175-new-r10/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02
> 1.0.0-175-new-r6/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49
> 1.0.0-175-new-r7/image/usr/sbin/foo
>   -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39
> 1.0.0-175-old-r6/image/usr/sbin/foo
>
>   $ md5sum 1.0.0-175-*/image/usr/sbin/foo
>   8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
>   6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
>   f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
> v3: added additional fix for perf (and changes in other recipes were move=
d
> to separate commits)
>
>  meta/conf/bitbake.conf | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 67ff769046..3836a389b8 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
>  ##################################################################
>  # Beware: applied last to first
>  DEBUG_PREFIX_MAP ?=3D "-fcanon-prefix-map \
> - -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> - -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}=
 \
> + -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \
> + -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
> + -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \
>   -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \
>   -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \
>   -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \
> --
> 2.42.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190753):
> https://lists.openembedded.org/g/openembedded-core/message/190753
> Mute This Topic: https://lists.openembedded.org/mt/102623139/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000093844d060a42810c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">RP asked on #yocto to add=C2=A0TARGET_DBGSRC_DIR variable =
for /usr/src/debug/${PN}/${PV} so that all recipes fixed in follow up chang=
es (and 10+ more for meta-oe layers) can use this instead of hardcoding the=
 /usr/src/debug/${PN}/${PV} value.<div><br></div><div>Will send v4 later to=
day.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Nov 16, 2023 at 8:36=E2=80=AFAM Martin Jansa via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;martin.ja=
nsa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.o=
penembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">* ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} =
in:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/185818" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/185818</a><br>
=C2=A0 adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.<br>
=C2=A0 As we don&#39;t depend on PR in WORKDIR maybe we don&#39;t need it i=
n<br>
=C2=A0 /usr/src/debug paths as well anymore.<br>
<br>
* The interesting side-effect of this is that for DISTROs which still<br>
=C2=A0 use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes=
<br>
=C2=A0 all binaries to be slightly different when rebuilt with different PR=
<br>
=C2=A0 (due to this path, even when otherwise they are binary reproducible)=
<br>
=C2=A0 and when the number of digits in PR changes (e.g. from r9 to r10) it=
<br>
=C2=A0 also results in slightly bigger binaries (and more unnecessary chang=
es<br>
=C2=A0 in buildhistory diffs).<br>
<br>
=C2=A0 For example this foo binary, the difference between &quot;new&quot; =
and &quot;old&quot; is<br>
=C2=A0 extra patch applied in SRC_URI (which doesn&#39;t affect the foo bin=
ary,<br>
=C2=A0 but was the reason for PR bump).<br>
<br>
=C2=A0 And the binary is bigger with r10, identical with r6 and slightly<br=
>
=C2=A0 different due to debug-prefix-map between r6 and r7:<br>
<br>
=C2=A0 $ ls -la 1.0.0-175-*/image/usr/sbin/foo<br>
=C2=A0 -rwxr-xr-x 1 bitbake bitbake 30182460 Nov=C2=A0 8 08:29 1.0.0-175-ne=
w-r10/image/usr/sbin/foo<br>
=C2=A0 -rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 08:02 1.0.0-175-ne=
w-r6/image/usr/sbin/foo<br>
=C2=A0 -rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:49 1.0.0-175-ne=
w-r7/image/usr/sbin/foo<br>
=C2=A0 -rwxr-xr-x 1 bitbake bitbake 30182224 Nov=C2=A0 8 07:39 1.0.0-175-ol=
d-r6/image/usr/sbin/foo<br>
<br>
=C2=A0 $ md5sum 1.0.0-175-*/image/usr/sbin/foo<br>
=C2=A0 8e3ab67d596f8cc2f9c6320dab10af01=C2=A0 1.0.0-175-new-r10/image/usr/s=
bin/foo<br>
=C2=A0 f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-new-r6/image/usr/sb=
in/foo<br>
=C2=A0 6469a0b10aac233911e63c5ea97b03c0=C2=A0 1.0.0-175-new-r7/image/usr/sb=
in/foo<br>
=C2=A0 f6ff1e64fe6affb9ba0d8f278cf7ed79=C2=A0 1.0.0-175-old-r6/image/usr/sb=
in/foo<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
v3: added additional fix for perf (and changes in other recipes were moved =
to separate commits)<br>
<br>
=C2=A0meta/conf/bitbake.conf | 8 ++++----<br>
=C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 67ff769046..3836a389b8 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARALLE=
L_MAKEINST} &quot;<br>
=C2=A0##################################################################<br=
>
=C2=A0# Beware: applied last to first<br>
=C2=A0DEBUG_PREFIX_MAP ?=3D &quot;-fcanon-prefix-map \<br>
- -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \=
<br>
- -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \=
<br>
- -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \=
<br>
- -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \=
<br>
+ -fmacro-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
+ -fdebug-prefix-map=3D${S}=3D/usr/src/debug/${PN}/${PV} \<br>
+ -fmacro-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
+ -fdebug-prefix-map=3D${B}=3D/usr/src/debug/${PN}/${PV} \<br>
=C2=A0 -fdebug-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
=C2=A0 -fmacro-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
=C2=A0 -fdebug-prefix-map=3D${STAGING_DIR_NATIVE}=3D \<br>
-- <br>
2.42.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#190753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/190753" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/190753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102623139/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102623139/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000093844d060a42810c--

