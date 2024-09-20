Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D279ACE8D75
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 10:00:48 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.14507.1726826439413920753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 03:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 6343729B63
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 12:00:28 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.38.23]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sraQo-0vfJtQ0; Fri, 20 Sep 2024 12:00:06 +0200
Date: Fri, 20 Sep 2024 12:01:03 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/4] glib-2.0: update 2.80.4 -> 2.82.1
To: openembedded-core@lists.openembedded.org
Message-Id: <RTV3KS.MYUJCM8NYN353@t-online.de>
In-Reply-To: <17F6EB57A4BE8FF3.4163@lists.openembedded.org>
References: <17F6EB57A4BE8FF3.4163@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-4hQQ1u56M9QqsK41efc0"
X-TOI-EXPURGATEID: 150726::1726826406-12FFB445-18020157/0/0 CLEAN NORMAL
X-TOI-MSGID: b0d77285-29a9-4cb7-8944-d7b569da7cb2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 10:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204734

--=-4hQQ1u56M9QqsK41efc0
Content-Type: text/plain; charset=us-ascii; format=flowed

The NEWS file for glib is not yet up to date. Therefore, no changes 
have been documented.

On Fri, Sep 20 2024 at 11:58:13 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - adjust 0010-Do-not-hardcode-python-path-into-various-tools.patch
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...010-Do-not-hardcode-python-path-into-various-tools.patch | 6 
> +++---
>  ...lib-2.0-initial_2.80.4.bb => glib-2.0-initial_2.82.1.bb} | 0
>  .../glib-2.0/{glib-2.0_2.80.4.bb => glib-2.0_2.82.1.bb}     | 0
>  meta/recipes-core/glib-2.0/glib.inc                         | 4 ++--
>  4 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.80.4.bb => 
> glib-2.0-initial_2.82.1.bb} (100%)
>  rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.4.bb => 
> glib-2.0_2.82.1.bb} (100%)
> 
> diff --git 
> a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch 
> b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
> index 30a6bd4c3a..4609f1fb2b 100644
> --- 
> a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
> +++ 
> b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
> @@ -16,7 +16,7 @@ index 67d3675..4e92a7a 100755
>  --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
>  +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
>  @@ -1,4 +1,4 @@
> --#!/usr/bin/env @PYTHON@
> +-#!@PYTHON@
>  +#!/usr/bin/env python3
> 
>   # GDBus - GLib D-Bus Library
> @@ -26,7 +26,7 @@ index aa5af43..56e8e2e 100755
>  --- a/gobject/glib-genmarshal.in
>  +++ b/gobject/glib-genmarshal.in
>  @@ -1,4 +1,4 @@
> --#!/usr/bin/env @PYTHON@
> +-#!@PYTHON@
>  +#!/usr/bin/env python3
> 
>   # pylint: disable=too-many-lines, missing-docstring, invalid-name
> @@ -36,7 +36,7 @@ index e10b910..4b619f8 100755
>  --- a/gobject/glib-mkenums.in
>  +++ b/gobject/glib-mkenums.in
>  @@ -1,4 +1,4 @@
> --#!/usr/bin/env @PYTHON@
> +-#!@PYTHON@
>  +#!/usr/bin/env python3
> 
>   # If the code below looks horrible and unpythonic, do not panic.
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb 
> b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb 
> b/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
> similarity index 100%
> rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb
> rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
> diff --git a/meta/recipes-core/glib-2.0/glib.inc 
> b/meta/recipes-core/glib-2.0/glib.inc
> index 9e742c4d3b..0855e6eb00 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -221,17 +221,17 @@ SRC_URI = 
> "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
>             file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch 
> <file://0001-fix-datadirname-on-uclibc-linux.patch/> \
>             
> file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch 
> <file://0001-remove-the-warning-about-deprecated-paths-in-schemas.patch/> 
> \
>             
> file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch 
> <file://0001-install-gio-querymodules-as-libexec_program.patch/> \
> -           
> file://0010-Do-not-hardcode-python-path-into-various-tools.patch 
> <file://0010-do-not-hardcode-python-path-into-various-tools.patch/> \
>             
> file://0001-Do-not-write-bindir-into-pkg-config-files.patch 
> <file://0001-do-not-write-bindir-into-pkg-config-files.patch/> \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch 
> <file://0001-meson-run-atomics-test-on-clang-as-well.patch/> \
>             
> file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch 
> <file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch/> 
> \
> +           
> file://0010-Do-not-hardcode-python-path-into-various-tools.patch 
> <file://0010-do-not-hardcode-python-path-into-various-tools.patch/> \
>             file://skip-timeout.patch <file://skip-timeout.patch/> \
>             "
>  SRC_URI:append:class-native = " file://relocate-modules.patch 
> <file://relocate-modules.patch/> \
>                                  
> file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch 
> <file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch/> 
> \
>                                "
> 
> -SRC_URI[sha256sum] = 
> "24e029c5dfc9b44e4573697adf33078a9827c48938555004b3b9096fa4ea034f"
> +SRC_URI[sha256sum] = 
> "478634440bf52ee4ec4428d558787398c0be6b043c521beb308334b3db4489a6"
> 
>  # Find any meson cross files in FILESPATH that are relevant for the 
> current
>  # build (using siteinfo) and add them to EXTRA_OEMESON.
> --
> 2.46.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204733): 
> <https://lists.openembedded.org/g/openembedded-core/message/204733>
> Mute This Topic: <https://lists.openembedded.org/mt/108556023/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-4hQQ1u56M9QqsK41efc0
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>The NEWS file for glib is not yet up to date. Therefore, no changes have been documented.</div></div><div id="geary-quote" dir="auto"><br>On Fri, Sep 20 2024 at 11:58:13 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- adjust 0010-Do-not-hardcode-python-path-into-various-tools.patch

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...010-Do-not-hardcode-python-path-into-various-tools.patch | 6 +++---
 ...lib-2.0-initial_2.80.4.bb =&gt; glib-2.0-initial_2.82.1.bb} | 0
 .../glib-2.0/{glib-2.0_2.80.4.bb =&gt; glib-2.0_2.82.1.bb}     | 0
 meta/recipes-core/glib-2.0/glib.inc                         | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.80.4.bb =&gt; glib-2.0-initial_2.82.1.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.80.4.bb =&gt; glib-2.0_2.82.1.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
