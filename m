Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20326C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 17:53:54 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.16603.1654797219338881429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 10:53:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=msdAqHCg;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id i29so22410105lfp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEv+6iPbKrDWIy2klLE1vdsvcicbt/T75O4tSbuCn3o=;
        b=msdAqHCgsY6HlcECzgFCSqZGtxHVWzwYyDzo3/RZMfZElIoqecqdvta+VL5lBw8LvV
         EoroA4z0Nv6CJEyL0RH8HIyedTX1kikMGWn09XPfYxbdkjXp595oVDgm90qakZp5y5GJ
         SN/hdqHqzQb6OhxYNLVLvSdSz/vvtlHojD/7hTbWTzfdOgzLvfRT5jWqaO+qYxF9Raqx
         CWF8v5JwJTpMcS1v3Ol7eFkmMt7td9iB7hwI3Q4B/hsGOHxqMngaDdE0aVlxFWVge4We
         ajG7/3ltxO+dz9XBSlG9iSQeS5hRYY/YlQQrJ5z11nd1zXwzptjnp0XdbdmmQZ3H02VK
         HHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEv+6iPbKrDWIy2klLE1vdsvcicbt/T75O4tSbuCn3o=;
        b=fqb5g1wvy3W2/1TCitxvWLbn1tYOWlqxrrR62x1OZoVq3izAfAM7u0NfYm8W19U5js
         Wdu+Pt5alJQU2ckHbUZQoxD8jZ75quL12gI17ONw/T/+PyDlws99Qp0/CLA573bFRfRx
         Wq8L25DGAAiz+/zyBrlAbgWDP1kZ2fO9NttSEVDWAPZkih/H0UORdcW9OzDFKU4Ode/Y
         gb+qjIK60k7qheHgFU6hthbFmIIvj9Q1dYGcwDTf50alfNqhzXSl1qwD3MPKJoaU8Mol
         FavV1sI+LBHm/hhRwWC65NugCuvQcj5B92qSbRERVKG5FkZ7YKzEl3vSaDpGCO0xUuhT
         5yFw==
X-Gm-Message-State: AOAM532wuVXlEpi8hKJJA9veREI0oNU3xvFiFIXrM0jCdzsAWeKxZpqh
	LQpZ7veyhNNYQzw+2A1ydqfsUC0vfqSCrt4Htbc=
X-Google-Smtp-Source: 
 ABdhPJx8uwCxnW7OLsHDRwvF0hYGRqnARl4pvEpDvDHgEsWLauNDZWdZLpRuaWiQdDIAOi0jFLq4aMO+YNYwugERj0U=
X-Received: by 2002:a05:6512:3f8f:b0:479:64f9:4420 with SMTP id
 x15-20020a0565123f8f00b0047964f94420mr8648260lfa.534.1654797217412; Thu, 09
 Jun 2022 10:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220609094209.41221-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220609094209.41221-1-richard.purdie@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 9 Jun 2022 18:53:26 +0100
Message-ID: 
 <CANPvuRmLJy-k+2k4A-Lf2TVRcCxHHXa1iiKX+89KQ6qgzH4pog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/multiconfig: Test that multiconfigs in
 separate layers works
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000051bba805e10780f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 17:53:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166787

--00000000000051bba805e10780f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

The same test using the same TMPDIR will be useful as there are some layers
doing that.
AFAIK the archiver and the rm_works don't like it very much.

The OE-core rm_work bbclass doesn't like multiconfig with the same TMPDIR.
This issue with the rm_works is because the native packages use the same
directory and bitbake
will run the native tasks twice, one for each machine. I need to
exclude them to get a green build:
RM_WORK_EXCLUDE:append =3D " texinfo-dummy-native gettext-minimal-native
gnu-config"
Another interesting detail is that these recipes that have the source dir i=
n
the working dir: $S =3D=3D $WORKDIR

Jose

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia quinta,
9/06/2022 =C3=A0(s) 10:42:

> We should test that mutliconfigs from a layer work, not just build/conf.
> This adds such a test.
>
> [YOCTO #13566]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta-selftest/conf/multiconfig/muslmc.conf  |  2 ++
>  meta/lib/oeqa/selftest/cases/multiconfig.py | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf
>
> diff --git a/meta-selftest/conf/multiconfig/muslmc.conf
> b/meta-selftest/conf/multiconfig/muslmc.conf
> new file mode 100644
> index 00000000000..043cd1ccc3b
> --- /dev/null
> +++ b/meta-selftest/conf/multiconfig/muslmc.conf
> @@ -0,0 +1,2 @@
> +TCLIBC =3D "musl"
> +TMPDIR =3D "${TOPDIR}/tmp-mc-musl"
> diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py
> b/meta/lib/oeqa/selftest/cases/multiconfig.py
> index baae9b456f5..83cbd1345da 100644
> --- a/meta/lib/oeqa/selftest/cases/multiconfig.py
> +++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
> @@ -70,3 +70,16 @@ TMPDIR =3D "${TOPDIR}/tmp-mc-tiny"
>
>          result =3D bitbake('mc:test:multiconfig-test-parse -c showvar')
>          self.assertIn('MCTESTVAR=3Dtest2', result.output.splitlines())
> +
> +    def test_multiconfig_inlayer(self):
> +        """
> +        Test that a multiconfig from meta-selftest works.
> +        """
> +
> +        config =3D """
> +BBMULTICONFIG =3D "muslmc"
> +"""
> +        self.write_config(config)
> +
> +        # Build a core-image-minimal, only dry run needed to check confi=
g
> is present
> +        bitbake('mc:muslmc:bash -n')
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166767):
> https://lists.openembedded.org/g/openembedded-core/message/166767
> Mute This Topic: https://lists.openembedded.org/mt/91641952/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000051bba805e10780f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Richard,</div><br>The same test using the same TMP=
DIR will be useful=C2=A0as there are some layers doing that.<br>AFAIK the a=
rchiver and the rm_works don&#39;t like it very much.<br><br>The OE-core rm=
_work bbclass doesn&#39;t like multiconfig with the same TMPDIR.<br>This is=
sue with the rm_works=C2=A0is because the native packages use the same dire=
ctory and bitbake<br>will run the native tasks twice, one for each machine.=
 I need to exclude=C2=A0them to get a green=C2=A0build:<div>RM_WORK_EXCLUDE=
:append =3D &quot; texinfo-dummy-native gettext-minimal-native gnu-config&q=
uot;</div><div>Another interesting detail is that these recipes that have t=
he source dir in<br>the working dir: $S =3D=3D $WORKDIR<div><div><br>Jose<b=
r><br></div><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no dia quinta, 9/0=
6/2022 =C3=A0(s) 10:42:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">We should test that mutliconfigs from a layer work, not just build/=
conf.<br>
This adds such a test.<br>
<br>
[YOCTO #13566]<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta-selftest/conf/multiconfig/muslmc.conf=C2=A0 |=C2=A0 2 ++<br>
=C2=A0meta/lib/oeqa/selftest/cases/multiconfig.py | 13 +++++++++++++<br>
=C2=A02 files changed, 15 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf<br>
<br>
diff --git a/meta-selftest/conf/multiconfig/muslmc.conf b/meta-selftest/con=
f/multiconfig/muslmc.conf<br>
new file mode 100644<br>
index 00000000000..043cd1ccc3b<br>
--- /dev/null<br>
+++ b/meta-selftest/conf/multiconfig/muslmc.conf<br>
@@ -0,0 +1,2 @@<br>
+TCLIBC =3D &quot;musl&quot;<br>
+TMPDIR =3D &quot;${TOPDIR}/tmp-mc-musl&quot;<br>
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/se=
lftest/cases/multiconfig.py<br>
index baae9b456f5..83cbd1345da 100644<br>
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py<br>
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py<br>
@@ -70,3 +70,16 @@ TMPDIR =3D &quot;${TOPDIR}/tmp-mc-tiny&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D bitbake(&#39;mc:test:multiconf=
ig-test-parse -c showvar&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(&#39;MCTESTVAR=3Dtest2&#39;=
, result.output.splitlines())<br>
+<br>
+=C2=A0 =C2=A0 def test_multiconfig_inlayer(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Test that a multiconfig from meta-selftest wor=
ks.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+BBMULTICONFIG =3D &quot;muslmc&quot;<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Build a core-image-minimal, only dry run nee=
ded to check config is present<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;mc:muslmc:bash -n&#39;)<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#166767): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/166767" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/166767</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91641952/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91641952/5052612</a><br>
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
 Quaresma</div></div></div></div></div></div></div>

--00000000000051bba805e10780f5--

