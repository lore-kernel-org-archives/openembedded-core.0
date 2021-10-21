Return-Path: <kergoth@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE8DC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 21:53:43 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.800.1634853221798268365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 14:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qt3kgv88;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id d3so4398965edp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hClsCS5m71LCtCW9p1IhF3l7IVY3LMOLqdZp7uyicFo=;
        b=Qt3kgv88IpRkoqekz7CHuV9Xxf4MzLb4yNPujqS3VgeRLnDSkvo2z0CdzsZCVpqcvo
         GOkzPONkobdEe6dt5OL3JeNhCvQ4AW+7rduJlpWm8/xZQ0P+b4CPJPLBGdtEsu7tr+wt
         o/ol8uRZRCuIZH/upD8QCi/g0xmIfhncTDT/ljRmmRAiOKHmUz5sEDT1g9lwByisFaGb
         a+7CfZTv2EtltFer8pxjKPzCabs5dzkd8fDhxMAfoEYzMKxRCcWHp8ZPaa49MP9UVd+O
         JRpT4k2no9Uhh0dvLyPwxv0eMtFDUjFuiQcq6FDwNTpsw1gdqS8+y1p+MAqfOzWlNnPy
         +Frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hClsCS5m71LCtCW9p1IhF3l7IVY3LMOLqdZp7uyicFo=;
        b=bfkQMBu5iSgV8hUzryEMzI5xBuIZj9I/4jrp4jpIKyXnQTBJXf8zjseSrWhHgsbHJs
         0bfTSW5a38vugQdAOva4LnjJT2T6s2FPS8J0Ztlm5XCwEWbOPDAds3w1IJ/S07cmpH9a
         2aZGwuJ+aZ5ip2FAn0IRmpn7xvLvBOTWDFhgOd4Dffm7/wGo+thgYsciqGDFcf8dqrcP
         AGccE3tvtdiW8AodyhDfVS5r8zDrlsx/YXo8+nb5n2Vfl2Hg8CIaRNj6TVIsZpmqSFYu
         SQHvNj2sD88Lo79BO8IsgwbgLblkbFMnvOtlluAmYvL9LehPDgCFiMYyGCIvUNlcnlwa
         OXXQ==
X-Gm-Message-State: AOAM531HoGrtAPG2oHlBeJ9g/P5lODC72chuzhNOSAe1ArKKdyVUr6Kv
	/qWaqNt74BNleXMrI37QDjRJBzy8NB6ykupqENE=
X-Google-Smtp-Source: 
 ABdhPJzIM7Ch6ZmMqFqaAKygr1a1FO+aUV4M7iDShDNs0e39dtmT3JxQcBUuxs8tizNNFjf610py/puV88wSHicB4rs=
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr10223050ejw.236.1634853219912;
 Thu, 21 Oct 2021 14:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211021143010.803736-1-ross.burton@arm.com>
In-Reply-To: <20211021143010.803736-1-ross.burton@arm.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 21 Oct 2021 14:53:28 -0700
Message-ID: 
 <CABcZAN=WLDgnkcq1=4T63v872YXKYkwadF=rcyK3=PnE_QCw_w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] strace: show test suite log on failure
To: Ross Burton <ross@burtonini.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006ed00105cee3edee"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 21:53:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157289

--0000000000006ed00105cee3edee
Content-Type: text/plain; charset="UTF-8"

I'm not familiar enough with the ptest-runner to say, but does the exit
code of run-ptest get used at all, or only the output in the expected
format? Just noticed this will suppress the non-zero exit code of run-ptest.

On Thu, Oct 21, 2021 at 7:30 AM Ross Burton <ross@burtonini.com> wrote:

> If the tests fail, dump the log so we can see the failures.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/strace/strace/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/strace/strace/run-ptest
> b/meta/recipes-devtools/strace/strace/run-ptest
> index 3a51fb0be9..42ececdc4f 100755
> --- a/meta/recipes-devtools/strace/strace/run-ptest
> +++ b/meta/recipes-devtools/strace/strace/run-ptest
> @@ -3,4 +3,4 @@ export TIMEOUT_DURATION=240
>  chown nobody tests
>  chown nobody tests/*
>  chown nobody ../ptest
> -su nobody -c "make -B -C tests -k test-suite.log"
> +su nobody -c "make -B -C tests -k test-suite.log" || cat
> tests/test-suite.log
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157284):
> https://lists.openembedded.org/g/openembedded-core/message/157284
> Mute This Topic: https://lists.openembedded.org/mt/86490861/3617123
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> kergoth@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000006ed00105cee3edee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m not familiar enough with the ptest-runner to say, =
but does the exit code of run-ptest get used at all, or only the output in =
the expected format? Just noticed this will suppress the non-zero exit code=
 of run-ptest.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Oct 21, 2021 at 7:30 AM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">If the tests fail, dump the lo=
g so we can see the failures.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/strace/strace/run-ptest | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/strace/strace/run-ptest b/meta/recipes-d=
evtools/strace/strace/run-ptest<br>
index 3a51fb0be9..42ececdc4f 100755<br>
--- a/meta/recipes-devtools/strace/strace/run-ptest<br>
+++ b/meta/recipes-devtools/strace/strace/run-ptest<br>
@@ -3,4 +3,4 @@ export TIMEOUT_DURATION=3D240<br>
=C2=A0chown nobody tests<br>
=C2=A0chown nobody tests/*<br>
=C2=A0chown nobody ../ptest<br>
-su nobody -c &quot;make -B -C tests -k test-suite.log&quot;<br>
+su nobody -c &quot;make -B -C tests -k test-suite.log&quot; || cat tests/t=
est-suite.log<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#157284): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/157284" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/157284</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86490861/3617=
123" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86490861/3617123</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:kergoth@gmail.com" target=
=3D"_blank">kergoth@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christoph=
er Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, O=
penZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></d=
iv>

--0000000000006ed00105cee3edee--

