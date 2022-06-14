Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04BCC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 14:17:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.6558.1655216275075713099
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 07:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QS5dCGgC;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id x17so11498681wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1JDBnBZPjpBjSAWpOXVXVLLGjTx4TwJv+lCoh2uo0U4=;
        b=QS5dCGgCW53PXSjtfE1Or8s9TMuNdzWAajV5GvRwh6WdQFqNCO7fqO0BSNAconwkrp
         7MB9xqOeUG/OTGA+WAI4iW2l/VL3RQ9BCemxaU1EanbX9DcUgqXSnDNIPj8+MdcjULjC
         XCKyOMjGOlPyyxSf0/iAeeKVAJWMv1XKLlEmbOk7Xyb+CBXbjeBtR/fXR4XDMCwWa+b1
         iQfv5Au88WiLEmJrXm7n84yF7W21MRcqlGnYAAJx/XJ5f4llIhpibcbWbGzfy8QY/GgU
         ag7QyBsodazQaDoGpVOh4SbgXLzM1vjrV6gwe5FcLKX5uhol/Y2SPfsxh2WDJqX702Nk
         CKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1JDBnBZPjpBjSAWpOXVXVLLGjTx4TwJv+lCoh2uo0U4=;
        b=e9RAMbA0Y4W0Vmi2hcbKJnwN2TzpAKI8B3GFjJQHdD5Dd7v0931LdL2AbEyVLzQkUy
         uCY1UfeM5+48Pj2n4hC4NiuR+J1DHuNuXpr9tHMUu7PGaQgx/c91UDxr/xsSTv5aU7RS
         dkhFkEkUxc3PZUh9HdRhVc0cU54Hb/sBvjdNNdKEOf4sEp/nep/ixTb2gMYYXZ5qwxYY
         LIUMIJx5ecGrORd/BiJqu/QdTr67mbjRgWHa0Wa1+aav1ylnUALkO9k1LAD9q7odVndY
         bwMeIUZNUNYBijxGmr2lqKgny1ZGpxrUfLnLUY4ehpazbbyI2EqOtZNl8y0plKd3jg+8
         oatw==
X-Gm-Message-State: AJIora8nTOWnZ4ctQnD/4/v8W2cZmrHaWciO6xAobDSEvEVhjAMcCE5L
	w7Pd/+2D9T+fsJ6rH9caq56WgyW/QWLA9RaeDxg=
X-Google-Smtp-Source: 
 AGRyM1ve1hQWpZDJX1spoXwgj1gIULFH5sN4mF49+V/sZT34wreVZ99fNrx2X3mmUQD61RmplFgxFjxdGI5N2cJNeyA=
X-Received: by 2002:adf:b358:0:b0:216:508c:e0bf with SMTP id
 k24-20020adfb358000000b00216508ce0bfmr5175249wrd.204.1655216273485; Tue, 14
 Jun 2022 07:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220614131652.566471-1-ptsneves@gmail.com>
 <20220614131652.566471-6-ptsneves@gmail.com>
 <CA+chaQeSuFsrFdGLjyV42kk3wmiFEK8aMMuyBTA7VdDPH-Wb1Q@mail.gmail.com>
 <0b06d351-7d98-42e4-0872-d8b0e4fe9ce7@gmail.com>
In-Reply-To: <0b06d351-7d98-42e4-0872-d8b0e4fe9ce7@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Jun 2022 16:17:37 +0200
Message-ID: 
 <CA+chaQeH=vs=MuRhTW8BahBKYCObzuaaU6NSvZW-cepxLWhnhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 6/7] utils: Add cmdline_shebang_wrapper util.
To: Paulo Neves <ptsneves@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000001f23505e16912e5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 14:17:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166893

--00000000000001f23505e16912e5
Content-Type: text/plain; charset="UTF-8"

