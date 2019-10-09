Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by mail.openembedded.org (Postfix) with ESMTP id BFB376B07E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2019 19:41:38 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id m21so1154386ual.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Oct 2019 12:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5PhoHrvL9B4NIsKlGgCDwMA8GvNJm8vpQqF7OAvCSks=;
	b=CtVjanDk0dbLeTu/YtORbjey5O7+0ccP7CU6FjHG/GR7MSKJK4xVFIC01XBcaI3YoQ
	IPnKGxDfjI4pOD3BzMZM3Howc/A5ZTfhH+B9QU/kmMat5v8gvBIgBqPmD6aWJi1Q0ZJG
	eKumzjMGaJ7/cwQEizNbo25y5nzQMASI6z/PA8Vlg1b2JoYaJdxQmveGa7G9kdC0oOO4
	5M7MA6N6cE/Kwn49xS0t8qU8GgFKCgshljw0lW53+nm35rFcRpvgj3FUuTCMHOaH25oB
	zwBk2mucU7MCUONuAJ4rZ9A/ivKwJPC0kWUbaEKqFx0nORkS9M4hBAJwqMoy7tvoaojq
	5MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5PhoHrvL9B4NIsKlGgCDwMA8GvNJm8vpQqF7OAvCSks=;
	b=gpQ9HVg0vmZY/ig+0BIEbf6JUNyHJzzkX4aKEnsA6QmJcUt0U2yFqmVLbYs9iFh8w3
	m5DKiScCvzfIqbawiwCaMbwd8YHgdIc6GkbpuQk6/G2wym35IrGJFw+1vJmh2Dej2l3B
	jv5Ax8QmI9owmRu+jpr8Wu5KG5k/XYgfN1CLqBAJnUBO8r5re3B1uLiDbnck2FacG9nf
	BBJ7kxhmQFWT1cNkDStLGtq91W8p9egfprbaCimtWZsL8p8yU7DCp0qoas+F0VnwRtqg
	8GCjKc1VfAZb1Uq1caJrwAnoAkb0cuKaTWLsItZXBIzYVGInUK7dYTDX6pYs9sOfxCja
	p2gQ==
X-Gm-Message-State: APjAAAV4CBoRb41qieLLpFqC6RaL84V7LoVFyGHQ8vrlur97bWvs5g2U
	WbXJF78CasXELcWdaUq8EjyNWS4arPPw+PXj/+8=
X-Google-Smtp-Source: APXvYqzCBOVyFCBL1jZ1WQcz5gQgu9kVo4ud+3XYGE9kNHk7BDTOznIEWz90UmwpKaE20LNbbJIFfL6uTJef0UFlqU4=
X-Received: by 2002:ab0:3f1:: with SMTP id 104mr2255870uau.93.1570650099703;
	Wed, 09 Oct 2019 12:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20191009144447.86018-1-alex.kanavin@gmail.com>
	<20191009144447.86018-2-alex.kanavin@gmail.com>
	<CABcZAN=fzjUJuKV44b-gpeOMW--w1icr4tzeFRONmJ2zYmLYxA@mail.gmail.com>
In-Reply-To: <CABcZAN=fzjUJuKV44b-gpeOMW--w1icr4tzeFRONmJ2zYmLYxA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Oct 2019 21:41:28 +0200
Message-ID: <CANNYZj_AC=6LdUgvW7DZ=gJzDwejnEJX0WpJztoCiTXkX08vEQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
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
X-List-Received-Date: Wed, 09 Oct 2019 19:41:40 -0000
Content-Type: multipart/alternative; boundary="0000000000004265c705947f793c"

--0000000000004265c705947f793c
Content-Type: text/plain; charset="UTF-8"

It wouldn't be too hard to add a condition that checks the (image-specific)
whitelist, I just wanted to gather a bit of feedback for the overall idea :)

Alex

On Wed, 9 Oct 2019 at 20:15, Christopher Larson <kergoth@gmail.com> wrote:

