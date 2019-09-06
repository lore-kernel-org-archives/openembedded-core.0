Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 010F97F402
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:30:44 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id k10so7274190qth.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 07:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bUiTivA+CJn6jA8l8CAU542dQn9gSCux5UGuQNLthD8=;
	b=VbXDyGDT1Zj59nHHRFfKt77O98aNbkZ180ctQeEZr+DovqVkBbZ2kSyw481VZZerLJ
	sEMAy5VRF1l06Be6Oe4Jn8vIQD6aSd6jjQEBKMzxMaBVztTrBfLCim9W84u6ZfYHU516
	fhhtr92B6pdZBLySCJwbHoi0O/xjZGrOqUGVcDERsRRjLJ1xRhzcFo+lnq+auNBrFFWu
	+RMFWTCpvyxBspNXPUqxKxpZzqXYWygVnEcXUaI2nWr+GORg1RCt39Re3rKNVhm3VqOJ
	DdZ85aVDp+JJXCA+yt/T4rIyA/3V3UMI44MUQmCND5ktrLp6KlYQXStk4wyt85ZVCFM/
	tlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bUiTivA+CJn6jA8l8CAU542dQn9gSCux5UGuQNLthD8=;
	b=UyCug0MMetNU9bYAVDgWPy6lRFLDIjlnov0ujJh4WMp+20unXl805sahVI8YnvJDDC
	vtPOrWnFUu7DTXLgEStWwqSD1oEB+tsM+PoC3QXT27Qd/21fkJCn2OivkGoi+rG6faD0
	+hPRW7DzS3bqCTsQ994chv9rT/AWKlgN+z6rOWRHlpxYskcYIHf+kYLOy7PDJrvCGSvR
	hsExIsfnrYY/2eL4rQUnDdcKiztXzMObDWw2O2ISd9JuZSVV6vSOKUdUhSpRiW/BHMtj
	q+2nu5xqSKwiwOKaXk66LrPDoWhuEA9DnK/fAzOrwRa56YeQnNQzLWU19yqHYnWa+oMF
	64Ww==
X-Gm-Message-State: APjAAAVt4DCa7nKBOsWaZZn3dY9qT85xEa0KGgF8g4ctkahc4SfHLe8w
	5HIezChSOA8WdYl4dApupAE/q20R+vvSIS/nwkk=
X-Google-Smtp-Source: APXvYqw6MAjydx3tJxd8P//glgmT1dFlfqCcXiagALtj5rO8eBgwM96BuwGO4Lxwmby0Yuhdcg7L1Bmq4kZrQ84ZEOM=
X-Received: by 2002:ac8:d4c:: with SMTP id r12mr9200855qti.88.1567780244503;
	Fri, 06 Sep 2019 07:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
In-Reply-To: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Sep 2019 07:30:34 -0700
Message-ID: <CAMKF1sqBun_F03kqsN3W0pKLBzKsRLLjXrFsGR0C9FBeey5w8g@mail.gmail.com>
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libevent: add granularity to ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Sep 2019 14:30:45 -0000
Content-Type: multipart/alternative; boundary="0000000000008f42450591e3485a"

--0000000000008f42450591e3485a
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019 at 7:04 AM Trevor Gamblin <Trevor.Gamblin@windriver.com>
wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> The libevent ptest used to report only a global pass or a fail result.
> Count individual PASS, FAIL, SKIP results. The SKIP results now
> include tests that are disabled in the libevent code.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
>  1 file changed, 22 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-support/libevent/libevent/run-ptest
> b/meta/recipes-support/libevent/libevent/run-ptest
> index 0241851c70..b7d945246f 100644
> --- a/meta/recipes-support/libevent/libevent/run-ptest
> +++ b/meta/recipes-support/libevent/libevent/run-ptest
> @@ -1,18 +1,28 @@
>  #!/bin/sh
>
> -fail=0
> +# run-ptest - 'ptest' test infrastructure shell script that
> +#   wraps the libevent test scripts
> +#
> +# Trevor Gamblin <trevor.gamblin@windriver.com>
> +###############################################################

