Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A621CC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:50:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.8706.1686646233612908707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:50:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MaoZMKxT;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2b1adf27823so63741451fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686646231; x=1689238231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nS9u6LdFGGq+X8cFtKTL5JneYbiH3q2nr6HhDNZHax4=;
        b=MaoZMKxT0XtAeioAsUvRT8iTkgkkT9eItmCpMwQt594g+dXMax2GJb4mBkRJZ9acu1
         O9R91AOyd1qLvbEr/+uimx0K17Mwdp8fvmyYwf9YvFaCHhpfhpZDaqxE/mwHe1qy0V/q
         sH/YBlcXhjEsDETCg5G9VQOHj3H2tVJ65d2iYD5QTNyy/OUCCBBwBLuJwEx8caKeLrSh
         r+1Ukmy9VvPnSI7Z6jGuX6AYoW45EdA2MBe8D0KjpXU6ZdnkNZC1STZqKAu57yB2BOGo
         UdD6nMtKEvtTqk29i4+tcvfBmudvXA8Xtu54wWjk0SDrDj80GRBXuVkLN1peQw6l2nOR
         6KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646231; x=1689238231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nS9u6LdFGGq+X8cFtKTL5JneYbiH3q2nr6HhDNZHax4=;
        b=lNW0BOrJOS1sFazd+lSQp0DsjKhPYSHlsagZOL/pn0ArHR0jnHDvjxOg/xIhcK0Apd
         HXHp48wThQt9OyvMRugfJ38GYVHYVA+thaw1yel0TBJalBADRV+UcnDFkDtA5Ah2W08P
         7l8rhueNAQwsBi/a1RQRNEpSTo2zRrXEye7DwAej1/C2gNtEMfMrNI4/Qm9pbtysKsxv
         76eJn6vZ1kjbop90e8H7O2awfi+5WYJ7VTn8nE4HqRXlZio2WFbWKBIp1l1ZNalk++GW
         iPE+4a6WoNK2fuLAhrXFAjOEKERs4/oc79dlUJ10+eC2/AYI/TJgY0fAlPsXGf+IysO5
         m50g==
X-Gm-Message-State: AC+VfDxu9kxIpElgbM8mJvNehZaXNUI+KBcYj5UPvVrD6IAPBuLOkRpP
	xSdOWCYafMcneW3IWVvf3nUYqQV6dUi0FXDppbE=
X-Google-Smtp-Source: ACHHUZ5LqJ6TOenRm7z2HSEhwylqBf57oxQS20fLDVE0LpBmkiZmwpWZzwgaKCsRQbLVg/Ilnss1dSz6p+C4d/0Jimw=
X-Received: by 2002:a2e:b0fb:0:b0:2b1:b814:c11a with SMTP id
 h27-20020a2eb0fb000000b002b1b814c11amr3997760ljl.47.1686646231240; Tue, 13
 Jun 2023 01:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230613081451.1736892-1-mikko.rapeli@linaro.org>
In-Reply-To: <20230613081451.1736892-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 13 Jun 2023 10:50:20 +0200
Message-ID: <CANNYZj8GcHbm-5G6J2BUy6yu6d31XTPrzGXx-iRrV8aebdj=Qg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest reproducible.py: support different
 build targets
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007994d505fdfeed87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182697

--0000000000007994d505fdfeed87
Content-Type: text/plain; charset="UTF-8"

There should be a default, set to what it is now.

Alex


On Tue 13. Jun 2023 at 10.15, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:

> From: Mikko Rapeli <mikko.rapeli@linaro.org>
>
> Allow users to set different build reproducibility targets than
> the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
> OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.
>
> Fixing all issues from "world" builds is not possible in some
> complex build environments with lots of layers. Limiting the focus to
> a smaller subset allows using this test to detect and fix build
> reproduction issues incrementally.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py
> b/meta/lib/oeqa/selftest/cases/reproducible.py
> index cd7aa8aafa..5c588461fa 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -134,9 +134,13 @@ class ReproducibleTests(OESelftestTestCase):
>      max_report_size = 250 * 1024 * 1024
>
>      # targets are the things we want to test the reproducibility of
> -    targets = ['core-image-minimal', 'core-image-sato',
> 'core-image-full-cmdline', 'core-image-weston', 'world']
> +    targets = get_bb_var("OEQA_REPRODUCIBLE_TEST_TARGET")
> +    if targets:
> +        targets = targets.split()
> +    else:
> +        targets = ['core-image-minimal', 'core-image-sato',
> 'core-image-full-cmdline', 'core-image-weston', 'world']
>      # sstate targets are things to pull from sstate to potentially cut
> build/debugging time
> -    sstate_targets = []
> +    sstate_targets = (get_bb_var("OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS")
> or "").split()
>      save_results = False
>      if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
>          save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182696):
> https://lists.openembedded.org/g/openembedded-core/message/182696
> Mute This Topic: https://lists.openembedded.org/mt/99501089/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007994d505fdfeed87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">There should be a default, set to what it is now.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div dir=3D"auto"><br=
></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue 13. Jun 2023 at 10.15, Mikko Rapeli &lt;<a href=3D"mailto:mikk=
o.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">From: Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@linaro.org=
" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<br>
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182696): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182696" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/182696</a><br>
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

--0000000000007994d505fdfeed87--

