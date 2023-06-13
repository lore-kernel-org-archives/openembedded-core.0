Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB221C7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:53:35 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.8729.1686646408549040109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:53:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JxzDt+if;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2b2f9f47256so38110711fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686646407; x=1689238407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m1jskN6QlZ6Ihj0Jsg2I2TCBR7pNYUwX2YlQhLLFYd0=;
        b=JxzDt+if6gkBj5f+FQnR4xST9U/RT76XDjUvr3tT9FIUDD52DXJY9EB61btvpbRoHk
         CWY1pG2XNRR51qHmrXXlQ1cmZ8BUqwJ4Jf/rE6KBRpuESCkMitGd01pP8n1AHnwudus3
         AeCwVtfk/jRMNjVVkMhms+76n3T0xcWRG+E7P7Euly8H+rHlKuQGrBAzQikcJFwGJ3wB
         Nj1oHjSqMzAHnU0G1PM3NmvJdHx82a5MhEvcYuZszbfgGQm5hOGFDzLJ0vpS4Qcvp0Kx
         AEvvL13OWHijchUDFMXj6J9eev9m/dTG8LhGT+vyfEq3Ag/yQrInt2Rq2F4hjXZjr9i+
         +59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646407; x=1689238407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1jskN6QlZ6Ihj0Jsg2I2TCBR7pNYUwX2YlQhLLFYd0=;
        b=lxFht6SVewBWA8I2A67joxTIKXnLWLUb7H8FcxnythGxvNXUENgeIiH5dWam47HVIR
         SjEkFkxf0RVo+k4NZqPA52EzPhX6PVmY31FVA+dCiTnJTScT4veqY/xRNWvfjFChuEUh
         pxFkqfxEea9mb84WfGl6QHUwU78iLLZFFFqtO9DisRe1dCIWlhGtqW4CxP0KoJZF7i4C
         oFExTjyzw6+FyUW8hfXRPPqRgd0E3N3ZjoJX4N7BXTUdSQIMDlHp+D4gOfL7xKx3Ge/+
         ngnV/ZWUH4BYebcirDp8f5sphyhL9aJnBOtf/MtyIJFdjid7lnxarFSsGe/NBukW9j0G
         aXDg==
X-Gm-Message-State: AC+VfDyKFRDfJpSWcEDh/Q1w4i3prcyzF/et3vJf63VSHswEBMkdb8DO
	H3ENDX4slNVfRm5aO4ejgpkMyrdt/MOqhfkxE2M=
X-Google-Smtp-Source: ACHHUZ6CSjT9tE2Eou05Waqv0pYKLL0tJSkpkSmvwRoPNwGHx1i/gHJ6DGbpnrXSK+UUUZ1d70S9OJIaGhVhR3KBXCI=
X-Received: by 2002:a2e:9088:0:b0:2b1:c389:c424 with SMTP id
 l8-20020a2e9088000000b002b1c389c424mr3964064ljg.12.1686646406497; Tue, 13 Jun
 2023 01:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230613081451.1736892-1-mikko.rapeli@linaro.org> <17682BD04995A55C.20698@lists.openembedded.org>
In-Reply-To: <17682BD04995A55C.20698@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jun 2023 10:53:15 +0200
Message-ID: <CANNYZj9WGpcyYcWee85+x96gaSZMFaTRKkV+6r0ERsLs2msdxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest reproducible.py: support different
 build targets
To: alex.kanavin@gmail.com
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ebc93c05fdfef7fc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:53:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182698

--000000000000ebc93c05fdfef7fc
Content-Type: text/plain; charset="UTF-8"

On second thought maybe not. Not sure about it :)

Alex

