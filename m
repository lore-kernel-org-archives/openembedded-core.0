Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F49C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 15:17:09 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web09.8406.1665760619067784101
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Oct 2022 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HlRic+Ma;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id r22so6367780ljn.10
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WDa09385C77yeIy907xizZj9mAuzUyB8UJrPDk8E0AQ=;
        b=HlRic+MaDLdyuhAn3oKX9JTLZTJ3EpRNNO4O3DwtfnCaTrc1zDpcZZahUbDMDRmziC
         UZxnrRMdKNayoxjob+UB99hjozoAGTbWS5HccrB4XGo4Wf5smbSDyTHqyeAtCuIM2YDt
         7LTGwqio6prnH31fXZSA/JiIMF6Mls2SlIE7QlX5og8V9e1BdC/Tlsu/DK4qidp1eT0C
         /Aq3lZWWUw99I8mJe9Yj6fInU4H2Phzgtsxu4q8W1KR9V0JhtD+YC+H/LqIMN5PoZDOb
         QFAUAAn1Z+D7Fg2q+75PzRAwNrBUdwV1xQVVT5T2FwBBFxQ1bfbMuKxUWojh8L/Ymzeq
         Q76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDa09385C77yeIy907xizZj9mAuzUyB8UJrPDk8E0AQ=;
        b=SbBsULAKJ3XwX/bhTtuwsp6BwYECr4nPo1TP3BlZWujzxKGaGjuzc5Z0Z3w3Yj4KWI
         B3Cx6TbZDJghqGY1GaBc0K6xjoDM/+PTMu2b0FNVueY/+HAtNZZx4bC0aBWUQbEYvdhd
         tnd/Ld+TOawLrwAjyGm1gD+xTPRTiRkB9Rs062djj8kGfe9RW5gf5I0MpkDC386MOnjb
         rpDbZZtxmMrjzsI2ZBmCtBgky0iLA8IVseRGeOGNObobSwHMTHPYP3M8RejCCv+vKdmP
         mejNfnDKaUU1ljpPngG4TB4ppfXblGz/qA+nbua2Bad7V6haZ/oyJaYbNYpeQDlWTwKV
         NB5A==
X-Gm-Message-State: ACrzQf1VkReh1QR2ea1yWLMd+qjUS/S9qnlYAHbEUDB9AJRV3pNDQbZC
	w3Twf5Hhdzu6AMk7I3HtdLis+5xJbJIqkN7R0vU=
X-Google-Smtp-Source: AMsMyM4IB1l/m+b1xQnuBPJ9M0z3OrOetAudSlYDZjG8maDlJsJ1moqQ4vgxzDKlnt6xBoJcuRj5tgrUbT5E9MhcZxk=
X-Received: by 2002:a05:651c:222c:b0:25f:e654:36e3 with SMTP id
 y44-20020a05651c222c00b0025fe65436e3mr1945993ljq.20.1665760617053; Fri, 14
 Oct 2022 08:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <171DF83D15C1B415.20269@lists.openembedded.org>
In-Reply-To: <171DF83D15C1B415.20269@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 14 Oct 2022 16:16:39 +0100
Message-ID: <CANPvuRmzq3KFJWO0vDF0kU5esBf6SsT0B4RL_nyv2KjJJ2H9oA@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 1/2] oeqa/selftest/archiver: Add multiconfig
 test for shared recipes
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000dc414505eb001d44"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 15:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171734

--000000000000dc414505eb001d44
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry but I messed up the patch and need to send a v3.

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia sexta, 14/10/2022 =C3=A0(=
s)
16:12:

