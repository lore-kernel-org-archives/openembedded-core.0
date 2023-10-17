Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A586CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 14:06:09 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.215924.1697551563788007930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 07:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mCZn3nFW;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: quaresma.jose@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d84f18e908aso6434183276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697551563; x=1698156363; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rgSi9EQz6wKc6LaCQz3eR9em0xyE7Wsej/QhFGTIII4=;
        b=mCZn3nFW3p+czWpmvXQninUxEBAMaPFaD8w2TN8k6GFSVhp48TFClMktkOhMznMZvK
         P1YHUV/ydxu7dqBYwwiYUsAuhAbadn5c8QIMjsCP7k5QgPn1Th4AKFk8L+Va8oNyW0FA
         clLPq2zLAj1HlUSPkAhTD9N6jiH6rQqoH0HTtkAqV5nxPm3wribJN/rpN1xWm/WxdxWQ
         jrI84c/zvBKLtUkkMc/Ju9g+K+5LuAz33KYFogoreX1zLdJx/3MyvxRnh4gn84keIcl+
         AcZ/SWhhwv625zKxAl1kdhoE1qLXpg5JrWnVSAk4Z6TqcWJIVU5pNw8R989jXXYBuUDk
         wXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697551563; x=1698156363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgSi9EQz6wKc6LaCQz3eR9em0xyE7Wsej/QhFGTIII4=;
        b=qysfpn09erPlE4Ujh9Kp32Jg6sv8PIB382cGiQgALBEvMXyODEJwg+8bfeZiE7AK+4
         A0TUiVLulmtmFXeh1EBCT1RH+uKxmhOBzHtawSUAKmCJnfFyPTFUXlpZd7j66CVwreMq
         BS04BnBjdoBiAKfn0WXNtPaVYrnBLuHbYIb/Ke0Gsoj8nGek1mRSnNTXaONzuh1UVSO/
         qQWaLphcW6adLK2DSZ5yw0uZdWeguxkneXmWSTb2YaLYs1zpkUZDXMjKAXU9cKEAHNYU
         sY5dts98da5N8g4V8UxDo+zaYrT7MfVWzsIYYfhTX1s36/q2U+w8xjkEFyZx8cqbIYWt
         El6Q==
X-Gm-Message-State: AOJu0Yz+uV5WpXRBKtYl94zLIqcPGMhkSRp4gX6nCGsUWln3UN8DkCpa
	g61cg43F6o+QXYSwgbkAYkY4nMu/U0QBsE2dYyE=
X-Google-Smtp-Source: AGHT+IGLWd3V1k+D6Mf/0Ue5eORrCeFFii74FuKQRul0CWbNhF5YDZZB5DF+gP54F9vGZN+a2KAxIM+zAFGYfWmfd30=
X-Received: by 2002:a25:d349:0:b0:d78:1502:9330 with SMTP id
 e70-20020a25d349000000b00d7815029330mr2331512ybf.7.1697551561271; Tue, 17 Oct
 2023 07:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231017133050.147000-1-alex@linutronix.de> <20231017133050.147000-2-alex@linutronix.de>
In-Reply-To: <20231017133050.147000-2-alex@linutronix.de>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Oct 2023 15:05:50 +0100
Message-ID: <CANPvuRmdtKAf6U8Kv1aW0N6VRSxN48q3bPDs3eHRn6NcDGWZkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="000000000000cc31210607ea05cd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 14:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189337

--000000000000cc31210607ea05cd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a,
17/10/2023 =C3=A0(s) 14:31:

