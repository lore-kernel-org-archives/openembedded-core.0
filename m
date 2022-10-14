Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ED8C4332F
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 10:14:27 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web08.5564.1665742461962117028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 03:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JuEazcG0;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id s20so6437463lfi.11
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 03:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WrXlRzBctfK0xsscNx66f/bI9QX/PuXqqp3+fsqbhU4=;
        b=JuEazcG06SGEuWoRhiC0Py1/tTracVAJQFpYJ6i54SxH3pKjb5zuYz1pd4uTSGAt4h
         Eas6mfJaE/1xem2Hlu7BX0BED2ZDH0nfslPPcY/SwxfxqG2Uf5JkEFOaZUdqbizwRNtm
         FZ7eJDUoLj1Pcj+ZXd1xlUaT32HnyJwW0nh9Uq+OiLkxY7aXVXBNSkouzwxwP0uVNOto
         Eqf3ZrOdrKcIXQ6L5J0u2dqeN+wxkN9b5P0SHqYVXXo+AydyCxN6gYwzySE9JNN5S5t0
         hjilSemCsNfYQp9ph/ek5/SpOlswDh7R4i9NfzSw+Mt3/MEuc4fOL7lQsfKKqIq+cAVq
         FZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrXlRzBctfK0xsscNx66f/bI9QX/PuXqqp3+fsqbhU4=;
        b=ZvCwpb18du9NKBv8hx0u1IunoP+sjOVu7ht7cD7Jq2qQ0J0XVKo4HedC85xai+iOH4
         TQcOidNsziNxe/Rl/uB62iXcAIEz+Woe9Qvwgq2Wf9Ixs9gBqfgOX8P4Jx8ALMwqCQip
         D7uak6Yns7uu5iVmkmGGUpuSxtUEtHOPVYwKJGo/LLqN/83NO0bngfhynjkkYvEVCPJv
         J7vgHeaC1zOlR0waTWA0CqflRTrdYPiQhqzFXd/3kVqQNGeu4g+KUOUMTw3ZMxNSr45/
         YwCIxGzBMXBzK5Xk9s8GKlT1TLoc3irTOnGFv8AZJ2YbwwGkdfamia4kVP/hlFzZNId2
         C/ZQ==
X-Gm-Message-State: ACrzQf3KusMyz51c+JC+gHGgo9w51599pu6FjtC2+RVnvNd+FWzQ8bcS
	NRSQKL5Roi/7DoSjUew1CZO5qBjUWceQnFoDjF8=
X-Google-Smtp-Source: AMsMyM4Mkug4tIikbJPtXnFSfa2Y7i3Ct3XIqdZdLTLxuttjKwZVXDV9XoXt/n9R+7HDfmJIiAYuNuTDjyZfaYZIiMM=
X-Received: by 2002:a05:6512:ac7:b0:4a2:6337:86e3 with SMTP id
 n7-20020a0565120ac700b004a2633786e3mr1553123lfu.154.1665742459523; Fri, 14
 Oct 2022 03:14:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221013192530.1761915-1-jose.quaresma@foundries.io> <Y0kuE1hXPCNkz58P@mail.local>
In-Reply-To: <Y0kuE1hXPCNkz58P@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 14 Oct 2022 11:14:02 +0100
Message-ID: <CANPvuR=sTTVB5TcEeOL2xers=nsVXn_y8VfU4njEsQabAjLj8g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] oeqa/selftest/archiver: Add multiconfig test
 for shared recipes
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000096597d05eafbe36e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 10:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171731

--00000000000096597d05eafbe36e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu no dia sexta,
14/10/2022 =C3=A0(s) 10:38:

> Hello Jose,
>
> This fails on the AB:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4236/st=
eps/15/logs/stdio


Oh damn, so it seems that parsing the locked-sigs.inc file is not a good
aproucth.

Does anyone know which is the best method to get the signature of the tasks
in selftest?
I need to investigate further.

Jose


