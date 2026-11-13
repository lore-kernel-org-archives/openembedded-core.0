Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9142.1794570109794530861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:41:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vriQw67Y;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ecd81cd67so16810696d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 03:41:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570109; cv=none;
        d=google.com; s=arc-20260327;
        b=E+QLwg1lSaVprrNyeHDGj2bCyzLJg4LgKP4Hb4U2OHrlZiLsiuoKSFU+Oa5RUjMnTG
         37FrYSBoNV3C/4Bg+/8drE6mXHEFOysDY1Mqd7b4RPzEwE08XceJyf7649ibV0EB+pvM
         NhAnlZfbYLDCuyi9TJAql0TSuKG5lDBFFzYMIMJoPGBe+xrORI3agZzFaKIqF1aLBlo0
         d+d6XuTYPpTqs6zvH6qJlYJc1cm5nCF25qQYWAO/UPPqHXY1rUF4c4vP2lTUAaqE+OEI
         paWUBkh4W/UqzBH8aGmrHUZk9/DdByhHTm0LnZ3q2ghoObo6of281q2EoL/1nJgnAJ2i
         vMLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qFi9KFivKAXqtpYNtyd9sLeWEsXrQlPrG+8GkUZMGrk=;
        fh=wJLD6zetCfjYthwLiAEels19uL6o2/FT2mHHrVoI57Y=;
        b=dI9H459c53v30XqsRdg3+2zTR2mBwQIPIFwPdEGbr1jUqTzwwhG5QORtn0muPD/V/1
         Jd749z6TPyixe6xhaQkcCZ4uopnHofMhzjEYXEeDUnytVhhDCaZgGBKcbA1HNvordveg
         WcK2aVC9xpJ/a03I39DJpxH/JUfboMbew2ozKNMTekOdMuBNNbx3lXHa1okGvcDWBp8K
         z+b0OlX8Nm4fJB9RwdX+LDvHO9+Kl9Q/2O3BotUYdPLPtje+yi5lMngZ5xWWgko716Lb
         OQ7Fo1qlEdn6rgQgItpqfLZ1VlDdFbIYgWgR9VTdgAz+IGrYhXKamD3Tju7Nj7RiZVMa
         mptA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794570109; x=1795174909; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFi9KFivKAXqtpYNtyd9sLeWEsXrQlPrG+8GkUZMGrk=;
        b=vriQw67YPpjIKOF1fvI8YPsFXMfFS3393SlyERNpDdOsMz5GCO77B+62/MR++ifpsF
         xg02eyeBqypCeAnHCz6jdx1N8JGx1k71wgY8fymyPFM0cMyljwDPj+kmCGh+Z2kCSkjY
         J3x96SZIqjo+B5T+pq1E44Cw/1jDs7WbCZAyCkVThZVMIyThRKXMqx1WDnPcpxqsf3hc
         6o7jxjn0KwCZFEENELjY3Zb+m/F5ihwkj2yFpPsBaBAxLxvmrY2rcmN40mRVKlivl2sU
         PyrWnAXoqi6/54CCGr7N5U8Qpscyu5arSQM5UueSZjCnM7kEQxxW+kQgFo1OIng1PAd0
         xjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570109; x=1795174909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qFi9KFivKAXqtpYNtyd9sLeWEsXrQlPrG+8GkUZMGrk=;
        b=cQmb64QrZjJRiSMHweZM1X9zJQoR7vLL4p0G3OqpB/iJzfVwS7CgwDZGyIpIlk4RNu
         E6xAxocf4ycHVilISXB70INrHZBf2+poXF2teSskElujX92gWkzsoseD//PcAgLVQleU
         7sdvj79+7qvg3vrEAWONUT4VWgt88f3KE3779vygQRpfVMX0oE/3yce8JRUR16xfSt/q
         HCqP4ItfdemNgQP9uUcuuZ3A4kBWOJQ5pR4+cyBp/hlfv4IrRssMMyb2wCJGBtrbxyD6
         ElF9XNizzrhpExzc8VRr329cIwbn/pAjSaXgd/zqbDQwiDsR3eeWRdJ0KoXCiFVpgdyj
         WVTg==
X-Gm-Message-State: APuU4Z/ZGUtW4U/RY2Q5p11heiH6H9sK/atUfsh6ChFgZUEhIGHJ/R+M
	gCkpAUM0sbmu7SJnbs54RuBtD5yvi++e2uefQKDNK/pJ40ucR0Mky+Gj1POARPXNVHiB86IwdYX
	DeWeONTbplad4KPsOugMwspCGWdZJdRk=
