Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id F0D006FF64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 08:08:17 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id w104so64153931qge.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=3KAvfS6+oO1z0OryKvg9V96XSVAbko5VIS0W4o/ziUo=;
	b=o94BGnyp6e1Mm8GSj9CW+B9bm6oagBqXBx3Ru0C8YQWxh+paSepw3RGGBhAMw9ZCdX
	W7ZubDVWugEDh3so89Ee7YTHIc+D/dRDQsDOtTihTcy7vHrhZHXQ1uDpMERWyT6ad5P6
	5N0ntUNCzdfTMMHnZo7acyfrzUrmL3gHqzbIxC9L08lcLTiy1E5q819nk/IClU9jr92P
	1QPMv9RDEBJGbU74nObJCUY5UJvhJwtj94KdSHI36hPeLoAIiDYyg/o1WcdiVBKlb8gV
	y68GZ0XWZahYHhLP8OrTXk28sYySKYHSnsceJ5jIxzvXYAQ2tlZqKzVBIWLuPzu16ALN
	MTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=3KAvfS6+oO1z0OryKvg9V96XSVAbko5VIS0W4o/ziUo=;
	b=MpQgDjds5s7Zj83uabf/37anopfW8VvHPoiJfXAPTZd7z5aOzO83SbX5TLvAK7+1Mu
	KmCmgpdtCztzt5kcIBYxZJAreN0ScJmd3A9onPVK2KDaL7PFzxUVNvPr4fC9ZQBdh70a
	jIVeSnjtSZ+cytq/f5ebLW9daQrfnm9a48nCAzcwzTwyyoXigx96woqu8I2XMr/xcX8g
	SnZ0z+uyu0gOM7BoWxxHFGztIem8T3tqRHsnpEMzgXCgkHvtKfO06qKa0JjgJKGyC+nK
	jazw5Cg00Ko97uXIK+A1r0ML39JTbN6Bm0xkn4V4nmI59lMSukJUykc2vJ94a5vbm12r
	WFfA==
X-Gm-Message-State: AD7BkJKpV8lRcRXzMH4cWyhWD6gJOjlhi0Urt5DriGBrfn+vvf2eQtIBVyz7xrO/3gAWaMuTSn94t+Tr2KGlXA==
MIME-Version: 1.0
X-Received: by 10.140.172.212 with SMTP id s203mr2426859qhs.41.1457597297938; 
	Thu, 10 Mar 2016 00:08:17 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Thu, 10 Mar 2016 00:08:17 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Thu, 10 Mar 2016 00:08:17 -0800 (PST)
In-Reply-To: <14047fe718ae0dcf3e1671364bcfa76e31aecc77.1457593651.git.hongxu.jia@windriver.com>
References: <cover.1457593651.git.hongxu.jia@windriver.com>
	<14047fe718ae0dcf3e1671364bcfa76e31aecc77.1457593651.git.hongxu.jia@windriver.com>
Date: Thu, 10 Mar 2016 15:08:17 +0700
Message-ID: <CAMKF1sqhFDRPHEFJFPoqqKpNbhKA9Sw9CpxA1+OOLceqEVPHrw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/18] cmake-native:convert source file to relative path
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
X-List-Received-Date: Thu, 10 Mar 2016 08:08:18 -0000
Content-Type: multipart/alternative; boundary=001a113a7eae2b583e052dad5178

--001a113a7eae2b583e052dad5178
Content-Type: text/plain; charset=UTF-8

We should submit these kind of changes upstream first and get an opinion
before forking like this
On Mar 10, 2016 2:25 PM, "Hongxu Jia" <hongxu.jia@windriver.com> wrote:

> While '__FILE__' is used in C/C++ source file, we need to
> compile with relative path to avoid build path issue.
>
> If a recipe(such as waffle) inherit cmake, it invoke native
> cmake to generate Makefile:
> Without the fix:
> vim ./build.make
> |    cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/
> build/src/waffle && /Build/tmp/sysroots/x86_64-linux/usr/bin/
> x86_64-poky-linux/x86_64-poky-linux-gcc  $(C_DEFINES) $(C_INCLUDES)
> $(C_FLAGS) -o glx/glx_context.c.o   -c /Build/tmp/work/core2-64-poky-linux/
> waffle/1.5.2-r0/waffle-1.5.2/src/waffle/glx/glx_context.c
>
> With the fix:
> vim ./build.make
> |    cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/
> build/src/waffle && /Build/tmp/sysroots/x86_64-linux/usr/bin/
> x86_64-poky-linux/x86_64-poky-linux-gcc  $(C_DEFINES) $(C_INCLUDES)
> $(C_FLAGS) -o glx/glx_context.c.o   -c
> ../../../waffle-1.5.2/src/waffle/glx/glx_context.c
>
> [YOCTO #7058]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.4.3.bb  |   1 +
>  .../convert-source-file-to-relative-path.patch     | 128
> +++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644
> meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
> index cb4e749..2939512 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.4.3.bb
> @@ -6,6 +6,7 @@ DEPENDS += "bzip2-native zlib-native"
>
>  SRC_URI += "\
>      file://cmlibarchive-disable-ext2fs.patch \
> +    file://convert-source-file-to-relative-path.patch \
>  "
>
>  # Disable ccmake since we don't depend on ncurses
> diff --git
> a/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
> b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
> new file mode 100644
> index 0000000..77a5155
> --- /dev/null
> +++
> b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-path.patch
> @@ -0,0 +1,128 @@
> +From c272c82eaeed2ae4b72f40af2754e91f1450a705 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Thu, 3 Mar 2016 04:48:46 -0500
> +Subject: [PATCH] convert source file to relative path
> +
> +Although there is CMAKE_USE_RELATIVE_PATHS, but upstream
> +explicitly did not support relative path.
> +In git://cmake.org/cmake.git
> +...
> +commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11
> +Author: Stephen Kelly <steveire@gmail.com>
> +Date:   Mon Jun 1 19:56:46 2015 +0200
> +
> +    Remove CMAKE_USE_RELATIVE_PATHS variable.
> +...
> +The reason is in https://cmake.org/Wiki/CMake_FAQ
> +(Why does CMake use full paths, or can I copy my build tree?)
> +
> +But oe-core need the source file path relative while compiling
> +to avoid build path issue. The fix partly refer the above commit,
> +but in order to minimize the influence, it only tweak gcc compiling
> +rule in generated Makefile (With "Building ** object" message).
> +
> +Upstream-Status: Inappropriate [openembedded specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + Source/cmCommonTargetGenerator.cxx   |  7 +++++++
> + Source/cmCommonTargetGenerator.h     |  5 +++++
> + Source/cmMakefileTargetGenerator.cxx |  5 +++++
> + Source/cmOutputConverter.cxx         | 14 ++++++++++++++
> + Source/cmOutputConverter.h           |  5 +++++
> + 5 files changed, 36 insertions(+)
> +
> +diff --git a/Source/cmCommonTargetGenerator.cxx
> b/Source/cmCommonTargetGenerator.cxx
> +index 252e231..f7d2d6b 100644
> +--- a/Source/cmCommonTargetGenerator.cxx
> ++++ b/Source/cmCommonTargetGenerator.cxx
> +@@ -54,6 +54,13 @@ std::string cmCommonTargetGenerator::Convert(
> +   return this->LocalGenerator->Convert(source, relative, output);
> + }
> +
> ++std::string cmCommonTargetGenerator::Convert(
> ++  std::string const& local,
> ++  std::string const& remote,
> ++  cmLocalGenerator::OutputFormat output)
> ++{
> ++  return this->LocalGenerator->Convert(local, remote, output);
> ++}
> +
> //----------------------------------------------------------------------------
> + const char* cmCommonTargetGenerator::GetFeature(const std::string&
> feature)
> + {
> +diff --git a/Source/cmCommonTargetGenerator.h
> b/Source/cmCommonTargetGenerator.h
> +index a4b2c10..6e6b724 100644
> +--- a/Source/cmCommonTargetGenerator.h
> ++++ b/Source/cmCommonTargetGenerator.h
> +@@ -72,6 +72,11 @@ protected:
> +                       cmLocalGenerator::OutputFormat output =
> +                       cmLocalGenerator::UNCHANGED);
> +
> ++  std::string Convert(std::string const& local,
> ++                      std::string const& remote,
> ++                      cmLocalGenerator::OutputFormat output =
> ++                      cmLocalGenerator::UNCHANGED);
> ++
> +   void AppendFortranFormatFlags(std::string& flags,
> +                                 cmSourceFile const& source);
> +
> +diff --git a/Source/cmMakefileTargetGenerator.cxx
> b/Source/cmMakefileTargetGenerator.cxx
> +index b278087..84a6ed7 100644
> +--- a/Source/cmMakefileTargetGenerator.cxx
> ++++ b/Source/cmMakefileTargetGenerator.cxx
> +@@ -530,6 +530,11 @@ cmMakefileTargetGenerator
> +     this->LocalGenerator->AppendEcho
> +       (commands, buildEcho.c_str(),
> cmLocalUnixMakefileGenerator3::EchoBuild,
> +        &progress);
> ++
> ++    //Convert sourceFile to relative path
> ++    sourceFile =
> this->Convert(this->Makefile->GetCurrentBinaryDirectory(),
> ++                               sourceFile,
> ++                               cmLocalGenerator::SHELL);
> +     }
> +
> +   std::string targetOutPathReal;
> +diff --git a/Source/cmOutputConverter.cxx b/Source/cmOutputConverter.cxx
> +index 5acae2f..3d71739 100644
> +--- a/Source/cmOutputConverter.cxx
> ++++ b/Source/cmOutputConverter.cxx
> +@@ -94,6 +94,20 @@ const char*
> cmOutputConverter::GetRelativeRootPath(RelativeRoot relroot) const
> +   return 0;
> + }
> +
> ++std::string cmOutputConverter::Convert(const std::string& local,
> ++                                       const std::string& remote,
> ++                                       OutputFormat output) const
> ++{
> ++  // Convert the path to a relative path.
> ++  std::string result = remote;
> ++
> ++  std::vector<std::string> components;
> ++  cmSystemTools::SplitPath(local, components);
> ++  result = this->ConvertToRelativePath(components, result, true);
> ++
> ++  return this->ConvertToOutputFormat(result, output);
> ++}
> ++
> + std::string cmOutputConverter::Convert(const std::string& source,
> +                                        RelativeRoot relative,
> +                                        OutputFormat output) const
> +diff --git a/Source/cmOutputConverter.h b/Source/cmOutputConverter.h
> +index 852df5d..d887a99 100644
> +--- a/Source/cmOutputConverter.h
> ++++ b/Source/cmOutputConverter.h
> +@@ -45,6 +45,11 @@ public:
> +   std::string Convert(RelativeRoot remote, const std::string& local,
> +                       OutputFormat output = UNCHANGED,
> +                       bool optional = false) const;
> ++
> ++  std::string Convert(const std::string& local,
> ++                      const std::string& remote,
> ++                      OutputFormat output = UNCHANGED) const;
> ++
> +   std::string ConvertDirectorySeparatorsForShell(
> +                                              const std::string& source)
> const;
> +
> +--
> +1.9.1
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113a7eae2b583e052dad5178
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">We should submit these kind of changes upstream first and ge=
t an opinion before forking like this</p>
<div class=3D"gmail_quote">On Mar 10, 2016 2:25 PM, &quot;Hongxu Jia&quot; =
&lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com</a=
>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">While &=
#39;__FILE__&#39; is used in C/C++ source file, we need to<br>
compile with relative path to avoid build path issue.<br>
<br>
If a recipe(such as waffle) inherit cmake, it invoke native<br>
cmake to generate Makefile:<br>
Without the fix:<br>
vim ./build.make<br>
|=C2=A0 =C2=A0 cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/<br>
build/src/waffle &amp;&amp; /Build/tmp/sysroots/x86_64-linux/usr/bin/<br>
x86_64-poky-linux/x86_64-poky-linux-gcc=C2=A0 $(C_DEFINES) $(C_INCLUDES)<br=
>
$(C_FLAGS) -o glx/glx_context.c.o=C2=A0 =C2=A0-c /Build/tmp/work/core2-64-p=
oky-linux/<br>
waffle/1.5.2-r0/waffle-1.5.2/src/waffle/glx/glx_context.c<br>
<br>
With the fix:<br>
vim ./build.make<br>
|=C2=A0 =C2=A0 cd /Build/tmp/work/core2-64-poky-linux/waffle/1.5.2-r0/<br>
build/src/waffle &amp;&amp; /Build/tmp/sysroots/x86_64-linux/usr/bin/<br>
x86_64-poky-linux/x86_64-poky-linux-gcc=C2=A0 $(C_DEFINES) $(C_INCLUDES)<br=
>
$(C_FLAGS) -o glx/glx_context.c.o=C2=A0 =C2=A0-c ../../../waffle-1.5.2/src/=
waffle/glx/glx_context.c<br>
<br>
[YOCTO #7058]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">h=
ongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake-native_3.4.3.bb</a>=C2=A0 |=C2=
=A0 =C2=A01 +<br>
=C2=A0.../convert-source-file-to-relative-path.patch=C2=A0 =C2=A0 =C2=A0| 1=
28 +++++++++++++++++++++<br>
=C2=A02 files changed, 129 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/cmake/cmake/convert-source-f=
ile-to-relative-path.patch<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.4=
.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.4.3.bb</a> b/met=
a/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.4.3.bb" rel=3D"no=
referrer" target=3D"_blank">cmake-native_3.4.3.bb</a><br>
index cb4e749..2939512 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake-native_3.4.3.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.4.3.bb" =
rel=3D"noreferrer" target=3D"_blank">cmake-native_3.4.3.bb</a><br>
@@ -6,6 +6,7 @@ DEPENDS +=3D &quot;bzip2-native zlib-native&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://cmlibarchive-disable-ext2fs.patch \<br>
+=C2=A0 =C2=A0 file://convert-source-file-to-relative-path.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# Disable ccmake since we don&#39;t depend on ncurses<br>
diff --git a/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relat=
ive-path.patch b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-r=
elative-path.patch<br>
new file mode 100644<br>
index 0000000..77a5155<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/cmake/cmake/convert-source-file-to-relative-pat=
h.patch<br>
@@ -0,0 +1,128 @@<br>
+From c272c82eaeed2ae4b72f40af2754e91f1450a705 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.ji=
a@windriver.com</a>&gt;<br>
+Date: Thu, 3 Mar 2016 04:48:46 -0500<br>
+Subject: [PATCH] convert source file to relative path<br>
+<br>
+Although there is CMAKE_USE_RELATIVE_PATHS, but upstream<br>
+explicitly did not support relative path.<br>
+In git://<a href=3D"http://cmake.org/cmake.git" rel=3D"noreferrer" target=
=3D"_blank">cmake.org/cmake.git</a><br>
+...<br>
+commit 1335992c8f4e8b96f1a21d5dcc7d65a9fbd84c11<br>
+Author: Stephen Kelly &lt;<a href=3D"mailto:steveire@gmail.com">steveire@g=
mail.com</a>&gt;<br>
+Date:=C2=A0 =C2=A0Mon Jun 1 19:56:46 2015 +0200<br>
+<br>
+=C2=A0 =C2=A0 Remove CMAKE_USE_RELATIVE_PATHS variable.<br>
+...<br>
+The reason is in <a href=3D"https://cmake.org/Wiki/CMake_FAQ" rel=3D"noref=
errer" target=3D"_blank">https://cmake.org/Wiki/CMake_FAQ</a><br>
+(Why does CMake use full paths, or can I copy my build tree?)<br>
+<br>
+But oe-core need the source file path relative while compiling<br>
+to avoid build path issue. The fix partly refer the above commit,<br>
+but in order to minimize the influence, it only tweak gcc compiling<br>
+rule in generated Makefile (With &quot;Building ** object&quot; message).<=
br>
+<br>
+Upstream-Status: Inappropriate [openembedded specific]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com">=
hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ Source/cmCommonTargetGenerator.cxx=C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
+ Source/cmCommonTargetGenerator.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
+ Source/cmMakefileTargetGenerator.cxx |=C2=A0 5 +++++<br>
+ Source/cmOutputConverter.cxx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++=
++++++++<br>
+ Source/cmOutputConverter.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 5 +++++<br>
+ 5 files changed, 36 insertions(+)<br>
+<br>
+diff --git a/Source/cmCommonTargetGenerator.cxx b/Source/cmCommonTargetGen=
erator.cxx<br>
+index 252e231..f7d2d6b 100644<br>
+--- a/Source/cmCommonTargetGenerator.cxx<br>
++++ b/Source/cmCommonTargetGenerator.cxx<br>
+@@ -54,6 +54,13 @@ std::string cmCommonTargetGenerator::Convert(<br>
+=C2=A0 =C2=A0return this-&gt;LocalGenerator-&gt;Convert(source, relative, =
output);<br>
+ }<br>
+<br>
++std::string cmCommonTargetGenerator::Convert(<br>
++=C2=A0 std::string const&amp; local,<br>
++=C2=A0 std::string const&amp; remote,<br>
++=C2=A0 cmLocalGenerator::OutputFormat output)<br>
++{<br>
++=C2=A0 return this-&gt;LocalGenerator-&gt;Convert(local, remote, output);=
<br>
++}<br>
+ //-----------------------------------------------------------------------=
-----<br>
+ const char* cmCommonTargetGenerator::GetFeature(const std::string&amp; fe=
ature)<br>
+ {<br>
+diff --git a/Source/cmCommonTargetGenerator.h b/Source/cmCommonTargetGener=
ator.h<br>
+index a4b2c10..6e6b724 100644<br>
+--- a/Source/cmCommonTargetGenerator.h<br>
++++ b/Source/cmCommonTargetGenerator.h<br>
+@@ -72,6 +72,11 @@ protected:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmLocalGenerator::OutputFormat output =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cmLocalGenerator::UNCHANGED);<br>
+<br>
++=C2=A0 std::string Convert(std::string const&amp; local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 std::string const&amp; remote,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cmLocalGenerator::OutputFormat output =3D<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cmLocalGenerator::UNCHANGED);<br>
++<br>
+=C2=A0 =C2=A0void AppendFortranFormatFlags(std::string&amp; flags,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmSourceFile const&amp; source=
);<br>
+<br>
+diff --git a/Source/cmMakefileTargetGenerator.cxx b/Source/cmMakefileTarge=
tGenerator.cxx<br>
+index b278087..84a6ed7 100644<br>
+--- a/Source/cmMakefileTargetGenerator.cxx<br>
++++ b/Source/cmMakefileTargetGenerator.cxx<br>
+@@ -530,6 +530,11 @@ cmMakefileTargetGenerator<br>
+=C2=A0 =C2=A0 =C2=A0this-&gt;LocalGenerator-&gt;AppendEcho<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(commands, buildEcho.c_str(), cmLocalUnixMakefi=
leGenerator3::EchoBuild,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;progress);<br>
++<br>
++=C2=A0 =C2=A0 //Convert sourceFile to relative path<br>
++=C2=A0 =C2=A0 sourceFile =3D this-&gt;Convert(this-&gt;Makefile-&gt;GetCu=
rrentBinaryDirectory(),<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sourceFile,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmLocalGenerator::SHELL);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0std::string targetOutPathReal;<br>
+diff --git a/Source/cmOutputConverter.cxx b/Source/cmOutputConverter.cxx<b=
r>
+index 5acae2f..3d71739 100644<br>
+--- a/Source/cmOutputConverter.cxx<br>
++++ b/Source/cmOutputConverter.cxx<br>
+@@ -94,6 +94,20 @@ const char* cmOutputConverter::GetRelativeRootPath(Rela=
tiveRoot relroot) const<br>
+=C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
++std::string cmOutputConverter::Convert(const std::string&amp; local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const std=
::string&amp; remote,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OutputFor=
mat output) const<br>
++{<br>
++=C2=A0 // Convert the path to a relative path.<br>
++=C2=A0 std::string result =3D remote;<br>
++<br>
++=C2=A0 std::vector&lt;std::string&gt; components;<br>
++=C2=A0 cmSystemTools::SplitPath(local, components);<br>
++=C2=A0 result =3D this-&gt;ConvertToRelativePath(components, result, true=
);<br>
++<br>
++=C2=A0 return this-&gt;ConvertToOutputFormat(result, output);<br>
++}<br>
++<br>
+ std::string cmOutputConverter::Convert(const std::string&amp; source,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Relative=
Root relative,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OutputFo=
rmat output) const<br>
+diff --git a/Source/cmOutputConverter.h b/Source/cmOutputConverter.h<br>
+index 852df5d..d887a99 100644<br>
+--- a/Source/cmOutputConverter.h<br>
++++ b/Source/cmOutputConverter.h<br>
+@@ -45,6 +45,11 @@ public:<br>
+=C2=A0 =C2=A0std::string Convert(RelativeRoot remote, const std::string&am=
p; local,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0OutputFormat output =3D UNCHANGED,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool optional =3D false) const;<br>
++<br>
++=C2=A0 std::string Convert(const std::string&amp; local,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 const std::string&amp; remote,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 OutputFormat output =3D UNCHANGED) const;<br>
++<br>
+=C2=A0 =C2=A0std::string ConvertDirectorySeparatorsForShell(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const std::string&amp; source) const;<br>
+<br>
+--<br>
+1.9.1<br>
+<br>
--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a113a7eae2b583e052dad5178--
