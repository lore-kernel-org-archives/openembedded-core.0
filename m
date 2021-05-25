Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.7581.1621937000964467912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkzeE93j;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id c6so9770046uat.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 03:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RB/qB5akvth/4LCGOLlF63xeLNyZm3HKSfN5R00Uhww=;
        b=dkzeE93jWLStMiKphJw5PWIx2ajL/NjlGFBeIx3ctN6ePee+QMiBVVJiMdNQan/gr8
         YkDeJ9v4M7dtF0cu1WKqk2iD6fnQxPX2wpiP2sQwueAKl2cZF0IANWAp+BrehoOVGhTs
         ugEE5rKtBDvJ0Vehh0aI4unSobGWT/yrHo36aUXpQ6mc6fdE4BrMCtwd0V9LZjDIkJaG
         KMP1SRvuupNiW40g1v0ZnGfjC2+3tfm7qCV8AdoqqEsTSitMTg8/1R9XmcmkXBOfTPe4
         46LFMGtWVP5sewE9g8C2mQz5j+YSItprfrvHA4x0HqbWMJncnyrmwkAjui0n4JoOwLVh
         Fqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RB/qB5akvth/4LCGOLlF63xeLNyZm3HKSfN5R00Uhww=;
        b=QSPVpEZ7Bzc9Dx/fTNfuu8GJHbrxtJG5CLfaGlklaUmRv7PjXrvwNTbJeuruC+pznN
         3hsLMA4WjyQoos/uFwGhQaRxyhI5sJkYdn8zPWZhbP3j68NzX5OAeqhdxolzNfpHprp4
         sb+CS+PKIW2ZBeczpWc95hSsor2P/kEK+xvxOKRL0ORjJyDG+r9+ya06DAl37lthS1QE
         zLO/Qe+Udc6qSKPR0mIOGSpg5PvhYKOOGRUCuOAHkqopNwbIFcK/16j+7yjfb1S0J3f/
         47GgSdZF5NY8iU5maadLrVnPH8qGpEtLeil/IbVwqdO5hb0T61yqCqyjd9+U/B8n/hQW
         mMaQ==
X-Gm-Message-State: AOAM531QU1KKWSlSrEmXzavg+6oQJBdoKeOFFP1QZrxPp9+5t4cripUM
	+u3PBxJbWmJcpRVd+Og1of7QpM9U2oUzictk80U=
X-Google-Smtp-Source: ABdhPJxBTcsXR8J6EXFcEoTB6CLDOFEXWA1QC/CxsUywvsyALGEy6QoxWexAm8Ig3cEl3HuQ9eC4GoK6D0mHYp/8JWM=
X-Received: by 2002:ab0:35ed:: with SMTP id w13mr25910106uau.22.1621937000081;
 Tue, 25 May 2021 03:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210525090910.11581-1-andrej.valek@siemens.com>
In-Reply-To: <20210525090910.11581-1-andrej.valek@siemens.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 25 May 2021 12:03:08 +0200
Message-ID: <CANNYZj89ScMfTenprh774C86cFNeN9bNfHtJHtPTo38Pzq7wPg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] expat: upgrade 2.2.10 -> 2.4.1
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bceb6005c324a21e"

--000000000000bceb6005c324a21e
Content-Type: text/plain; charset="UTF-8"

I think you need to rebase this on master first, as it already has 2.3.0.

And removing patches needs to be explained.

Alex

On Tue, 25 May 2021 at 11:10, Andrej Valek <andrej.valek@siemens.com> wrote:

> Includes lot of security fixes, especially CVE-2013-0340/CWE-776.
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../expat/0001-Add-output-of-tests-result.patch    | 83
> ----------------------
>  .../expat/{expat_2.2.10.bb => expat_2.4.1.bb}      |  3 +-
>  2 files changed, 1 insertion(+), 85 deletions(-)
>  delete mode 100644
> meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
>  rename meta/recipes-core/expat/{expat_2.2.10.bb => expat_2.4.1.bb} (84%)
>
> diff --git
> a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
> b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
> deleted file mode 100644
> index c5c18ead74..0000000000
> --- a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001
> -From: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> -Date: Tue, 18 Feb 2020 19:04:55 +0200
> -Subject: [PATCH] Add output of tests result
> -
> -Added console output of testing results in form 'RESULT: TEST_NAME'.
> -
> -Changed verbose mode of test application set by '-v' ('--verbose')
> -argument to CK_NORMAL.
> -Added new supported argument '-vv' ('--extra-verbose') that changes
> -verbose mode of test application to CK_VERBOSE. Results of each test
> -are shown in output only if this mode is set.
> -
> -Upstream-Status: Denied
> -
> -This patch changes potentially deprecated feature that shoud be changed
> -in upstream. [https://github.com/libexpat/libexpat/issues/382]
> -
> -Signed-off-by: Oleksandr Popovych <oleksandr.s.popovych@globallogic.com>
> ----
> - tests/minicheck.c | 10 +++++++++-
> - tests/runtests.c  |  4 +++-
> - 2 files changed, 12 insertions(+), 2 deletions(-)
> -
> -diff --git a/expat/tests/minicheck.c b/expat/tests/minicheck.c
> -index a5a1efb..94fa412 100644
> ---- a/tests/minicheck.c
> -+++ b/tests/minicheck.c
> -@@ -164,6 +164,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
> -       if (tc->setup != NULL) {
> -         /* setup */
> -         if (setjmp(env)) {
> -+          if (verbosity >= CK_VERBOSE)
> -+            printf("SKIP: %s\n", _check_current_function);
> -           add_failure(runner, verbosity);
> -           continue;
> -         }
> -@@ -171,6 +173,8 @@ srunner_run_all(SRunner *runner, int verbosity) {
> -       }
> -       /* test */
> -       if (setjmp(env)) {
> -+        if (verbosity >= CK_VERBOSE)
> -+          printf("FAIL: %s\n", _check_current_function);
> -         add_failure(runner, verbosity);
> -         continue;
> -       }
> -@@ -178,12 +182,16 @@ srunner_run_all(SRunner *runner, int verbosity) {
> -
> -       /* teardown */
> -       if (tc->teardown != NULL) {
> --        if (setjmp(env)) {
> -+        if (setjmp(env)) {
> -+          if (verbosity >= CK_VERBOSE)
> -+           printf("PASS: %s\n", _check_current_function);
> -           add_failure(runner, verbosity);
> -           continue;
> -         }
> -         tc->teardown();
> -       }
> -+      if (verbosity >= CK_VERBOSE)
> -+        printf("PASS: %s\n", _check_current_function);
> -     }
> -     tc = tc->next_tcase;
> -   }
> -diff --git a/tests/runtests.c b/expat/tests/runtests.c
> -index 7791fe0..75724e5 100644
> ---- a/tests/runtests.c
> -+++ b/tests/runtests.c
> -@@ -11619,9 +11619,11 @@ main(int argc, char *argv[]) {
> -   for (i = 1; i < argc; ++i) {
> -     char *opt = argv[i];
> -     if (strcmp(opt, "-v") == 0 || strcmp(opt, "--verbose") == 0)
> --      verbosity = CK_VERBOSE;
> -+      verbosity = CK_NORMAL;
> -     else if (strcmp(opt, "-q") == 0 || strcmp(opt, "--quiet") == 0)
> -       verbosity = CK_SILENT;
> -+    else if (strcmp(opt, "-vv") == 0 || strcmp(opt, "--extra-verbose")
> == 0)
> -+      verbosity = CK_VERBOSE;
> -     else {
> -       fprintf(stderr, "runtests: unknown option '%s'\n", opt);
> -       return 2;
> ---
> -2.17.1
> diff --git a/meta/recipes-core/expat/expat_2.2.10.bb
> b/meta/recipes-core/expat/expat_2.4.1.bb
> similarity index 84%
> rename from meta/recipes-core/expat/expat_2.2.10.bb
> rename to meta/recipes-core/expat/expat_2.4.1.bb
> index fa263775b3..476c5f8cc7 100644
> --- a/meta/recipes-core/expat/expat_2.2.10.bb
> +++ b/meta/recipes-core/expat/expat_2.4.1.bb
> @@ -9,10 +9,9 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
>             file://libtool-tag.patch \
>            file://run-ptest \
> -          file://0001-Add-output-of-tests-result.patch \
>           "
>
> -SRC_URI[sha256sum] =
> "b2c160f1b60e92da69de8e12333096aeb0c3bf692d41c60794de278af72135a5"
> +SRC_URI[sha256sum] =
> "2f9b6a580b94577b150a7d5617ad4643a4301a6616ff459307df3e225bcfbf40"
>
>  EXTRA_OECMAKE_class-native += "-DEXPAT_BUILD_DOCS=OFF"
>
> --
> 2.11.0
>
>
> 
>
>

--000000000000bceb6005c324a21e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think you need to rebase this on master first, as i=
t already has 2.3.0.</div><div><br></div><div>And removing patches needs to=
 be explained.<br></div><div><br></div><div>Alex<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 25 May 20=
21 at 11:10, Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com">a=
ndrej.valek@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Includes lot of security fixes, especially CVE-2013-=
0340/CWE-776.<br>
<br>
Signed-off-by: Andrej Valek &lt;<a href=3D"mailto:andrej.valek@siemens.com=
" target=3D"_blank">andrej.valek@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../expat/0001-Add-output-of-tests-result.patch=C2=A0 =C2=A0 | 83 --=
--------------------<br>
=C2=A0.../expat/{<a href=3D"http://expat_2.2.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">expat_2.2.10.bb</a> =3D&gt; <a href=3D"http://expat_2.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">expat_2.4.1.bb</a>}=C2=A0 =C2=A0 =C2=
=
=A0 |=C2=A0 3 +-<br>
=C2=A02 files changed, 1 insertion(+), 85 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-core/expat/expat/0001-Add-output-of-=
tests-result.patch<br>
=C2=A0rename meta/recipes-core/expat/{<a href=3D"http://expat_2.2.10.bb" r=
el=3D"noreferrer" target=3D"_blank">expat_2.2.10.bb</a> =3D&gt; <a href=3D"=
http://expat_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank">expat_2.4.1.bb<=
/a>} (84%)<br>
<br>
diff --git a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result=
.patch b/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patc=
h<br>
deleted file mode 100644<br>
index c5c18ead74..0000000000<br>
--- a/meta/recipes-core/expat/expat/0001-Add-output-of-tests-result.patch<=
br>
+++ /dev/null<br>
@@ -1,83 +0,0 @@<br>
-From aa84835a00bfd65e784d58411e76f60658e939dc Mon Sep 17 00:00:00 2001<br=
>
-From: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popovych@globa=
llogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com</a>&gt;<=
br>
-Date: Tue, 18 Feb 2020 19:04:55 +0200<br>
-Subject: [PATCH] Add output of tests result<br>
-<br>
-Added console output of testing results in form &#39;RESULT: TEST_NAME&#3=
9;.<br>
-<br>
-Changed verbose mode of test application set by &#39;-v&#39; (&#39;--verb=
ose&#39;)<br>
-argument to CK_NORMAL.<br>
-Added new supported argument &#39;-vv&#39; (&#39;--extra-verbose&#39;) th=
at changes<br>
-verbose mode of test application to CK_VERBOSE. Results of each test<br>
-are shown in output only if this mode is set.<br>
-<br>
-Upstream-Status: Denied<br>
-<br>
-This patch changes potentially deprecated feature that shoud be changed<b=
r>
-in upstream. [<a href=3D"https://github.com/libexpat/libexpat/issues/382"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/libexpat/libexpat/=
issues/382</a>]<br>
-<br>
-Signed-off-by: Oleksandr Popovych &lt;<a href=3D"mailto:oleksandr.s.popov=
ych@globallogic.com" target=3D"_blank">oleksandr.s.popovych@globallogic.com=
</a>&gt;<br>
----<br>
- tests/minicheck.c | 10 +++++++++-<br>
- tests/runtests.c=C2=A0 |=C2=A0 4 +++-<br>
- 2 files changed, 12 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/expat/tests/minicheck.c b/expat/tests/minicheck.c<br>
-index a5a1efb..94fa412 100644<br>
---- a/tests/minicheck.c<br>
-+++ b/tests/minicheck.c<br>
-@@ -164,6 +164,8 @@ srunner_run_all(SRunner *runner, int verbosity) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;setup !=3D NULL) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* setup */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(env)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (verbosity &gt;=3D CK_VERBOSE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;SKIP: %s\n&quot;,=
 _check_current_function);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -171,6 +173,8 @@ srunner_run_all(SRunner *runner, int verbosity) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* test */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (setjmp(env)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (verbosity &gt;=3D CK_VERBOSE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;FAIL: %s\n&quot;, _check=
_current_function);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -178,12 +182,16 @@ srunner_run_all(SRunner *runner, int verbosity) {<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* teardown */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tc-&gt;teardown !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setjmp(env)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (setjmp(env)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (verbosity &gt;=3D CK_VERBOSE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printf(&quot;PASS: %s\n&quot;, =
_check_current_function);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0add_failure(runner, verbosity);<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tc-&gt;teardown();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+=C2=A0 =C2=A0 =C2=A0 if (verbosity &gt;=3D CK_VERBOSE)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 printf(&quot;PASS: %s\n&quot;, _check_curren=
t_function);<br>
-=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0tc =3D tc-&gt;next_tcase;<br>
-=C2=A0 =C2=A0}<br>
-diff --git a/tests/runtests.c b/expat/tests/runtests.c<br>
-index 7791fe0..75724e5 100644<br>
---- a/tests/runtests.c<br>
-+++ b/tests/runtests.c<br>
-@@ -11619,9 +11619,11 @@ main(int argc, char *argv[]) {<br>
-=C2=A0 =C2=A0for (i =3D 1; i &lt; argc; ++i) {<br>
-=C2=A0 =C2=A0 =C2=A0char *opt =3D argv[i];<br>
-=C2=A0 =C2=A0 =C2=A0if (strcmp(opt, &quot;-v&quot;) =3D=3D 0 || strcmp(op=
t, &quot;--verbose&quot;) =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 verbosity =3D CK_VERBOSE;<br>
-+=C2=A0 =C2=A0 =C2=A0 verbosity =3D CK_NORMAL;<br>
-=C2=A0 =C2=A0 =C2=A0else if (strcmp(opt, &quot;-q&quot;) =3D=3D 0 || strc=
mp(opt, &quot;--quiet&quot;) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0verbosity =3D CK_SILENT;<br>
-+=C2=A0 =C2=A0 else if (strcmp(opt, &quot;-vv&quot;) =3D=3D 0 || strcmp(o=
pt, &quot;--extra-verbose&quot;) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 verbosity =3D CK_VERBOSE;<br>
-=C2=A0 =C2=A0 =C2=A0else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;runtests: unknown option=
 &#39;%s&#39;\n&quot;, opt);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 2;<br>
---<br>
-2.17.1<br>
diff --git a/meta/recipes-core/expat/<a href=3D"http://expat_2.2.10.bb" re=
l=3D"noreferrer" target=3D"_blank">expat_2.2.10.bb</a> b/meta/recipes-core/=
expat/<a href=3D"http://expat_2.4.1.bb" rel=3D"noreferrer" target=3D"_blank=
">expat_2.4.1.bb</a><br>
similarity index 84%<br>
rename from meta/recipes-core/expat/<a href=3D"http://expat_2.2.10.bb" rel=
=
=3D"noreferrer" target=3D"_blank">expat_2.2.10.bb</a><br>
rename to meta/recipes-core/expat/<a href=3D"http://expat_2.4.1.bb" rel=3D=
"noreferrer" target=3D"_blank">expat_2.4.1.bb</a><br>
index fa263775b3..476c5f8cc7 100644<br>
--- a/meta/recipes-core/expat/<a href=3D"http://expat_2.2.10.bb" rel=3D"no=
referrer" target=3D"_blank">expat_2.2.10.bb</a><br>
+++ b/meta/recipes-core/expat/<a href=3D"http://expat_2.4.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">expat_2.4.1.bb</a><br>
@@ -9,10 +9,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D9e2ce3b3c=
4c0f2670883a23bbd7c37a9&quot;<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libtool-tag.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Add-output-of-tests-result=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;b2c160f1b60e92da69de8e12333096aeb0c3bf692d41=
c60794de278af72135a5&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2f9b6a580b94577b150a7d5617ad4643a4301a6616ff=
459307df3e225bcfbf40&quot;<br>
<br>
=C2=A0EXTRA_OECMAKE_class-native +=3D &quot;-DEXPAT_BUILD_DOCS=3DOFF&quot;=
<br>
<br>
-- <br>
2.11.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000bceb6005c324a21e--