>
> 2022-10-13 21:04:28,387 - oe-selftest - INFO -
> archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch
> (subunit.RemotedTestCase)
> 2022-10-13 21:04:28,388 - oe-selftest - INFO -  ... FAIL
> 2022-10-13 21:04:28,388 - oe-selftest - INFO - 0: 15/57 149/504 (49.12s)
> (archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch)
> 2022-10-13 21:04:28,388 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent call
> last):
>   File
> "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/self=
test/cases/archiver.py",
> line 151, in test_archiver_multiconfig_shared_unpack_and_patch
>     self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recipe "%s=
"
> has diferent signatures for each machine in multiconfig' % (task, pn))
>   File "/usr/lib64/python3.6/unittest/case.py", line 693, in assertFalse
>     raise self.failureException(msg)
> AssertionError: -1 is not false : The task "do_unpack_and_patch" of the
> recipe "gcc-source-12.2.0" has diferent signatures for each machine in
> multiconfig
>
> On 13/10/2022 19:25:29+0000, Jose Quaresma wrote:
> > Test that the shared recipes in original mode with diff enabled works i=
n
> multiconfig,
> > otherwise it will not build when using the same TMP dir.
> >
> > The test can be run with:
> >
> > oe-selftest -r
> archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch
> >
> > | oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patc=
h
> (archiver.Archiver)
> > | oe-selftest - INFO -  ... ok
> > | oe-selftest - INFO -
> ----------------------------------------------------------------------
> > | oe-selftest - INFO - Ran 1 test in 199.710s
> > | oe-selftest - INFO - OK
> > | oe-selftest - INFO - RESULTS:
> > | oe-selftest - INFO - RESULTS -
> archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch: PASS=
ED
> (192.24s)
> > | oe-selftest - INFO - SUMMARY:
> > | oe-selftest - INFO - oe-selftest () - Ran 1 test in 199.711s
> > | oe-selftest - INFO - oe-selftest - OK - All required tests passed
> (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/lib/oeqa/selftest/cases/archiver.py | 29 ++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/archiver.py
> b/meta/lib/oeqa/selftest/cases/archiver.py
> > index ffdea832be..1d4985dacf 100644
> > --- a/meta/lib/oeqa/selftest/cases/archiver.py
> > +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> > @@ -6,6 +6,7 @@
> >
> >  import os
> >  import glob
> > +import re
> >  from oeqa.utils.commands import bitbake, get_bb_vars
> >  from oeqa.selftest.case import OESelftestTestCase
> >
> > @@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):
> >          excluded_present =3D len(glob.glob(src_path_target + '/%s-*/*'=
 %
> target_recipes[1]))
> >          self.assertFalse(excluded_present, 'Recipe %s was not
> excluded.' % target_recipes[1])
> >
> > +    def test_archiver_multiconfig_shared_unpack_and_patch(self):
> > +        """
> > +        Test that shared recipes in original mode with diff enabled
> works in multiconfig,
> > +        otherwise it will not build when using the same TMP dir.
> > +        """
> > +
> > +        features =3D 'BBMULTICONFIG =3D "mc1 mc2"\n'
> > +        features +=3D 'INHERIT +=3D "archiver"\n'
> > +        features +=3D 'ARCHIVER_MODE[src] =3D "original"\n'
> > +        features +=3D 'ARCHIVER_MODE[diff] =3D "1"\n'
> > +        self.write_config(features)
> > +
> > +        # We can use any machine in multiconfig as long as they are
> different
> > +        self.write_config('MACHINE =3D "qemuarm"\n', 'mc1')
> > +        self.write_config('MACHINE =3D "qemux86"\n', 'mc2')
> > +
> > +        task =3D 'do_unpack_and_patch'
> > +        # Use gcc-source as it is a shared recipe (appends the pv to
> the pn)
> > +        pn =3D 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
> > +
> > +        # Generate the tasks signatures
> > +        bitbake('mc:mc1:%s mc:mc2:%s --runonly=3D%s
> --dump-signatures=3Dnone' % (pn, pn, task))
> >
> > +        # Check the tasks signatures
> > +        # To be machine agnostic the tasks needs to generate the same
> signature for each machine
> > +        locked_sigs =3D open("%s/locked-sigs.inc" % self.builddir).rea=
d()
> > +        task_sigs =3D re.findall(r"%s:%s:.*" % (pn, task), locked_sigs=
)
> > +        uniq_sigs =3D set(task_sigs)
> > +        self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the
> recipe "%s" has diferent signatures for each machine in multiconfig' %
> (task, pn))
> >
> >      def test_archiver_srpm_mode(self):
> >          """
> > --
> > 2.34.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171719):
> https://lists.openembedded.org/g/openembedded-core/message/171719
> > Mute This Topic: https://lists.openembedded.org/mt/94312275/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000096597d05eafbe36e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexandre,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Alexandre Belloni &lt;<a=
 href=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.co=
m</a>&gt; escreveu no dia sexta, 14/10/2022 =C3=A0(s) 10:38:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hello Jose,<br>
<br>
This fails on the AB:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/4236/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/4236/steps/15/logs/=
stdio</a></blockquote><div><br></div><div>Oh damn, so it seems that parsing=
 the locked-sigs.inc file is not a good aproucth.</div><div><br>Does anyone=
 know which is the best method to get the signature of the tasks in=C2=A0se=
lftest?</div><div>I need to investigate further.<br></div><div><br>Jose</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
2022-10-13 21:04:28,387 - oe-selftest - INFO - archiver.Archiver.test_archi=
ver_multiconfig_shared_unpack_and_patch (subunit.RemotedTestCase)<br>
2022-10-13 21:04:28,388 - oe-selftest - INFO -=C2=A0 ... FAIL<br>
2022-10-13 21:04:28,388 - oe-selftest - INFO - 0: 15/57 149/504 (49.12s) (a=
rchiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch)<br>
2022-10-13 21:04:28,388 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/selftest/cases/archiver.py&quot;, line 151, in test_archiver_mul=
ticonfig_shared_unpack_and_patch<br>
=C2=A0 =C2=A0 self.assertFalse(len(uniq_sigs) - 1, &#39;The task &quot;%s&q=
uot; of the recipe &quot;%s&quot; has diferent signatures for each machine =
in multiconfig&#39; % (task, pn))<br>
=C2=A0 File &quot;/usr/lib64/python3.6/unittest/case.py&quot;, line 693, in=
 assertFalse<br>
=C2=A0 =C2=A0 raise self.failureException(msg)<br>
AssertionError: -1 is not false : The task &quot;do_unpack_and_patch&quot; =
of the recipe &quot;gcc-source-12.2.0&quot; has diferent signatures for eac=
h machine in multiconfig<br>
<br>
On 13/10/2022 19:25:29+0000, Jose Quaresma wrote:<br>
&gt; Test that the shared recipes in original mode with diff enabled works =
in multiconfig,<br>
&gt; otherwise it will not build when using the same TMP dir.<br>
&gt; <br>
&gt; The test can be run with:<br>
&gt; <br>
&gt; oe-selftest -r archiver.Archiver.test_archiver_multiconfig_shared_unpa=
ck_and_patch<br>
&gt; <br>
&gt; | oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_pat=
ch (archiver.Archiver)<br>
&gt; | oe-selftest - INFO -=C2=A0 ... ok<br>
&gt; | oe-selftest - INFO - -----------------------------------------------=
-----------------------<br>
&gt; | oe-selftest - INFO - Ran 1 test in 199.710s<br>
&gt; | oe-selftest - INFO - OK<br>
&gt; | oe-selftest - INFO - RESULTS:<br>
&gt; | oe-selftest - INFO - RESULTS - archiver.Archiver.test_archiver_multi=
config_shared_unpack_and_patch: PASSED (192.24s)<br>
&gt; | oe-selftest - INFO - SUMMARY:<br>
&gt; | oe-selftest - INFO - oe-selftest () - Ran 1 test in 199.711s<br>
&gt; | oe-selftest - INFO - oe-selftest - OK - All required tests passed (s=
uccesses=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oeqa/selftest/cases/archiver.py | 29 ++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 29 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/=
selftest/cases/archiver.py<br>
&gt; index ffdea832be..1d4985dacf 100644<br>
&gt; --- a/meta/lib/oeqa/selftest/cases/archiver.py<br>
&gt; +++ b/meta/lib/oeqa/selftest/cases/archiver.py<br>
&gt; @@ -6,6 +6,7 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 import os<br>
&gt;=C2=A0 import glob<br>
&gt; +import re<br>
&gt;=C2=A0 from oeqa.utils.commands import bitbake, get_bb_vars<br>
&gt;=C2=A0 from oeqa.selftest.case import OESelftestTestCase<br>
&gt;=C2=A0 <br>
&gt; @@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 excluded_present =3D len(glob.glob(s=
rc_path_target + &#39;/%s-*/*&#39; % target_recipes[1]))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(excluded_present, &=
#39;Recipe %s was not excluded.&#39; % target_recipes[1])<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 def test_archiver_multiconfig_shared_unpack_and_patch(s=
elf):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Test that shared recipes in original mode=
 with diff enabled works in multiconfig,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 otherwise it will not build when using th=
e same TMP dir.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;BBMULTICONFIG =3D &quot=
;mc1 mc2&quot;\n&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;INHERIT +=3D &quot;arc=
hiver&quot;\n&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;ARCHIVER_MODE[src] =3D=
 &quot;original&quot;\n&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;ARCHIVER_MODE[diff] =
=3D &quot;1&quot;\n&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can use any machine in multiconfig a=
s long as they are different<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;MACHINE =3D &quot;=
qemuarm&quot;\n&#39;, &#39;mc1&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;MACHINE =3D &quot;=
qemux86&quot;\n&#39;, &#39;mc2&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D &#39;do_unpack_and_patch&#39;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use gcc-source as it is a shared recipe=
 (appends the pv to the pn)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D &#39;gcc-source-%s&#39; % get_bb_v=
ars([&#39;PV&#39;], &#39;gcc&#39;)[&#39;PV&#39;]<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Generate the tasks signatures<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;mc:mc1:%s mc:mc2:%s --runonl=
y=3D%s --dump-signatures=3Dnone&#39; % (pn, pn, task))<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check the tasks signatures<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # To be machine agnostic the tasks needs =
to generate the same signature for each machine<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 locked_sigs =3D open(&quot;%s/locked-sigs=
.inc&quot; % self.builddir).read()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 task_sigs =3D re.findall(r&quot;%s:%s:.*&=
quot; % (pn, task), locked_sigs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uniq_sigs =3D set(task_sigs)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(len(uniq_sigs) - 1, &#39=
;The task &quot;%s&quot; of the recipe &quot;%s&quot; has diferent signatur=
es for each machine in multiconfig&#39; % (task, pn))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 def test_archiver_srpm_mode(self):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171719): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/171719" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/171719</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94312275=
/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94312275/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000096597d05eafbe36e--

