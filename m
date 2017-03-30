Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4874577D42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 16:51:17 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id r45so44427374qte.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I8wmFLi3DvQsdb/eEwU1TfoHHQT96SFvGQRAc8zhCdg=;
	b=Q4nL1fr2TvTOhKMZOXY/3h36mGLZNOoYQ9GcTb/XLJ13jsJSOLF11ebO8i63m3T8sq
	Q6OhR9KUWJU7l6o2fj2pkZ2Efc97bP3KccomU5si4j2+gf/BqGOIQ1RPy4AB3Qjdnnbx
	948+fsc/XDdM12VXG0YfkNP9Lo8/KQNVMPj0v6tKopy8LEyY9wOzeHLpSmiIaTI0ko9h
	noRV44LhZTls8+puatp8/661KegW0+FZ62KeNby+iWygvY7NSGWYO6M2lmtJ5WvefTB4
	lvtwqtQcgim5eU0WUnzeo7ZuLClIJ+owhBqtEOWs21uctdMTPN+GzLkFJAqtVdYyHoxS
	webg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I8wmFLi3DvQsdb/eEwU1TfoHHQT96SFvGQRAc8zhCdg=;
	b=VIC40nCQx14YdpQYu1+Dgg8tSqXGQBBtXlwCLiI9O4jRESiqXcyyLgBVWzmbrCSEpA
	COZYw8WgKktReaa56xK3cZdGAxb/hR4Ds5Js356w9egsv/oCWhBOgm/6m1Uq/ad/IVtz
	QknLdoNhqSj57D9wlIBDrwBIJeVdxJZdrrQBrH4HeaUIsfn6NHwPzWAG/79I3gOXjl1a
	PMgabPYY+ZH7EmxBY3bvFRpT5xLSOmdxAVvGyHlfjUPMyio6N8aCFmVKU2J8g3SVkpgS
	ABq9ixAwzX7SbjWbXyv3Ymiak0XWhE0v0iOaOc5bRZN5P96GbpbPrvUraZypTaK+it90
	fbOg==
X-Gm-Message-State: AFeK/H1RZJ07vgvO7D0JBcuz/+g4a7bi4TvY5IYsgrbmHUAn/cm7VEPF7mwIun2wzPOK51pn8idttfGo/ECcWQNS
X-Received: by 10.237.53.9 with SMTP id a9mr714621qte.188.1490892679024; Thu,
	30 Mar 2017 09:51:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Thu, 30 Mar 2017 09:50:58 -0700 (PDT)
In-Reply-To: <1490829122-31454-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
References: <1490829122-31454-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Mar 2017 17:50:58 +0100
Message-ID: <CAJTo0Lb_53+8xCJcVWRrX+JNf3-QwXTLPWzi1pq19MTZkqP1qg@mail.gmail.com>
To: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5] oeqa/sdk/cases:Adds validation for SDK compatibility tests
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
X-List-Received-Date: Thu, 30 Mar 2017 16:51:18 -0000
Content-Type: multipart/alternative; boundary=001a11c0285e884358054bf580e0

--001a11c0285e884358054bf580e0
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 00:12, Francisco Pedraza <
francisco.j.pedraza.gonzalez@intel.com> wrote:

> @@ -9,7 +9,9 @@ class GalculatorTest(OESDKTestCase):
>      @classmethod
>      def setUpClass(self):
>          if not (self.tc.hasTargetPackage("gtk+3") or\
> -                self.tc.hasTargetPackage("libgtk-3.0")):
> +                self.tc.hasTargetPackage("libgtk-3.0") or
> +                self.tc.hasTargetPackage("gtk") or
> +                self.tc.hasTargetPackage("matchbox-config-gtk")):
>              raise unittest.SkipTest("GalculatorTest class: SDK don't
> support gtk+3")
>

Why is this checking for what appears to be gtk+v2 ("gtk") or
matchbox-config-gtk (an application that shouldn't be in a SDK)?


> @@ -17,7 +17,9 @@ class BuildIptablesTest(OESDKTestCase):
>
>          machine = self.td.get("MACHINE")
>
> -        if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" %
> machine):
> +        if not (self.tc.hasTargetPackage("packagegroup-cross-canadian-%s"
> % machine) or
> +                self.tc.hasTargetPackage("gcc-runtime") or
> +                self.tc.hasTargetPackage("libgcc")):
>              raise unittest.SkipTest("SDK doesn't contain a cross-canadian
> toolchain")
>

Seems a very long-winded way of checking that a compiler is present...

@@ -8,7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase
>  class PerlTest(OESDKTestCase):
>      @classmethod
>      def setUpClass(self):
> -        if not self.tc.hasHostPackage("nativesdk-perl"):
> +        if not (self.tc.hasHostPackage("nativesdk-perl") or
> +                self.tc.hasHostPackage("perl-native") or
> +                self.tc.hasHostPackage("libperl5") or
> +                self.tc.hasHostPackage("perl")):
>              raise unittest.SkipTest("No perl package in the SDK")
>

As this is a test for the nativesdk part of the SDK, why does it care about
target (perl) or native (perl-native) packages?

         for f in ['test.pl']:
> diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/
> python.py
> index 94a296f..29705bf 100644
> --- a/meta/lib/oeqa/sdk/cases/python.py
> +++ b/meta/lib/oeqa/sdk/cases/python.py
> @@ -8,7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase
>  class PythonTest(OESDKTestCase):
>      @classmethod
>      def setUpClass(self):
> -        if not self.tc.hasHostPackage("nativesdk-python"):
> +        if not (self.tc.hasHostPackage("nativesdk-python") or
> +                self.tc.hasHostPackage("python-smartpm-native") or
> +                self.tc.hasHostPackage("nativesdk-python3")):



Aside from the fact that oe-core master has recently moved from smart to
DNF, and Python2 to Python3, why does a test that just runs a basic Python
command care about smartpm?

Also the test also now checks for nativesdk-python3 but executes python,
which is python v2.

Ross

--001a11c0285e884358054bf580e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 March 2017 at 00:12, Francisco Pedraza <span dir=3D"=
ltr">&lt;<a href=3D"mailto:francisco.j.pedraza.gonzalez@intel.com" target=
=3D"_blank">francisco.j.pedraza.gonzalez@intel.com</a>&gt;</span> wrote:<br=
><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">@@ -9,7 +9,9 @@ class GalculatorTest(OESDKTestCase):<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def setUpClass(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not (self.tc.hasTargetPackage(&quot;<w=
br>gtk+3&quot;) or\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;<wbr>libgtk-3.0&quot;)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;<wbr>libgtk-3.0&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;gtk&quot;<wbr>) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;<wbr>matchbox-config-gtk&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise unittest.SkipTest(&qu=
ot;<wbr>GalculatorTest class: SDK don&#39;t support gtk+3&quot;)<br></block=
quote><div><br></div><div>Why is this checking for what appears to be gtk+v=
2 (&quot;gtk&quot;) or matchbox-config-gtk (an application that shouldn&#39=
;t be in a SDK)?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">@=
@ -17,7 +17,9 @@ class BuildIptablesTest(<wbr>OESDKTestCase):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine =3D self.td.get(&quot;MACHINE&quo=
t;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.tc.hasHostPackage(&quot;<wbr>packa=
gegroup-cross-canadian-%<wbr>s&quot; % machine):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (self.tc.hasTargetPackage(&quot;<wbr>pa=
ckagegroup-cross-canadian-%<wbr>s&quot; % machine) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;gcc-<wbr>runtime&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasTargetP=
ackage(&quot;<wbr>libgcc&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise unittest.SkipTest(&qu=
ot;SDK doesn&#39;t contain a cross-canadian toolchain&quot;)<br></blockquot=
e><div><br></div><div>Seems a very long-winded way of checking that a compi=
ler is present...</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">@@ -8,=
7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase<br>
=C2=A0class PerlTest(OESDKTestCase):<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def setUpClass(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.tc.hasHostPackage(&quot;<wbr>nativ=
esdk-perl&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (self.tc.hasHostPackage(&quot;<wbr>nati=
vesdk-perl&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasHostPac=
kage(&quot;perl-<wbr>native&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasHostPac=
kage(&quot;<wbr>libperl5&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasHostPac=
kage(&quot;perl&quot;)<wbr>):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise unittest.SkipTest(&qu=
ot;No perl package in the SDK&quot;)<br></blockquote><div><br></div><div>As=
 this is a test for the nativesdk part of the SDK, why does it care about t=
arget (perl) or native (perl-native) packages?</div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in [&#39;<a href=3D"http://test.pl"=
 rel=3D"noreferrer" target=3D"_blank">test.pl</a>&#39;]:<br>
diff --git a/meta/lib/oeqa/sdk/cases/<wbr>python.py b/meta/lib/oeqa/sdk/cas=
es/<wbr>python.py<br>
index 94a296f..29705bf 100644<br>
--- a/meta/lib/oeqa/sdk/cases/<wbr>python.py<br>
+++ b/meta/lib/oeqa/sdk/cases/<wbr>python.py<br>
@@ -8,7 +8,10 @@ from oeqa.sdk.case import OESDKTestCase<br>
=C2=A0class PythonTest(OESDKTestCase):<br>
=C2=A0 =C2=A0 =C2=A0@classmethod<br>
=C2=A0 =C2=A0 =C2=A0def setUpClass(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not self.tc.hasHostPackage(&quot;<wbr>nativ=
esdk-python&quot;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not (self.tc.hasHostPackage(&quot;<wbr>nati=
vesdk-python&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasHostPac=
kage(&quot;<wbr>python-smartpm-native&quot;) or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tc.hasHostPac=
kage(&quot;<wbr>nativesdk-python3&quot;)):</blockquote><div><br></div><div>=
<br></div><div>Aside from the fact that oe-core master has recently moved f=
rom smart to DNF, and Python2 to Python3, why does a test that just runs a =
basic Python command care about smartpm?</div><div><br></div><div>Also the =
test also now checks for nativesdk-python3 but executes python, which is py=
thon v2.</div><div><br></div><div>Ross</div></div></div></div>

--001a11c0285e884358054bf580e0--
