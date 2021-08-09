Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.19251.1628490375486818207
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 23:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pBErwNHZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: sanakazisk19@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id z11so22901957edb.11
        for <Openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=94jQJyXLGRyRVdCUmr9w2kgVfaABSqVwoh6lCp+146I=;
        b=pBErwNHZun/49fOlJ8L8akJ+Y4AT8fkDxk16FoMBQNLehUgn4eqNDQRVxUTviPMoph
         zgGjhA1mUwQmNXPefuDL2pE4nCZ7NlMzcmiDWdvjudMpiliv1oL+p4UY7pnAlA9vx8Vy
         g++zbvD5VjQ1fNPeqRerO0NP7diZQCrHzGNnMAqRi3IPR/z1yYPT52d9GZrijvKWxdAW
         QlJ2pbgnUw/7Zq1MPVwEA+8QwuIDz0ISz4Aj9iIGIbtjVpxlYMe3nal1Zs08ZFiC5goI
         qfx0uNWjkYAizFvFYu5qy/+cQSsTMVmWxOunBSjjnSqVZiIL7f0ajH8OvmjHhdrdKzuG
         +8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=94jQJyXLGRyRVdCUmr9w2kgVfaABSqVwoh6lCp+146I=;
        b=L6AJ1mQsfdvJpeJAtZk8i0ciQtNmzTDVGL/M41MdJIGLIVPXx499ILY2KIcO2vcLM8
         luxm0d4j+4X1jtShoNGuUQkOaN6S6JPPThD3NsE+VzWlVvtCmT1tyUj7R0KDhDQbegap
         psaXXVyFPr6V6dFJpotuSSqmfMVvxT6eepBlXKzbOlkC9/HMWTK6VkfoGaveSI5LbAkv
         ZCUjT0ufkBS2kQz8Rk3vUdg77zFQf1aP9tsdQNZIB9MeMpjWmHuy/1+UoE8NGXbuPEzf
         0waxvP9bf2s1Tn89x4rhXCV3CrbQuEoPfXCNxal0fO7LmLfJqPDntPNAnUwkX7B6N433
         +5Nw==
X-Gm-Message-State: AOAM530xhhA7iWlrEH3JUe+/b7ihh4F8Hx2o+YC1b2F4xJsMLfA53nsW
	lqazNZTeTX17UYP9Rs6ViTC0FQggPT/PPM+nB8Ak9ql0yZP1xw==
X-Google-Smtp-Source: ABdhPJyY4rKXZsd/amCDttU7AJoeBNqN9LhT14C7qrMkJfd7li/gX8WDaCAQwFunElhcuKxCHPSCRXkiVS/OwOFlwNo=
X-Received: by 2002:a05:6402:b19:: with SMTP id bm25mr28166153edb.213.1628490373966;
 Sun, 08 Aug 2021 23:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210726034638.13401-1-sanakazisk19@gmail.com>
In-Reply-To: <20210726034638.13401-1-sanakazisk19@gmail.com>
From: "sana kazi" <sanakazisk19@gmail.com>
Date: Mon, 9 Aug 2021 11:56:02 +0530
Message-ID: <CAPxU0muZ68pXFOXvEOCyvheNyErNjsybonxD88x91OSUbvANyg@mail.gmail.com>
Subject: Re: [poky][master][PATCH] test_buildhistory: Add test to verify that LICENSE is added
To: Openembedded-core@lists.openembedded.org
Cc: nishaparrakat@gmail.com
Content-Type: multipart/alternative; boundary="00000000000042ae2505c91a76ff"

--00000000000042ae2505c91a76ff
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you please review below patch?

Regards,
Sana Kazi

On Mon, 26 Jul 2021 at 09:16, Sana Kazi <sanakazisk19@gmail.com> wrote:

> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Added test case which uses BUILDHISTORY_EXPORT_RECIPE_VARIABLES
> and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to add LICENSE for glibc as a
> sample recipe to buildhistory and the test verifies that expected
> license value is written in latest file.
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  .../recipes-test/glibc/glibc_%.bbappend       |  2 +
>  .../oeqa/selftest/cases/test_buildhistory.py  | 48 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/glibc/glibc_%.bbappend
>  create mode 100644 meta/lib/oeqa/selftest/cases/test_buildhistory.py
>
> diff --git a/meta-selftest/recipes-test/glibc/glibc_%.bbappend
> b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
> new file mode 100644
> index 0000000000..205720982c
> --- /dev/null
> +++ b/meta-selftest/recipes-test/glibc/glibc_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc
> file created by tests.
> +include test_recipe.inc
> diff --git a/meta/lib/oeqa/selftest/cases/test_buildhistory.py
> b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
> new file mode 100644
> index 0000000000..2f1bd54599
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/test_buildhistory.py
> @@ -0,0 +1,48 @@
> +import unittest
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.selftest.cases.buildhistory import BuildhistoryBase
> +from oeqa.utils.commands import bitbake, get_bb_var
> +
> +class BuildhistoryTests(BuildhistoryBase):
> +
> +    def test_write_license_to_latest_recipe(self):
> +        target = 'glibc'
> +        recipe_variables = []
> +        self.write_recipeinc(target,
> 'BUILDHISTORY_EXPORT_RECIPE_VARIABLES += \"LICENSE\"')
> +        self.run_buildhistory_operation(target)
> +        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
> +        self.append_config(add_buildhistory_config)
> +        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
> +        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
> +        bitbake('-c package_write_ipk -f %s' % target)
> +        infofile = "{}/packages/{}/{}/latest".format(pkghistdir,
> PACKAGE_ARCH, target)
> +        expected = "LICENSE = GPLv2 & LGPLv2.1"
> +        result = False
> +        with open(infofile, "r") as f:
> +            for line in f:
> +                if line.strip() == expected:
> +                    result = True
> +                    break
> +        if not result:
> +            raise AssertionError("Expected License not found")
> +
> +    def test_write_license_to_latest_package(self):
> +        target = 'glibc'
> +        recipe_variables = []
> +        self.write_recipeinc(target,
> 'BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += \"LICENSE\"')
> +        self.run_buildhistory_operation(target)
> +        add_buildhistory_config = 'PACKAGE_CLASSES = \"package_ipk\"'
> +        self.append_config(add_buildhistory_config)
> +        bitbake('-c package_write_ipk -f %s' % target)
> +        pkghistdir = get_bb_var('BUILDHISTORY_DIR')
> +        PACKAGE_ARCH = get_bb_var('MULTIMACH_TARGET_SYS')
> +        infofile = "{}/packages/{}/{}/{}-dbg/latest".format(pkghistdir,
> PACKAGE_ARCH, target, target)
> +        expected = "LICENSE = GPLv2 & LGPLv2.1"
> +        result = False
> +        with open(infofile, "r") as f:
> +            for line in f:
> +                if line.strip() == expected:
> +                    result = True
> +                    break
> +        if not result:
> +            raise AssertionError("Expected License not found")
> --
> 2.17.1
>
>

