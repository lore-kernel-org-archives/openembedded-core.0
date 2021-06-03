Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.162.1622742377562353636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 10:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NyR9S5We;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id d13so3072659uav.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 10:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TaMmsa1DIEFnL9hrhnLxLBKaJ/hpHe4exNTkICj5bv8=;
        b=NyR9S5WevKTy3lZqO8IKmhOfNqVbBCmunJUE7krCIxhAvrnOLoqv8mG07sJop8r/BF
         MKzskFM+J6ifAqw/IzIs99JHE8UuAmHly7/Kn4Z1FjAIoBamNhTlnBCznFE6twJ8fPZX
         eV4SdpUYQYrwyiBRLrF/c2WTyBqO7dr+BSlQUlF0h8p+hkft6Cv15KfsfAC7tLCdayHV
         AohKl66VvkYTzfKF+rOg72m9Pw+tI0BWSGc+iyn9ypHOh6ldggOtj6PlXt1Qn3eZqrYj
         sstTkc1SPXdVjjJfpJhV9o/tiNMEECN7LJe2a3keylT2Vz01n+a1dwwp6kaJHR0YRsrG
         drbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TaMmsa1DIEFnL9hrhnLxLBKaJ/hpHe4exNTkICj5bv8=;
        b=LgFgpTKFjnLcvstf+H0TH/x8C1WLiokfKUnmiAXWphl8nlDoVKkgTsqsViGYBgmQlr
         OS6M6aZCBtmUit/PoMM/2gUqVrotW6PMTWtC9tPvUlQ/KvDxkA+Pm5CMLYyHFmWhdV2I
         O2ret2q6fUbLHzt2i14HT+LhdUKsend2RMPKF4I5WxNCSQuNPosaqnf7BY2YDZlDa6Ol
         hweFdRPttkVuuzt5N3Ex9o8zG1ClVPHduKW2mnIIrKSViLokWMCYcE+e0vNOZbZhHajC
         5Z8ngccNTOpu40OuKTEoIEEDCuS/64GC5s8fxC1zDxI3xYe2dEBfkkGu+bjO/DrW0bRg
         RZFw==
X-Gm-Message-State: AOAM532w/k2LJSA74BpfRpfz0z0pAj81U5puMyAuihSWz7AwLYFKTmIL
	pDrop9FYDozV2NvaM3kv8HTClhJ+h4SoDEIopBQ=
X-Google-Smtp-Source: ABdhPJymG9idPTgUfFAoXR/4ZiNOD20YMBLMKPUZ/Pnx6zVdrFI9cC4O89fQMiNwE4LOWOptUV1bkJRtGipn5EraSPs=
X-Received: by 2002:a1f:b217:: with SMTP id b23mr616313vkf.16.1622742376649;
 Thu, 03 Jun 2021 10:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210603172149.100248-1-adrian.freihofer@siemens.com>
In-Reply-To: <20210603172149.100248-1-adrian.freihofer@siemens.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 3 Jun 2021 19:46:05 +0200
Message-ID: <CANNYZj9HDXbUm=3LJ3tio4JMKQ56vrMGiYVkHBy9hCNOf=a4Lw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] meta-skeleton: add a ptest example
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="000000000000ec168a05c3e02669"

--000000000000ec168a05c3e02669
Content-Type: text/plain; charset="UTF-8"

Rather than construct an artificial example, is there an actual existing
ptest in oe-core that can be extended to do this junit xml stuff?

Alex

On Thu, 3 Jun 2021 at 19:22, Adrian Freihofer <adrian.freihofer@gmail.com>
wrote:

> ---
>  .../ptest-example/files/run-ptest             | 26 +++++++++++++++++++
>  .../ptest-example/ptest-example_0.1.bb        | 16 ++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100644
> meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
>  create mode 100644 meta-skeleton/recipes-skeleton/ptest-example/
> ptest-example_0.1.bb
>
> diff --git a/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
> b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
> new file mode 100644
> index 0000000000..7c80306475
> --- /dev/null
> +++ b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +
> +# The result should be PASS, FAIL, or SKIP, and the testname can be any
> identifying string.
> +# The ptest-runner does not evaluate stdout or stderr. The output format
> is a recommended convention.
> +# A real ptest would call the unit-test executable instead of echo.
> +echo "PASS:  dummy test passing always"
> +
> +# Optional a ptest might provide a JUnit like XML report. Reports are
> collected by the ptest imagetest if
> +# the TESTIMAGE_PTEST_REPORT_DIR variable is configured for the tested
> image.
> +# Example to fetch a xml report to
> ${TEST_LOG_DIR}/reports-xml/ptest-example.xml:
> +#   TESTIMAGE_PTEST_REPORT_DIR ?= "/tmp/ptest-xml/*.xml:reports-xml"
> +# The following shell heredoc is as a placeholder e.g. for something more
> useful such as
> +# my-gtest --gtest_output="xml:/tmp/ptest-xml/"
> +mkdir -p /tmp/ptest-xml
> +cat << xxxEOFxxx > /tmp/ptest-xml/ptest-example.xml
> +<?xml version="1.0" encoding="UTF-8"?>
> +<testsuites tests="1" failures="0" disabled="0" errors="0" time="0.010"
> timestamp="2020-09-20T10:44:23" name="AllTests">
> +  <testsuite name="ConfigurationTest" tests="1" failures="0" disabled="0"
> errors="0" time="0.010" timestamp="2020-09-20T10:44:23">
> +    <testcase name="readConfiguration" status="run" result="completed"
> time="0.010" timestamp="2020-09-20T10:44:23" classname="ConfigurationTest"
> />
> +  </testsuite>
> +</testsuites>
> +xxxEOFxxx
> +
> +# The ptest-runner evaluates the exit value of a test case: 0 means pass,
> 1 means fail.
> +# This minimal example passes always.
> +exit 0
> diff --git a/meta-skeleton/recipes-skeleton/ptest-example/
> ptest-example_0.1.bb b/meta-skeleton/recipes-skeleton/ptest-example/
> ptest-example_0.1.bb
> new file mode 100644
> index 0000000000..02bc9bcfa2
> --- /dev/null
> +++ b/meta-skeleton/recipes-skeleton/ptest-example/ptest-example_0.1.bb
> @@ -0,0 +1,16 @@
> +SUMMARY = "A very basic ptest enabled recipe"
> +DESCRIPTION = "This recipe provides a minimalistic ptest package"
> +SECTION = "examples"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +
> +# A recipe is "ptest-enabled" if it inherits the ptest class
> +inherit ptest
> +
> +# Usually a ptest contains at least two items: the actual test,
> +# and a shell script (run-ptest) that starts the test.
> +# For this minimized example there is just the script.
> +SRC_URI = "file://run-ptest"
> +
> +# This minimalistic example provides nothing more than a ptest package.
> +ALLOW_EMPTY_${PN} = "1"
> --
> 2.31.1
>
>
> 
>
>

--000000000000ec168a05c3e02669
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Rather than construct an artificial example, is there=
 an actual existing ptest in oe-core that can be extended to do this junit =
xml stuff?</div><div><br></div><div>Alex<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 3 Jun 2021 at 19:=
22, Adrian Freihofer &lt;<a href=3D"mailto:adrian.freihofer@gmail.com">adri=
an.freihofer@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">---<br>
=C2=A0.../ptest-example/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0| 26 +++++++++++++++++++<br>
=C2=A0.../ptest-example/<a href=3D"http://ptest-example_0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">ptest-example_0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 | 16 ++++++++++++<br>
=C2=A02 files changed, 42 insertions(+)<br>
=C2=A0create mode 100644 meta-skeleton/recipes-skeleton/ptest-example/file=
s/run-ptest<br>
=C2=A0create mode 100644 meta-skeleton/recipes-skeleton/ptest-example/<a h=
ref=3D"http://ptest-example_0.1.bb" rel=3D"noreferrer" target=3D"_blank">pt=
est-example_0.1.bb</a><br>
<br>
diff --git a/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest =
b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest<br>
new file mode 100644<br>
index 0000000000..7c80306475<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-skeleton/ptest-example/files/run-ptest<br>
@@ -0,0 +1,26 @@<br>
+#!/bin/sh<br>
+<br>
+# The result should be PASS, FAIL, or SKIP, and the testname can be any i=
dentifying string.<br>
+# The ptest-runner does not evaluate stdout or stderr. The output format =
is a recommended convention.<br>
+# A real ptest would call the unit-test executable instead of echo.<br>
+echo &quot;PASS:=C2=A0 dummy test passing always&quot;<br>
+<br>
+# Optional a ptest might provide a JUnit like XML report. Reports are col=
lected by the ptest imagetest if<br>
+# the TESTIMAGE_PTEST_REPORT_DIR variable is configured for the tested im=
age.<br>
+# Example to fetch a xml report to ${TEST_LOG_DIR}/reports-xml/ptest-exam=
ple.xml:<br>
+#=C2=A0 =C2=A0TESTIMAGE_PTEST_REPORT_DIR ?=3D &quot;/tmp/ptest-xml/*.xml:=
reports-xml&quot;<br>
+# The following shell heredoc is as a placeholder e.g. for something more=
 useful such as<br>