You can use bitbake-getvar to see the default FILESPATH, but "files" next
to recipe is included by default (I prefer to use BPN directory for
slightly faster lookup - unless the files are shared between different
recipes). FILESEXTRAPATHS is usually only needed from bbappends which add
new files to SRC_URI.

For LICENSE you can use MIT and
LIC_FILES_CHKSUM =
"file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
like many "pure-metadata" recipes in oe-core.

On Tue, Jun 14, 2022 at 3:46 PM Paulo Neves <ptsneves@gmail.com> wrote:

> Regarding the FILESEXTRAPATHS:prepend  i was convinced that
> ${THISDIR}/files was not automatically added and was needed for the
> test.awk file. I guess I have been cargo culting for some time on this.
> Will remove it.
>
> This is a recipe for a test and if i add a license different than CLOSED
> than i need to add a license file, which seems a bit overkill for a one
> line. Am I wrong? What license should it even be? Dont Panic is a common
> string used in awk docs.
>
> Paulo Neves
>
> On 6/14/22 15:39, Martin Jansa wrote:
>
> FILESEXTRAPATHS:prepend doesn't seem to be needed and LICENSE is really
> CLOSED?
>
> On Tue, Jun 14, 2022 at 3:17 PM Paulo Neves <ptsneves@gmail.com> wrote:
>
>> Useful to work around shebang relocation issues, where
>> shebangs are too long or have arguments in them, thus preventing them
>> from using the /usr/bin/env shebang.
>> ---
>>  .../wrapper/cmdline-shebang-wrapper-test.bb   | 21 ++++++++++++
>>  .../recipes-test/wrapper/files/test.awk       |  2 ++
>>  meta/classes/utils.bbclass                    | 34 +++++++++++++++++++
>>  meta/lib/oeqa/selftest/cases/wrapper.py       | 11 ++++++
>>  4 files changed, 68 insertions(+)
>>  create mode 100644 meta-selftest/recipes-test/wrapper/
>> cmdline-shebang-wrapper-test.bb
>>  create mode 100644 meta-selftest/recipes-test/wrapper/files/test.awk
>>  create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py
>>
>> diff --git a/meta-selftest/recipes-test/wrapper/
>> cmdline-shebang-wrapper-test.bb b/meta-selftest/recipes-test/wrapper/
>> cmdline-shebang-wrapper-test.bb
>> new file mode 100644
>> index 0000000000..302eea8901
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/wrapper/cmdline-shebang-wrapper-test.bb
>> @@ -0,0 +1,21 @@
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>> +SUMMARY = "Check that create_cmdline_shebang works"
>> +LICENSE = "CLOSED"
>> +INHIBIT_DEFAULT_DEPS = "1"
>> +
>> +SRC_URI += "file://test.awk"
>> +
>> +EXCLUDE_FROM_WORLD = "1"
>> +do_install() {
>> +    install -d ${D}${bindir}
>> +    install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/test
>> +    sed -i -e 's|@AWK_BIN@|${bindir}/awk|g' ${D}${bindir}/test
>> +    create_cmdline_shebang_wrapper ${D}${bindir}/test
>> +    if [ $(${D}${bindir}/test) != "Don't Panic!" ]; then
>> +        bbfatal "Wrapper is broken"
>> +    else
>> +        bbnote "Wrapper is good"
>> +    fi
>> +}
>> +
>> +BBCLASSEXTEND = "native"
>> diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk
>> b/meta-selftest/recipes-test/wrapper/files/test.awk
>> new file mode 100644
>> index 0000000000..91429197b1
>> --- /dev/null
>> +++ b/meta-selftest/recipes-test/wrapper/files/test.awk
>> @@ -0,0 +1,2 @@
>> +#! @AWK_BIN@ -f
>> +BEGIN { print "Don't Panic!" }
>> diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
>> index b4eb3d38ab..b617632d9f 100644
>> --- a/meta/classes/utils.bbclass
>> +++ b/meta/classes/utils.bbclass
>> @@ -184,6 +184,40 @@ END
>>         chmod +x $cmd
>>  }
>>
>> +create_cmdline_shebang_wrapper () {
>> +       # Create a wrapper script where commandline options are needed
>> +       #
>> +       # These are useful to work around shebang relocation issues,
>> where shebangs are too
>> +  # long or have arguments in them, thus preventing them from using the
>> /usr/bin/env
>> +       # shebang
>> +       #
>> +       # Usage: create_cmdline_wrapper FILENAME <extra-options>
>> +
>> +       cmd=$1
>> +       shift
>> +
>> +       echo "Generating wrapper script for $cmd"
>> +
>> +  # Strip #! and get remaining interpreter + arg
>> +  argument="$(basename "$(head -n1 $cmd | sed -e 's|#![ ]*||g' )")"
>> +  # strip the shebang from the real script as we do not want it to be
>> usable anyway
>> +  tail -n +2 $cmd > $cmd.real
>> +       cmdname=$(basename $cmd)
>> +       dirname=$(dirname $cmd)
>> +       cmdoptions=$@
>> +       if [ "${base_prefix}" != "" ]; then
>> +               relpath=`python3 -c "import os;
>> print(os.path.relpath('${D}${base_prefix}', '$dirname'))"`
>> +               cmdoptions=`echo $@ | sed -e
>> "s:${base_prefix}:\\$realdir/$relpath:g"`
>> +       fi
>> +       cat <<END >$cmd
>> +#!/usr/bin/env bash
>> +realpath=\`readlink -fn \$0\`
>> +realdir=\`dirname \$realpath\`
>> +exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real $cmdoptions
>> "\$@"
>> +END
>> +       chmod +x $cmd
>> +}
>> +
>>  create_wrapper () {
>>         # Create a wrapper script where extra environment variables are
>> needed
>>         #
>> diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py
>> b/meta/lib/oeqa/selftest/cases/wrapper.py
>> new file mode 100644
>> index 0000000000..6de63310c0
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/wrapper.py
>> @@ -0,0 +1,11 @@
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.utils.commands import bitbake
>> +
>> +class WrapperTests(OESelftestTestCase):
>> +    def test_shebang_wrapper(self):
>> +        """
>> +        Summary:   Build a recipe which will fail if the
>> cmdline_shebang_wrapper function is defective.
>> +        Expected:  Exit status to be 0.
>> +        Author:    Paulo Neves <ptsneves@gmail.com>
>> +        """
>> +        res = bitbake("cmdline-shebang-wrapper-test -c install",
>> ignore_status=False)
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166887):
>> https://lists.openembedded.org/g/openembedded-core/message/166887
>> Mute This Topic: https://lists.openembedded.org/mt/91748692/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> Martin.Jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>

--00000000000001f23505e16912e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You can use bitbake-getvar to see the default FILESPATH, b=
ut &quot;files&quot; next to recipe is included by default (I prefer to use=
 BPN directory for slightly faster lookup - unless the files are shared bet=
ween different recipes). FILESEXTRAPATHS is usually only needed from bbappe=
nds which add new files to SRC_URI.<div><br></div><div>For LICENSE you can =
use MIT and</div><div>LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/CO=
PYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420&quot;<br></div><div>like m=
any &quot;pure-metadata&quot; recipes in oe-core.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 14, 2022=
 at 3:46 PM Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com">ptsneves@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
 =20
   =20
 =20
  <div>
    Regarding the FILESEXTRAPATHS:prepend=C2=A0 i was convinced that
    ${THISDIR}/files was not automatically added and was needed for the
    test.awk file. I guess I have been cargo culting for some time on
    this. Will remove it.<br>
    <br>
    This is a recipe for a test and if i add a license different than
    CLOSED than i need to add a license file, which seems a bit overkill
    for a one line. Am I wrong? What license should it even be? Dont
    Panic is a common string used in awk docs.<br>
    <br>
    Paulo Neves<br>
    <br>
    <div>On 6/14/22 15:39, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">FILESEXTRAPATHS:prepend doesn&#39;t seem to be neede=
d
        and LICENSE is really CLOSED?<br>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 14, 2022 at 3:17
          PM Paulo Neves &lt;<a href=3D"mailto:ptsneves@gmail.com" target=
=3D"_blank">ptsneves@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Useful
          to work around shebang relocation issues, where<br>
          shebangs are too long or have arguments in them, thus
          preventing them<br>
          from using the /usr/bin/env shebang.<br>
          ---<br>
          =C2=A0.../wrapper/<a href=3D"http://cmdline-shebang-wrapper-test.=
bb" rel=3D"noreferrer" target=3D"_blank">cmdline-shebang-wrapper-test.bb</a=
>=C2=A0
          =C2=A0| 21 ++++++++++++<br>
          =C2=A0.../recipes-test/wrapper/files/test.awk=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 2 ++<br>
          =C2=A0meta/classes/utils.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 34
          +++++++++++++++++++<br>
          =C2=A0meta/lib/oeqa/selftest/cases/wrapper.py=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 11 ++++++<br>
          =C2=A04 files changed, 68 insertions(+)<br>
          =C2=A0create mode 100644 meta-selftest/recipes-test/wrapper/<a hr=
ef=3D"http://cmdline-shebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"=
_blank">cmdline-shebang-wrapper-test.bb</a><br>
          =C2=A0create mode 100644
          meta-selftest/recipes-test/wrapper/files/test.awk<br>
          =C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/wrapper.py<=
br>
          <br>
          diff --git a/meta-selftest/recipes-test/wrapper/<a href=3D"http:/=
/cmdline-shebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmdl=
ine-shebang-wrapper-test.bb</a>
          b/meta-selftest/recipes-test/wrapper/<a href=3D"http://cmdline-sh=
ebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmdline-shebang=
-wrapper-test.bb</a><br>
          new file mode 100644<br>
          index 0000000000..302eea8901<br>
          --- /dev/null<br>
          +++ b/meta-selftest/recipes-test/wrapper/<a href=3D"http://cmdlin=
e-shebang-wrapper-test.bb" rel=3D"noreferrer" target=3D"_blank">cmdline-she=
bang-wrapper-test.bb</a><br>
          @@ -0,0 +1,21 @@<br>
          +FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/files:&quot;<br>
          +SUMMARY =3D &quot;Check that create_cmdline_shebang works&quot;<=
br>
          +LICENSE =3D &quot;CLOSED&quot;<br>
          +INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
          +<br>
          +SRC_URI +=3D <a>&quot;file://test.awk&quot;</a><br>
          +<br>
          +EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
          +do_install() {<br>
          +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
          +=C2=A0 =C2=A0 install -m 0755 ${WORKDIR}/test.awk ${D}${bindir}/=
test<br>
          +=C2=A0 =C2=A0 sed -i -e &#39;s|@AWK_BIN@|${bindir}/awk|g&#39;
          ${D}${bindir}/test<br>
          +=C2=A0 =C2=A0 create_cmdline_shebang_wrapper ${D}${bindir}/test<=
br>
          +=C2=A0 =C2=A0 if [ $(${D}${bindir}/test) !=3D &quot;Don&#39;t Pa=
nic!&quot; ]; then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal &quot;Wrapper is broken&quot=
;<br>
          +=C2=A0 =C2=A0 else<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bbnote &quot;Wrapper is good&quot;<b=
r>
          +=C2=A0 =C2=A0 fi<br>
          +}<br>
          +<br>
          +BBCLASSEXTEND =3D &quot;native&quot;<br>
          diff --git a/meta-selftest/recipes-test/wrapper/files/test.awk
          b/meta-selftest/recipes-test/wrapper/files/test.awk<br>
          new file mode 100644<br>
          index 0000000000..91429197b1<br>
          --- /dev/null<br>
          +++ b/meta-selftest/recipes-test/wrapper/files/test.awk<br>
          @@ -0,0 +1,2 @@<br>
          +#! @AWK_BIN@ -f<br>
          +BEGIN { print &quot;Don&#39;t Panic!&quot; }<br>
          diff --git a/meta/classes/utils.bbclass
          b/meta/classes/utils.bbclass<br>
          index b4eb3d38ab..b617632d9f 100644<br>
          --- a/meta/classes/utils.bbclass<br>
          +++ b/meta/classes/utils.bbclass<br>
          @@ -184,6 +184,40 @@ END<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod +x $cmd<br>
          =C2=A0}<br>
          <br>
          +create_cmdline_shebang_wrapper () {<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Create a wrapper script where comma=
ndline options
          are needed<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0# These are useful to work around she=
bang relocation
          issues, where shebangs are too<br>
          +=C2=A0 # long or have arguments in them, thus preventing them fr=
om
          using the /usr/bin/env<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0# shebang<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0# Usage: create_cmdline_wrapper FILEN=
AME
          &lt;extra-options&gt;<br>
          +<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0cmd=3D$1<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0shift<br>
          +<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Generating wrapper script =
for $cmd&quot;<br>
          +<br>
          +=C2=A0 # Strip #! and get remaining interpreter + arg<br>
          +=C2=A0 argument=3D&quot;$(basename &quot;$(head -n1 $cmd | sed -=
e &#39;s|#![
          ]*||g&#39; )&quot;)&quot;<br>
          +=C2=A0 # strip the shebang from the real script as we do not wan=
t
          it to be usable anyway<br>
          +=C2=A0 tail -n +2 $cmd &gt; $cmd.real<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdname=3D$(basename $cmd)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0dirname=3D$(dirname $cmd)<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0cmdoptions=3D$@<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${base_prefix}&quot; !=3D =
&quot;&quot; ]; then<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0relpath=
=3D`python3 -c &quot;import os;
          print(os.path.relpath(&#39;${D}${base_prefix}&#39;, &#39;$dirname=
&#39;))&quot;`<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmdoption=
s=3D`echo $@ | sed -e
          &quot;s:${base_prefix}:\\$realdir/$relpath:g&quot;`<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0cat &lt;&lt;END &gt;$cmd<br>
          +#!/usr/bin/env bash<br>
          +realpath=3D\`readlink -fn \$0\`<br>
          +realdir=3D\`dirname \$realpath\`<br>
          +exec -a \$realdir/$cmdname $argument \$realdir/$cmdname.real
          $cmdoptions &quot;\$@&quot;<br>
          +END<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0chmod +x $cmd<br>
          +}<br>
          +<br>
          =C2=A0create_wrapper () {<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create a wrapper script where extra=
 environment
          variables are needed<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 #<br>
          diff --git a/meta/lib/oeqa/selftest/cases/wrapper.py
          b/meta/lib/oeqa/selftest/cases/wrapper.py<br>
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
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Build a recipe =
which will fail if the
          cmdline_shebang_wrapper function is defective.<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Exit status to be 0.=
<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Paulo Neves &lt=
;<a href=3D"mailto:ptsneves@gmail.com" target=3D"_blank">ptsneves@gmail.com=
</a>&gt;<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&quot;cmdline-sheban=
g-wrapper-test -c
          install&quot;, ignore_status=3DFalse)<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#166887): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-core/message/166887" rel=3D"noreferrer" target=3D"_bla=
nk">https://lists.openembedded.org/g/openembedded-core/message/166887</a><b=
r>
          Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/917=
48692/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/91748692/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.op=
enembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedde=
d.org</a><br>
          Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/g/openembedded-core/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank">Mart=
in.Jansa@gmail.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div>

--00000000000001f23505e16912e5--

