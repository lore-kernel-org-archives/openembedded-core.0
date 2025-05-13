Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13FAC3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:53:02 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.77088.1747144376606131368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 06:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfW8Y4V4;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4033c70577fso3391742b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747144376; x=1747749176; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zRYQECXAWvteHSLFjygRBRpodp6eC1rNVYWW59l4C7s=;
        b=BfW8Y4V4TM4orb03rSrQPSLQjviwRSmp5eI9SQ541Lo65bo6ygFw6yP8GBx3WHWxfW
         ZCDuS+Kf4P8UCpzufmWd5trmJK+ymDV9YiVLfVpPTaP4f2NmUXLOoqDMLgzsN7XNHq8h
         KwTyTORiTQiFVN18+ftmHKFVJQIAcTE1D0/FF6+bzk4yxo7kMbZgLl85v2/lqq/VawuP
         CqaVd6p6t4KjDlPLVzcrAEzBYF5EbLDnlDFp+3kDB/KNaNTaLKqPIf9+2q8fQl6+uXbe
         hDAtx2rFICyTunDIcvEh3u4XyHPDlg2pQNMf5ZrGJRSvOVnTx89+E86GflPOqqv0u3BS
         A1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144376; x=1747749176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRYQECXAWvteHSLFjygRBRpodp6eC1rNVYWW59l4C7s=;
        b=nlO3ejjGGNwYYq305iaEJiEqKfTOalcilYAUZtkNPDM8T0v1utYrzGdMh+hR3HjSPX
         WabnSSoVFNtUBikX+Ce9bVWwkkOKjaIlN3qGzljUz+UyEsDU5T8bLT28TWhnKpLoI2aK
         G7lbk7Bfo5X5RVSRePEmnAISZ5UpRH/2VIf/gdD1o6twVmXKbAlqb3en/IDenKlQpWJp
         8excGy5amXrjurPcyt6wFldCwUcBNaWQLqmlBRHMjgqSOUsoQ2BsLJuCknArrP48/m7i
         aBTR6eFEhbr571k2pXF9n28oKay1qaQnf8JHxFTT+vKIK4YI+XYbUbhnTujCUvaOrII4
         UAJA==
X-Gm-Message-State: AOJu0Yy3HD1W19BaEz8FstLK5b/5JJEOcxtMOm71gmg+uDBE7ipX7LI1
	fL1gRHj290BnZKpVy0awDU3xsT9XmBrRbEJC8mTQtbuwvSM6UiLx/tVGKa1o+Ju7hoFT01ZKkUA
	HXHjaTAP6l0aYpjpuroDqfIId8u0=
X-Gm-Gg: ASbGncvQgq+oRO6ePow4p79GCTb3fnDjysIV5FMnl9CoxynIDiIQ0p5BCCQJ/AT3lhj
	uBAZxIGovbFrNt2FgFVcWhXhtWxZCpa21+yny19jjYt+std/s/rBwBoxdyvfD9xWl60PsToDnpG
	Ot8Z0+c5N1egW8I9OF630PSsxBMg480w8GD12eINGtP9Lf1n7tnJqKmvJAnfPKe/asIhgL/gZwJ
	Sfi
X-Google-Smtp-Source: AGHT+IFyhjaiRq8uv6yS5vta7jUEGjykRuGfRi9VQJ4iHPkH8SVbKGZsfNp93kFLepPAe926+1YhkS9AmHuSLBqe5jw=
X-Received: by 2002:a05:6808:1892:b0:400:bdfc:478d with SMTP id
 5614622812f47-4037fe5e0bamr10945414b6e.30.1747144375383; Tue, 13 May 2025
 06:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250509052739.3638179-1-yogita.urade@windriver.com>
 <CAMKF1sqMaiOGn+cQ1p8_XMCo+iGdso+kq+1wia8OTywmcJk5sw@mail.gmail.com> <5f1ee894-b118-4d5e-8381-fe38709afc7a@windriver.com>
