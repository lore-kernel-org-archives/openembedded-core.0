Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E360BC4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 17:31:55 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.68234.1702661513558653202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 09:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 812151081E
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 18:31:38 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.124]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rEC2D-0icb3Y0; Fri, 15 Dec 2023 18:31:37 +0100
Date: Fri, 15 Dec 2023 18:32:20 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH 2/2] appstream: Upgrade 0.16.3 -> 1.0.0
To: openembedded-core@lists.openembedded.org
Message-Id: <W1YP5S.NKLPKVK34QF62@t-online.de>
In-Reply-To: <17A1118A230686C4.11381@lists.openembedded.org>
References: <20231215173056.2392-1-f_l_k@t-online.de>
	<17A1118A230686C4.11381@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uLJaMvpb8qlfsGMdiKaP"
X-TOI-EXPURGATEID: 150726::1702661497-E626F957-3F59EAFB/0/0 CLEAN NORMAL
X-TOI-MSGID: e0d5ce68-9258-49cb-898b-262f3039810c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 17:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192542

--=-uLJaMvpb8qlfsGMdiKaP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

This update requires libadwaita 1.4.2 and also some backports for=20
gnome-software

On Fri, Dec 15 2023 at 06:30:56 PM +01:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> - remove backport patch
> - update 0001-remove-hardcoded-path.patch
> - fix api-documentation
>=20
> Version 1.0.0
> ~~~~~~~~~~~~~~
> Released: 2023-11-11
>=20
> Notes:
>  * This version breaks API and bumps the SONAME of libappstream!
>    Applications using AppStream will have to be ported to the new API.
>    The 1.0 release is coinstallable with the stable 0.16.x series.
>=20
> Features:
>  * Autoformat C and C++ sources
>  * Remove all deprecated symbols
>  * Drop support for many deprecated AppStream XML features
>  * Use GPtrArray to expose keywords list
>  * Add length argument to raw metadata parsing functions
>  * Add component array container class
>  * Remove named values for display_length relations
>  * Make AsPool only accept/return component boxes
>  * Port all API away from per-entity locale overrides
>  * Reduce appstream.conf to its essentials, make it work on stateless=20
> systems
>  * Hide search engine details from public API
>  * Wrap release entries in AsReleaseList container class
>  * Make AsMetadata handle AsReleaseList objects
>  * Refactor is_satisfied result into new RelationCheckResult class
>  * Add a method to check all relations of a component and get the=20
> result
>  * Add algorithm to score compatibility with a system, add chassis=20
> templates
>  * ascli: Add new check-syscompat command to check chassis=20
> compatibility
>  * Implement environment property for component screenshots
>  * Autogenerate translatable DE and gui-environment-style C arrays
>  * Expose more advanced markup conversion function, update function=20
> names
>  * Allow BLAKE3 and SHA512 checksums for release artifacts
>  * Stop supporting mailto: URLs in <url/> tags
>  * validator: Improve API and simplify it
>  * validator: Parse XML in pedantic mode when validating
>  * validator: Check screenshot environment property
>  * validator: Only apply summary-has-dot-suffix check to untranslated=20
> strings
>  * compose: Allow creating metadata with complete URLs and no base URL
>  * spdx: Add API to retrieve a translated license name from an SPDX ID
>  * qt: Switch to building with Qt6
>  * qt: Make it possible to iterate ComponentBox
>  * qt: Implement AppStream::ComponentBox::erase
>  * qt: Allow concatenating two ComponentBoxes
>  * qt: Allow loading Pool asynchronously
>  * qt: Use ComponentBox/Releases in Qt bindings as well
>  * qt: Add support for the new API to check relation satisfaction
>  * qt: Maintenance and namespace fixes, use cPtr() to get C pointers=20
> everywhere
>  * bundle: Add linglong as a new type of bundle
>  * Add GUI environment IDs for macOS and Microsoft Windows
>  * validator: Check if Release Description is inside description tag
>  * validator: Add validation for content_rating
>  * Add support for building on Win32
>  * win32: change some file/path-related code for portability
>  * Implement the developer element for unique developer IDs
>  * Implement scaling factor for screenshots
>  * component-box: Allow removal of components by-index
>  * Implement support for external references and citations
>  * Implement usertags for release data as well
>  * Move ValueFlags to the context, instead of tieing them to=20
> components
>  * pool: search: Add additional weight for exact substring matches on=20
> names
>  * sysinfo: Add memory size detection support for macOS
>  * Add support for Zstd for on-disk data compression
>  * utils: Make tar unpacker independent of zstd binary presence
>  * Drop Python2 provided tag support
>  * data: Add =E2=80=98Endless=E2=80=99 to the list of desktops
>  * Add NetBSD support
>=20
> Specification:
>  * Drop (most) deprecated information
>  * docs: Clarify environment-based screenshot ordering
>  * Add new  'snapshot' release kind
>  * docs: Build all API documentation with gi-docgen
>  * spec: Document the new "developer" element
>  * spec: Document the "reference" tag for registry references
>  * docs: Add example of YAML for references elements
>  * Allow hyphens in the last segment of a component-ID
>  * docs: Drop outdated information from l10n quickstart guide
>=20
> Bugfixes:
>  * meson: check for docbook xsl stylesheets
>  * Fix tweaking of appstream.pc when building as subproject
>  * Fix crash in asc_l10n_search_translations_qt()
>  * qt: Make Qt6 dependency a system dependency.
>  * meson: do not rely on an exe wrapper
>  * meson: do not -I/usr/include when !stemmer
>  * meson: Prevent building attempts with MSVC
>  * meson: Use an SPDX license indentifier in project(license:)
>  * Add meson overrides
>  * compose: Set lower-cased CID for synthesized components again
>  * compose: Set lower-cased CID in desktop-entry parse function
>  * compose: Honor prefix in font search
>  * compose: Select the correct default icon glyphs for fonts
>  * Don't crash when non-YAML documents are read as YAML
>  * Do not override default-priority when parsing multiple metadata=20
> files
>  * Ensure stemmer always has the right locale and token-search works
>  * Require a more recent libxmlb to avoid crashes
>  * Rename component get_releases to indicate that releases may not be=20
> loaded from the web
>  * Prevent string-id validation functions from matching source=20
> comments
>  * Don't define _POSIX_C_SOURCE when building for NetBSD
>=20
> Miscellaneous:
>  * Explain metainfo-ancient error in more detail
>  * Make sed invocation more portable
>  * Add FreeBSD CI
>  * Allow variable shadowing in C++ code
>  * Drop the catchall as-enums unit
>  * vapi: Drop unneeded metadata
>  * Make AsMetadata return a component box for multiple components
>  * apt: Make item descriptions more human-friendly
>  * Streamline README
>=20
> Contributors:
>  Aleix Pol, Alessandro Astone, Alexander Wilms, Dan Yeaw, Daniel=20
> Drake,
>  Gary Wang, Gleb Popov, Ingo Kl=C3=B6cker, JakobDev, Jeremy Whiting, Kai=20
> Uwe Broulik,
>  Marc-Andr=C3=A9 Lureau, Matthias Klumpp, Philip Withnall, Tao Zuhong,
>  Thomas Klausner, Tristan Partin, and thanks to all translators=20
> mentioned
>  in the respective l10n files!
>=20
> Version 0.16.4
> ~~~~~~~~~~~~~~
> Released: 2023-11-10
>=20
> Features:
>  * Allow hyphens in the last segment of a component-ID
>  * Implement the developer element for unique developer IDs
>  * Add meson overrides
>=20
> Bugfixes:
>  * meson: Prevent building attempts with MSVC
>  * meson: Avoid potentially bad sed backup filename when fixing .pc=20
> file
>=20
> Miscellaneous:
>  * Make sed invocation more portable
>=20
> Contributors:
>  Gleb Popov, Matthias Klumpp, Tristan Partin
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36=20
> -------------------
>  .../0001-remove-hardcoded-path.patch          | 16 +++++----
>  ...appstream_0.16.3.bb =3D> appstream_1.0.0.bb} |  7 ++--
>  3 files changed, 13 insertions(+), 46 deletions(-)
>  delete mode 100644=20
> meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-exe=
-wrapper.patch
>  rename meta/recipes-support/appstream/{appstream_0.16.3.bb =3D>=20
> appstream_1.0.0.bb} (82%)
>=20
> diff --git=20
> a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-e=
xe-wrapper.patch=20
> b/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-e=
xe-wrapper.patch
> deleted file mode 100644
> index d4f2951e7a..0000000000
> ---=20
> a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an-e=
xe-wrapper.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00=20
> 2001
> -From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D=20
> <marcandre.lureau@redhat.com <mailto:marcandre.lureau@redhat.com>>
> -Date: Wed, 26 Jul 2023 23:21:10 +0400
> -Subject: meson: do not rely on an exe wrapper
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com=20
> <mailto:marcandre.lureau@redhat.com>>
> -
> -Upstream-Status: Backport=20
> [<https://github.com/ximion/appstream/commit/79bf322768990b28c29a9d907edc=
ca52ff48e0b8>]
> ----
> - data/meson.build | 7 +++++++
> - 1 file changed, 7 insertions(+)
> -
> -diff --git a/data/meson.build b/data/meson.build
> -index aea0cb25..ec0e434f 100644
> ---- a/data/meson.build
> -+++ b/data/meson.build
> -@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
> - install_data('its/metainfo.loc',
> -               install_dir: join_paths(get_option('datadir'),=20
> 'gettext', 'its'))
> -
> -+# Do not rely on an exe wrapper for rel-info, use the system one in=20
> that case
> -+if meson.is_cross_build()
> -+    dependency('appstream', version: '>=3D' + as_version, native:=20
> true,
> -+               not_found_message: 'Native appstream required for=20
> cross-building')
> -+    ascli_exe =3D find_program('appstreamcli')
> -+endif
> -+
> - # NOTE: We do not translate the release notes on purpose here.
> - # If you do want to give translators a chance to translate them,
> - # ascli news-to-metainfo needs to produce a temporary file to=20
> translate
> ---
> -2.41.0
> -
> diff --git=20
> a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.pat=
ch=20
> b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.pat=
ch
> index 9cbfaca82f..66687a5b89 100644
> ---=20
> a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.pat=
ch
> +++=20
> b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.pat=
ch
> @@ -17,15 +17,19 @@ diff --git a/meson.build b/meson.build
>  index fd0e3373..2f273ada 100644
>  --- a/meson.build
>  +++ b/meson.build
> -@@ -124,7 +124,7 @@ if get_option ('gir')
> -     dependency('gobject-introspection-1.0', version: '>=3D1.56')
> - endif
> -
> --stemmer_inc_dirs =3D include_directories(['/usr/include'])
> -+stemmer_inc_dirs =3D include_directories([''])
> +@@ -185,10 +185,10 @@ endif
> + stemmer_inc_dirs =3D include_directories()
>   if get_option('stemming')
>       stemmer_lib =3D cc.find_library('stemmer', required: true)
> +-    stemmer_inc_dirs =3D include_directories(['/usr/include'])
> ++    stemmer_inc_dirs =3D include_directories([''])
>       if not cc.has_header('libstemmer.h')
> +         if cc.has_header('libstemmer/libstemmer.h')
> +-            stemmer_inc_dirs =3D=20
> include_directories('/usr/include/libstemmer')
> ++            stemmer_inc_dirs =3D include_directories('')
> +         else
> +             error('Unable to find Snowball header "libstemmer.h".=20
> Please ensure libstemmer/Snowball is installed properly in order to=20
> continue.')
> +         endif
>  --
>  2.34.1
>=20
> diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb=20
> b/meta/recipes-support/appstream/appstream_1.0.0.bb
> similarity index 82%
> rename from meta/recipes-support/appstream/appstream_0.16.3.bb
> rename to meta/recipes-support/appstream/appstream_1.0.0.bb
> index bde679e256..3f8bfcd263 100644
> --- a/meta/recipes-support/appstream/appstream_0.16.3.bb
> +++ b/meta/recipes-support/appstream/appstream_1.0.0.bb
> @@ -19,17 +19,16 @@ DEPENDS =3D " \
>      python3-pygments-native \
>  "
>=20
> -inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> +inherit meson gobject-introspection gettext gi-docgen pkgconfig vala
>=20
>  GIR_MESON_OPTION =3D "gir"
> -GTKDOC_MESON_OPTION =3D "apidocs"
> +GIDOCGEN_MESON_OPTION =3D "apidocs"
>=20
>  SRC_URI =3D " \
> =20
> 	https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.=
tar.xz=20
> <https://www.freedesktop.org/software/appstream/releases/AppStream-$%7BPV=
%7D.tar.xz>=20
> \
>  	file://0001-remove-hardcoded-path.patch=20
> <file://0001-remove-hardcoded-path.patch/> \
> -	file://0001-meson-do-not-rely-on-an-exe-wrapper.patch=20
> <file://0001-meson-do-not-rely-on-an-exe-wrapper.patch/> \
>  "
> -SRC_URI[sha256sum] =3D=20
> "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
> +SRC_URI[sha256sum] =3D=20
> "ef23477a380e8b525e92cfa87687f1146b9cef74c641349a1ae11250be5401d0"
>=20
>  S =3D "${WORKDIR}/AppStream-${PV}"
>=20
> --
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192540):=20
> <https://lists.openembedded.org/g/openembedded-core/message/192540>
> Mute This Topic: <https://lists.openembedded.org/mt/103195007/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-uLJaMvpb8qlfsGMdiKaP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>This update requires libadwaita 1.=
4.2 and also some backports for gnome-software</div></div><div id=3D"geary-=
quote" dir=3D"auto"><br>On Fri, Dec 15 2023 at 06:30:56 PM +01:00:00, Marku=
s Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"cite"><div c=
lass=3D"plaintext" style=3D"white-space: break-spaces;">- remove backport p=
atch
- update 0001-remove-hardcoded-path.patch
- fix api-documentation

Version 1.0.0
~~~~~~~~~~~~~~
Released: 2023-11-11

Notes:
 * This version breaks API and bumps the SONAME of libappstream!
   Applications using AppStream will have to be ported to the new API.
   The 1.0 release is coinstallable with the stable 0.16.x series.

Features:
 * Autoformat C and C++ sources
 * Remove all deprecated symbols
 * Drop support for many deprecated AppStream XML features
 * Use GPtrArray to expose keywords list
 * Add length argument to raw metadata parsing functions
 * Add component array container class
 * Remove named values for display_length relations
 * Make AsPool only accept/return component boxes
 * Port all API away from per-entity locale overrides
 * Reduce appstream.conf to its essentials, make it work on stateless syste=
ms
 * Hide search engine details from public API
 * Wrap release entries in AsReleaseList container class
 * Make AsMetadata handle AsReleaseList objects
 * Refactor is_satisfied result into new RelationCheckResult class
 * Add a method to check all relations of a component and get the result
 * Add algorithm to score compatibility with a system, add chassis template=
s
 * ascli: Add new check-syscompat command to check chassis compatibility
 * Implement environment property for component screenshots
 * Autogenerate translatable DE and gui-environment-style C arrays
 * Expose more advanced markup conversion function, update function names
 * Allow BLAKE3 and SHA512 checksums for release artifacts
 * Stop supporting mailto: URLs in &lt;url/&gt; tags
 * validator: Improve API and simplify it
 * validator: Parse XML in pedantic mode when validating
 * validator: Check screenshot environment property
 * validator: Only apply summary-has-dot-suffix check to untranslated strin=
gs
 * compose: Allow creating metadata with complete URLs and no base URL
 * spdx: Add API to retrieve a translated license name from an SPDX ID
 * qt: Switch to building with Qt6
 * qt: Make it possible to iterate ComponentBox
 * qt: Implement AppStream::ComponentBox::erase
 * qt: Allow concatenating two ComponentBoxes
 * qt: Allow loading Pool asynchronously
 * qt: Use ComponentBox/Releases in Qt bindings as well
 * qt: Add support for the new API to check relation satisfaction
 * qt: Maintenance and namespace fixes, use cPtr() to get C pointers everyw=
here
 * bundle: Add linglong as a new type of bundle
 * Add GUI environment IDs for macOS and Microsoft Windows
 * validator: Check if Release Description is inside description tag
 * validator: Add validation for content_rating
 * Add support for building on Win32
 * win32: change some file/path-related code for portability
 * Implement the developer element for unique developer IDs
 * Implement scaling factor for screenshots
 * component-box: Allow removal of components by-index
 * Implement support for external references and citations
 * Implement usertags for release data as well
 * Move ValueFlags to the context, instead of tieing them to components
 * pool: search: Add additional weight for exact substring matches on names
 * sysinfo: Add memory size detection support for macOS
 * Add support for Zstd for on-disk data compression
 * utils: Make tar unpacker independent of zstd binary presence
 * Drop Python2 provided tag support
 * data: Add =E2=80=98Endless=E2=80=99 to the list of desktops
 * Add NetBSD support

Specification:
 * Drop (most) deprecated information
 * docs: Clarify environment-based screenshot ordering
 * Add new  'snapshot' release kind
 * docs: Build all API documentation with gi-docgen
 * spec: Document the new "developer" element
 * spec: Document the "reference" tag for registry references
 * docs: Add example of YAML for references elements
 * Allow hyphens in the last segment of a component-ID
 * docs: Drop outdated information from l10n quickstart guide

Bugfixes:
 * meson: check for docbook xsl stylesheets
 * Fix tweaking of appstream.pc when building as subproject
 * Fix crash in asc_l10n_search_translations_qt()
 * qt: Make Qt6 dependency a system dependency.
 * meson: do not rely on an exe wrapper
 * meson: do not -I/usr/include when !stemmer
 * meson: Prevent building attempts with MSVC
 * meson: Use an SPDX license indentifier in project(license:)
 * Add meson overrides
 * compose: Set lower-cased CID for synthesized components again
 * compose: Set lower-cased CID in desktop-entry parse function
 * compose: Honor prefix in font search
 * compose: Select the correct default icon glyphs for fonts
 * Don't crash when non-YAML documents are read as YAML
 * Do not override default-priority when parsing multiple metadata files
 * Ensure stemmer always has the right locale and token-search works
 * Require a more recent libxmlb to avoid crashes
 * Rename component get_releases to indicate that releases may not be loade=
d from the web
 * Prevent string-id validation functions from matching source comments
 * Don't define _POSIX_C_SOURCE when building for NetBSD

Miscellaneous:
 * Explain metainfo-ancient error in more detail
 * Make sed invocation more portable
 * Add FreeBSD CI
 * Allow variable shadowing in C++ code
 * Drop the catchall as-enums unit
 * vapi: Drop unneeded metadata
 * Make AsMetadata return a component box for multiple components
 * apt: Make item descriptions more human-friendly
 * Streamline README

Contributors:
 Aleix Pol, Alessandro Astone, Alexander Wilms, Dan Yeaw, Daniel Drake,
 Gary Wang, Gleb Popov, Ingo Kl=C3=B6cker, JakobDev, Jeremy Whiting, Kai Uw=
e Broulik,
 Marc-Andr=C3=A9 Lureau, Matthias Klumpp, Philip Withnall, Tao Zuhong,
 Thomas Klausner, Tristan Partin, and thanks to all translators mentioned
 in the respective l10n files!

Version 0.16.4
~~~~~~~~~~~~~~
Released: 2023-11-10

Features:
 * Allow hyphens in the last segment of a component-ID
 * Implement the developer element for unique developer IDs
 * Add meson overrides

Bugfixes:
 * meson: Prevent building attempts with MSVC
 * meson: Avoid potentially bad sed backup filename when fixing .pc file

Miscellaneous:
 * Make sed invocation more portable

Contributors:
 Gleb Popov, Matthias Klumpp, Tristan Partin

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...-meson-do-not-rely-on-an-exe-wrapper.patch | 36 -------------------
 .../0001-remove-hardcoded-path.patch          | 16 +++++----
 ...appstream_0.16.3.bb =3D&gt; appstream_1.0.0.bb} |  7 ++--
 3 files changed, 13 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-support/appstream/appstream/0001-meson-do-=