> Does this obey the whitelist? Can I whitelist a gplv3 package to get it
> installed, ideally with a warning rather than silent or error? I don't have
> the code in front of me at the moment. I have a class in meta-mentor that
> does this sort of check, so wanted to see how the implementations compare.
> On a related note,
> https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mentor-common/classes/incompatible-recipe-check.bbclass
> +
> https://github.com/MentorEmbedded/meta-mentor/blob/95d05dcc12651a7b246f91b240120f92d196b0de/meta-mel-support/recipes-core/packagegroups/packagegroup-tools-benchmark.bb#L10
> might be of interest to you in your gplv2 work, perhaps? Specifically
> handling the whitelisting.
>
> On Wed, Oct 9, 2019 at 8:45 AM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> The use case is setting INCOMPATIBLE_LICENSE per image,
>> rather than as an awkward, and too strict global setting.
>>
>> This for example would allow building development images with gplv3 tools,
>> but production images without them, and checking that nothing
>> gpl3-licensed
>> gets into the latter.
>>
>> Examples are provided via the selftest: three scenarios are tested:
>>
>> - bash is added to the image, with a default gpl3 license; this is
>> rejected
>> - bash is added to the image, with a "gpl3 & other" license; this is also
>> rejected
>> - bash is added to the image, with a "gpl3 | other" license; this is
>> accepted, but
>> only 'other' is added to the license manifest (this was already handled
>> correctly
>> previously).
>>
>> Eventually, this would allow deprecating the meta-gplv2 layer, while still
>> enforcing the no-gpl3 rule where possible and needed.
>>
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>  meta/classes/license_image.bbclass            |  2 ++
>>  .../oeqa/selftest/cases/incompatible_lic.py   | 29 +++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>
>> diff --git a/meta/classes/license_image.bbclass
>> b/meta/classes/license_image.bbclass
>> index 3f102d0fbc3..e5cb1b8c77d 100644
>> --- a/meta/classes/license_image.bbclass
>> +++ b/meta/classes/license_image.bbclass
>> @@ -47,6 +47,8 @@ def write_license_files(d, license_manifest, pkg_dic,
>> rootfs=True):
>>          for pkg in sorted(pkg_dic):
>>              if bad_licenses:
>>                  try:
>> +                    if incompatible_pkg_license(d, bad_licenses,
>> pkg_dic[pkg]["LICENSE"]):
>> +                        bb.fatal("Package %s has an incompatible license
>> %s and cannot be installed into the image." %(pkg, pkg_dic[pkg]["LICENSE"]))
>>                      (pkg_dic[pkg]["LICENSE"], pkg_dic[pkg]["LICENSES"])
>> = \
>>
>>  oe.license.manifest_licenses(pkg_dic[pkg]["LICENSE"],
>>                          bad_licenses, canonical_license, d)
>> diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
>> b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
>> index 8fb93af8a89..e80c9783122 100644
>> --- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
>> +++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
>> @@ -39,3 +39,32 @@ class IncompatibleLicenseTests(OESelftestTestCase):
>>      # INCOMPATIBLE_LICENSE contains this license
>>      def test_incompatible_nonspdx_license(self):
>>          self.lic_test('incompatible-nonspdx-license', 'FooLicense',
>> 'FooLicense')
>> +
>> +class IncompatibleLicensePerImageTests(OESelftestTestCase):
>> +    def default_config(self):
>> +        return """
>> +IMAGE_INSTALL_append = "bash"
>> +INCOMPATIBLE_LICENSE_pn-core-image-minimal = "GPL-3.0 LGPL-3.0"
>> +"""
>> +
>> +    def test_bash_default(self):
>> +        self.write_config(self.default_config())
>> +        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package
>> bash has an incompatible license GPLv3+ and cannot be installed into the
>> image."
>> +
>> +        result = bitbake('core-image-minimal', ignore_status=True)
>> +        if error_msg not in result.output:
>> +            raise AssertionError(result.output)
>> +
>> +    def test_bash_and_license(self):
>> +        self.write_config(self.default_config() +
>> '\nLICENSE_append_pn-bash = " & SomeLicense"')
>> +        error_msg = "ERROR: core-image-minimal-1.0-r0 do_rootfs: Package
>> bash has an incompatible license GPLv3+ & SomeLicense and cannot be
>> installed into the image."
>> +
>> +        result = bitbake('core-image-minimal', ignore_status=True)
>> +        if error_msg not in result.output:
>> +            raise AssertionError(result.output)
>> +
>> +    def test_bash_or_license(self):
>> +        self.write_config(self.default_config() +
>> '\nLICENSE_append_pn-bash = " | SomeLicense"')
>> +
>> +        bitbake('core-image-minimal')
>> +
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>

--0000000000004265c705947f793c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It wouldn&#39;t be too hard to add a condition that c=
hecks the (image-specific) whitelist, I just wanted to gather a bit of feed=
back for the overall idea :)</div><div><br></div><div>Alex<br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 9 Oct 2019 at 20:15, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmai=
l.com">kergoth@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><div dir=3D"ltr">Does this obey the whitelist? Can =
I whitelist a gplv3 package to get it installed, ideally with a warning rat=
her than silent or error? I don&#39;t have the code in front of me at the m=
oment. I have a class in meta-mentor that does this sort of check, so wante=
d to see how the implementations compare. On a related note, <a href=3D"htt=
ps://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mentor-common/c=
lasses/incompatible-recipe-check.bbclass" target=3D"_blank">https://github.=
com/MentorEmbedded/meta-mentor/blob/master/meta-mentor-common/classes/incom=
patible-recipe-check.bbclass</a> + <a href=3D"https://github.com/MentorEmbe=
dded/meta-mentor/blob/95d05dcc12651a7b246f91b240120f92d196b0de/meta-mel-sup=
port/recipes-core/packagegroups/packagegroup-tools-benchmark.bb#L10" target=
=3D"_blank">https://github.com/MentorEmbedded/meta-mentor/blob/95d05dcc1265=
1a7b246f91b240120f92d196b0de/meta-mel-support/recipes-core/packagegroups/pa=
ckagegroup-tools-benchmark.bb#L10</a> might be of interest to you in your g=
plv2 work, perhaps? Specifically handling the whitelisting.<br></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct =
9, 2019 at 8:45 AM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gma=
il.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">The use case is setting INC=
OMPATIBLE_LICENSE per image,<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</blockquote></div>

--0000000000004265c705947f793c--