On Tue 13. Jun 2023 at 10.50, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> There should be a default, set to what it is now.
>
> Alex
>
>
> On Tue 13. Jun 2023 at 10.15, Mikko Rapeli <mikko.rapeli@linaro.org>
> wrote:
>
>> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>>
>> Allow users to set different build reproducibility targets than
>> the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
>> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.
>>
>> Fixing all issues from "world" builds is not possible in some
>> complex build environments with lots of layers. Limiting the focus to
>> a smaller subset allows using this test to detect and fix build
>> reproduction issues incrementally.
>>
>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> ---
>>  meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
>> b/meta/lib/oeqa/selftest/cases/reproducible.py
>> index cd7aa8aafa..5c588461fa 100644
>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>> @@ -134,9 +134,13 @@ class ReproducibleTests(OESelftestTestCase):
>>      max_report_size = 250 * 1024 * 1024
>>
>>      # targets are the things we want to test the reproducibility of
>> -    targets = ['core-image-minimal', 'core-image-sato',
>> 'core-image-full-cmdline', 'core-image-weston', 'world']
>> +    targets = get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
>> +    if targets:
>> +        targets = targets.split()
>> +    else:
>> +        targets = ['core-image-minimal', 'core-image-sato',
>> 'core-image-full-cmdline', 'core-image-weston', 'world']
>>      # sstate targets are things to pull from sstate to potentially cut
>> build/debugging time
>> -    sstate_targets = []
>> +    sstate_targets =
>> (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS") or "").split()
>>      save_results = False
>>      if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
>>          save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
>> --
>> 2.34.1
>>
>>
>>
>>
>>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182697):
> https://lists.openembedded.org/g/openembedded-core/message/182697
> Mute This Topic: https://lists.openembedded.org/mt/99501089/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000ebc93c05fdfef7fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">On second thought maybe not. Not sure about it :)</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 13. Jun 2023 =
at 10.50, Alexander Kanavin via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@li=
sts.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-col=
or:rgb(204,204,204)"><div dir=3D"auto">There should be a default, set to wh=
at it is now.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div>=
<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue 13. Jun 2023 at 10.15, Mikko Rapeli &lt;<=
a href=3D"mailto:mikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@li=
naro.org</a>&gt; wrote:<br></div></div></div><div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color=
:rgb(204,204,204)">From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@li=
naro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
<br>
Allow users to set different build reproducibility targets than<br>
the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and<br>
OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.<br>
<br>
Fixing all issues from &quot;world&quot; builds is not possible in some<br>
complex build environments with lots of layers. Limiting the focus to<br>
a smaller subset allows using this test to detect and fix build<br>
reproduction issues incrementally.<br>
<br>
Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org" =
target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/s=
elftest/cases/reproducible.py<br>
index cd7aa8aafa..5c588461fa 100644<br>
--- a/meta/lib/oeqa/selftest/cases/reproducible.py<br>
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py<br>
@@ -134,9 +134,13 @@ class ReproducibleTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0max_report_size =3D 250 * 1024 * 1024<br>
<br>
=C2=A0 =C2=A0 =C2=A0# targets are the things we want to test the reproducib=
ility of<br>
-=C2=A0 =C2=A0 targets =3D [&#39;core-image-minimal&#39;, &#39;core-image-s=
ato&#39;, &#39;core-image-full-cmdline&#39;, &#39;core-image-weston&#39;, &=
#39;world&#39;]<br>
+=C2=A0 =C2=A0 targets =3D get_bb_var(&quot;OEQA_REPRODUCIBLE_TEST_TARGET&q=
uot;)<br>
+=C2=A0 =C2=A0 if targets:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D targets.split()<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D [&#39;core-image-minimal&#39;, &#3=
9;core-image-sato&#39;, &#39;core-image-full-cmdline&#39;, &#39;core-image-=
weston&#39;, &#39;world&#39;]<br>
=C2=A0 =C2=A0 =C2=A0# sstate targets are things to pull from sstate to pote=
ntially cut build/debugging time<br>
-=C2=A0 =C2=A0 sstate_targets =3D []<br>
+=C2=A0 =C2=A0 sstate_targets =3D (get_bb_var(&quot;OEQA_REPRODUCIBLE_TEST_=
SSTATE_TARGETS&quot;) or &quot;&quot;).split()<br>
=C2=A0 =C2=A0 =C2=A0save_results =3D False<br>
=C2=A0 =C2=A0 =C2=A0if &#39;OEQA_DEBUGGING_SAVED_OUTPUT&#39; in os.environ:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_results =3D os.environ[&#39;OEQA_DEB=
UGGING_SAVED_OUTPUT&#39;]<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div><div><div class=3D"gmail_quote"></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182697): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182697" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182697</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99501089/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99501089/1686489</a><br>
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

--000000000000ebc93c05fdfef7fc--

