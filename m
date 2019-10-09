Return-Path: <kergoth@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id BBD0060197
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 18:15:28 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 89so2522814oth.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 11:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VnPj6K/B8gTpl6ifbOyie/cShSO+pehvo90wBmDrVx8=;
	b=SMbnIIZ1fYUzmvwKnvR6DmDTO0Vdl1ygK6cbTlV3tOaZZvACthYZyDNC7yEQ6b5zsv
	CGOSOLJJHKXfbf/eBd8+Fz/aadkTdlAJXdpamKL8XJmA54dLzw8biPK1nAuRfl+aD1kF
	9kbMHEBzZHq5nevbsPiuW1AIzsPlDVmh6Bzh2QG2J8grKlbqGc9dY6GEe8Ufk0KKkHdY
	kefODXmHoK1YyBkuNIgj5aGpt2bKy7LInTp6aO7Ff1RbOf1tm4O1rnT9vm+2afB1ThP2
	3jBFwk9+m92n3RN1NwwKpxl3l37lzJd8CU0tu1CLyOMYaIh2eZwW97uIhAThaWJizonP
	DHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VnPj6K/B8gTpl6ifbOyie/cShSO+pehvo90wBmDrVx8=;
	b=tRB9xQkH5652/2xJVJWDQBfAZ3vSPBRhVhQugbQqVr6SEpogTS/AYV3m7QveA0yoxo
	KhHidwYCHex3vd5a/zDO0VvHmy9U4KjbJeNgLADK7kRAqB++d82ai7P2jafksxZS/yi1
	VypdUxTU/qFtGabepCS8w84dOC6vVlUoh//vghZ0ozLMLvzlU+4JqnaL1Gk+A/Tnv57K
	qUJHlubIoGCe8AMCRnXJzqU8fB7q1VqR2yIyf65iuEwd7vh8UTLy0+1KSZypGJmv22E/
	9QdqvI95Et8KG3Y+gmdwJXPiPLmTV8/fc034Mo6LzLEHwdubCTqV5RRSvUQCCUVnkEcE
	Z8oQ==
X-Gm-Message-State: APjAAAXfpshWoBD6ZxS3aOUjYkIWSIqJvvuMYex2aUclgIX4yLjidlYi
	tqmxsT/2uLFV9GfIHS3wzG2xlS7MQtSgxZZ93ok=
X-Google-Smtp-Source: APXvYqzIHgCEbOHC8HtzDDwhPFWCtbKug29KYREPAZSxwVmIV6zN3wy+gZYfDcSfeilakDeHzKYCTPPzy6IbOkn96i0=
X-Received: by 2002:a05:6830:1e59:: with SMTP id
	e25mr1680930otj.340.1570644929511; 
	Wed, 09 Oct 2019 11:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191009144447.86018-1-alex.kanavin@gmail.com>
	<20191009144447.86018-2-alex.kanavin@gmail.com>
In-Reply-To: <20191009144447.86018-2-alex.kanavin@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 9 Oct 2019 12:15:17 -0600
Message-ID: <CABcZAN=fzjUJuKV44b-gpeOMW--w1icr4tzeFRONmJ2zYmLYxA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/2] license_image.bbclass: check and reject packages which have incompatible licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 18:15:28 -0000
Content-Type: multipart/alternative; boundary="0000000000001788fa05947e4524"

--0000000000001788fa05947e4524
Content-Type: text/plain; charset="UTF-8"

Does this obey the whitelist? Can I whitelist a gplv3 package to get it
installed, ideally with a warning rather than silent or error? I don't have
the code in front of me at the moment. I have a class in meta-mentor that
does this sort of check, so wanted to see how the implementations compare.
On a related note,
https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mentor-common/classes/incompatible-recipe-check.bbclass
+
https://github.com/MentorEmbedded/meta-mentor/blob/95d05dcc12651a7b246f91b240120f92d196b0de/meta-mel-support/recipes-core/packagegroups/packagegroup-tools-benchmark.bb#L10
might be of interest to you in your gplv2 work, perhaps? Specifically
handling the whitelisting.

