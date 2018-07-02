Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC1697754B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 06:06:44 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id x24-v6so2629673ual.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 23:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Kjpye397gfdXa4CGn3GwiP/YJvofTWrlxRRg3XoeCY=;
	b=iTQ/g5Tu34fDyDBdXEaQrR9/Gy9XlTi27vHdXDwAyHTvWsjTJKbaevZVWYW27lOetC
	lWCqcQYNKH79H6pq3ZlxGbJpALUJEY2IgyWsJJwxBlfx0exXpvSMKgWfTsr9n44E+1h1
	aUgbqdNqU9nHIg0W5Y9ofG3MYr0+Uan6ERNXfW0FWqFQdTBQoFU+DkWXFjMfjLJAlBUr
	TsjeKql8a2pM2fUMZ1/LXB9qDLaZglZhZAgEFF52eRRD5WikvIDzHNnRGlxZpzpFd1Do
	jIGGwYA62NhQAOigbbHtefVqwjIozOqmYoCZCr1EawBtqGWHK2tz9rHurMgokTzd0/A3
	mY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Kjpye397gfdXa4CGn3GwiP/YJvofTWrlxRRg3XoeCY=;
	b=STzZi9mG53p7xxiqfsNUW5yWcZza65iqcfXkabjtHeM1MblzmFErK8Q9rR8uMz7+6b
	Td71mv9aGhhxQ0D5G8BPHJxhNNhZ7nJDcS2mpcUELvoLY3UAFUQfSopw1lLD1futJPLJ
	S+Mx0cVplpG/AiTw5Dy8yFvNriTasQsMiaevaaJygzeJ/qFDbl3QR0s98UHNUeQFtbBQ
	3SzGQ2z05KCGpYpfo1rMyVkN0jrpkEanOa3x7CV6UyXaWXS+TRZAL6kL2pj+E0C8b+yu
	5KWHse6W25PLZDvfbZ0r2SM7ui3stceq7vlOv/OsvuXUGtBc1izEmMju/0Lklct5bEc+
	MB+w==
X-Gm-Message-State: APt69E048VQ11AG61IFGwuoR/cSTsZKztO8eqcyR6DuIgE9WkZNrHEiB
	E4AiuErdAXlCoDPs4WzAnNHpkqh6ToJ3UgkHEc0=
X-Google-Smtp-Source: AAOMgpesHdmcFenhLSBUyJbAyd+KFGujhKEcOzm4/9NF/j/VwSle69OaaHDS20uHiKWt8tvtjWPdm2rV2ekCYdI0jKY=
X-Received: by 2002:ab0:50cd:: with SMTP id
	d13-v6mr12247312uaa.45.1530511605247; 
	Sun, 01 Jul 2018 23:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180702011534.4676-1-kai.kang@windriver.com>
In-Reply-To: <20180702011534.4676-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 1 Jul 2018 23:06:19 -0700
Message-ID: <CAMKF1sqcV=tq1XMSktRNuvTJeEX4sYd=4yBfP8JhukPtqo1pTA@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: 2.20.2 -> 2.20.3
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
X-List-Received-Date: Mon, 02 Jul 2018 06:06:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 1, 2018 at 6:49 PM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade webkitgtk from 2.20.2 to 2.20.3.
> * update context of 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> * remove detect-atomics-during-configure.patch that webkitgtk 2.20.3
>   contains the commit of better solution, see
>   https://bugs.webkit.org/show_bug.cgi?id=161900#c9

If you build it with clang on qemux86 then we can verify if the
alternative fix is functional
for the original intent of this patch that we are dropping here.

>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  ...acros-Append-to-I-and-not-to-isystem.patch | 12 +++---
>  .../detect-atomics-during-configure.patch     | 43 -------------------
>  ...ebkitgtk_2.20.2.bb => webkitgtk_2.20.3.bb} |  5 +--
>  3 files changed, 8 insertions(+), 52 deletions(-)
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.20.2.bb => webkitgtk_2.20.3.bb} (96%)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> index 034219f826..b31026448c 100644
> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
> @@ -41,18 +41,18 @@ index b3c7e0b..88446de 100644
>   target_link_libraries(jsc ${JSC_LIBRARIES})
>
>  diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
> -index 32c6ccc..fef5e8b 100644
> +index f7d8d70a..3c27b8bc 100644
>  --- a/Source/WebCore/PlatformGTK.cmake
>  +++ b/Source/WebCore/PlatformGTK.cmake
> -@@ -159,7 +159,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> -         ${GTK2_INCLUDE_DIRS}
> -         ${GDK2_INCLUDE_DIRS}
> +@@ -157,7 +157,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
> +     target_include_directories(WebCorePlatformGTK2 PRIVATE
> +         ${WebCore_INCLUDE_DIRECTORIES}
>       )
>  -    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
>  +    target_include_directories(WebCorePlatformGTK2 PRIVATE
>           ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
> -     )
> -     target_link_libraries(WebCorePlatformGTK2
> +         ${GTK2_INCLUDE_DIRS}
> +         ${GDK2_INCLUDE_DIRS}
>  @@ -183,7 +183,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
>   target_include_directories(WebCorePlatformGTK PRIVATE
>       ${WebCore_INCLUDE_DIRECTORIES}
> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
> deleted file mode 100644
> index bbdb64490a..0000000000
> --- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From d907ac649ff5514826af9ad7e97e15dfcf79909c Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 17 May 2017 22:34:24 -0700
> -Subject: [PATCH] webkitgtk: Fix build for armv5
> -
> -Taken from
> -https://bugs.webkit.org/show_bug.cgi?id=161900
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
> -index 220bafd..4e1e9f8 100644
> ---- a/Source/WTF/wtf/CMakeLists.txt
> -+++ b/Source/WTF/wtf/CMakeLists.txt
> -@@ -315,7 +315,6 @@ set(WTF_HEADERS
> -
> - set(WTF_SOURCES
> -     Assertions.cpp
> --    Atomics.cpp
> -     AutomaticThread.cpp
> -     BitVector.cpp
> -     CPUTime.cpp
> -@@ -458,6 +457,15 @@ if (NOT USE_SYSTEM_MALLOC)
> -     list(APPEND WTF_LIBRARIES bmalloc)
> - endif ()
> -
> -+file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
> -+     "int main(void)\n"
> -+     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
> -+try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
> -+if (NOT ATOMICS_BUILD_SUCCEEDED)
> -+    list(APPEND WTF_SOURCES Atomics.cpp)
> -+endif ()
> -+file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
> -+
> - list(APPEND WTF_SOURCES
> -     unicode/CollatorDefault.cpp
> -
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> similarity index 96%
> rename from meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> rename to meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> index a68a69f43c..9d0f00a6d6 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
> @@ -17,15 +17,14 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
>             file://x32_support.patch \
>             file://cross-compile.patch \
> -           file://detect-atomics-during-configure.patch \
>             file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>             file://0001-Fix-build-with-musl.patch \
>             file://detect-gstreamer-gl.patch \
>             file://0012-soup-Forward-declare-URL-class.patch \
>             "
>
> -SRC_URI[md5sum] = "3fdda40dc10eb2a00d5fba4219b83967"
> -SRC_URI[sha256sum] = "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d5515948cbf454ca4b526e2"
> +SRC_URI[md5sum] = "efb69a0cc3cc67ef2647efec22e44c69"
> +SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48f20dd8"
>
>  inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>
> --
> 2.17.1
>