> 'bitbake -S printdiff' is a useful diagnostic facility for finding out
> why sstate is not being reused, but until now it had no tests that would
> ensure it works. This commit adds three basic scenarios:
>
> 1. make a change in a really basic, common recipe that is at the very roo=
t
> of dependency trees (quilt-native), and ensure that change is correctly
> discovered when
> building an image.
>
> 2. make a change in gcc-source recipe, which is somewhat special
> (operates in work-shared), and ensure that gcc-runtime builds track
> that down as well.
>
> 3. make a change in base_do_configure() definition from base.bbclass,
> which is not recipe-specific, but affects many basic recipes, and ensure
> that
> is correctly reported as well.
>
> The test itself actually runs twice:
> - first against a fully populated build directory, where
> the printdiff code is guaranteed to find the correct previous
> stamp that can be compared with in a predictable manner.
>
> - then in an empty build directory where the printdiff code
> goes to look in the sstate cache, and so the existence of the
> previous signature can be tested, but not the difference with it
> (what the exact difference would be is unpredictable as the
> sstate cache is indeed shared between many builds).
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../base-do-configure-modified.bbclass        |   3 +
>  .../gcc-source/gcc-source_%.bbappend          |   2 +
>  .../quilt-native/quilt-native_%.bbappend      |   2 +
>  meta/lib/oeqa/selftest/cases/sstatetests.py   | 104 ++++++++++++++++++
>  4 files changed, 111 insertions(+)
>  create mode 100644
> meta-selftest/classes/base-do-configure-modified.bbclass
>  create mode 100644
> meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
>  create mode 100644
> meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
>
> diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass
> b/meta-selftest/classes/base-do-configure-modified.bbclass
> new file mode 100644
> index 00000000000..3f96827a428
> --- /dev/null
> +++ b/meta-selftest/classes/base-do-configure-modified.bbclass
> @@ -0,0 +1,3 @@
> +base_do_configure:append () {
> +       echo "this changes base_do_configure() definiton"
> +}
> diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> new file mode 100644
> index 00000000000..205720982cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc
> file created by tests.
> +include test_recipe.inc
> diff --git
> a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> new file mode 100644
> index 00000000000..205720982cb
> --- /dev/null
> +++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend
> @@ -0,0 +1,2 @@
> +# This bbappend is used to alter the recipe using the test_recipe.inc
> file created by tests.
> +include test_recipe.inc
> diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py
> b/meta/lib/oeqa/selftest/cases/sstatetests.py
> index bdad9088d37..29e31f2ef9f 100644
> --- a/meta/lib/oeqa/selftest/cases/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
> @@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1
>                  latestfiles =3D sorted(filedates.keys(), key=3Dlambda f:
> filedates[f])[-2:]
>                  bb.siggen.compare_sigfiles(latestfiles[-2],
> latestfiles[-1], recursecb)
>                  self.assertEqual(recursecb_count,1)
> +
> +class SStatePrintdiff(SStateBase):
> +    def run_test_printdiff_changerecipe(self, target, change_recipe,
> change_bbtask, change_content, expected_sametmp_output,
> expected_difftmp_output):
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> +        bitbake(target)
> +        bitbake("-S none {}".format(target))
> +        bitbake(change_bbtask)
> +        self.write_recipeinc(change_recipe, change_content)
> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.delete_recipeinc(change_recipe)
> +        for item in expected_sametmp_output:
> +            self.assertIn(item, result_sametmp.output)
> +        for item in expected_difftmp_output:
> +            self.assertIn(item, result_difftmp.output)
> +
> +    def run_test_printdiff_changeconfig(self, target, change_content,
> expected_sametmp_output, expected_difftmp_output):
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff"
> +""")
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff")
> +        bitbake(target)
> +        bitbake("-S none {}".format(target))
> +        self.append_config(change_content)
> +        result_sametmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        self.write_config("""
> +TMPDIR =3D "${TOPDIR}/tmp-sstateprintdiff-2"
> +""")
> +        self.append_config(change_content)
> +        self.track_for_cleanup(self.topdir + "/tmp-sstateprintdiff-2")
> +        result_difftmp =3D bitbake("-S printdiff {}".format(target))
> +
> +        for item in expected_sametmp_output:
> +            self.assertIn(item, result_sametmp.output)
> +        for item in expected_difftmp_output:
> +            self.assertIn(item, result_difftmp.output)
> +
> +
> +    # Check if printdiff walks the full dependency chain from the image
> target to where the change is in a specific recipe
> +    def test_image_minimal_vs_quilt(self):
> +        expected_output =3D ("Task quilt-native:do_install couldn't be u=
sed
> from the cache because:",
> +"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable do_inst=
all
> value changed",'+    echo "this changes the task signature"')
> +        expected_difftmp_output =3D expected_output
> +
> +        self.run_test_printdiff_changerecipe("core-image-minimal",
> "quilt-native", "-c do_install quilt-native",
> +"""
> +do_install:append() {
> +    echo "this changes the task signature"
> +}
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> +
> +    # Check if changes to gcc-source (which uses tmp/work-shared) are
> correctly discovered
> +    def test_gcc_runtime_vs_gcc_source(self):
> +        expected_output =3D ("Task gcc-source-13.2.0:do_preconfigure
> couldn't be used from the cache because:",
>

We should avoid using the PV=3D13.2.0 explicitly imo otherwise it will need
to be updated with the recipe forever.

The archiver selftest have a gcc-source-PV example
https://git.openembedded.org/openembedded-core/tree/meta/lib/oeqa/selftest/=
cases/archiver.py#n141

+"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable
> do_preconfigure value changed",'+    print("this changes the task
> signature")')
> +        #FIXME: printdiff is supposed to find at least one preconfigure
> task signature in the sstate cache, but isn't able to
> +        #expected_difftmp_output =3D expected_output
> +        expected_difftmp_output =3D ()
> +
> +        self.run_test_printdiff_changerecipe("gcc-runtime", "gcc-source"=
,
> "-c do_preconfigure gcc-source-13.2.0",
>

Same here

Jose


> +"""
> +python do_preconfigure:append() {
> +    print("this changes the task signature")
> +}
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> +
> +    # Check if changing a really base task definiton is reported against
> multiple core recipes using it
> +    def test_image_minimal_vs_base_do_configure(self):
> +        expected_output =3D ("Task zstd-native:do_configure couldn't be
> used from the cache because:",
> +"Task texinfo-dummy-native:do_configure couldn't be used from the cache
> because:",
> +"Task ldconfig-native:do_configure couldn't be used from the cache
> because:",
> +"Task gettext-minimal-native:do_configure couldn't be used from the cach=
e
> because:",
> +"Task tzcode-native:do_configure couldn't be used from the cache
> because:",
> +"Task makedevs-native:do_configure couldn't be used from the cache
> because:",
> +"Task pigz-native:do_configure couldn't be used from the cache because:"=
,
> +"Task update-rc.d-native:do_configure couldn't be used from the cache
> because:",
> +"Task unzip-native:do_configure couldn't be used from the cache because:=
",
> +"Task gnu-config-native:do_configure couldn't be used from the cache
> because:",
> +"We need hash",
> +"most recent matching task was")
> +        expected_sametmp_output =3D expected_output + ("Variable
> base_do_configure value changed",'+     echo "this changes
> base_do_configure() definiton"')
> +        expected_difftmp_output =3D expected_output
> +
> +        self.run_test_printdiff_changeconfig("core-image-minimal",
> +"""
> +INHERIT +=3D "base-do-configure-modified"
> +""",
> +expected_sametmp_output, expected_difftmp_output)
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189332):
> https://lists.openembedded.org/g/openembedded-core/message/189332
> Mute This Topic: https://lists.openembedded.org/mt/102017475/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cc31210607ea05cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;=
 escreveu no dia ter=C3=A7a, 17/10/2023 =C3=A0(s) 14:31:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">&#39;bitbake -S printdiff&#39; is =
a useful diagnostic facility for finding out<br>
why sstate is not being reused, but until now it had no tests that would<br=
>
ensure it works. This commit adds three basic scenarios:<br>
<br>
1. make a change in a really basic, common recipe that is at the very root<=
br>
of dependency trees (quilt-native), and ensure that change is correctly dis=
covered when<br>
building an image.<br>
<br>
2. make a change in gcc-source recipe, which is somewhat special<br>
(operates in work-shared), and ensure that gcc-runtime builds track<br>
that down as well.<br>
<br>
3. make a change in base_do_configure() definition from base.bbclass,<br>
which is not recipe-specific, but affects many basic recipes, and ensure th=
at<br>
is correctly reported as well.<br>
<br>
The test itself actually runs twice:<br>
- first against a fully populated build directory, where<br>
the printdiff code is guaranteed to find the correct previous<br>
stamp that can be compared with in a predictable manner.<br>
<br>
- then in an empty build directory where the printdiff code<br>
goes to look in the sstate cache, and so the existence of the<br>
previous signature can be tested, but not the difference with it<br>
(what the exact difference would be is unpredictable as the<br>
sstate cache is indeed shared between many builds).<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" =
target=3D"_blank">alex@linutronix.de</a>&gt;<br>
---<br>
=C2=A0.../base-do-configure-modified.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A03 +<br>
=C2=A0.../gcc-source/gcc-source_%.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../quilt-native/quilt-native_%.bbappend=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A0meta/lib/oeqa/selftest/cases/sstatetests.py=C2=A0 =C2=A0| 104 +++++++=
+++++++++++<br>
=C2=A04 files changed, 111 insertions(+)<br>
=C2=A0create mode 100644 meta-selftest/classes/base-do-configure-modified.b=
bclass<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/gcc-source/gcc-source_%=
.bbappend<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/quilt-native/quilt-nati=
ve_%.bbappend<br>
<br>
diff --git a/meta-selftest/classes/base-do-configure-modified.bbclass b/met=
a-selftest/classes/base-do-configure-modified.bbclass<br>
new file mode 100644<br>
index 00000000000..3f96827a428<br>
--- /dev/null<br>
+++ b/meta-selftest/classes/base-do-configure-modified.bbclass<br>
@@ -0,0 +1,3 @@<br>
+base_do_configure:append () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;this changes base_do_configure() def=
initon&quot;<br>
+}<br>
diff --git a/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend b/=
meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend<br>
new file mode 100644<br>
index 00000000000..205720982cb<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/gcc-source/gcc-source_%.bbappend<br>
@@ -0,0 +1,2 @@<br>
+# This bbappend is used to alter the recipe using the test_recipe.inc file=
 created by tests.<br>
+include test_recipe.inc<br>
diff --git a/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappen=
d b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend<br>
new file mode 100644<br>
index 00000000000..205720982cb<br>
--- /dev/null<br>
+++ b/meta-selftest/recipes-test/quilt-native/quilt-native_%.bbappend<br>
@@ -0,0 +1,2 @@<br>
+# This bbappend is used to alter the recipe using the test_recipe.inc file=
 created by tests.<br>
+include test_recipe.inc<br>
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/se=
lftest/cases/sstatetests.py<br>
index bdad9088d37..29e31f2ef9f 100644<br>
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py<br>
@@ -773,3 +773,107 @@ addtask tmptask2 before do_tmptask1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0latestfiles =
=3D sorted(filedates.keys(), key=3Dlambda f: filedates[f])[-2:]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.siggen.com=
pare_sigfiles(latestfiles[-2], latestfiles[-1], recursecb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEq=
ual(recursecb_count,1)<br>
+<br>
+class SStatePrintdiff(SStateBase):<br>
+=C2=A0 =C2=A0 def run_test_printdiff_changerecipe(self, target, change_rec=
ipe, change_bbtask, change_content, expected_sametmp_output, expected_difft=
mp_output):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topdir + &quot;/tm=
p-sstateprintdiff&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-S none {}&quot;.format(target))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(change_bbtask)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(change_recipe, change_con=
tent)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_sametmp =3D bitbake(&quot;-S printdiff =
{}&quot;.format(target))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topdir + &quot;/tm=
p-sstateprintdiff-2&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_difftmp =3D bitbake(&quot;-S printdiff =
{}&quot;.format(target))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.delete_recipeinc(change_recipe)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_sametmp_output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item, result_samet=
mp.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_difftmp_output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item, result_difft=
mp.output)<br>
+<br>
+=C2=A0 =C2=A0 def run_test_printdiff_changeconfig(self, target, change_con=
tent, expected_sametmp_output, expected_difftmp_output):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topdir + &quot;/tm=
p-sstateprintdiff&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(target)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&quot;-S none {}&quot;.format(target))=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(change_content)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_sametmp =3D bitbake(&quot;-S printdiff =
{}&quot;.format(target))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&quot;&quot;&quot;<br>
+TMPDIR =3D &quot;${TOPDIR}/tmp-sstateprintdiff-2&quot;<br>
+&quot;&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.append_config(change_content)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.track_for_cleanup(self.topdir + &quot;/tm=
p-sstateprintdiff-2&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 result_difftmp =3D bitbake(&quot;-S printdiff =
{}&quot;.format(target))<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_sametmp_output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item, result_samet=
mp.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for item in expected_difftmp_output:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(item, result_difft=
mp.output)<br>
+<br>
+<br>
+=C2=A0 =C2=A0 # Check if printdiff walks the full dependency chain from th=
e image target to where the change is in a specific recipe<br>
+=C2=A0 =C2=A0 def test_image_minimal_vs_quilt(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task quilt-native:d=
o_install couldn&#39;t be used from the cache because:&quot;,<br>
+&quot;We need hash&quot;,<br>
+&quot;most recent matching task was&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expected_output + =
(&quot;Variable do_install value changed&quot;,&#39;+=C2=A0 =C2=A0 echo &qu=
ot;this changes the task signature&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D expected_output<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changerecipe(&quot;cor=
e-image-minimal&quot;, &quot;quilt-native&quot;, &quot;-c do_install quilt-=
native&quot;,<br>
+&quot;&quot;&quot;<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 echo &quot;this changes the task signature&quot;<br>
+}<br>
+&quot;&quot;&quot;,<br>
+expected_sametmp_output, expected_difftmp_output)<br>
+<br>
+=C2=A0 =C2=A0 # Check if changes to gcc-source (which uses tmp/work-shared=
) are correctly discovered<br>
+=C2=A0 =C2=A0 def test_gcc_runtime_vs_gcc_source(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task gcc-source-13.=
2.0:do_preconfigure couldn&#39;t be used from the cache because:&quot;,<br>=
</blockquote><div><br></div><div>We should avoid using the PV=3D13.2.0 expl=
icitly imo otherwise it will need to be updated with the recipe forever.</d=
iv><div><br></div><div>The archiver selftest have a gcc-source-PV example=
=C2=A0<br></div><div><a href=3D"https://git.openembedded.org/openembedded-c=
ore/tree/meta/lib/oeqa/selftest/cases/archiver.py#n141">https://git.openemb=
edded.org/openembedded-core/tree/meta/lib/oeqa/selftest/cases/archiver.py#n=
141</a><br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+&quot;We need hash&quot;,<br>
+&quot;most recent matching task was&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expected_output + =
(&quot;Variable do_preconfigure value changed&quot;,&#39;+=C2=A0 =C2=A0 pri=
nt(&quot;this changes the task signature&quot;)&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #FIXME: printdiff is supposed to find at least=
 one preconfigure task signature in the sstate cache, but isn&#39;t able to=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #expected_difftmp_output =3D expected_output<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D ()<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changerecipe(&quot;gcc=
-runtime&quot;, &quot;gcc-source&quot;, &quot;-c do_preconfigure gcc-source=
-13.2.0&quot;,<br></blockquote><div><br></div><div>Same here<br><br>Jose</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+&quot;&quot;&quot;<br>
+python do_preconfigure:append() {<br>
+=C2=A0 =C2=A0 print(&quot;this changes the task signature&quot;)<br>
+}<br>
+&quot;&quot;&quot;,<br>
+expected_sametmp_output, expected_difftmp_output)<br>
+<br>
+=C2=A0 =C2=A0 # Check if changing a really base task definiton is reported=
 against multiple core recipes using it<br>
+=C2=A0 =C2=A0 def test_image_minimal_vs_base_do_configure(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_output =3D (&quot;Task zstd-native:do=
_configure couldn&#39;t be used from the cache because:&quot;,<br>
+&quot;Task texinfo-dummy-native:do_configure couldn&#39;t be used from the=
 cache because:&quot;,<br>
+&quot;Task ldconfig-native:do_configure couldn&#39;t be used from the cach=
e because:&quot;,<br>
+&quot;Task gettext-minimal-native:do_configure couldn&#39;t be used from t=
he cache because:&quot;,<br>
+&quot;Task tzcode-native:do_configure couldn&#39;t be used from the cache =
because:&quot;,<br>
+&quot;Task makedevs-native:do_configure couldn&#39;t be used from the cach=
e because:&quot;,<br>
+&quot;Task pigz-native:do_configure couldn&#39;t be used from the cache be=
cause:&quot;,<br>
+&quot;Task update-rc.d-native:do_configure couldn&#39;t be used from the c=
ache because:&quot;,<br>
+&quot;Task unzip-native:do_configure couldn&#39;t be used from the cache b=
ecause:&quot;,<br>
+&quot;Task gnu-config-native:do_configure couldn&#39;t be used from the ca=
che because:&quot;,<br>
+&quot;We need hash&quot;,<br>
+&quot;most recent matching task was&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_sametmp_output =3D expected_output + =
(&quot;Variable base_do_configure value changed&quot;,&#39;+=C2=A0 =C2=A0 =
=C2=A0echo &quot;this changes base_do_configure() definiton&quot;&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 expected_difftmp_output =3D expected_output<br=
>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_printdiff_changeconfig(&quot;cor=
e-image-minimal&quot;,<br>
+&quot;&quot;&quot;<br>
+INHERIT +=3D &quot;base-do-configure-modified&quot;<br>
+&quot;&quot;&quot;,<br>
+expected_sametmp_output, expected_difftmp_output)<br>
-- <br>
2.39.2<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#189332): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/189332" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/189332</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/102017475/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/102017475/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000cc31210607ea05cd--