X-Gm-Gg: AYBFou1nkHPXlBKSI6ItMExGPXc9l+lOOJkxkTbEyjUXlOSxddMLuQiOqAogrqokoSB
	lVNZSXioW8oRclJtKjW8ZtA12D0pluXEzJ/7VQ+smCdDNWZlu4cI0zI6I6ycj4XNXZRfhZ7+EHt
	aeLL3Th4HymIaUpy0+9NGc1g6rF1K9eoc34z534dzbpFCHsE/rp4BFjzY0xxaHp1Uq5ZVCnF88J
	50AkeNo+EZTL6iYXlGokr3mnXXBkSxwAqsBfEO0ccvHBELwkx5VqKIN2Tbt8kF1dbvaRXABTVSy
	sEIvCn5Mmqluxn7jhaXLf+BpyoPF8tSUoMVURCMldpSabZpNJ1RDPkiUlY7ngNlmTNKWfhJZ5s8
	xruwifJ1RjPR8ju84KCFHx0wak5WVWqThFBd2F5zrWhn8B7xuiR+R3EHuOV8ZAn4qmj+tZJQ=
X-Received: by 2002:a05:6214:470b:b0:91e:f3ad:b744 with SMTP id
 6a1803df08f44-91f241f6c74mr29177786d6.32.1794570108624; Fri, 13 Nov 2026
 03:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20261113101537.3586467-1-sean@geanix.com> <20261113101537.3586467-2-sean@geanix.com>
In-Reply-To: <20261113101537.3586467-2-sean@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Nov 2026 12:41:37 +0100
X-Gm-Features: AclHuK8J-eI3NLwIbf8Dbjb3S46zrPS5hWcWYHvaiGdiYtSbiH3uUUoD_meDHuo
Message-ID: <CANNYZj-stM_rpnBi9FRhBvgu+seUOyMY4iYB4qenQX9kSMrZoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oeqa/selftest/incompatible_lic: test
 INCOMPATIBLE_LICENSE in populate_sdk
To: sean@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d96911066026e9d8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250163

--000000000000d96911066026e9d8
Content-Type: text/plain; charset="UTF-8"

Typical claude, sorry. It's far too eager to mass-produce new test cases
via copy-paste instead of figuring out how to tweak existing cases. Please
instruct it to do that.

Alex

On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer via openembedded-core <sean=
geanix.com@lists.openembedded.org> wrote:

> Check that do_populate_sdk ignores the image's INCOMPATIBLE_LICENSE for
> SDK host tools (nativesdk-bash) and still applies it to packages in the
> SDK target sysroot (which).
>
> bash can't be used for the target check, as target-sdk-provides-dummy
> RPROVIDES bash, so it is never installed into the SDK target sysroot.
>
> Autoconf-exception-macro is added to the exceptions, as the SDK's
> complementary packages include xz-src.
>
> AI-Generated: Claude Opus 5.5 (Claude Code)
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
> It seems weird to add the AI-Generated tag here.
> It took quite a lot of effort to get the tests to fail before 1/2 and
> pass after 1/2.
>
>  .../oeqa/selftest/cases/incompatible_lic.py   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> index 406f92e37b..e05e2ee31c 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -155,6 +155,34 @@ NO_GENERIC_LICENSE[SomeLicense] = "COPYING"
>              """))
>          bitbake('core-image-minimal')
>
> +class IncompatibleLicensePerImageSDKTests(OESelftestTestCase):
> +    def default_config(self):
> +        return """
> +INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
> +INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal =
> "GCC-exception-3.1 Autoconf-exception-macro"
> +ERROR_QA:remove:pn-core-image-minimal = "license-exception"
> +
> +require conf/distro/include/no-gplv3.inc
> +"""
> +
> +    # Verify that host tools in the SDK (nativesdk, cross-canadian) are
> not
> +    # checked against the image's INCOMPATIBLE_LICENSE, the same as at
> parse
> +    # time
> +    def test_sdk_host_gpl3(self):
> +        self.write_config(self.default_config() +
> '\nTOOLCHAIN_HOST_TASK:append:pn-core-image-minimal = " nativesdk-bash"')
> +
> +        bitbake('core-image-minimal -c populate_sdk')
> +
> +    # Verify that target packages in the SDK sysroot are still checked
> +    # against the image's INCOMPATIBLE_LICENSE
> +    def test_sdk_target_gpl3(self):
> +        self.write_config(self.default_config() +
> '\nTOOLCHAIN_TARGET_TASK:append:pn-core-image-minimal = " which"')
> +        error_msg = "ERROR: core-image-minimal-1.0-r0 do_populate_sdk:
> Some packages cannot be installed into the image because they have
> incompatible licenses:\n\twhich (GPL-3.0-or-later)"
> +
> +        result = bitbake('core-image-minimal -c populate_sdk',
> ignore_status=True)
> +        if error_msg not in result.output:
> +            raise AssertionError(result.output)
> +
>  class NoGPL3InImagesTests(OESelftestTestCase):
>      def test_core_image_minimal(self):
>          self.write_config("""
> --
> 2.56.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#250156):
> https://lists.openembedded.org/g/openembedded-core/message/250156
> Mute This Topic: https://lists.openembedded.org/mt/122244713/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000d96911066026e9d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Typical claude, sorry. It&#39;s far too eager to mass=
-produce new test cases via copy-paste instead of figuring out how to tweak=
 existing cases. Please instruct it to do that.</div><div><br></div><div>Al=
