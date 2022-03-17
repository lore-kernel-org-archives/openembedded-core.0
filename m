Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02FADC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 01:59:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.5550.1647482382955172941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CgqT0tOI;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: ticotimo@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u10so5375904wra.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 18:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSKi36f+Z8GbdOZmpsAl3XBlTIlDpN+VJhsn0V0FjwE=;
        b=CgqT0tOIYo631fbAJIr1tISriSe0uzj0rDQhsz64Omk9NDNOWRuDrFUPr8sNoSPiPc
         r8yVffw0Zm1GvxCP2LF0dQlKyQMNRtsS9mJfrD9R1yR7ez7B0YIAQ33tIrO4oUHxZnj6
         safY4AqWE4wYaN5r+jSPnP4P69mPtpJnIEuVB6LK2TutHz8LQIOf+xt4gFOeWJRukjOq
         8My4oWL/dJC8tTbjHZceE9TWUfTAe4cW7jurtG48vGyWUkQi9H5Oobt6AYhhO/GuYbf/
         TaqXTiYVJIUei5v4cEu8eP5lL98YUB+RMQcucm41WwnvrYCTjj4kuek7dJqgOSWbTdVR
         E5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSKi36f+Z8GbdOZmpsAl3XBlTIlDpN+VJhsn0V0FjwE=;
        b=lZLvaWDtMN+aFLVQmOXjLFs93kOyprYg9hbVg69UwOcMmPsVpPUrx15EMFLN6PMSz7
         wYIuUcLEcehwpUR+9E8/1s8gKPYhQV2m3lLSvHA23aXjRnNOVFxjVLbimpbsujJ73v2q
         f+8u725fnjzQ/Yg2rI3X4p91Vd96agVRIToDw9lWqh8g6wf+NxxTT/tiMd/ZTspMjS9L
         cbc0cJ0ZsnqSQ/sYGSyciuhNyss/BSPpZgP4lTb0qOLA5ZryOYYgawFznEUjbfJt43Ds
         gGm75yiM/DSZ9ve2JOjv+yzQ4aaMrDKL9A7Kz7WcoVv5m9+Wspdnz0mWkS1cIGMlOqtX
         xz8w==
X-Gm-Message-State: AOAM530tDgVvUDIpFHXLvDwpVcc3HFjeimEbeaVYav3xhxIx4cuWrapK
	ZaPRKnDSROHmt1n2huU7XzsQuvf+NKJmdmhryfI=
X-Google-Smtp-Source: 
 ABdhPJwxOMA2jkxNxIL5paikAkoF+yL3NEvtG1Okhx+FTPiFKDeLdE1KZLc84j08YnmAxd+XCnM4VsK1uT3tqvHUzJo=
X-Received: by 2002:a5d:6489:0:b0:203:d75b:5d05 with SMTP id
 o9-20020a5d6489000000b00203d75b5d05mr2096650wri.236.1647482381163; Wed, 16
 Mar 2022 18:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220317003425.971028-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220317003425.971028-1-richard.purdie@linuxfoundation.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 16 Mar 2022 18:59:30 -0700
Message-ID: 
 <CANx9H-CNpnnGCi+26qgVtiGcaRTX3u2h_r8_UQHyoaZY-jreqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Fix ptest result handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001a5fbc05da6062b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 01:59:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163369

--0000000000001a5fbc05da6062b5
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 5:34 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We run the tests correctly, we just don't get individual test result
> reporting. Borrow the code from python3-bcrypt to handle this correctly
> and ensure the test pass/fail scores and individual test results are
> reported in a format we can read.


One day we will have a nice pytest bbclass that makes this easy.

>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3-cryptography/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography/run-ptest
> b/meta/recipes-devtools/python/python3-cryptography/run-ptest
> index 1e97dda63e7..3089df87819 100644
> --- a/meta/recipes-devtools/python/python3-cryptography/run-ptest
> +++ b/meta/recipes-devtools/python/python3-cryptography/run-ptest
> @@ -1,4 +1,4 @@
>  #!/bin/sh
>  if ./check-memfree.py; then
> -    pytest -vvvv tests/
> +    pytest -vvvv tests/ -o log_cli=true -o log_cli_level=INFO | sed -e
> 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e
> 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" ||
> $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk
> '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" ||
> $NF=="XPASS") {$NF="";print $0}else{print}}'
>  fi
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163365):
> https://lists.openembedded.org/g/openembedded-core/message/163365
> Mute This Topic: https://lists.openembedded.org/mt/89835935/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000001a5fbc05da6062b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 16, 2022 at 5:34 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">We run the te=
sts correctly, we just don&#39;t get individual test result<br>
reporting. Borrow the code from python3-bcrypt to handle this correctly<br>
and ensure the test pass/fail scores and individual test results are<br>
reported in a format we can read.</blockquote><div dir=3D"auto"><br></div><=
div dir=3D"auto">One day we will have a nice pytest bbclass that makes this=
 easy.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/python/python3-cryptography/run-ptest | 2 +-<br=
>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/python/python3-cryptography/run-ptest b/=
meta/recipes-devtools/python/python3-cryptography/run-ptest<br>
index 1e97dda63e7..3089df87819 100644<br>
--- a/meta/recipes-devtools/python/python3-cryptography/run-ptest<br>
+++ b/meta/recipes-devtools/python/python3-cryptography/run-ptest<br>
@@ -1,4 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
=C2=A0if ./check-memfree.py; then<br>
-=C2=A0 =C2=A0 pytest -vvvv tests/<br>
+=C2=A0 =C2=A0 pytest -vvvv tests/ -o log_cli=3Dtrue -o log_cli_level=3DINF=
O | sed -e &#39;s/\[...%\]//g&#39;| sed -e &#39;s/PASSED/PASS/g&#39;| sed -=
e &#39;s/FAILED/FAIL/g&#39;|sed -e &#39;s/SKIPPED/SKIP/g&#39;| awk &#39;{if=
 ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;=
SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;){pri=
ntf &quot;%s: %s\n&quot;, $NF, $0}else{print}}&#39;| awk &#39;{if ($NF=3D=
=3D&quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=3D=3D&quot;SKIP&quo=
t; || $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPASS&quot;) {$NF=3D&quo=
t;&quot;;print $0}else{print}}&#39;<br>
=C2=A0fi<br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163365): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163365" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163365</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89835935/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
89835935/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001a5fbc05da6062b5--

