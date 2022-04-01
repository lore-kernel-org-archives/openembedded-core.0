Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BABC4332F
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 15:02:46 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.11752.1648825365981394698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 08:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Xb83AX/q;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id i7so3067914oie.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V0pfvL8xTpfU0FJwK8O8eXMuc5BvZIEe57Hpmg7CM9c=;
        b=Xb83AX/q9OhVmvqKJJq8TavtEWpmnk2zHs0PYzdPvl0K0sboKioz3SveNuiQV0tour
         eMAwhylF1mbbVvFMa0KCaHisfYaj9EvJ5oZ1BPs+cyjG3pKf2+ZhPgJKLpWCVDvjxf0T
         VWi2FEWYa77t152E3nWbxoz8FuP+hI1VPVVaVyNEJYw/tyFVs751nvKC+zzTBximLlrF
         19qNdBoGJWbgwxTb1iKqTw2J4DOVZAgT48QY9a830R3FOHHBbfNV2I6rmpyqPIqLGHER
         GFaDtUZVVseGeGXUPTJXi7RpAXrLPkh0OMgvUQeAwqEjumjks6hQwQVzAYpNX8EWbKNd
         a0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0pfvL8xTpfU0FJwK8O8eXMuc5BvZIEe57Hpmg7CM9c=;
        b=o8ZeZjHmi9m66iQQmrXSPjZ0jixXDmdUvtGdP28dIhepV17qz48+mFp+SnvqzCAZ8+
         1nFVJ6z9qTjwmdeKPGJm8XF098q+7uVOZzxfB6SxfpR7d2i2a+te/Iz7Tcu4+zsBP7mP
         InPgZkzXFt3ZOjn32xtmVzupQRqLi/nQIh+REVAxSggcuSrj9Ba+J187ZcWsw4K7SN+f
         EIxoEmDZ3ESDfGfmFHYEMpgtMnbsOj4O2ZS7dYpCGW6JETvlreimLuNXTlien9qZoRPq
         EHZ63puEoQkwkSm8x90defgj7zFgM0tfGJm4ks6YymWmbQ6fmCPj8Ti3B2bEONCFnQCe
         5E0w==
X-Gm-Message-State: AOAM5302foaTRYmIKixAvdwR2Adq8rkk3jOUTS/PMcqni4TPigru6suk
	NKA8xL1ECAjoAxWR7I79I9bOzC8Es9+CCMnl1js=
X-Google-Smtp-Source: 
 ABdhPJxfX9dZYh4E7CvKGlA1eRKx7xRZP0zHP2WMjbR6MyGfp4Tgjm2QnRxtwp3RyGIGvR5YZBJmXax1y7O9PVUJw80=
X-Received: by 2002:aca:a9c8:0:b0:2da:45b6:b796 with SMTP id
 s191-20020acaa9c8000000b002da45b6b796mr4668387oie.193.1648825365050; Fri, 01
 Apr 2022 08:02:45 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
In-Reply-To: 
 <0bdd8781-1174-4002-a3b6-4b3de641d2d3@denue6es010.ebgroup.elektrobit.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Apr 2022 17:02:33 +0200
Message-ID: 
 <CANNYZj-UB6hGHxL4biVC9NYtxy9EDdScUKERHKQjRF4AP5LyFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] popt: add ptest
To: Simone Weiss <simone.weiss@elektrobit.com>
Cc: David Niederpruem <david.niederpruem@elektrobit.com>,
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e37cf05db99124a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 15:02:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163941

--0000000000002e37cf05db99124a
Content-Type: text/plain; charset="UTF-8"

Please submit the patch upstream first.

Alex

On Fri 1. Apr 2022 at 16.46, Simone Weiss <simone.weiss@elektrobit.com>
wrote:

