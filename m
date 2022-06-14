Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F974C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 13:40:15 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.6182.1655214005281192641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oRKA8Pst;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso4819258wmc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SObAKJDQMEy3Ni3dUi2O1DOJf6kozok8UyF7v/1pXPE=;
        b=oRKA8PstgsMmKTjX9jjn91CozlkDiX16vtDIH2pYWwVbF6q+qXhjtbJLB4W8hmrN9q
         VIQHDpvMpRG2/VdNx3ozD1kM1XiK/U6WXkSVlZ16I+Upw+fL92nLQf2V/Px5V5OP3H6Q
         lbFoyG9coB4OoGYqX2zgHOW3+FXbUwHWTM4+gf3fXHWEen6jucqmCXQkF+fqg9ITEQeW
         L6aBmhje2+Nz7wn+1fH9CTe/S893eR8iArf4S1IV1ub62tLKXjn0URAaK7RhjQtfoMAd
         hpPsL8fRHwMSPOk1JCRbkIB9l4uBbYQqe4d/7J6xsk2U3IK3eM1sbvTpnTc1AL3bwJnT
         n7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SObAKJDQMEy3Ni3dUi2O1DOJf6kozok8UyF7v/1pXPE=;
        b=rW3DCTk0y6nbNI5F/78ASlTIPYDTf6yglydSuArdyrolrr+9UpDqI0owz3W9rZ+b7t
         XjzqXyzBGcyQyyUCWTBibiKVZKsa5/tF4WVdr2KevGfTgDITIdpuQM1SYw3ayguPjC0C
         ymfSwIBuEByfLFJShhsrvyzJt0ORK0A9sX/LrAADl9GZOkxZYL4ZEJsG5it1wdMN4vGu
         0CgTXJ9xQr1QnTIO/y+Q7kyzLlyf504q7Eyb2hT17TXnh22ATGZ1jPn1mkuLOoPoGyRs
         S7d3pyunJFJBUKhb1NEejguX04lbdbfi4VCfXtVgXa8DwwWZirRuQy2RY0ljejhKfTHG
         Zngw==
X-Gm-Message-State: AOAM532jDHY5/SiE0huAATmyEX4cyYMBe3JZYrwrqDfjjzri6oBuAE55
	jbXbjCWHeCHlCXHVrM+0AFGi6PLhsDpB/MWTS6Y=
X-Google-Smtp-Source: 
 ABdhPJyFa+hxKZgI6SBVwBc0x1OKATRjIvh9Q6eWHZbcnAoRXLOWFf/utKfWrLkwL/soQpmkt8t7U3yNGfFTkhRUHPg=
X-Received: by 2002:a7b:c057:0:b0:39c:4579:42e1 with SMTP id
 u23-20020a7bc057000000b0039c457942e1mr4286563wmc.102.1655214003719; Tue, 14
 Jun 2022 06:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
 <20220614131652.566471-6-ptsneves@gmail.com>
In-Reply-To: <20220614131652.566471-6-ptsneves@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jun 2022 15:39:47 +0200
Message-ID: 
 <CA+chaQeSuFsrFdGLjyV42kk3wmiFEK8aMMuyBTA7VdDPH-Wb1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/7] utils: Add cmdline_shebang_wrapper util.
To: Paulo Neves <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b811bb05e1688a44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 13:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166889

--000000000000b811bb05e1688a44
Content-Type: text/plain; charset="UTF-8"

FILESEXTRAPATHS:prepend doesn't seem to be needed and LICENSE is really
CLOSED?

On Tue, Jun 14, 2022 at 3:17 PM Paulo Neves <ptsneves@gmail.com> wrote:

> Useful to work around shebang relocation issues, where
> shebangs are too long or have arguments in them, thus preventing them
> from using the /usr/bin/env shebang.
> ---
>  .../wrapper/cmdline-shebang-wrapper-test.bb   | 21 ++++++++++++
>  .../recipes-test/wrapper/files/test.awk       |  2 ++
>  meta/classes/utils.bbclass                    | 34 +++++++++++++++++++
>  meta/lib/oeqa/selftest/cases/wrapper.py       | 11 ++++++
>  4 files changed, 68 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/wrapper/
> cmdline-shebang-wrapper-test.bb
>  create mode 100644 meta-selftest/recipes-test/wrapper/files/test.awk
>  create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py
>
> diff --git a/meta-selftest/recipes-test/wrapper/
> cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/
> cmdline-shebang-wrapper-test.bb
> new file mode 100644
> index 0000000000..302eea8901
> --- /dev/null
> +++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
> @@ -0,0 +1,21 @@
> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
> +SUMMARY = "Check that create_cmdline_shebang works"
> +LICENSE = "CLOSED"
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +SRC_URI += "file://test.awk"
> +
> +EXCLUDE_FROM_WORLD = "1"
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
> +    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
> +    create_cmdline_shebang_wrapper ${D}${bindir}/test
> +    if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
> +        bbfatal "Wrapper is broken"
> +    else
> +        bbnote "Wrapper is good"
> +    fi
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk
> b/meta-selftest/recipes-test/wrapper/files/test.awk
> new file mode 100644
> index 0000000000..91429197b1
> --- /dev/null
> +++ b/meta-selftest/recipes-test/wrapper/files/test.awk
> @@ -0,0 +1,2 @@
> +#! @AWK_BIN@ -f
> +BEGIN { print "Don't Panic!" }
> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> index b4eb3d38ab..b617632d9f 100644
> --- a/meta/classes/utils.bbclass
> +++ b/meta/classes/utils.bbclass
> @@ -184,6 +184,40 @@ END
>         chmod +x $cmd
>  }
>
> +create_cmdline_shebang_wrapper () {
> +       # Create a wrapper script where commandline options are needed
> +       #
> +       # These are useful to work around shebang relocation issues, where
> shebangs are too
> +  # long or have arguments in them, thus preventing them from using the
> /usr/bin/env
> +       # shebang
> +       #
> +       # Usage: create_cmdline_wrapper FILENAME <extra-options>
> +
> +       cmd=$1
> +       shift
> +
> +       echo "Generating wrapper script for $cmd"
> +
> +  # Strip #! and get remaining interpreter + arg
> +  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )")"
> +  # strip the shebang from the real script as we do not want it to be
> usable anyway
> +  tail -n +2 $cmd > $cmd.real
> +       cmdname=$(basename $cmd)
> +       dirname=$(dirname $cmd)
> +       cmdoptions=$@
> +       if [ "${base_prefix}" != "" ]; then
> +               relpath=`python3 -c "import os;
> print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
> +               cmdoptions=`echo $@ | sed -e
> "s:${base_prefix}:\\$realdir/$relpath:g"`
> +       fi
> +       cat <<END >$cmd
> +#!/usr/bin/env bash
> +realpath=\`readlink -fn \$0\`
> +realdir=\`dirname \$realpath\`
> +exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real $cmdoptions
> "\$@"
> +END
> +       chmod +x $cmd
> +}
> +
>  create_wrapper () {
>         # Create a wrapper script where extra environment variables are
> needed
>         #
> diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py
> b/meta/lib/oeqa/selftest/cases/wrapper.py
> new file mode 100644
> index 0000000000..6de63310c0
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/wrapper.py
> @@ -0,0 +1,11 @@
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +
> +class WrapperTests(OESelftestTestCase):
> +    def test_shebang_wrapper(self):
> +        """
> +        Summary:   Build a recipe which will fail if the
> cmdline_shebang_wrapper function is defective.
> +        Expected:  Exit status to be 0.
> +        Author:    Paulo Neves <ptsneves@gmail.com>
> +        """
> +        res = bitbake("cmdline-shebang-wrapper-test -c install",
> ignore_status=False)
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166887):
> https://lists.openembedded.org/g/openembedded-core/message/166887
> Mute This Topic: https://lists.openembedded.org/mt/91748692/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b811bb05e1688a44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FILESEXTRAPATHS:prepend doesn&#39;t seem to be needed and =
LICENSE is really CLOSED?<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Jun 14, 2022 at 3:17 PM Paulo Neves &=
lt;<a href=3D"mailto:ptsneves@gmail.com">ptsneves@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Useful to work a=
round shebang relocation issues, where<br>
shebangs are too long or have arguments in them, thus preventing them<br>
from using the /usr/bin/env shebang.<br>
---<br>
=C2=A0.../wrapper/<a href=3D"http://cmdline-shebang-wrapper-test.bb" rel=3D=
"noreferrer" target=3D"_blank">cmdline-shebang-wrapper-test.bb</a>=C2=A0 =
=C2=A0| 21 ++++++++++++<br>
=C2=A0.../recipes-test/wrapper/files/test.awk=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 ++<br>
=C2=A0meta/classes/utils.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34 +++++++++++++++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/wrapper.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
1 ++++++<br>
=C2=A04 files changed, 68 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/wrapper/<a href=3D"http=
://cmdline-shebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cm=
dline-shebang-wrapper-test.bb</a><br>
=C2=A0create mode 100644 meta-selftest/recipes-test/wrapper/files/test.awk<=
br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py<br>
<br>
diff --git a/meta-selftest/recipes-test/wrapper/<a href=3D"http://cmdline-s=
hebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmdline-sheban=
g-wrapper-test.bb</a> b/meta-selftest/recipes-test/wrapper/<a href=3D"http:=
//cmdline-shebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmd=
line-shebang-wrapper-test.bb</a><br>
new file mode 100644<br>
index 0000000000..302eea8901<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/wrapper/<a href=3D"http://cmdline-shebang-=
wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmdline-shebang-wrapp=
er-test.bb</a><br>
@@ -0,0 +1,21 @@<br>
+FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
+SUMMARY =3D &quot;Check that create_cmdline_shebang works&quot;<br>
+LICENSE =3D &quot;CLOSED&quot;<br>
+INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
+<br>
+SRC_URI +=3D &quot;file://test.awk&quot;<br>
+<br>
+EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
+=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test<br>
+=C2=A0 =C2=A0 sed -i -e &#39;s|@AWK_BIN@|${bindir}/awk|g&#39; ${D}${bindir=
}/test<br>
+=C2=A0 =C2=A0 create_cmdline_shebang_wrapper ${D}${bindir}/test<br>
+=C2=A0 =C2=A0 if [ $(${D}${bindir}/test) !=3D &quot;Don&#39;t Panic!&quot;=
 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;Wrapper is broken&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;Wrapper is good&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk b/meta-selft=
est/recipes-test/wrapper/files/test.awk<br>
new file mode 100644<br>
index 0000000000..91429197b1<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/wrapper/files/test.awk<br>
@@ -0,0 +1,2 @@<br>
+#! @AWK_BIN@ -f<br>
+BEGIN { print &quot;Don&#39;t Panic!&quot; }<br>
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass<br>
index b4eb3d38ab..b617632d9f 100644<br>
--- a/meta/classes/utils.bbclass<br>
+++ b/meta/classes/utils.bbclass<br>
@@ -184,6 +184,40 @@ END<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x $cmd<br>
=C2=A0}<br>
<br>
+create_cmdline_shebang_wrapper () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a wrapper script where commandline opt=
ions are needed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# These are useful to work around shebang reloc=
ation issues, where shebangs are too<br>
+=C2=A0 # long or have arguments in them, thus preventing them from using t=
he /usr/bin/env<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# shebang<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Usage: create_cmdline_wrapper FILENAME &lt;ex=
tra-options&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd=3D$1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Generating wrapper script for $cmd&q=
uot;<br>
+<br>
+=C2=A0 # Strip #! and get remaining interpreter + arg<br>
+=C2=A0 argument=3D&quot;$(basename &quot;$(head -n1 $cmd | sed -e &#39;s|#=
![ ]*||g&#39; )&quot;)&quot;<br>
+=C2=A0 # strip the shebang from the real script as we do not want it to be=
 usable anyway<br>
+=C2=A0 tail -n +2 $cmd &gt; $cmd.real<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdname=3D$(basename $cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dirname=3D$(dirname $cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdoptions=3D$@<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_prefix}&quot; !=3D &quot;&quo=
t; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0relpath=3D`python3 =
-c &quot;import os; print(os.path.relpath(&#39;${D}${base_prefix}&#39;, &#3=
9;$dirname&#39;))&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmdoptions=3D`echo =
$@ | sed -e &quot;s:${base_prefix}:\\$realdir/$relpath:g&quot;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;END &gt;$cmd<br>
+#!/usr/bin/env bash<br>
+realpath=3D\`readlink -fn \$0\`<br>
+realdir=3D\`dirname \$realpath\`<br>
+exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real $cmdoptions &=
quot;\$@&quot;<br>
+END<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x $cmd<br>
+}<br>
+<br>
=C2=A0create_wrapper () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a wrapper script where extra environme=
nt variables are needed<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py b/meta/lib/oeqa/selfte=
st/cases/wrapper.py<br>
new file mode 100644<br>
index 0000000000..6de63310c0<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/wrapper.py<br>
@@ -0,0 +1,11 @@<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import bitbake<br>
+<br>
+class WrapperTests(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 def test_shebang_wrapper(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Build a recipe which will=
 fail if the cmdline_shebang_wrapper function is defective.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Exit status to be 0.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Paulo Neves &lt;<a href=
=3D"mailto:ptsneves@gmail.com" target=3D"_blank">ptsneves@gmail.com</a>&gt;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&quot;cmdline-shebang-wrapper-=
test -c install&quot;, ignore_status=3DFalse)<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166887): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166887" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166887</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91748692/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91748692/3617156</a><br>
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

--000000000000b811bb05e1688a44--