+LIBEVENTLIB=/usr/lib/libevent
>

Do we need to account for multilib here ?

+LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
> +
> +cd ${LIBEVENTLIB}/ptest
> +
>  for test in ./test/*
>  do
> -       $test
> -       if [ $? -ne 0 ]
> -       then
> -               fail=1
> -       fi
> +    $test 2>&1|tee -a ${LOG}
>  done
>
> -if [ $fail -eq 0 ]
> -then
> -       echo "PASS: libevent"
> -else
> -       echo "FAIL: libevent"
> -fi
> +passed=`grep OK ${LOG}|wc -l`
> +failed=`grep FAILED ${LOG}|wc -l`
> +skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
> +all=$((passed + failed + skipped))
> +
> +(   echo "=== Test Summary ==="
> +    echo "TOTAL: ${all}"
> +    echo "PASSED: ${passed}"
> +    echo "FAILED: ${failed}"
> +    echo "SKIPPED: ${skipped}"
> +) | tee -a ${LOG}
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008f42450591e3485a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 6, 2019 at 7:04 AM Trevor Gamblin &lt;<a href=
=3D"mailto:Trevor.Gamblin@windriver.com">Trevor.Gamblin@windriver.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">From: Trevor Gamblin &lt;=
<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank">trevor.ga=
mblin@windriver.com</a>&gt;<br>
<br>
The libevent ptest used to report only a global pass or a fail result.<br>
Count individual PASS, FAIL, SKIP results. The SKIP results now<br>
include tests that are disabled in the libevent code.<br>
<br>
Signed-off-by: Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windrive=
r.com" target=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../libevent/libevent/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 34 ++++++++++++-------<br>
=C2=A01 file changed, 22 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipe=
s-support/libevent/libevent/run-ptest<br>
index 0241851c70..b7d945246f 100644<br>
--- a/meta/recipes-support/libevent/libevent/run-ptest<br>
+++ b/meta/recipes-support/libevent/libevent/run-ptest<br>
@@ -1,18 +1,28 @@<br>
=C2=A0#!/bin/sh<br>
<br>
-fail=3D0<br>
+# run-ptest - &#39;ptest&#39; test infrastructure shell script that<br>
+#=C2=A0 =C2=A0wraps the libevent test scripts <br>
+#<br>
+# Trevor Gamblin &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" targe=
t=3D"_blank">trevor.gamblin@windriver.com</a>&gt;<br>
+###############################################################</blockquot=
e><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">+LIBEVENTLIB=3D/usr/lib/libevent<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Do we need to ac=
count for multilib here ?</div><div dir=3D"auto"><br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">+LOG=3D&quot;${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%=
m%d-%H%M%S).log&quot;<br>
+<br>
+cd ${LIBEVENTLIB}/ptest <br>
+<br>
=C2=A0for test in ./test/*<br>
=C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$test<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ $? -ne 0 ]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fail=3D1<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 $test 2&gt;&amp;1|tee -a ${LOG}<br>
=C2=A0done<br>
<br>
-if [ $fail -eq 0 ]<br>
-then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;PASS: libevent&quot;<br>
-else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL: libevent&quot;<br>
-fi<br>
+passed=3D`grep OK ${LOG}|wc -l`<br>
+failed=3D`grep FAILED ${LOG}|wc -l`<br>
+skipped=3D`grep -E &#39;DISABLED|SKIPPED&#39; ${LOG}|wc -l`<br>
+all=3D$((passed + failed + skipped))<br>
+<br>
+(=C2=A0 =C2=A0echo &quot;=3D=3D=3D Test Summary =3D=3D=3D&quot;<br>
+=C2=A0 =C2=A0 echo &quot;TOTAL: ${all}&quot;<br>
+=C2=A0 =C2=A0 echo &quot;PASSED: ${passed}&quot;<br>
+=C2=A0 =C2=A0 echo &quot;FAILED: ${failed}&quot;<br>
+=C2=A0 =C2=A0 echo &quot;SKIPPED: ${skipped}&quot;<br>
+) | tee -a ${LOG}<br>
-- <br>
2.21.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000008f42450591e3485a--