In-Reply-To: <5f1ee894-b118-4d5e-8381-fe38709afc7a@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2025 06:52:43 -0700
X-Gm-Features: AX0GCFuk2qg67Dw_F52HSsTOeMpm_HU0o1YM2hnaiqACU0YNPsR9ZhM50Z04NLc
Message-ID: <CAMKF1srdFYVVQZhb4pgQb9nG4LeafEtGYcXSLyvTyj+WEBxnoA@mail.gmail.com>
Subject: Re: [OE-core][walnascar][PATCH 1/1] webkitgtk: upgrade 2.48.0 -> 2.48.1
To: "Urade, Yogita" <yogita.urade@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ddbcc7063504bf3d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 13:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216427

--000000000000ddbcc7063504bf3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That would be great last couple of upgrades were resulting in build
failures on riscv

On Tue, May 13, 2025 at 4:29=E2=80=AFAM Urade, Yogita <yogita.urade@windriv=
er.com>
wrote:

>
> On 09-05-2025 12:43, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > Have you built it for qemuriscv64 ?
> No, I only build for qemux86.
>
> Should I test for qemuriscv64?
> ../Yogita
> > On Thu, May 8, 2025 at 10:28=E2=80=AFPM Urade, Yogita via
> > lists.openembedded.org
> > <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
> >> From: Yogita Urade <yogita.urade@windriver.com>
> >>
> >> Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,
> >> CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427
> >>
> >> Changelog:
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> - Limit the data stored in session state.
> >> - Remove the empty area below the title bar in Web Inspector when not
> docked.
> >> - Fix the build with GST_DISABLE_GST_DEBUG.
> >> - Fix the build with GStreamer < 1.20.
> >> - Fix the build with video disabled.
> >> - Fix the build with clang 20.
> >>
> >> Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch
> >> and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
> >> which are part of upgrade.
> >>
> >> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> >> ---
> >>   ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 -----------------=
-
> >>   ...or-no-matching-function-for-call-to-.patch | 77 -----------------=
--
> >>   ...ebkitgtk_2.48.0.bb =3D> webkitgtk_2.48.1.bb} |  4 +-
> >>   3 files changed, 1 insertion(+), 155 deletions(-)
> >>   delete mode 100644
> meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624=
258-.-https-bugs.we.patch
> >>   delete mode 100644
> meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-fu=
nction-for-call-to-.patch
> >>   rename meta/recipes-sato/webkit/{webkitgtk_2.48.0.bb =3D>
> webkitgtk_2.48.1.bb} (96%)
> >>
> >> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc296=
24258-.-https-bugs.we.patch
> b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc296=
24258-.-https-bugs.we.patch
> >> deleted file mode 100644
> >> index 5cbb1035b2..0000000000
> >> ---
> a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc296=
24258-.-https-bugs.we.patch
> >> +++ /dev/null
> >> @@ -1,75 +0,0 @@
> >> -From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 200=
1
> >> -From: Adrian Perez de Castro <aperez@igalia.com>
> >> -Date: Tue, 18 Mar 2025 07:39:01 -0700
> >> -Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
> >> - https://bugs.webkit.org/show_bug.cgi?id=3D289953
> >> -
> >> -    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
> >> -    https://bugs.webkit.org/show_bug.cgi?id=3D289953
> >> -
> >> -    Reviewed by Alicia Boya Garcia.
> >> -
> >> -    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc+=
+
> >> -      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MO=
DE
> >> -      macro, otherwise for older versions keep
> _LIBCPP_ENABLE_ASSERTIONS.
> >> -
> >> -    Canonical link: https://commits.webkit.org/292304@main
> >> -
> >> -Upstream-Status: Backport [
> https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07eb=
d134459
> ]
> >> -
> >> -Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
> >> -
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
> >> - 1 file changed, 19 insertions(+), 5 deletions(-)
> >> -
> >> -diff --git a/Source/cmake/OptionsCommon.cmake
> b/Source/cmake/OptionsCommon.cmake
> >> -index f6cf5ee..3178674 100644
> >> ---- a/Source/cmake/OptionsCommon.cmake
> >> -+++ b/Source/cmake/OptionsCommon.cmake
> >> -@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
> >> - ")
> >> - check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}"
> CXX_STDLIB_IS_LIBCPP)
> >> - if (CXX_STDLIB_IS_LIBCPP)
> >> --    set(CXX_STDLIB_VARIANT "LIBCPP")
> >> --    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
> >> -+    set(CXX_STDLIB_TEST_SOURCE "
> >> -+        #include <utility>
> >> -+        #if _LIBCPP_VERSION >=3D 190000
> >> -+        int main() { }
> >> -+        #else
> >> -+        #error libc++ is older than 19.x
> >> -+        #endif
> >> -+    ")
> >> -+    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}"
> CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
> >> -+    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
> >> -+        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
> >> -+        set(CXX_STDLIB_ASSERTIONS_MACRO
> _LIBCPP_HARDENING_MODE=3D_LIBCPP_HARDENING_MODE_EXTENSIVE)
> >> -+    else ()
> >> -+        set(CXX_STDLIB_VARIANT "LIBCPP <19")
> >> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=3D=
1)
> >> -+    endif ()
> >> - else ()
> >> -     set(CXX_STDLIB_TEST_SOURCE "
> >> -     #include <utility>
> >> -@@ -239,7 +253,7 @@ else ()
> >> -     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}"
> CXX_STDLIB_IS_GLIBCXX)
> >> -     if (CXX_STDLIB_IS_GLIBCXX)
> >> -         set(CXX_STDLIB_VARIANT "GLIBCXX")
> >> --        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
> >> -+        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=3D1)
> >> -     endif ()
> >> - endif ()
> >> - message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
> >> -@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
> >> -
> >> - if (USE_CXX_STDLIB_ASSERTIONS)
> >> -     if (CXX_STDLIB_ASSERTIONS_MACRO)
> >> --        message(STATUS "  Assertions enabled,
> ${CXX_STDLIB_ASSERTIONS_MACRO}=3D1")
> >> --        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=3D1"=
)
> >> -+        message(STATUS "  Assertions enabled,
> ${CXX_STDLIB_ASSERTIONS_MACRO}")
> >> -+        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
> >> -     else ()
> >> -         message(STATUS "  Assertions disabled,
> CXX_STDLIB_ASSERTIONS_MACRO undefined")
> >> -     endif ()
> >> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-=
function-for-call-to-.patch
> b/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-=
function-for-call-to-.patch
> >> deleted file mode 100644
> >> index 5b83d9e7eb..0000000000
> >> ---
> a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-no-matching-=
function-for-call-to-.patch
> >> +++ /dev/null
> >> @@ -1,77 +0,0 @@
> >> -From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00 200=
1
> >> -From: Fujii Hironori <Hironori.Fujii@sony.com>
> >> -Date: Tue, 18 Mar 2025 10:25:47 +0900
> >> -Subject: [PATCH] EnumTraits.h: error: no matching function for call t=
o
> >> - 'enumName' with Clang 20
> https://bugs.webkit.org/show_bug.cgi?id=3D289669
> >> -
> >> -Reviewed by NOBODY (OOPS!).
> >> -
> >> -Clang 20 couldn't compile EnumTraits.h.
> >> -
> >> -> wtf/EnumTraits.h:212:33: note: candidate template ignored: invalid
> explicitly-specified argument for template parameter 'V'
> >> -
> >> -An invalid enum value can't be specifed to the template parameter `V`=
.
> >> -
> >> -> template<auto V> constexpr std::span<const char> enumName()
> >> -
> >> -The upstream Magic Enum C++ has a template variable
> `is_enum_constexpr_static_cast_valid<E, V>` to check a enum value is vali=
d.
> >> -<
> https://github.com/Neargye/magic_enum/blob/a413fcc9c46a020a746907136a384c=
227f3cd095/include/magic_enum/magic_enum.hpp#L624-L634
> >
> >> -
> >> -Imported the template variable.
> >> -
> >> -* Source/WTF/wtf/EnumTraits.h:
> >> -(WTF::enumName):
> >> -(WTF::makeEnumNames):
> >> -
> >> -Upstream-Status: Submitted [
> https://github.com/WebKit/WebKit/pull/42597]
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ----
> >> - Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-
> >> - 1 file changed, 20 insertions(+), 1 deletion(-)
> >> -
> >> -diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTraits.=
h
> >> -index 0d33e39a..95e6318b 100644
> >> ---- a/Source/WTF/wtf/EnumTraits.h
> >> -+++ b/Source/WTF/wtf/EnumTraits.h
> >> -@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()
> >> - #pragma clang diagnostic ignored "-Wenum-constexpr-conversion"
> >> - #endif
> >> -
> >> -+#if COMPILER(CLANG) && __clang_major__ >=3D 16
> >> -+template <typename E, auto V, typename =3D void>
> >> -+inline constexpr bool isEnumConstexprStaticCastValid =3D false;
> >> -+template <typename E, auto V>
> >> -+inline constexpr bool isEnumConstexprStaticCastValid<E, V,
> std::void_t<std::integral_constant<E, static_cast<E>(V)>>> =3D true;
> >> -+#else
> >> -+template <typename, auto>
> >> -+inline constexpr bool isEnumConstexprStaticCastValid =3D true;
> >> -+#endif
> >> -+
> >> - template<typename E>
> >> - constexpr std::span<const char> enumTypeNameImpl()
> >> - {
> >> -@@ -215,6 +225,15 @@ constexpr std::span<const char> enumName()
> >> -     return result;
> >> - }
> >> -
> >> -+template<typename E, auto V>
> >> -+constexpr std::span<const char> enumName()
> >> -+{
> >> -+    if constexpr (isEnumConstexprStaticCastValid<E, V>)
> >> -+        return enumName<static_cast<E>(V)>();
> >> -+    else
> >> -+        return { };
> >> -+}
> >> -+
> >> - template<typename E>
> >> - constexpr std::underlying_type_t<E> enumNamesMin()
> >> - {
> >> -@@ -264,7 +283,7 @@ constexpr auto
> makeEnumNames(std::index_sequence<Is...>)
> >> - {
> >> -     constexpr auto min =3D enumNamesMin<E>();
> >> -     return std::array<std::span<const char>, sizeof...(Is)> {
> >> --
> enumName<static_cast<E>(static_cast<std::underlying_type_t<E>>(Is) +
> min)>()...
> >> -+        enumName<E, static_cast<std::underlying_type_t<E>>(Is) +
> min>()...
> >> -     };
> >> - }
> >> -
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> >> similarity index 96%
> >> rename from meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
> >> rename to meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> >> index 6eb80da1de..41fe8209ce 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.1.bb
> >> @@ -16,11 +16,9 @@ SRC_URI =3D "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >>              file://no-musttail-arm.patch \
> >>              file://t6-not-declared.patch \
> >>              file://sys_futex.patch \
> >> -
>  file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
> >> -
>  file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
> >>
> file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
> >>              "
> >> -SRC_URI[sha256sum] =3D
> "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
> >> +SRC_URI[sha256sum] =3D
> "98efdf21c4cdca0fe0b73ab5a8cb52093b5aa52d9b1b016a93f71dbfa1eb258f"
> >>
> >>   inherit cmake pkgconfig gobject-introspection perlnative
> features_check upstream-version-is-even gi-docgen
> >>
> >> --
> >> 2.40.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#216185):
> https://lists.openembedded.org/g/openembedded-core/message/216185
> >> Mute This Topic: https://lists.openembedded.org/mt/112893933/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--000000000000ddbcc7063504bf3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">That would be great last couple of upgrades were resultin=
g in build failures on riscv=C2=A0</div><div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 13=
, 2025 at 4:29=E2=80=AFAM Urade, Yogita &lt;<a href=3D"mailto:yogita.urade@=
windriver.com">yogita.urade@windriver.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><br>
On 09-05-2025 12:43, Khem Raj wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt;<br>
&gt; Have you built it for qemuriscv64 ?<br>
No, I only build for qemux86.<br>
<br>
Should I test for qemuriscv64?<br>
../Yogita<br>
&gt; On Thu, May 8, 2025 at 10:28=E2=80=AFPM Urade, Yogita via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;Yogita.Urade=3D<a href=3D"mailto:windriver.com@lists.openembedded.=
org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt; From: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.co=
m" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Includes fix for CVE-2024-54551, CVE-2025-24208, CVE-2025-24209,<b=
r>
&gt;&gt; CVE-2025-24213, CVE-2025-24216, CVE-2025-24264 and CVE-2025-30427<=
br>
&gt;&gt;<br>
&gt;&gt; Changelog:<br>
&gt;&gt; =3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; - Limit the data stored in session state.<br>
&gt;&gt; - Remove the empty area below the title bar in Web Inspector when =
not docked.<br>
&gt;&gt; - Fix the build with GST_DISABLE_GST_DEBUG.<br>
&gt;&gt; - Fix the build with GStreamer &lt; 1.20.<br>
&gt;&gt; - Fix the build with video disabled.<br>
&gt;&gt; - Fix the build with clang 20.<br>
&gt;&gt;<br>
&gt;&gt; Drop 0001-EnumTraits.h-error-no-matching-function-for-call-to-.pat=
ch<br>
&gt;&gt; and 0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patc=
h<br>
&gt;&gt; which are part of upgrade.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@win=
driver.com" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0...04-main-7ffc29624258-.-https-bugs.we.patch | 75 ---=
---------------<br>
&gt;&gt;=C2=A0 =C2=A0...or-no-matching-function-for-call-to-.patch | 77 ---=
----------------<br>
&gt;&gt;=C2=A0 =C2=A0...<a href=3D"http://ebkitgtk_2.48.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">ebkitgtk_2.48.0.bb</a> =3D&gt; <a href=3D"http://we=
bkitgtk_2.48.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.1.bb=
</a>} |=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 =C2=A03 files changed, 1 insertion(+), 155 deletions(-)<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-sato/webkit/webkitgtk/=
0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch<br>
&gt;&gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-sato/webkit/webkitgtk/=
0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch<br>
&gt;&gt;=C2=A0 =C2=A0rename meta/recipes-sato/webkit/{<a href=3D"http://web=
kitgtk_2.48.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.0.bb<=
/a> =3D&gt; <a href=3D"http://webkitgtk_2.48.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">webkitgtk_2.48.1.bb</a>} (96%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-2=
92304-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/we=
bkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 5cbb1035b2..0000000000<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-m=
ain-7ffc29624258-.-https-bugs.we.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,75 +0,0 @@<br>
&gt;&gt; -From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; -From: Adrian Perez de Castro &lt;<a href=3D"mailto:aperez@igalia.=
com" target=3D"_blank">aperez@igalia.com</a>&gt;<br>
&gt;&gt; -Date: Tue, 18 Mar 2025 07:39:01 -0700<br>
&gt;&gt; -Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).<br>
&gt;&gt; - <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D289953" rel=
=3D"noreferrer" target=3D"_blank">https://bugs.webkit.org/show_bug.cgi?id=
=3D289953</a><br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer li=
bc++ versions<br>
&gt;&gt; -=C2=A0 =C2=A0 <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=
=3D289953" rel=3D"noreferrer" target=3D"_blank">https://bugs.webkit.org/sho=
w_bug.cgi?id=3D289953</a><br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 Reviewed by Alicia Boya Garcia.<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 * Source/cmake/OptionsCommon.cmake: Add a new check=
 for the libc++<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 version, if it is 19 or newer, use the new _=
LIBCPP_HARDENING_MODE<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 macro, otherwise for older versions keep _LI=
BCPP_ENABLE_ASSERTIONS.<br>
&gt;&gt; -<br>
&gt;&gt; -=C2=A0 =C2=A0 Canonical link: <a href=3D"https://commits.webkit.o=
rg/292304@main" rel=3D"noreferrer" target=3D"_blank">https://commits.webkit=
.org/292304@main</a><br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/WebKit/W=
ebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de=
3a4cac2ed8a07ebd134459</a>]<br>
&gt;&gt; -<br>
&gt;&gt; -Canonical link: <a href=3D"https://commits.webkit.org/290945.71@w=
ebkitglib/2.48" rel=3D"noreferrer" target=3D"_blank">https://commits.webkit=
.org/290945.71@webkitglib/2.48</a><br>
&gt;&gt; -<br>
&gt;&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ----<br>
&gt;&gt; - Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----<b=
r>
&gt;&gt; - 1 file changed, 19 insertions(+), 5 deletions(-)<br>
&gt;&gt; -<br>
&gt;&gt; -diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/Opti=
onsCommon.cmake<br>
&gt;&gt; -index f6cf5ee..3178674 100644<br>
&gt;&gt; ---- a/Source/cmake/OptionsCommon.cmake<br>
&gt;&gt; -+++ b/Source/cmake/OptionsCommon.cmake<br>
&gt;&gt; -@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE &quot;<br>
&gt;&gt; - &quot;)<br>
&gt;&gt; - check_cxx_source_compiles(&quot;${CXX_STDLIB_TEST_SOURCE}&quot; =
CXX_STDLIB_IS_LIBCPP)<br>
&gt;&gt; - if (CXX_STDLIB_IS_LIBCPP)<br>
&gt;&gt; --=C2=A0 =C2=A0 set(CXX_STDLIB_VARIANT &quot;LIBCPP&quot;)<br>
&gt;&gt; --=C2=A0 =C2=A0 set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASS=
ERTIONS)<br>
&gt;&gt; -+=C2=A0 =C2=A0 set(CXX_STDLIB_TEST_SOURCE &quot;<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #include &lt;utility&gt;<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #if _LIBCPP_VERSION &gt;=3D 190000<b=
r>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int main() { }<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #else<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #error libc++ is older than 19.x<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 #endif<br>
&gt;&gt; -+=C2=A0 =C2=A0 &quot;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 check_cxx_source_compiles(&quot;${CXX_STDLIB_TEST_=
SOURCE}&quot; CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)<br>
&gt;&gt; -+=C2=A0 =C2=A0 if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_VARIANT &quot;LIBCPP =
19+&quot;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_ASSERTIONS_MACRO _LIB=
CPP_HARDENING_MODE=3D_LIBCPP_HARDENING_MODE_EXTENSIVE)<br>
&gt;&gt; -+=C2=A0 =C2=A0 else ()<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_VARIANT &quot;LIBCPP =
&lt;19&quot;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_ASSERTIONS_MACRO _LIB=
CPP_ENABLE_ASSERTIONS=3D1)<br>
&gt;&gt; -+=C2=A0 =C2=A0 endif ()<br>
&gt;&gt; - else ()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0set(CXX_STDLIB_TEST_SOURCE &quot;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0#include &lt;utility&gt;<br>
&gt;&gt; -@@ -239,7 +253,7 @@ else ()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0check_cxx_source_compiles(&quot;${CXX_STDLIB_=
TEST_SOURCE}&quot; CXX_STDLIB_IS_GLIBCXX)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0if (CXX_STDLIB_IS_GLIBCXX)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set(CXX_STDLIB_VARIANT &quot;GL=
IBCXX&quot;)<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_ASSERTIONS_MACRO _GLI=
BCXX_ASSERTIONS)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(CXX_STDLIB_ASSERTIONS_MACRO _GLI=
BCXX_ASSERTIONS=3D1)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0endif ()<br>
&gt;&gt; - endif ()<br>
&gt;&gt; - message(STATUS &quot;C++ standard library in use: ${CXX_STDLIB_V=
ARIANT}&quot;)<br>
&gt;&gt; -@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS<br>
&gt;&gt; -<br>
&gt;&gt; - if (USE_CXX_STDLIB_ASSERTIONS)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0if (CXX_STDLIB_ASSERTIONS_MACRO)<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 message(STATUS &quot;=C2=A0 Assertio=
ns enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=3D1&quot;)<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_compile_definitions(&quot;${CXX_=
STDLIB_ASSERTIONS_MACRO}=3D1&quot;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 message(STATUS &quot;=C2=A0 Assertio=
ns enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}&quot;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 add_compile_definitions(&quot;${CXX_=
STDLIB_ASSERTIONS_MACRO}&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0else ()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message(STATUS &quot;=C2=A0 Ass=
ertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0endif ()<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-=
error-no-matching-function-for-call-to-.patch b/meta/recipes-sato/webkit/we=
bkitgtk/0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 5b83d9e7eb..0000000000<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/webkitgtk/0001-EnumTraits.h-error-n=
o-matching-function-for-call-to-.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,77 +0,0 @@<br>
&gt;&gt; -From 7d159a631ae55c10a0b7a92cf031200a11629736 Mon Sep 17 00:00:00=
 2001<br>
&gt;&gt; -From: Fujii Hironori &lt;<a href=3D"mailto:Hironori.Fujii@sony.co=
m" target=3D"_blank">Hironori.Fujii@sony.com</a>&gt;<br>
&gt;&gt; -Date: Tue, 18 Mar 2025 10:25:47 +0900<br>
&gt;&gt; -Subject: [PATCH] EnumTraits.h: error: no matching function for ca=
ll to<br>
&gt;&gt; - &#39;enumName&#39; with Clang 20 <a href=3D"https://bugs.webkit.=
org/show_bug.cgi?id=3D289669" rel=3D"noreferrer" target=3D"_blank">https://=
bugs.webkit.org/show_bug.cgi?id=3D289669</a><br>
&gt;&gt; -<br>
&gt;&gt; -Reviewed by NOBODY (OOPS!).<br>
&gt;&gt; -<br>
&gt;&gt; -Clang 20 couldn&#39;t compile EnumTraits.h.<br>
&gt;&gt; -<br>
&gt;&gt; -&gt; wtf/EnumTraits.h:212:33: note: candidate template ignored: i=
nvalid explicitly-specified argument for template parameter &#39;V&#39;<br>
&gt;&gt; -<br>
&gt;&gt; -An invalid enum value can&#39;t be specifed to the template param=
eter `V`.<br>
&gt;&gt; -<br>
&gt;&gt; -&gt; template&lt;auto V&gt; constexpr std::span&lt;const char&gt;=
 enumName()<br>
&gt;&gt; -<br>
&gt;&gt; -The upstream Magic Enum C++ has a template variable `is_enum_cons=
texpr_static_cast_valid&lt;E, V&gt;` to check a enum value is valid.<br>
&gt;&gt; -&lt;<a href=3D"https://github.com/Neargye/magic_enum/blob/a413fcc=
9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_enum.hpp#L624-L6=
34" rel=3D"noreferrer" target=3D"_blank">https://github.com/Neargye/magic_e=
num/blob/a413fcc9c46a020a746907136a384c227f3cd095/include/magic_enum/magic_=
enum.hpp#L624-L634</a>&gt;<br>
&gt;&gt; -<br>
&gt;&gt; -Imported the template variable.<br>
&gt;&gt; -<br>
&gt;&gt; -* Source/WTF/wtf/EnumTraits.h:<br>
&gt;&gt; -(WTF::enumName):<br>
&gt;&gt; -(WTF::makeEnumNames):<br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/WebKit/=
WebKit/pull/42597" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
WebKit/WebKit/pull/42597</a>]<br>
&gt;&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ----<br>
&gt;&gt; - Source/WTF/wtf/EnumTraits.h | 21 ++++++++++++++++++++-<br>
&gt;&gt; - 1 file changed, 20 insertions(+), 1 deletion(-)<br>
&gt;&gt; -<br>
&gt;&gt; -diff --git a/Source/WTF/wtf/EnumTraits.h b/Source/WTF/wtf/EnumTra=
its.h<br>
&gt;&gt; -index 0d33e39a..95e6318b 100644<br>
&gt;&gt; ---- a/Source/WTF/wtf/EnumTraits.h<br>
&gt;&gt; -+++ b/Source/WTF/wtf/EnumTraits.h<br>
&gt;&gt; -@@ -152,6 +152,16 @@ constexpr bool isZeroBasedContiguousEnum()<b=
r>
&gt;&gt; - #pragma clang diagnostic ignored &quot;-Wenum-constexpr-conversi=
on&quot;<br>
&gt;&gt; - #endif<br>
&gt;&gt; -<br>
&gt;&gt; -+#if COMPILER(CLANG) &amp;&amp; __clang_major__ &gt;=3D 16<br>
&gt;&gt; -+template &lt;typename E, auto V, typename =3D void&gt;<br>
&gt;&gt; -+inline constexpr bool isEnumConstexprStaticCastValid =3D false;<=
br>
&gt;&gt; -+template &lt;typename E, auto V&gt;<br>
&gt;&gt; -+inline constexpr bool isEnumConstexprStaticCastValid&lt;E, V, st=
d::void_t&lt;std::integral_constant&lt;E, static_cast&lt;E&gt;(V)&gt;&gt;&g=
t; =3D true;<br>
&gt;&gt; -+#else<br>
&gt;&gt; -+template &lt;typename, auto&gt;<br>
&gt;&gt; -+inline constexpr bool isEnumConstexprStaticCastValid =3D true;<b=
r>
&gt;&gt; -+#endif<br>
&gt;&gt; -+<br>
&gt;&gt; - template&lt;typename E&gt;<br>
&gt;&gt; - constexpr std::span&lt;const char&gt; enumTypeNameImpl()<br>
&gt;&gt; - {<br>
&gt;&gt; -@@ -215,6 +225,15 @@ constexpr std::span&lt;const char&gt; enumNa=
me()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0return result;<br>
&gt;&gt; - }<br>
&gt;&gt; -<br>
&gt;&gt; -+template&lt;typename E, auto V&gt;<br>
&gt;&gt; -+constexpr std::span&lt;const char&gt; enumName()<br>
&gt;&gt; -+{<br>
&gt;&gt; -+=C2=A0 =C2=A0 if constexpr (isEnumConstexprStaticCastValid&lt;E,=
 V&gt;)<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return enumName&lt;static_cast&lt;E&=
gt;(V)&gt;();<br>
&gt;&gt; -+=C2=A0 =C2=A0 else<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return { };<br>
&gt;&gt; -+}<br>
&gt;&gt; -+<br>
&gt;&gt; - template&lt;typename E&gt;<br>
&gt;&gt; - constexpr std::underlying_type_t&lt;E&gt; enumNamesMin()<br>
&gt;&gt; - {<br>
&gt;&gt; -@@ -264,7 +283,7 @@ constexpr auto makeEnumNames(std::index_seque=
nce&lt;Is...&gt;)<br>
&gt;&gt; - {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0constexpr auto min =3D enumNamesMin&lt;E&gt;(=
);<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0return std::array&lt;std::span&lt;const char&=
gt;, sizeof...(Is)&gt; {<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 enumName&lt;static_cast&lt;E&gt;(sta=
tic_cast&lt;std::underlying_type_t&lt;E&gt;&gt;(Is) + min)&gt;()...<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 enumName&lt;E, static_cast&lt;std::u=
nderlying_type_t&lt;E&gt;&gt;(Is) + min&gt;()...<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0};<br>
&gt;&gt; - }<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_=
2.48.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.0.bb</a> b/m=
eta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.48.1.bb" rel=3D"noref=
errer" target=3D"_blank">webkitgtk_2.48.1.bb</a><br>
&gt;&gt; similarity index 96%<br>
&gt;&gt; rename from meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2=
.48.0.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.0.bb</a><br>
&gt;&gt; rename to meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.4=
8.1.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.1.bb</a><br>
&gt;&gt; index 6eb80da1de..41fe8209ce 100644<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.48.0.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.0.bb</a><br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.48.1.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.48.1.bb</a><br>
&gt;&gt; @@ -16,11 +16,9 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkit=
gtk.org/releases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"=
_blank">https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-musttail=
-arm.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://t6-not-decl=
ared.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sys_futex.p=
atch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-EnumTraits.h=
-error-no-matching-function-for-call-to-.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Cherry-pick-=
292304-main-7ffc29624258-.-https-bugs.we.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-bu=
ild-errors-on-RISCV-https-bugs.webkit.org-show.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;94904a55cf12d44a4e36ceadafff02d46da7=
3d76be9b4769f34cbfdf0eebf88e&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;98efdf21c4cdca0fe0b73ab5a8cb52093b5a=
a52d9b1b016a93f71dbfa1eb258f&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0inherit cmake pkgconfig gobject-introspection perlnati=
ve features_check upstream-version-is-even gi-docgen<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.40.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#216185): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/216185" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/216185</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1128=
93933/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/112893933/1997914</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt;<br>
</blockquote></div></div>

--000000000000ddbcc7063504bf3d--

