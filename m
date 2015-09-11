Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C3EA7755F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:24:09 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so28545341qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 00:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8oIgTaa+xL8LjAZe5B2srinrb+nzsLMnWs5S7qj9YKo=;
	b=gGobN0AUVhZSQ46mUiP0AEYBdGzlCsbrLyrLuKYTy8bmxyzbSnD9RjBepHq1oMf7zI
	7THkElB8HQKlR7LKsVw10rDCLMepOk2IABaAHdsOHRIPXV1796WpG2Rg3cRifrKEl7QD
	5Kw3u+5nBPV5AV8tHSHL8akI+vu96zSir9QxLnpbyGZKcWniP2/XQI1zHTR9tXURD1lN
	YivaZJ05rsGbzcmANNULSPKjKh0rF815Y0HCTzexHrIU+7/7GKDgG1LqGzgnDCEDMdWt
	AFSaqIFuCH7DuhCZ4AeokbqRcjiCKKn9U7I05hZXvp0cWESghWBfw7rYDY+GLGxu/Kw4
	Ty1w==
X-Gm-Message-State: ALoCoQngoNIVK0/BevmdvaZVkY4tbBEO/0VcBGq/eZ9BZPDHlfq9OD11UiQS98S8wZ2+rOQQvAxu
X-Received: by 10.55.33.222 with SMTP id f91mr60500429qki.64.1441956249657;
	Fri, 11 Sep 2015 00:24:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 11 Sep 2015 00:23:50 -0700 (PDT)
In-Reply-To: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1441909087-3860-1-git-send-email-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Sep 2015 08:23:50 +0100
Message-ID: <CAJTo0LYETBvMzwYDqNJGRpKhgG79TJBYg-psQdGi7fEqGHn0yg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: add a new recipe for latest upstream version
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
X-List-Received-Date: Fri, 11 Sep 2015 07:24:12 -0000
Content-Type: multipart/alternative; boundary=001a1144d35e0af981051f739a96

--001a1144d35e0af981051f739a96
Content-Type: text/plain; charset=UTF-8

This is now failing on qemumips for me:

|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerIhE13internalShiftILi4EEEvv.isra.66' for
R_MIPS_GOT16 at 0x6394 in section
`.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerIhE13internalShiftILi6EEEvv.isra.67' for
R_MIPS_GOT16 at 0x6d0c in section
`.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerIhE13internalShiftILi3EEEvv.isra.63' for
R_MIPS_GOT16 at 0x6d48 in section
`.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerIhE13internalShiftILi6EEEvv.isra.67' for
R_MIPS_GOT16 at 0x6d94 in section
`.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerIhE13internalShiftILi7EEEvv.isra.65' for
R_MIPS_GOT16 at 0x6f20 in section
`.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi6EEEvv.isra.79' for
R_MIPS_GOT16 at 0x6714 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi6EEEvv.isra.79' for
R_MIPS_GOT16 at 0x6764 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75' for
R_MIPS_GOT16 at 0x67b4 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi6EEEvv.isra.79' for
R_MIPS_GOT16 at 0x68b4 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75' for
R_MIPS_GOT16 at 0x6ab4 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi7EEEvv.isra.77' for
R_MIPS_GOT16 at 0x6af0 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75' for
R_MIPS_GOT16 at 0x70cc in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi5EEEvv.isra.76' for
R_MIPS_GOT16 at 0x745c in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75' for
R_MIPS_GOT16 at 0x7518 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75' for
R_MIPS_GOT16 at 0x7678 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
|
/data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld:
CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can't find matching LO16
reloc against `_ZN3JSC5LexerItE13internalShiftILi4EEEvv.isra.78' for
R_MIPS_GOT16 at 0x7910 in section
`.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]'
| CMakeFiles/JavaScriptCore.dir/runtime/JSArray.cpp.o: In function
`JSC::JSArray::push(JSC::ExecState*, JSC::JSValue)':
|
/data/poky-master/tmp/work/mips32r2-poky-linux/webkitgtk/2.8.5-r0/webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSArray.cpp:566:
undefined reference to `void
JSC::JSObject::putByIndexBeyondVectorLengthWithoutAttributes<(unsigned
char)20>(JSC::ExecState*, unsigned int, JSC::JSValue)'
| collect2: error: ld returned 1 exit status
| Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/build.make:14167:
recipe for target 'lib/libjavascriptcoregtk-4.0.so.18.1.12' failed

(similar failure on qemuppc too)

Ross

On 10 September 2015 at 19:18, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Also, add a backported patch that prevents too long command lines from
> happening.
>
> Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit.
>
> (From OE-Core rev: 1ffa1c36f5d3d3f076840c9239c17f13f36064c3)
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...fixes-a-command-line-that-is-too-long-ove.patch | 89
> ++++++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        | 57 ++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
>
> diff --git
> a/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
> b/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
> new file mode 100644
> index 0000000..ee9c807
> --- /dev/null
> +++
> b/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch
> @@ -0,0 +1,89 @@
> +From 22d5063c551d3c08c0a4ad8b80e08b793d53093d Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Thu, 10 Sep 2015 16:23:27 +0300
> +Subject: [PATCH] This patch fixes a command line that is too long (over
> 100K!)
> + and is rejected by /bin/sh.
> +
> +Upstream-status: Backport [should appear in 2.10,
> http://trac.webkit.org/changeset/184856]
> +---
> + Source/WebKit2/PlatformGTK.cmake                   | 11 ++++++-----
> + Tools/gtk/generate-inspector-gresource-manifest.py | 16 ++++++++++++----
> + 2 files changed, 18 insertions(+), 9 deletions(-)
> +
> +diff --git a/Source/WebKit2/PlatformGTK.cmake
> b/Source/WebKit2/PlatformGTK.cmake
> +index a13af7c..058c241 100644
> +--- a/Source/WebKit2/PlatformGTK.cmake
> ++++ b/Source/WebKit2/PlatformGTK.cmake
> +@@ -408,7 +408,7 @@ set(WebKit2WebExtension_INSTALLED_HEADERS
> +
>  ${WEBKIT2_DIR}/WebProcess/InjectedBundle/API/gtk/webkit-web-extension.h
> + )
> +
> +-file(GLOB InspectorFiles
> ++set(InspectorFiles
> +     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/*.html
> +     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Base/*.js
> +
>  ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Controllers/*.css
> +@@ -423,13 +423,14 @@ file(GLOB InspectorFiles
> +     ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Views/*.js
> +
>  ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Images/gtk/*.png
> +
>  ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterface/Images/gtk/*.svg
> +-)
> +-
> +-list(APPEND InspectorFiles
> +
>  ${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/Localizations/en.lproj/localizedStrings.js
> +
>  ${DERIVED_SOURCES_WEBINSPECTORUI_DIR}/UserInterface/Protocol/InspectorBackendCommands.js
> + )
> +
> ++file(GLOB InspectorFilesDependencies
> ++    ${InspectorFiles}
> ++)
> ++
> + # This is necessary because of a conflict between the GTK+ API
> WebKitVersion.h and one generated by WebCore.
> + list(INSERT WebKit2_INCLUDE_DIRECTORIES 0
> +     "${FORWARDING_HEADERS_WEBKIT2GTK_DIR}"
> +@@ -564,7 +565,7 @@ add_custom_command(
> +
> + add_custom_command(
> +     OUTPUT ${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGResourceBundle.xml
> +-    DEPENDS ${InspectorFiles}
> ++    DEPENDS ${InspectorFilesDependencies}
> +             ${TOOLS_DIR}/gtk/generate-inspector-gresource-manifest.py
> +     COMMAND ${TOOLS_DIR}/gtk/generate-inspector-gresource-manifest.py
> --output=${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGResourceBundle.xml
> ${InspectorFiles}
> +     VERBATIM
> +diff --git a/Tools/gtk/generate-inspector-gresource-manifest.py
> b/Tools/gtk/generate-inspector-gresource-manifest.py
> +index 0687c4c..03060cf 100755
> +--- a/Tools/gtk/generate-inspector-gresource-manifest.py
> ++++ b/Tools/gtk/generate-inspector-gresource-manifest.py
> +@@ -16,6 +16,7 @@
> + # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
> 02110-1301  USA
> +
> + import argparse
> ++import glob
> + import os
> + import sys
> +
> +@@ -26,10 +27,17 @@ BASE_DIR = 'WebInspectorUI/'
> + def get_filenames(args):
> +     filenames = []
> +
> +-    for filename in args:
> +-        base_dir_index = filename.rfind(BASE_DIR)
> +-        if base_dir_index != -1:
> +-            filenames.append(filename[base_dir_index + len(BASE_DIR):])
> ++    for pattern in args:
> ++        paths = glob.glob(pattern)
> ++        for filename in paths:
> ++            base_dir_index = filename.rfind(BASE_DIR)
> ++            if base_dir_index != -1:
> ++                name = filename[base_dir_index + len(BASE_DIR):]
> ++                # The result should use forward slashes, thus make sure
> any os-specific
> ++                # separator, added by the glob.glob() call, is properly
> replaced
> ++                if os.sep != '/':
> ++                    name = name.replace(os.sep, '/')
> ++                filenames.append(name)
> +     return filenames
> +
> +
> +--
> +2.1.4
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> new file mode 100644
> index 0000000..365f20b
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
> @@ -0,0 +1,57 @@
> +SUMMARY = "WebKit web rendering engine for the GTK+ platform"
> +HOMEPAGE = "http://www.webkitgtk.org/"
> +BUGTRACKER = "http://bugs.webkit.org/"
> +
> +LICENSE = "BSD & LGPLv2+"
> +LIC_FILES_CHKSUM =
> "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691
> \
> +
> file://Source/WebKit/LICENSE;md5=4646f90082c40bcf298c285f8bab0b12 \
> +
> file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
> +
>  file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
> +
>  file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80
> \
> +                  "
> +
> +SRC_URI = "\
> +  http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> +  file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.patch \
> +  "
> +SRC_URI[md5sum] = "df79991848a5096d3a75289ebce547ae"
> +SRC_URI[sha256sum] =
> "3d1f0c534935f43fd74df90f2648fcee672d60f1f57a30fa557a77891ae04d20"
> +
> +inherit cmake lib_package pkgconfig perlnative pythonnative
> +
> +DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt
> libidn gnutls \
> +           gtk+ gtk+3 gstreamer1.0 gstreamer1.0-plugins-base flex-native
> gperf-native sqlite3 \
> +          pango icu bison-native gnome-common gawk intltool-native
> libwebp \
> +          atk udev harfbuzz jpeg libpng pulseaudio librsvg libtheora
> libvorbis libxcomposite libxtst \
> +          ruby-native libsecret libnotify gstreamer1.0-plugins-bad \
> +          "
> +DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'virtual/libgl', '', d)}"
> +
> +EXTRA_OECMAKE = " \
> +               -DPORT=GTK \
> +               -DCMAKE_BUILD_TYPE=Release \
> +               -DENABLE_INTROSPECTION=False \
> +               -DENABLE_MINIBROWSER=True \
> +               ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> '-DENABLE_WEBGL=True', '-DENABLE_WEBGL=False', d)} \
> +               "
> +
> +# Javascript JIT is not supported on powerpc
> +EXTRA_OECMAKE_append_powerpc = " -DENABLE_JIT=False "
> +EXTRA_OECMAKE_append_powerpc64 = " -DENABLE_JIT=False "
> +
> +# ARM JIT code does not build on ARMv5/6 anymore, apparently they test
> only on v7 onwards
> +EXTRA_OECMAKE_append_armv5 = " -DENABLE_JIT=False "
> +EXTRA_OECMAKE_append_armv6 = " -DENABLE_JIT=False "
> +
> +# binutils 2.25.1 has a bug on aarch64:
> +# https://sourceware.org/bugzilla/show_bug.cgi?id=18430
> +EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=False "
> +
> +# JIT not supported on MIPS either
> +EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=False "
> +EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=False "
> +
> +FILES_${PN} +=
> "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
> +FILES_${PN}-dbg +=
> "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
> +FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
> +
> --
> 2.1.4
>
>

--001a1144d35e0af981051f739a96
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is now failing on qemumips for me:<div><br></div><div=
><div>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-l=
inux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lex=
er.cpp.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5LexerIhE13int=
ernalShiftILi4EEEvv.isra.66&#39; for R_MIPS_GOT16 at 0x6394 in section `.te=
xt._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEj=
b]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec=
/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.di=
r/parser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5L=
exerIhE13internalShiftILi6EEEvv.isra.67&#39; for R_MIPS_GOT16 at 0x6d0c in =
section `.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPN=
S_7JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux=
/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaS=
criptCore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc agains=
t `_ZN3JSC5LexerIhE13internalShiftILi3EEEvv.isra.63&#39; for R_MIPS_GOT16 a=
t 0x6d48 in section `.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb[_ZN3JSC5Lex=
erIhE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/=
x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMak=
eFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 =
reloc against `_ZN3JSC5LexerIhE13internalShiftILi6EEEvv.isra.67&#39; for R_=
MIPS_GOT16 at 0x6d94 in section `.text._ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb=
[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky-master/t=
mp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.=
2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;t find ma=
tching LO16 reloc against `_ZN3JSC5LexerIhE13internalShiftILi7EEEvv.isra.65=
&#39; for R_MIPS_GOT16 at 0x6f20 in section `.text._ZN3JSC5LexerIhE3lexEPNS=
_7JSTokenEjb[_ZN3JSC5LexerIhE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/p=
oky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-p=
oky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#=
39;t find matching LO16 reloc against `_ZN3JSC5LexerItE13internalShiftILi6E=
EEvv.isra.79&#39; for R_MIPS_GOT16 at 0x6714 in section `.text._ZN3JSC5Lexe=
rItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]&#39;</div><d=
iv>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linu=
x/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.=
cpp.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5LexerItE13intern=
alShiftILi6EEEvv.isra.79&#39; for R_MIPS_GOT16 at 0x6764 in section `.text.=
_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]&=
#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mi=
ps-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/p=
arser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5Lexe=
rItE13internalShiftILi3EEEvv.isra.75&#39; for R_MIPS_GOT16 at 0x67b4 in sec=
tion `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7=
JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux/us=
r/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScri=
ptCore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc against `=
_ZN3JSC5LexerItE13internalShiftILi6EEEvv.isra.79&#39; for R_MIPS_GOT16 at 0=
x68b4 in section `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerI=
tE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86=
_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFi=
les/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 rel=
oc against `_ZN3JSC5LexerItE13internalShiftILi3EEEvv.isra.75&#39; for R_MIP=
S_GOT16 at 0x6ab4 in section `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_Z=
N3JSC5LexerItE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/=
sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0=
/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;t find match=
ing LO16 reloc against `_ZN3JSC5LexerItE13internalShiftILi7EEEvv.isra.77&#3=
9; for R_MIPS_GOT16 at 0x6af0 in section `.text._ZN3JSC5LexerItE3lexEPNS_7J=
STokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky=
-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/gcc/mips-poky=
-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;=
t find matching LO16 reloc against `_ZN3JSC5LexerItE13internalShiftILi3EEEv=
v.isra.75&#39; for R_MIPS_GOT16 at 0x70cc in section `.text._ZN3JSC5LexerIt=
E3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]&#39;</div><div>=
| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-poky-linux/g=
cc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/parser/Lexer.cpp=
.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5LexerItE13internalS=
hiftILi5EEEvv.isra.76&#39; for R_MIPS_GOT16 at 0x745c in section `.text._ZN=
3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb]&#39=
;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/libexec/mips-=
poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptCore.dir/pars=
er/Lexer.cpp.o: Can&#39;t find matching LO16 reloc against `_ZN3JSC5LexerIt=
E13internalShiftILi3EEEvv.isra.75&#39; for R_MIPS_GOT16 at 0x7518 in sectio=
n `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3lexEPNS_7JST=
okenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64-linux/usr/l=
ibexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles/JavaScriptC=
ore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc against `_ZN=
3JSC5LexerItE13internalShiftILi3EEEvv.isra.75&#39; for R_MIPS_GOT16 at 0x76=
78 in section `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3JSC5LexerItE3=
lexEPNS_7JSTokenEjb]&#39;</div><div>| /data/poky-master/tmp/sysroots/x86_64=
-linux/usr/libexec/mips-poky-linux/gcc/mips-poky-linux/5.2.0/ld: CMakeFiles=
/JavaScriptCore.dir/parser/Lexer.cpp.o: Can&#39;t find matching LO16 reloc =
against `_ZN3JSC5LexerItE13internalShiftILi4EEEvv.isra.78&#39; for R_MIPS_G=
OT16 at 0x7910 in section `.text._ZN3JSC5LexerItE3lexEPNS_7JSTokenEjb[_ZN3J=
SC5LexerItE3lexEPNS_7JSTokenEjb]&#39;</div><div>| CMakeFiles/JavaScriptCore=
.dir/runtime/JSArray.cpp.o: In function `JSC::JSArray::push(JSC::ExecState*=
, JSC::JSValue)&#39;:</div><div>| /data/poky-master/tmp/work/mips32r2-poky-=
linux/webkitgtk/2.8.5-r0/webkitgtk-2.8.5/Source/JavaScriptCore/runtime/JSAr=
ray.cpp:566: undefined reference to `void JSC::JSObject::putByIndexBeyondVe=
ctorLengthWithoutAttributes&lt;(unsigned char)20&gt;(JSC::ExecState*, unsig=
ned int, JSC::JSValue)&#39;</div><div>| collect2: error: ld returned 1 exit=
 status</div><div>| Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/bui=
ld.make:14167: recipe for target &#39;lib/libjavascriptcoregtk-4.0.so.18.1.=
12&#39; failed</div></div><div><br></div><div>(similar failure on qemuppc t=
oo)</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 10 September 2015 at 19:18, Alexander Kanavi=
n <span dir=3D"ltr">&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com=
" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Also, add a backported patch that preven=
ts too long command lines from happening.<br>
<br>
Recipe for the obsolete webkit-gtk 1.8.3 is removed in a separate commit.<b=
r>
<br>
(From OE-Core rev: 1ffa1c36f5d3d3f076840c9239c17f13f36064c3)<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0...fixes-a-command-line-that-is-too-long-ove.patch | 89 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" rel=3D=
"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 57 ++++++++++++++<br>
=C2=A02 files changed, 146 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/files/0001-This-patch-fix=
es-a-command-line-that-is-too-long-ove.patch<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/<a href=3D"http://webkitg=
tk_2.8.5.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a><br=
>
<br>
diff --git a/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command=
-line-that-is-too-long-ove.patch b/meta/recipes-sato/webkit/files/0001-This=
-patch-fixes-a-command-line-that-is-too-long-ove.patch<br>
new file mode 100644<br>
index 0000000..ee9c807<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/files/0001-This-patch-fixes-a-command-line-t=
hat-is-too-long-ove.patch<br>
@@ -0,0 +1,89 @@<br>
+From 22d5063c551d3c08c0a4ad8b80e08b793d53093d Mon Sep 17 00:00:00 2001<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 10 Sep 2015 16:23:27 +0300<br>
+Subject: [PATCH] This patch fixes a command line that is too long (over 10=
0K!)<br>
+ and is rejected by /bin/sh.<br>
+<br>
+Upstream-status: Backport [should appear in 2.10, <a href=3D"http://trac.w=
ebkit.org/changeset/184856" rel=3D"noreferrer" target=3D"_blank">http://tra=
c.webkit.org/changeset/184856</a>]<br>
+---<br>
+ Source/WebKit2/PlatformGTK.cmake=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 ++++++-----<br>
+ Tools/gtk/generate-inspector-gresource-manifest.py | 16 ++++++++++++----<=
br>
+ 2 files changed, 18 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/Source/WebKit2/PlatformGTK.cmake b/Source/WebKit2/PlatformGTK=
.cmake<br>
+index a13af7c..058c241 100644<br>
+--- a/Source/WebKit2/PlatformGTK.cmake<br>
++++ b/Source/WebKit2/PlatformGTK.cmake<br>
+@@ -408,7 +408,7 @@ set(WebKit2WebExtension_INSTALLED_HEADERS<br>
+=C2=A0 =C2=A0 =C2=A0${WEBKIT2_DIR}/WebProcess/InjectedBundle/API/gtk/webki=
t-web-extension.h<br>
+ )<br>
+<br>
+-file(GLOB InspectorFiles<br>
++set(InspectorFiles<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/*.html<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/Base/*.js<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/Controllers/*.css<br>
+@@ -423,13 +423,14 @@ file(GLOB InspectorFiles<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/Views/*.js<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/Images/gtk/*.png<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/UserInterfac=
e/Images/gtk/*.svg<br>
+-)<br>
+-<br>
+-list(APPEND InspectorFiles<br>
+=C2=A0 =C2=A0 =C2=A0${CMAKE_SOURCE_DIR}/Source/WebInspectorUI/Localization=
s/en.lproj/localizedStrings.js<br>
+=C2=A0 =C2=A0 =C2=A0${DERIVED_SOURCES_WEBINSPECTORUI_DIR}/UserInterface/Pr=
otocol/InspectorBackendCommands.js<br>
+ )<br>
+<br>
++file(GLOB InspectorFilesDependencies<br>
++=C2=A0 =C2=A0 ${InspectorFiles}<br>
++)<br>
++<br>
+ # This is necessary because of a conflict between the GTK+ API WebKitVers=
ion.h and one generated by WebCore.<br>
+ list(INSERT WebKit2_INCLUDE_DIRECTORIES 0<br>
+=C2=A0 =C2=A0 =C2=A0&quot;${FORWARDING_HEADERS_WEBKIT2GTK_DIR}&quot;<br>
+@@ -564,7 +565,7 @@ add_custom_command(<br>
+<br>
+ add_custom_command(<br>
+=C2=A0 =C2=A0 =C2=A0OUTPUT ${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGRes=
ourceBundle.xml<br>
+-=C2=A0 =C2=A0 DEPENDS ${InspectorFiles}<br>
++=C2=A0 =C2=A0 DEPENDS ${InspectorFilesDependencies}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${TOOLS_DIR}/gtk/generate-=
inspector-gresource-manifest.py<br>
+=C2=A0 =C2=A0 =C2=A0COMMAND ${TOOLS_DIR}/gtk/generate-inspector-gresource-=
manifest.py --output=3D${DERIVED_SOURCES_WEBKIT2GTK_DIR}/InspectorGResource=
Bundle.xml ${InspectorFiles}<br>
+=C2=A0 =C2=A0 =C2=A0VERBATIM<br>
+diff --git a/Tools/gtk/generate-inspector-gresource-manifest.py b/Tools/gt=
k/generate-inspector-gresource-manifest.py<br>
+index 0687c4c..03060cf 100755<br>
+--- a/Tools/gtk/generate-inspector-gresource-manifest.py<br>
++++ b/Tools/gtk/generate-inspector-gresource-manifest.py<br>
+@@ -16,6 +16,7 @@<br>
+ # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA=C2=A0 021=
10-1301=C2=A0 USA<br>
+<br>
+ import argparse<br>
++import glob<br>
+ import os<br>
+ import sys<br>
+<br>
+@@ -26,10 +27,17 @@ BASE_DIR =3D &#39;WebInspectorUI/&#39;<br>
+ def get_filenames(args):<br>
+=C2=A0 =C2=A0 =C2=A0filenames =3D []<br>
+<br>
+-=C2=A0 =C2=A0 for filename in args:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 base_dir_index =3D filename.rfind(BASE_DIR)<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if base_dir_index !=3D -1:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filenames.append(filename[base_=
dir_index + len(BASE_DIR):])<br>
++=C2=A0 =C2=A0 for pattern in args:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 paths =3D glob.glob(pattern)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for filename in paths:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base_dir_index =3D filename.rfi=
nd(BASE_DIR)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if base_dir_index !=3D -1:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name =3D filename=
[base_dir_index + len(BASE_DIR):]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # The result shou=
ld use forward slashes, thus make sure any os-specific<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # separator, adde=
d by the glob.glob() call, is properly replaced<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.sep !=3D &#=
39;/&#39;:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nam=
e =3D name.replace(os.sep, &#39;/&#39;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filenames.append(=
name)<br>
+=C2=A0 =C2=A0 =C2=A0return filenames<br>
+<br>
+<br>
+--<br>
+2.1.4<br>
+<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a> b/meta/recipes=
-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">webkitgtk_2.8.5.bb</a><br>
new file mode 100644<br>
index 0000000..365f20b<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.8.5.bb" rel=3D=
"noreferrer" target=3D"_blank">webkitgtk_2.8.5.bb</a><br>
@@ -0,0 +1,57 @@<br>
+SUMMARY =3D &quot;WebKit web rendering engine for the GTK+ platform&quot;<=
br>
+HOMEPAGE =3D &quot;<a href=3D"http://www.webkitgtk.org/" rel=3D"noreferrer=
" target=3D"_blank">http://www.webkitgtk.org/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"http://bugs.webkit.org/" rel=3D"noreferrer=
" target=3D"_blank">http://bugs.webkit.org/</a>&quot;<br>
+<br>
+LICENSE =3D &quot;BSD &amp; LGPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://Source/JavaScriptCore/COPYING.LIB;md5=3D=
d0c6d6397a5d84286dda758da57bd691 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://Source/WebKit/LICENSE;md5=3D4646f90082c40bcf298c285f8bab0b12 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://Source/WebCore/LICENSE-APPLE;md5=3D4646f90082c40bcf298c285f8bab0b12 \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//Source/WebCore/LICENSE-LGPL-2;md5=3D36357ffde2b64ae177b2494445b79d21 \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file:=
//Source/WebCore/LICENSE-LGPL-2.1;md5=3Da778a33ef338abbaf8b8a7c36b6eec80 \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 <a href=3D"http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz" r=
el=3D"noreferrer" target=3D"_blank">http://www.webkitgtk.org/releases/${BPN=
}-${PV}.tar.xz</a> \<br>
+=C2=A0 file://0001-This-patch-fixes-a-command-line-that-is-too-long-ove.pa=
tch \<br>
+=C2=A0 &quot;<br>
+SRC_URI[md5sum] =3D &quot;df79991848a5096d3a75289ebce547ae&quot;<br>
+SRC_URI[sha256sum] =3D &quot;3d1f0c534935f43fd74df90f2648fcee672d60f1f57a3=
0fa557a77891ae04d20&quot;<br>
+<br>
+inherit cmake lib_package pkgconfig perlnative pythonnative<br>
+<br>
+DEPENDS =3D &quot;zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libx=
t libidn gnutls \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk+ gtk+3 gstreamer1.0 gstreamer=
1.0-plugins-base flex-native gperf-native sqlite3 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pango icu bison-native gnome-common gaw=
k intltool-native libwebp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 atk udev harfbuzz jpeg libpng pulseaudi=
o librsvg libtheora libvorbis libxcomposite libxtst \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ruby-native libsecret libnotify gstream=
er1.0-plugins-bad \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+DEPENDS +=3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;o=
pengl&#39;, &#39;virtual/libgl&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
+EXTRA_OECMAKE =3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DPORT=3DGTK \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DCMAKE_BUILD_TYPE=
=3DRelease \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_INTROSPECT=
ION=3DFalse \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DENABLE_MINIBROWSE=
R=3DTrue \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contain=
s(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;-DENABLE_WEBGL=3DTrue&#=
39;, &#39;-DENABLE_WEBGL=3DFalse&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+<br>
+# Javascript JIT is not supported on powerpc<br>
+EXTRA_OECMAKE_append_powerpc =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+EXTRA_OECMAKE_append_powerpc64 =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+<br>
+# ARM JIT code does not build on ARMv5/6 anymore, apparently they test onl=
y on v7 onwards<br>
+EXTRA_OECMAKE_append_armv5 =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+EXTRA_OECMAKE_append_armv6 =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+<br>
+# binutils 2.25.1 has a bug on aarch64:<br>
+# <a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D18430" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/bugzilla/show_bug.=
cgi?id=3D18430</a><br>
+EXTRA_OECMAKE_append_aarch64 =3D &quot; -DUSE_LD_GOLD=3DFalse &quot;<br>
+<br>
+# JIT not supported on MIPS either<br>
+EXTRA_OECMAKE_append_mips =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+EXTRA_OECMAKE_append_mips64 =3D &quot; -DENABLE_JIT=3DFalse &quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2=
gtkinjectedbundle.so&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/webkit2gtk-4.0/injected-bundle/.debug=
/libwebkit2gtkinjectedbundle.so&quot;<br>
+FILES_${PN}-dbg +=3D &quot;${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*&quo=
t;<br>
+<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div>

--001a1144d35e0af981051f739a96--