+# my-gtest --gtest_output=3D&quot;xml:/tmp/ptest-xml/&quot;<br>
+mkdir -p /tmp/ptest-xml<br>
+cat &lt;&lt; xxxEOFxxx &gt; /tmp/ptest-xml/ptest-example.xml<br>
+&lt;?xml version=3D&quot;1.0&quot; encoding=3D&quot;UTF-8&quot;?&gt;<br>
+&lt;testsuites tests=3D&quot;1&quot; failures=3D&quot;0&quot; disabled=3D=
&quot;0&quot; errors=3D&quot;0&quot; time=3D&quot;0.010&quot; timestamp=3D&=
quot;2020-09-20T10:44:23&quot; name=3D&quot;AllTests&quot;&gt;<br>
+=C2=A0 &lt;testsuite name=3D&quot;ConfigurationTest&quot; tests=3D&quot;1=
&quot; failures=3D&quot;0&quot; disabled=3D&quot;0&quot; errors=3D&quot;0&q=
uot; time=3D&quot;0.010&quot; timestamp=3D&quot;2020-09-20T10:44:23&quot;&g=
t;<br>
+=C2=A0 =C2=A0 &lt;testcase name=3D&quot;readConfiguration&quot; status=3D=
&quot;run&quot; result=3D&quot;completed&quot; time=3D&quot;0.010&quot; tim=
estamp=3D&quot;2020-09-20T10:44:23&quot; classname=3D&quot;ConfigurationTes=
t&quot; /&gt;<br>
+=C2=A0 &lt;/testsuite&gt;<br>
+&lt;/testsuites&gt;<br>
+xxxEOFxxx<br>
+<br>
+# The ptest-runner evaluates the exit value of a test case: 0 means pass,=
 1 means fail.<br>
+# This minimal example passes always.<br>
+exit 0<br>
diff --git a/meta-skeleton/recipes-skeleton/ptest-example/<a href=3D"http:=
//ptest-example_0.1.bb" rel=3D"noreferrer" target=3D"_blank">ptest-example_=
0.1.bb</a> b/meta-skeleton/recipes-skeleton/ptest-example/<a href=3D"http:/=
/ptest-example_0.1.bb" rel=3D"noreferrer" target=3D"_blank">ptest-example_0=
.1.bb</a><br>
new file mode 100644<br>
index 0000000000..02bc9bcfa2<br>
--- /dev/null<br>
+++ b/meta-skeleton/recipes-skeleton/ptest-example/<a href=3D"http://ptest=
-example_0.1.bb" rel=3D"noreferrer" target=3D"_blank">ptest-example_0.1.bb<=
/a><br>
@@ -0,0 +1,16 @@<br>
+SUMMARY =3D &quot;A very basic ptest enabled recipe&quot;<br>
+DESCRIPTION =3D &quot;This recipe provides a minimalistic ptest package&q=
uot;<br>
+SECTION =3D &quot;examples&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9=
cfbcb788c80a0384361b4de20420&quot;<br>
+<br>
+# A recipe is &quot;ptest-enabled&quot; if it inherits the ptest class<br=
>
+inherit ptest<br>
+<br>
+# Usually a ptest contains at least two items: the actual test,<br>
+# and a shell script (run-ptest) that starts the test.<br>
+# For this minimized example there is just the script.<br>
+SRC_URI =3D &quot;file://run-ptest&quot;<br>
+<br>
+# This minimalistic example provides nothing more than a ptest package.<b=
r>
+ALLOW_EMPTY_${PN} =3D &quot;1&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ec168a05c3e02669--
