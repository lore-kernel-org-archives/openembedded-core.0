Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CB9C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:47:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.39894.1675082848695944436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e1plALPC;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id q10-20020a1cf30a000000b003db0edfdb74so8549696wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 04:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w85yhHnuibn6f94YQ0jAbTUOIX0CPBPV2rm6aocmx5E=;
        b=e1plALPCMOOmiNbJZ4O1M5jYV+Ij4FhtiDGpnEi89oQTR5N140oq/2tMVJG2ISvnk5
         2TebSHKMg6xTKq2eFcLWlyQSbq3T9hd2jIvXpJn2Vx0EiflqYXhFjKJ3HqJWhndT4qLM
         rUayu0xpXDS/qcpxAYi2fS5W8N6EUFtooUwnthClHL/R8dEV8B4rj+G2JlIbtVbfC4td
         e0eXpP9yobITfWr5i95wtkOwEHZZE/cnm3vpfXqoyhOS3qaamusUBGkqZTwS/K5B8oYg
         yE6bR4aWK56sSthXOd4X3pp/pafYFaOF1EEY9ydid81lpx9n+F2loWOiru1LQ728kOev
         iDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w85yhHnuibn6f94YQ0jAbTUOIX0CPBPV2rm6aocmx5E=;
        b=mKSqCIuEbAk5exONAu/kJyVJ6Vt2XWO19/n04f+q6bDALdgPP5VDE9V3pG3QLXH1NV
         xf28fK5l/5pFK2O7rl1ia5hmHNtDNCS1ib+cJ6G+jJwT9P57DYq2LxxA2IpD83ahC2KI
         Y6LdpA9FX2q2zZmz+0lfDDsFYn8TH7HF3oxWFZzmpk77Hqw/zvfZpBZpR6ideXqDHiJn
         jF8RdZWlVLU4IzVvB2bIzE0XiQEsiFjhgvuX2Rk/aj+RkuoQu8YulqCOoW9ahLHCdmRM
         YDE5jZnWrPDPYuz63AGxvCqKZK2gNYr7OY/gV5mDp8Eek+vFVhRA43IGDnWdg+zurG5O
         xncw==
X-Gm-Message-State: AFqh2kpuC2+xBadOw79CDt6HH98pHQXMVuxDEj2/Kwp7wlY2bMjwCB5x
	QgdQs/SRrXABGt/SPUWphBNM/89C/vRVO7aUUng=
X-Google-Smtp-Source: AMrXdXuouGsTEmNJwDqZ3VVCNaXs2BeLjifhUuE4NvQeZzRC87vXBItxyj/92lm5DWglCyYYoQXv310WLVys2bzpgGM=
X-Received: by 2002:a05:600c:5405:b0:3d0:50c4:432c with SMTP id
 he5-20020a05600c540500b003d050c4432cmr2750430wmb.67.1675082846887; Mon, 30
 Jan 2023 04:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20230127163308.2649311-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230127163308.2649311-1-richard.purdie@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Jan 2023 13:47:15 +0100
Message-ID: <CA+chaQe-CteA-B2tSz1nxQwCemoGVRZZBxYTNF7uZdEghgXFQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Inject a dash into PN for BB_HASH_CODEPARSER_VALS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000ee1df05f37a9e3b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:47:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176489

--0000000000000ee1df05f37a9e3b
Content-Type: text/plain; charset="UTF-8"

FWIW: this change doesn't help in the case I've reported earlier, because
the bbclass which was doing the split('-') was also checking that the
suffix was one of the supported values.

So I'll continue to use:
BB_HASH_CODEPARSER_VALS:remove = "PN=no-pn"
in that .bbclass.


On Fri, Jan 27, 2023 at 5:33 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We've had a couple of reports of recipes expecting to be able to call
> split("-") on PN. There isn't any real harm in adding a dash to the dummy
> PN value to avoid these errors.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5aadf6e7078..530b068757b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -959,7 +959,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
>      sstate-lockfile-shared prefuncs postfuncs export_func deptask
> rdeptask \
>      recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename
> lineno \
>      progress mcdepends number_threads"
> -BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234
> PV=0.0-1 PN=nopn METADATA_REVISION=1234"
> +BB_HASH_CODEPARSER_VALS = "LOGFIFO=/ T=/ WORKDIR=/ DATE=1234 TIME=1234
> PV=0.0-1 PN=no-pn METADATA_REVISION=1234"
>
>  MLPREFIX ??= ""
>  MULTILIB_VARIANTS ??= ""
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176452):
> https://lists.openembedded.org/g/openembedded-core/message/176452
> Mute This Topic: https://lists.openembedded.org/mt/96569450/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000000ee1df05f37a9e3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: this change doesn&#39;t help in the case I&#39;ve re=
ported earlier, because the bbclass which was doing the split(&#39;-&#39;) =
was also checking that the suffix was one of the supported values.<div><br>=
</div><div>So I&#39;ll continue to use:</div><div>BB_HASH_CODEPARSER_VALS:r=
emove =3D &quot;PN=3Dno-pn&quot;<br></div><div>in that .bbclass.</div><div>=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Jan 27, 2023 at 5:33 PM Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">W=
e&#39;ve had a couple of reports of recipes expecting to be able to call<br=
>
split(&quot;-&quot;) on PN. There isn&#39;t any real harm in adding a dash =
to the dummy<br>
PN value to avoid these errors.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/conf/bitbake.conf | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 5aadf6e7078..530b068757b 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -959,7 +959,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D &quot;doc deps depends =
\<br>
=C2=A0 =C2=A0 =C2=A0sstate-lockfile-shared prefuncs postfuncs export_func d=
eptask rdeptask \<br>
=C2=A0 =C2=A0 =C2=A0recrdeptask nodeprrecs stamp-extra-info sstate-outputdi=
rs filename lineno \<br>
=C2=A0 =C2=A0 =C2=A0progress mcdepends number_threads&quot;<br>
-BB_HASH_CODEPARSER_VALS =3D &quot;LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D123=
4 TIME=3D1234 PV=3D0.0-1 PN=3Dnopn METADATA_REVISION=3D1234&quot;<br>
+BB_HASH_CODEPARSER_VALS =3D &quot;LOGFIFO=3D/ T=3D/ WORKDIR=3D/ DATE=3D123=
4 TIME=3D1234 PV=3D0.0-1 PN=3Dno-pn METADATA_REVISION=3D1234&quot;<br>
<br>
=C2=A0MLPREFIX ??=3D &quot;&quot;<br>
=C2=A0MULTILIB_VARIANTS ??=3D &quot;&quot;<br>
-- <br>
2.37.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176452): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176452" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176452</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96569450/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96569450/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000000ee1df05f37a9e3b--