--00000000000042ae2505c91a76ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Could you please r=
eview below patch?</div><div><br></div><div>Regards,</div><div>Sana Kazi</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, 26 Jul 2021 at 09:16, Sana Kazi &lt;<a href=3D"mailto:sanakazisk=
19@gmail.com">sanakazisk19@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">From: Sana Kazi &lt;<a href=3D"mailto:S=
ana.Kazi@kpit.com" target=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
<br>
Added test case which uses BUILDHISTORY_EXPORT_RECIPE_VARIABLES<br>
and BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to add LICENSE for glibc as a<br>
sample recipe to buildhistory and the test verifies that expected<br>
license value is written in latest file.<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-test/glibc/glibc_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +<br>
=C2=A0.../oeqa/selftest/cases/test_buildhistory.py=C2=A0 | 48 +++++++++++++=
++++++<br>
=C2=A02 files changed, 50 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/glibc/glibc_%.bbappend<=
br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/test_buildhistory.py<=
br>
<br>
diff --git a/meta-selftest/recipes-test/glibc/glibc_%.bbappend b/meta-selft=
est/recipes-test/glibc/glibc_%.bbappend<br>
new file mode 100644<br>
index 0000000000..205720982c<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/glibc/glibc_%.bbappend<br>
@@ -0,0 +1,2 @@<br>
+# This bbappend is used to alter the recipe using the test_recipe.inc file=
 created by tests.<br>
+include test_recipe.inc<br>
diff --git a/meta/lib/oeqa/selftest/cases/test_buildhistory.py b/meta/lib/o=
eqa/selftest/cases/test_buildhistory.py<br>
new file mode 100644<br>
index 0000000000..2f1bd54599<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/test_buildhistory.py<br>
@@ -0,0 +1,48 @@<br>
+import unittest<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.selftest.cases.buildhistory import BuildhistoryBase<br>
+from oeqa.utils.commands import bitbake, get_bb_var<br>
+<br>
+class BuildhistoryTests(BuildhistoryBase):<br>
+<br>
+=C2=A0 =C2=A0 def test_write_license_to_latest_recipe(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D &#39;glibc&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_variables =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(target, &#39;BUILDHISTORY=
_EXPORT_RECIPE_VARIABLES +=3D \&quot;LICENSE\&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_buildhistory_operation(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_buildhistory_config =3D &#39;PACKAGE_CLASS=
ES =3D \&quot;package_ipk\&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(add_buildhistory_config)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkghistdir =3D get_bb_var(&#39;BUILDHISTORY_DI=
R&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGE_ARCH =3D get_bb_var(&#39;MULTIMACH_TAR=
GET_SYS&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c package_write_ipk -f %s&#39; %=
 target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 infofile =3D &quot;{}/packages/{}/{}/latest&qu=
ot;.format(pkghistdir, PACKAGE_ARCH, target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected =3D &quot;LICENSE =3D GPLv2 &amp; LGP=
Lv2.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(infofile, &quot;r&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.strip() =
=3D=3D expected:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not result:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(&quot;Expec=
ted License not found&quot;)<br>
+<br>
+=C2=A0 =C2=A0 def test_write_license_to_latest_package(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 target =3D &#39;glibc&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 recipe_variables =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(target, &#39;BUILDHISTORY=
_EXPORT_PACKAGE_VARIABLES +=3D \&quot;LICENSE\&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_buildhistory_operation(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_buildhistory_config =3D &#39;PACKAGE_CLASS=
ES =3D \&quot;package_ipk\&quot;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(add_buildhistory_config)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;-c package_write_ipk -f %s&#39; %=
 target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkghistdir =3D get_bb_var(&#39;BUILDHISTORY_DI=
R&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKAGE_ARCH =3D get_bb_var(&#39;MULTIMACH_TAR=
GET_SYS&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 infofile =3D &quot;{}/packages/{}/{}/{}-dbg/la=
test&quot;.format(pkghistdir, PACKAGE_ARCH, target, target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected =3D &quot;LICENSE =3D GPLv2 &amp; LGP=
Lv2.1&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(infofile, &quot;r&quot;) as f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.strip() =
=3D=3D expected:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 resu=
lt =3D True<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 brea=
k<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not result:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(&quot;Expec=
ted License not found&quot;)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000042ae2505c91a76ff--