index 30a6bd4c3a..4609f1fb2b 100644
--- a/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
+++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path-into-various-tools.patch
@@ -16,7 +16,7 @@ index 67d3675..4e92a7a 100755
 --- a/gio/gdbus-2.0/codegen/gdbus-codegen.in
 +++ b/gio/gdbus-2.0/codegen/gdbus-codegen.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
  
  # GDBus - GLib D-Bus Library
@@ -26,7 +26,7 @@ index aa5af43..56e8e2e 100755
 --- a/gobject/glib-genmarshal.in
 +++ b/gobject/glib-genmarshal.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
  
  # pylint: disable=too-many-lines, missing-docstring, invalid-name
@@ -36,7 +36,7 @@ index e10b910..4b619f8 100755
 --- a/gobject/glib-mkenums.in
 +++ b/gobject/glib-mkenums.in
 @@ -1,4 +1,4 @@
--#!/usr/bin/env @PYTHON@
+-#!@PYTHON@
 +#!/usr/bin/env python3
  
  # If the code below looks horrible and unpythonic, do not panic.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.82.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.82.1.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 9e742c4d3b..0855e6eb00 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -221,17 +221,17 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            <a href="file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch">file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch</a> \
            <a href="file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch">file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch</a> \
            <a href="file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch">file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch</a> \
-           <a href="file://0010-Do-not-hardcode-python-path-into-various-tools.patch">file://0010-Do-not-hardcode-python-path-into-various-tools.patch</a> \
            <a href="file://0001-Do-not-write-bindir-into-pkg-config-files.patch">file://0001-Do-not-write-bindir-into-pkg-config-files.patch</a> \
            <a href="file://0001-meson-Run-atomics-test-on-clang-as-well.patch">file://0001-meson-Run-atomics-test-on-clang-as-well.patch</a> \
            <a href="file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch">file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch</a> \
+           <a href="file://0010-Do-not-hardcode-python-path-into-various-tools.patch">file://0010-Do-not-hardcode-python-path-into-various-tools.patch</a> \
            <a href="file://skip-timeout.patch">file://skip-timeout.patch</a> \
            "
 SRC_URI:append:class-native = " <a href="file://relocate-modules.patch">file://relocate-modules.patch</a> \ 
                                 <a href="file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch">file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch</a> \
                               "
 
-SRC_URI[sha256sum] = "24e029c5dfc9b44e4573697adf33078a9827c48938555004b3b9096fa4ea034f"
+SRC_URI[sha256sum] = "478634440bf52ee4ec4428d558787398c0be6b043c521beb308334b3db4489a6"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
<div>-- 
</div>2.46.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#204733): <a href="https://lists.openembedded.org/g/openembedded-core/message/204733">https://lists.openembedded.org/g/openembedded-core/message/204733</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/108556023/3618223">https://lists.openembedded.org/mt/108556023/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-4hQQ1u56M9QqsK41efc0--