> Add a ptest for popt to core-image-ptest-all. Provide a patch to popt to
> adopt the test format to "simple test" and a script for running the test.
> All tests passed on a trial run.
>
> Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  ...01-popt-test-output-format-for-ptest.patch | 68 +++++++++++++++++++
>  meta/recipes-support/popt/popt/run-ptest      |  3 +
>  meta/recipes-support/popt/popt_1.18.bb        | 21 +++++-
>  4 files changed, 91 insertions(+), 2 deletions(-)
>  create mode 100644
> meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
>  create mode 100644 meta/recipes-support/popt/popt/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index ac3295d1aa..b51cce4d9e 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -48,6 +48,7 @@ PTESTS_FAST = "\
>      opkg-ptest \
>      pango-ptest \
>      parted-ptest \
> +    popt-ptest \
>      python3-atomicwrites-ptest \
>      python3-bcrypt-ptest \
>      python3-hypothesis-ptest \
> diff --git
> a/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
> b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
> new file mode 100644
> index 0000000000..020949cc34
> --- /dev/null
> +++
> b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest.patch
> @@ -0,0 +1,68 @@
> +From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00 2001
> +From: Simone Weiss <simone.weiss@elektrobit.com>
> +Date: Mon, 13 Dec 2021 09:29:53 +0000
> +Subject: [PATCH] popt test output format for ptest
> +
> +patch test output format to match simple-test as it is used in ptests.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Simone Weiss <simone.weiss@elektrobit.com>
> +Signed-off-by: David Niederpruem <david.niederpruem@elektrobit.com>
> +---
> + tests/testit.sh | 20 ++++++++------------
> + 1 file changed, 8 insertions(+), 12 deletions(-)
> +
> +diff --git a/tests/testit.sh b/tests/testit.sh
> +index 2a7b4aa..50b42e2 100755
> +--- a/tests/testit.sh
> ++++ b/tests/testit.sh
> +@@ -5,12 +5,11 @@ run() {
> +     name=$1; shift
> +     answer=$1; shift
> +
> +-    echo Running test $name.
> +-
> +     result=`HOME=$builddir $builddir/$prog $*`
> +     if [ "$answer" != "$result" ]; then
> +-      echo "Test \"$prog $*\" failed with: \"$result\" != \"$answer\" "
> +-      exit 2
> ++        echo "FAIL: $name"
> ++    else
> ++        echo "PASS: $name"
> +     fi
> + }
> +
> +@@ -23,17 +22,17 @@ run_diff() {
> +     out=$builddir/tmp.out
> +     diff_file=$builddir/tmp.diff
> +
> +-    echo Running test $name.
> +-
> +     $builddir/$prog $in_file > $out
> +     ret=$?
> +     diff $out $answer_file > $diff_file
> +     diff_ret=$?
> +
> +     if [ "$diff_ret" != "0" ]; then
> +-       echo "Test \"$name\" failed output is in $out, diff is:"
> +-       cat $diff_file
> +-       exit 2
> ++        echo "FAIL: $name"
> ++        echo "diff is:"
> ++        cat $diff_file
> ++    else
> ++        echo "PASS: $name"
> +     fi
> +     rm $out $diff_file
> + }
> +@@ -174,6 +173,3 @@ Help options:
> + #run_diff test3 "test3 - 51" test3-data/01.input test3-data/01.answer
> + #run_diff test3 "test3 - 52" test3-data/02.input test3-data/02.answer
> + #run_diff test3 "test3 - 53" test3-data/03.input test3-data/03.answer
> +-
> +-echo ""
> +-echo "Passed."
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/popt/popt/run-ptest
> b/meta/recipes-support/popt/popt/run-ptest
> new file mode 100644
> index 0000000000..85754035d0
> --- /dev/null
> +++ b/meta/recipes-support/popt/popt/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +./testit.sh
> diff --git a/meta/recipes-support/popt/popt_1.18.bb
> b/meta/recipes-support/popt/popt_1.18.bb
> index 057c44f223..af8add4ad6 100644
> --- a/meta/recipes-support/popt/popt_1.18.bb
> +++ b/meta/recipes-support/popt/popt_1.18.bb
> @@ -8,9 +8,26 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=cb0613c30af2a8249b8dcc67d3edb06d"
>
>  DEPENDS = "virtual/libiconv"
>
> -SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz"
> +SRC_URI = "\
> +    http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
> +    file://0001-popt-test-output-format-for-ptest.patch \
> +    file://run-ptest \
> +"
>  SRC_URI[sha256sum] =
> "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24fdc5d1"
>
> -inherit autotools gettext
> +inherit autotools gettext ptest
> +
> +RDEPENDS_${PN}-ptest += "bash"
> +
> +do_compile_ptest() {
> +    sed 's#lt-test1#test1#g' ${S}/tests/testit.sh > ${B}/tests/testit.sh
> +}
> +
> +do_install_ptest() {
> +    install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}
> +    install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}
> +    install ${B}/tests/testit.sh ${D}/${PTEST_PATH}
> +    install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}
> +}
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163940):
> https://lists.openembedded.org/g/openembedded-core/message/163940
> Mute This Topic: https://lists.openembedded.org/mt/90180554/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000002e37cf05db99124a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Please submit the patch upstream first.=C2=A0</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri 1. Apr 2022 at 16.4=
6, Simone Weiss &lt;<a href=3D"mailto:simone.weiss@elektrobit.com">simone.w=
eiss@elektrobit.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Add a ptest fo=
r popt to core-image-ptest-all. Provide a patch to popt to<br>
adopt the test format to &quot;simple test&quot; and a script for running t=
he test.<br>
All tests passed on a trial run.<br>
<br>
Signed-off-by: Simone Weiss &lt;<a href=3D"mailto:simone.weiss@elektrobit.c=
om" target=3D"_blank">simone.weiss@elektrobit.com</a>&gt;<br>
Signed-off-by: David Niederpruem &lt;<a href=3D"mailto:david.niederpruem@el=
ektrobit.com" target=3D"_blank">david.niederpruem@elektrobit.com</a>&gt;<br=
>
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0...01-popt-test-output-format-for-ptest.patch | 68 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-support/popt/popt/run-ptest=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
3 +<br>
=C2=A0meta/recipes-support/popt/<a href=3D"http://popt_1.18.bb" rel=3D"nore=
ferrer" target=3D"_blank">popt_1.18.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 21 =
+++++-<br>
=C2=A04 files changed, 91 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-support/popt/popt/0001-popt-test-outp=
ut-format-for-ptest.patch<br>
=C2=A0create mode 100644 meta/recipes-support/popt/popt/run-ptest<br>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index ac3295d1aa..b51cce4d9e 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -48,6 +48,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0opkg-ptest \<br>
=C2=A0 =C2=A0 =C2=A0pango-ptest \<br>
=C2=A0 =C2=A0 =C2=A0parted-ptest \<br>
+=C2=A0 =C2=A0 popt-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-atomicwrites-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-bcrypt-ptest \<br>
=C2=A0 =C2=A0 =C2=A0python3-hypothesis-ptest \<br>
diff --git a/meta/recipes-support/popt/popt/0001-popt-test-output-format-fo=
r-ptest.patch b/meta/recipes-support/popt/popt/0001-popt-test-output-format=
-for-ptest.patch<br>
new file mode 100644<br>
index 0000000000..020949cc34<br>
--- /dev/null<br>
+++ b/meta/recipes-support/popt/popt/0001-popt-test-output-format-for-ptest=
.patch<br>
@@ -0,0 +1,68 @@<br>
+From 330b77081c3a4c7ae76cb08602db385b40fa7ff7 Mon Sep 17 00:00:00 2001<br>
+From: Simone Weiss &lt;<a href=3D"mailto:simone.weiss@elektrobit.com" targ=
et=3D"_blank">simone.weiss@elektrobit.com</a>&gt;<br>
+Date: Mon, 13 Dec 2021 09:29:53 +0000<br>
+Subject: [PATCH] popt test output format for ptest<br>
+<br>
+patch test output format to match simple-test as it is used in ptests.<br>
+<br>
+Upstream-Status: Pending<br>
+=C2=A0 =C2=A0 <br>
+Signed-off-by: Simone Weiss &lt;<a href=3D"mailto:simone.weiss@elektrobit.=
com" target=3D"_blank">simone.weiss@elektrobit.com</a>&gt;<br>
+Signed-off-by: David Niederpruem &lt;<a href=3D"mailto:david.niederpruem@e=
lektrobit.com" target=3D"_blank">david.niederpruem@elektrobit.com</a>&gt;<b=
r>
+---<br>
+ tests/testit.sh | 20 ++++++++------------<br>
+ 1 file changed, 8 insertions(+), 12 deletions(-)<br>
+<br>
+diff --git a/tests/testit.sh b/tests/testit.sh<br>
+index 2a7b4aa..50b42e2 100755<br>
+--- a/tests/testit.sh<br>
++++ b/tests/testit.sh<br>
+@@ -5,12 +5,11 @@ run() {<br>
+=C2=A0 =C2=A0 =C2=A0name=3D$1; shift<br>
+=C2=A0 =C2=A0 =C2=A0answer=3D$1; shift<br>
+ <br>
+-=C2=A0 =C2=A0 echo Running test $name.<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0result=3D`HOME=3D$builddir $builddir/$prog $*`<br>
+=C2=A0 =C2=A0 =C2=A0if [ &quot;$answer&quot; !=3D &quot;$result&quot; ]; t=
hen<br>
+-=C2=A0 =C2=A0 =C2=A0 echo &quot;Test \&quot;$prog $*\&quot; failed with: =
\&quot;$result\&quot; !=3D \&quot;$answer\&quot; &quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 exit 2<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $name&quot;<br>
++=C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0fi<br>
+ }<br>
+ <br>
+@@ -23,17 +22,17 @@ run_diff() {<br>
+=C2=A0 =C2=A0 =C2=A0out=3D$builddir/tmp.out<br>
+=C2=A0 =C2=A0 =C2=A0diff_file=3D$builddir/tmp.diff<br>
+ <br>
+-=C2=A0 =C2=A0 echo Running test $name.<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0$builddir/$prog $in_file &gt; $out<br>
+=C2=A0 =C2=A0 =C2=A0ret=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0diff $out $answer_file &gt; $diff_file<br>
+=C2=A0 =C2=A0 =C2=A0diff_ret=3D$?<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if [ &quot;$diff_ret&quot; !=3D &quot;0&quot; ]; then<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Test \&quot;$name\&quot; failed out=
put is in $out, diff is:&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0cat $diff_file<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 2<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $name&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;diff is:&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cat $diff_file<br>
++=C2=A0 =C2=A0 else<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $name&quot;<br>
+=C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0rm $out $diff_file<br>
+ }<br>
+@@ -174,6 +173,3 @@ Help options:<br>
+ #run_diff test3 &quot;test3 - 51&quot; test3-data/01.input test3-data/01.=
answer<br>
+ #run_diff test3 &quot;test3 - 52&quot; test3-data/02.input test3-data/02.=
answer<br>
+ #run_diff test3 &quot;test3 - 53&quot; test3-data/03.input test3-data/03.=
answer<br>
+-<br>
+-echo &quot;&quot;<br>
+-echo &quot;Passed.&quot;<br>
+-- <br>
+2.17.1<br>
+<br>
diff --git a/meta/recipes-support/popt/popt/run-ptest b/meta/recipes-suppor=
t/popt/popt/run-ptest<br>
new file mode 100644<br>
index 0000000000..85754035d0<br>
--- /dev/null<br>
+++ b/meta/recipes-support/popt/popt/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+./testit.sh<br>
diff --git a/meta/recipes-support/popt/<a href=3D"http://popt_1.18.bb" rel=
=3D"noreferrer" target=3D"_blank">popt_1.18.bb</a> b/meta/recipes-support/p=
opt/<a href=3D"http://popt_1.18.bb" rel=3D"noreferrer" target=3D"_blank">po=
pt_1.18.bb</a><br>
index 057c44f223..af8add4ad6 100644<br>
--- a/meta/recipes-support/popt/<a href=3D"http://popt_1.18.bb" rel=3D"nore=
ferrer" target=3D"_blank">popt_1.18.bb</a><br>
+++ b/meta/recipes-support/popt/<a href=3D"http://popt_1.18.bb" rel=3D"nore=
ferrer" target=3D"_blank">popt_1.18.bb</a><br>
@@ -8,9 +8,26 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dcb0613c30a=
f2a8249b8dcc67d3edb06d&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;virtual/libiconv&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"http://ftp.rpm.org/popt/releases/popt-1.x/$%7=
BBP%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.rpm.org/popt=
/releases/popt-1.x/${BP}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 <a href=3D"http://ftp.rpm.org/popt/releases/popt-1.x/$%7BBP%=
7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://ftp.rpm.org/popt/rel=
eases/popt-1.x/${BP}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 file://0001-popt-test-output-format-for-ptest.patch \<br>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;5159bc03a20b28ce363aa96765f37df99ea4d885=
0b1ece17d1e6ad5c24fdc5d1&quot;<br>
<br>
-inherit autotools gettext<br>
+inherit autotools gettext ptest<br>
+<br>
+RDEPENDS_${PN}-ptest +=3D &quot;bash&quot;<br>
+<br>
+do_compile_ptest() {<br>
+=C2=A0 =C2=A0 sed &#39;s#lt-test1#test1#g&#39; ${S}/tests/testit.sh &gt; $=
{B}/tests/testit.sh<br>
+}<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 install ${B}/tests/.libs/test* ${D}/${PTEST_PATH}<br>
+=C2=A0 =C2=A0 install ${B}/tests/.libs/tdict ${D}/${PTEST_PATH}<br>
+=C2=A0 =C2=A0 install ${B}/tests/testit.sh ${D}/${PTEST_PATH}<br>
+=C2=A0 =C2=A0 install ${B}/tests/test-poptrc ${D}/${PTEST_PATH}<br>
+}<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163940): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163940" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163940</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90180554/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/90180554/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000002e37cf05db99124a--