On Wed, Oct 9, 2019 at 8:45 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> The use case is setting INCOMPATIBLE_LICENSE per image,
> rather than as an awkward, and too strict global setting.
>
> This for example would allow building development images with gplv3 tools,
> but production images without them, and checking that nothing gpl3-licensed
> gets into the latter.
>
> Examples are provided via the selftest: three scenarios are tested:
>
> - bash is added to the image, with a default gpl3 license; this is rejected
> - bash is added to the image, with a "gpl3 & other" license; this is also
> rejected
> - bash is added to the image, with a "gpl3 | other" license; this is
> accepted, but
> only 'other' is added to the license manifest (this was already handled
> correctly
> previously).
>
> Eventually, this would allow deprecating the meta-gplv2 layer, while still
> enforcing the no-gpl3 rule where possible and needed.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/classes/license_image.bbclass            |  2 ++
>  .../oeqa/selftest/cases/incompatible_lic.py   | 29 +++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/meta/classes/license_image.bbclass
> b/meta/classes/license_image.bbclass
> index 3f102d0fbc3..e5cb1b8c77d 100644
> --- a/meta/classes/license_image.bbclass
> +++ b/meta/classes/license_image.bbclass
> @@ -47,6 +47,8 @@ def write_license_files(d, license_manifest, pkg_dic,
> rootfs=True):
>          for pkg in sorted(pkg_dic):
>              if bad_licenses:
>                  try:
> +                    if incompatible_pkg_license(d, bad_licenses,
> pkg_dic[pkg]["LICENSE"]):
> +                        bb.fatal("Package %s has an incompatible license
> %s and cannot be installed into the image." %(pkg, pkg_dic[pkg]["LICENSE"]))
>                      (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"]) =
> \
>
>  oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
>                          bad_licenses, canonical_license, d)
> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> index 8fb93af8a89..e80c9783122 100644
> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
> @@ -39,3 +39,32 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>      # INCOMPATIBLE_LICENSE contains this license
>      def test_incompatible_nonspdx_license(self):
>          self.lic_test('incompatible-nonspdx-license', 'FooLicense',
> 'FooLicense')
> +
> +class IncompatibleLicensePerImageTests(OESelftestTestCase):
> +    def default_config(self):
> +        return """
> +IMAGE_INSTALL_append = "bash"
> +INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
> +"""
> +
> +    def test_bash_default(self):
> +        self.write_config(self.default_config())
> +        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package
> bash has an incompatible license GPLv3+ and cannot be installed into the
> image."
> +
> +        result = bitbake('core-image-minimal', ignore_status=True)
> +        if error_msg not in result.output:
> +            raise AssertionError(result.output)
> +
> +    def test_bash_and_license(self):
> +        self.write_config(self.default_config() +
> '\nLICENSE_append_pn-bash = " & SomeLicense"')
> +        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package
> bash has an incompatible license GPLv3+ & SomeLicense and cannot be
> installed into the image."
> +
> +        result = bitbake('core-image-minimal', ignore_status=True)
> +        if error_msg not in result.output:
> +            raise AssertionError(result.output)
> +
> +    def test_bash_or_license(self):
> +        self.write_config(self.default_config() +
> '\nLICENSE_append_pn-bash = " | SomeLicense"')
> +
> +        bitbake('core-image-minimal')
> +
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000001788fa05947e4524
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this obey the whitelist? Can I whitelist a gplv3 pack=
age to get it installed, ideally with a warning rather than silent or error=
? I don&#39;t have the code in front of me at the moment. I have a class in=
 meta-mentor that does this sort of check, so wanted to see how the impleme=
ntations compare. On a related note, <a href=3D"https://github.com/MentorEm=
bedded/meta-mentor/blob/master/meta-mentor-common/classes/incompatible-reci=
pe-check.bbclass">https://github.com/MentorEmbedded/meta-mentor/blob/master=
/meta-mentor-common/classes/incompatible-recipe-check.bbclass</a> + <a href=
=3D"https://github.com/MentorEmbedded/meta-mentor/blob/95d05dcc12651a7b246f=
91b240120f92d196b0de/meta-mel-support/recipes-core/packagegroups/packagegro=
up-tools-benchmark.bb#L10">https://github.com/MentorEmbedded/meta-mentor/bl=
ob/95d05dcc12651a7b246f91b240120f92d196b0de/meta-mel-support/recipes-core/p=
ackagegroups/packagegroup-tools-benchmark.bb#L10</a> might be of interest t=
o you in your gplv2 work, perhaps? Specifically handling the whitelisting.<=
br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, Oct 9, 2019 at 8:45 AM Alexander Kanavin &lt;<a href=3D"mailto:a=
lex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The use case is setting INCOMP=
ATIBLE_LICENSE per image,<br>
rather than as an awkward, and too strict global setting.<br>
<br>
This for example would allow building development images with gplv3 tools,<=
br>
but production images without them, and checking that nothing gpl3-licensed=
<br>
gets into the latter.<br>
<br>
Examples are provided via the selftest: three scenarios are tested:<br>
<br>
- bash is added to the image, with a default gpl3 license; this is rejected=
<br>
- bash is added to the image, with a &quot;gpl3 &amp; other&quot; license; =
this is also rejected<br>
- bash is added to the image, with a &quot;gpl3 | other&quot; license; this=
 is accepted, but<br>
only &#39;other&#39; is added to the license manifest (this was already han=
dled correctly<br>
previously).<br>
<br>
Eventually, this would allow deprecating the meta-gplv2 layer, while still<=
br>
enforcing the no-gpl3 rule where possible and needed.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/license_image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 ++<br>
=C2=A0.../oeqa/selftest/cases/incompatible_lic.py=C2=A0 =C2=A0| 29 ++++++++=
+++++++++++<br>
=C2=A02 files changed, 31 insertions(+)<br>
<br>
diff --git a/meta/classes/license_image.bbclass b/meta/classes/license_imag=
e.bbclass<br>
index 3f102d0fbc3..e5cb1b8c77d 100644<br>
--- a/meta/classes/license_image.bbclass<br>
+++ b/meta/classes/license_image.bbclass<br>
@@ -47,6 +47,8 @@ def write_license_files(d, license_manifest, pkg_dic, roo=
tfs=3DTrue):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for pkg in sorted(pkg_dic):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bad_licenses:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if i=
ncompatible_pkg_license(d, bad_licenses, pkg_dic[pkg][&quot;LICENSE&quot;])=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bb.fatal(&quot;Package %s has an incompatible license %s and can=
not be installed into the image.&quot; %(pkg, pkg_dic[pkg][&quot;LICENSE&qu=
ot;]))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(pkg_dic[pkg][&quot;LICENSE&quot;], pkg_dic[pkg][&quot;LICENSES&quot;]) =
=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0oe.license.manifest_licenses(pkg_dic[pkg][&quot;LICENSE&qu=
ot;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bad_licenses, canonical_license, d)<br>
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oe=
qa/selftest/cases/incompatible_lic.py<br>
index 8fb93af8a89..e80c9783122 100644<br>
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py<br>
@@ -39,3 +39,32 @@ class IncompatibleLicenseTests(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0# INCOMPATIBLE_LICENSE contains this license<br>
=C2=A0 =C2=A0 =C2=A0def test_incompatible_nonspdx_license(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.lic_test(&#39;incompatible-nonspdx-l=
icense&#39;, &#39;FooLicense&#39;, &#39;FooLicense&#39;)<br>
+<br>
+class IncompatibleLicensePerImageTests(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 def default_config(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;&quot;<br>
+IMAGE_INSTALL_append =3D &quot;bash&quot;<br>
+INCOMPATIBLE_LICENSE_pn-core-image-minimal =3D &quot;GPL-3.0 LGPL-3.0&quot=
;<br>
+&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 def test_bash_default(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(self.default_config())<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D &quot;ERROR: core-image-minimal-=
1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ and canno=
t be installed into the image.&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D bitbake(&#39;core-image-minimal&#39=
;, ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg not in result.output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(result.outp=
ut)<br>
+<br>
+=C2=A0 =C2=A0 def test_bash_and_license(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(self.default_config() + &#39=
;\nLICENSE_append_pn-bash =3D &quot; &amp; SomeLicense&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_msg =3D &quot;ERROR: core-image-minimal-=
1.0-r0 do_rootfs: Package bash has an incompatible license GPLv3+ &amp; Som=
eLicense and cannot be installed into the image.&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D bitbake(&#39;core-image-minimal&#39=
;, ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if error_msg not in result.output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise AssertionError(result.outp=
ut)<br>
+<br>
+=C2=A0 =C2=A0 def test_bash_or_license(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(self.default_config() + &#39=
;\nLICENSE_append_pn-bash =3D &quot; | SomeLicense&quot;&#39;)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-minimal&#39;)<br>
+<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<b=
r>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<b=
r>Senior Software Engineer, Mentor Graphics</div></div></div></div>

--0000000000001788fa05947e4524--