ex</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 13 Nov 2026 at 11:15, Sean Nyekjaer v=
ia openembedded-core &lt;sean=3D<a href=3D"mailto:geanix.com@lists.openembe=
dded.org">geanix.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Check that do_populate_sdk ignor=
es the image&#39;s INCOMPATIBLE_LICENSE for<br>
SDK host tools (nativesdk-bash) and still applies it to packages in the<br>
SDK target sysroot (which).<br>
<br>
bash can&#39;t be used for the target check, as target-sdk-provides-dummy<b=
r>
RPROVIDES bash, so it is never installed into the SDK target sysroot.<br>
<br>
Autoconf-exception-macro is added to the exceptions, as the SDK&#39;s<br>
complementary packages include xz-src.<br>
<br>
AI-Generated: Claude Opus 5.5 (Claude Code)<br>
Signed-off-by: Sean Nyekjaer &lt;<a href=3D"mailto:sean@geanix.com" target=
=3D"_blank">sean@geanix.com</a>&gt;<br>
---<br>
It seems weird to add the AI-Generated tag here.<br>
It took quite a lot of effort to get the tests to fail before 1/2 and<br>
pass after 1/2.<br>
<br>
=C2=A0.../oeqa/selftest/cases/incompatible_lic.py=C2=A0 =C2=A0| 28 ++++++++=
+++++++++++<br>
=C2=A01 file changed, 28 insertions(+)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oe=
qa/selftest/cases/incompatible_lic.py<br>
index 406f92e37b..e05e2ee31c 100644<br>
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
@@ -155,6 +155,34 @@ NO_GENERIC_LICENSE[SomeLicense] =3D &quot;COPYING&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitbake(&#39;core-image-minimal&#39;)<br>
<br>
+class IncompatibleLicensePerImageSDKTests(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 def default_config(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;&quot;<br>
+INCOMPATIBLE_LICENSE:pn-core-image-minimal =3D &quot;GPL-3.0* LGPL-3.0*&qu=
ot;<br>
+INCOMPATIBLE_LICENSE_EXCEPTIONS:pn-core-image-minimal =3D &quot;GCC-except=
ion-3.1 Autoconf-exception-macro&quot;<br>
+ERROR_QA:remove:pn-core-image-minimal =3D &quot;license-exception&quot;<br=
>
+<br>
+require conf/distro/include/no-gplv3.inc<br>
+&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 # Verify that host tools in the SDK (nativesdk, cross-canadi=
an) are not<br>
+=C2=A0 =C2=A0 # checked against the image&#39;s INCOMPATIBLE_LICENSE, the =
same as at parse<br>
+=C2=A0 =C2=A0 # time<br>
+=C2=A0 =C2=A0 def test_sdk_host_gpl3(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(self.default_config() + &#39=
;\nTOOLCHAIN_HOST_TASK:append:pn-core-image-minimal =3D &quot; nativesdk-ba=
sh&quot;&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-minimal -c populate_sd=
k&#39;)<br>
+<br>
+=C2=A0 =C2=A0 # Verify that target packages in the SDK sysroot are still c=
hecked<br>
+=C2=A0 =C2=A0 # against the image&#39;s INCOMPATIBLE_LICENSE<br>
+=C2=A0 =C2=A0 def test_sdk_target_gpl3(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(self.default_config() + &#39=
;\nTOOLCHAIN_TARGET_TASK:append:pn-core-image-minimal =3D &quot; which&quot=
;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D &quot;ERROR: core-image-minimal-=
1.0-r0 do_populate_sdk: Some packages cannot be installed into the image be=
cause they have incompatible licenses:\n\twhich (GPL-3.0-or-later)&quot;<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D bitbake(&#39;core-image-minimal -c =
populate_sdk&#39;, ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg not in result.output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(result.outp=
ut)<br>
+<br>
=C2=A0class NoGPL3InImagesTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0def test_core_image_minimal(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.write_config(&quot;&quot;&quot;<br>
-- <br>
2.56.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#250156): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/250156" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/250156</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122244713/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122244713/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d96911066026e9d8--