not-rely-on-an-exe-wrapper.patch
 rename meta/recipes-support/appstream/{appstream_0.16.3.bb =3D&gt; appstre=
am_1.0.0.bb} (82%)

diff --git a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rel=
y-on-an-exe-wrapper.patch b/meta/recipes-support/appstream/appstream/0001-m=
eson-do-not-rely-on-an-exe-wrapper.patch
deleted file mode 100644
index d4f2951e7a..0000000000
--- a/meta/recipes-support/appstream/appstream/0001-meson-do-not-rely-on-an=
-exe-wrapper.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 79bf322768990b28c29a9d907edcca52ff48e0b8 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Marc-Andr=3DC3=3DA9=3D20Lureau?=3D &lt;<a href=3D"mailto=
:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;
-Date: Wed, 26 Jul 2023 23:21:10 +0400
-Subject: meson: do not rely on an exe wrapper
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com">marcandre.lureau@redhat.com</a>&gt;
-
-Upstream-Status: Backport [<a href=3D"https://github.com/ximion/appstream/=
commit/79bf322768990b28c29a9d907edcca52ff48e0b8">https://github.com/ximion/=
appstream/commit/79bf322768990b28c29a9d907edcca52ff48e0b8</a>]
----
- data/meson.build | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/data/meson.build b/data/meson.build
-index aea0cb25..ec0e434f 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -7,6 +7,13 @@ install_data('its/metainfo.its',
- install_data('its/metainfo.loc',
-               install_dir: join_paths(get_option('datadir'), 'gettext', '=
its'))
-=20
-+# Do not rely on an exe wrapper for rel-info, use the system one in that =
case
-+if meson.is_cross_build()
-+    dependency('appstream', version: '&gt;=3D' + as_version, native: true=
,
-+               not_found_message: 'Native appstream required for cross-bu=
ilding')
-+    ascli_exe =3D find_program('appstreamcli')
-+endif
-+
- # NOTE: We do not translate the release notes on purpose here.
- # If you do want to give translators a chance to translate them,
- # ascli news-to-metainfo needs to produce a temporary file to translate
---=20
-2.41.0
-
diff --git a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded=
-path.patch b/meta/recipes-support/appstream/appstream/0001-remove-hardcode=
d-path.patch
index 9cbfaca82f..66687a5b89 100644
--- a/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.p=
atch
+++ b/meta/recipes-support/appstream/appstream/0001-remove-hardcoded-path.p=
atch
@@ -17,15 +17,19 @@ diff --git a/meson.build b/meson.build
 index fd0e3373..2f273ada 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -124,7 +124,7 @@ if get_option ('gir')
-     dependency('gobject-introspection-1.0', version: '&gt;=3D1.56')
- endif
-=20
--stemmer_inc_dirs =3D include_directories(['/usr/include'])
-+stemmer_inc_dirs =3D include_directories([''])
+@@ -185,10 +185,10 @@ endif
+ stemmer_inc_dirs =3D include_directories()
  if get_option('stemming')
      stemmer_lib =3D cc.find_library('stemmer', required: true)
+-    stemmer_inc_dirs =3D include_directories(['/usr/include'])
++    stemmer_inc_dirs =3D include_directories([''])
      if not cc.has_header('libstemmer.h')
+         if cc.has_header('libstemmer/libstemmer.h')
+-            stemmer_inc_dirs =3D include_directories('/usr/include/libste=
mmer')
++            stemmer_inc_dirs =3D include_directories('')
+         else
+             error('Unable to find Snowball header "libstemmer.h". Please =
ensure libstemmer/Snowball is installed properly in order to continue.')
+         endif
 --=20
 2.34.1
=20
diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/reci=
pes-support/appstream/appstream_1.0.0.bb
similarity index 82%
rename from meta/recipes-support/appstream/appstream_0.16.3.bb
rename to meta/recipes-support/appstream/appstream_1.0.0.bb
index bde679e256..3f8bfcd263 100644
--- a/meta/recipes-support/appstream/appstream_0.16.3.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.0.bb
@@ -19,17 +19,16 @@ DEPENDS =3D " \
     python3-pygments-native \
 "
=20
-inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
+inherit meson gobject-introspection gettext gi-docgen pkgconfig vala
=20
 GIR_MESON_OPTION =3D "gir"
-GTKDOC_MESON_OPTION =3D "apidocs"
+GIDOCGEN_MESON_OPTION =3D "apidocs"
=20
 SRC_URI =3D " \
 	<a href=3D"https://www.freedesktop.org/software/appstream/releases/AppStr=
eam-${PV}.tar.xz">https://www.freedesktop.org/software/appstream/releases/A=
ppStream-${PV}.tar.xz</a> \
 	<a href=3D"file://0001-remove-hardcoded-path.patch">file://0001-remove-ha=
rdcoded-path.patch</a> \
-	<a href=3D"file://0001-meson-do-not-rely-on-an-exe-wrapper.patch">file://=
0001-meson-do-not-rely-on-an-exe-wrapper.patch</a> \
 "
-SRC_URI[sha256sum] =3D "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6=
344a2b318b98b1"
+SRC_URI[sha256sum] =3D "ef23477a380e8b525e92cfa87687f1146b9cef74c641349a1a=
e11250be5401d0"
=20
 S =3D "${WORKDIR}/AppStream-${PV}"
=20
<div>--=20
</div>2.43.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#192540): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/192540">https://lists.openembedded.org/g/openembedd=
ed-core/message/192540</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103195007/361=
8223">https://lists.openembedded.org/mt/103195007/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-uLJaMvpb8qlfsGMdiKaP--