> From: Jose Quaresma <quaresma.jose@gmail.com>
>
> Test that the shared recipes in original mode with diff enabled works in
> multiconfig,
> otherwise it will not build when using the same TMP dir.
>
> The test can be run with:
>
> oe-selftest -r
> archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch
>
> | oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patch
> (archiver.Archiver)
> | oe-selftest - INFO -  ... ok
> | oe-selftest - INFO -
> ----------------------------------------------------------------------
> | oe-selftest - INFO - Ran 1 test in 52.948s
> | oe-selftest - INFO - OK
> | oe-selftest - INFO - RESULTS:
> | oe-selftest - INFO - RESULTS -
> archiver.Archiver.test_archiver_multiconfig_shared_unpack_and_patch: PASS=
ED
> (49.98s)
> | oe-selftest - INFO - SUMMARY:
> | oe-selftest - INFO - oe-selftest () - Ran 1 test in 52.948s
> | oe-selftest - INFO - oe-selftest - OK - All required tests passed
> (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>
>  v2: replace --runonly with --cmd (-c)
>      update the runtime test time on the commit
>      show the locked_sigs file used on the assert
>
>  meta/lib/oeqa/selftest/cases/archiver.py | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/archiver.py
> b/meta/lib/oeqa/selftest/cases/archiver.py
> index ffdea832be..1d4985dacf 100644
> --- a/meta/lib/oeqa/selftest/cases/archiver.py
> +++ b/meta/lib/oeqa/selftest/cases/archiver.py
> @@ -6,6 +6,7 @@
>
>  import os
>  import glob
> +import re
>  from oeqa.utils.commands import bitbake, get_bb_vars
>  from oeqa.selftest.case import OESelftestTestCase
>
> @@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):
>          excluded_present =3D len(glob.glob(src_path_target + '/%s-*/*' %
> target_recipes[1]))
>          self.assertFalse(excluded_present, 'Recipe %s was not excluded.'
> % target_recipes[1])
>
> +    def test_archiver_multiconfig_shared_unpack_and_patch(self):
> +        """
> +        Test that shared recipes in original mode with diff enabled work=
s
> in multiconfig,
> +        otherwise it will not build when using the same TMP dir.
> +        """
> +
> +        features =3D 'BBMULTICONFIG =3D "mc1 mc2"\n'
> +        features +=3D 'INHERIT +=3D "archiver"\n'
> +        features +=3D 'ARCHIVER_MODE[src] =3D "original"\n'
> +        features +=3D 'ARCHIVER_MODE[diff] =3D "1"\n'
> +        self.write_config(features)
> +
> +        # We can use any machine in multiconfig as long as they are
> different
> +        self.write_config('MACHINE =3D "qemuarm"\n', 'mc1')
> +        self.write_config('MACHINE =3D "qemux86"\n', 'mc2')
> +
> +        task =3D 'do_unpack_and_patch'
> +        # Use gcc-source as it is a shared recipe (appends the pv to the
> pn)
> +        pn =3D 'gcc-source-%s' % get_bb_vars(['PV'], 'gcc')['PV']
> +
> +        # Generate the tasks signatures
> +        bitbake('mc:mc1:%s mc:mc2:%s --runonly=3D%s --dump-signatures=3D=
none'
> % (pn, pn, task))
>
> +        # Check the tasks signatures
> +        # To be machine agnostic the tasks needs to generate the same
> signature for each machine
> +        locked_sigs =3D open("%s/locked-sigs.inc" % self.builddir).read(=
)
> +        task_sigs =3D re.findall(r"%s:%s:.*" % (pn, task), locked_sigs)
> +        uniq_sigs =3D set(task_sigs)
> +        self.assertFalse(len(uniq_sigs) - 1, 'The task "%s" of the recip=
e
> "%s" has diferent signatures for each machine in multiconfig' % (task, pn=
))
>
>      def test_archiver_srpm_mode(self):
>          """
> --
> 2.38.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171732):
> https://lists.openembedded.org/g/openembedded-core/message/171732
> Mute This Topic: https://lists.openembedded.org/mt/94328653/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000dc414505eb001d44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry but I messed up the patch and need to send a v3.<div=
><br></div><div>Jose</div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto=
:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt;=
 escreveu no dia sexta, 14/10/2022 =C3=A0(s) 16:12:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&g=
t;<br>
<br>
Test that the shared recipes in original mode with diff enabled works in mu=
lticonfig,<br>
otherwise it will not build when using the same TMP dir.<br>
<br>
The test can be run with:<br>
<br>
oe-selftest -r archiver.Archiver.test_archiver_multiconfig_shared_unpack_an=
d_patch<br>
<br>
| oe-selftest - INFO - test_archiver_multiconfig_shared_unpack_and_patch (a=
rchiver.Archiver)<br>
| oe-selftest - INFO -=C2=A0 ... ok<br>
| oe-selftest - INFO - ----------------------------------------------------=
------------------<br>
| oe-selftest - INFO - Ran 1 test in 52.948s<br>
| oe-selftest - INFO - OK<br>
| oe-selftest - INFO - RESULTS:<br>
| oe-selftest - INFO - RESULTS - archiver.Archiver.test_archiver_multiconfi=
g_shared_unpack_and_patch: PASSED (49.98s)<br>
| oe-selftest - INFO - SUMMARY:<br>
| oe-selftest - INFO - oe-selftest () - Ran 1 test in 52.948s<br>
| oe-selftest - INFO - oe-selftest - OK - All required tests passed (succes=
ses=3D1, skipped=3D0, failures=3D0, errors=3D0)<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.=
io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
---<br>
<br>
=C2=A0v2: replace --runonly with --cmd (-c)<br>
=C2=A0 =C2=A0 =C2=A0update the runtime test time on the commit<br>
=C2=A0 =C2=A0 =C2=A0show the locked_sigs file used on the assert<br>
<br>
=C2=A0meta/lib/oeqa/selftest/cases/archiver.py | 29 +++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 29 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selft=
est/cases/archiver.py<br>
index ffdea832be..1d4985dacf 100644<br>
--- a/meta/lib/oeqa/selftest/cases/archiver.py<br>
+++ b/meta/lib/oeqa/selftest/cases/archiver.py<br>
@@ -6,6 +6,7 @@<br>
<br>
=C2=A0import os<br>
=C2=A0import glob<br>
+import re<br>
=C2=A0from oeqa.utils.commands import bitbake, get_bb_vars<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
<br>
@@ -119,7 +120,35 @@ class Archiver(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0excluded_present =3D len(glob.glob(src_pa=
th_target + &#39;/%s-*/*&#39; % target_recipes[1]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertFalse(excluded_present, &#39;R=
ecipe %s was not excluded.&#39; % target_recipes[1])<br>
<br>
+=C2=A0 =C2=A0 def test_archiver_multiconfig_shared_unpack_and_patch(self):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Test that shared recipes in original mode with=
 diff enabled works in multiconfig,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 otherwise it will not build when using the sam=
e TMP dir.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features =3D &#39;BBMULTICONFIG =3D &quot;mc1 =
mc2&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;INHERIT +=3D &quot;archiver=
&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;ARCHIVER_MODE[src] =3D &quo=
t;original&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 features +=3D &#39;ARCHIVER_MODE[diff] =3D &qu=
ot;1&quot;\n&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(features)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can use any machine in multiconfig as lon=
g as they are different<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;MACHINE =3D &quot;qemua=
rm&quot;\n&#39;, &#39;mc1&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;MACHINE =3D &quot;qemux=
86&quot;\n&#39;, &#39;mc2&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 task =3D &#39;do_unpack_and_patch&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Use gcc-source as it is a shared recipe (app=
ends the pv to the pn)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D &#39;gcc-source-%s&#39; % get_bb_vars([=
&#39;PV&#39;], &#39;gcc&#39;)[&#39;PV&#39;]<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Generate the tasks signatures<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;mc:mc1:%s mc:mc2:%s --runonly=3D%=
s --dump-signatures=3Dnone&#39; % (pn, pn, task))<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Check the tasks signatures<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # To be machine agnostic the tasks needs to ge=
nerate the same signature for each machine<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 locked_sigs =3D open(&quot;%s/locked-sigs.inc&=
quot; % self.builddir).read()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 task_sigs =3D re.findall(r&quot;%s:%s:.*&quot;=
 % (pn, task), locked_sigs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 uniq_sigs =3D set(task_sigs)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(len(uniq_sigs) - 1, &#39;The =
task &quot;%s&quot; of the recipe &quot;%s&quot; has diferent signatures fo=
r each machine in multiconfig&#39; % (task, pn))<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_archiver_srpm_mode(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-- <br>
2.38.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#171732): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/171732" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/171732</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94328653/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/94328653/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000dc414505eb001d44--

