Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A84C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 11:27:39 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.115430.1669634849751272237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 03:27:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout07.t-online.de (Postfix) with SMTP id B6EBF10B31
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 12:25:57 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozcGq-2sCF040; Mon, 28 Nov 2022 12:25:56 +0100
Date: Mon, 28 Nov 2022 12:25:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: openembedded-core@lists.openembedded.org
Message-Id: <1F22MR.1DLOYQ2GK3OF2@t-online.de>
In-Reply-To: <20221128112232.123025-1-f_l_k@t-online.de>
References: <20221128112232.123025-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-J4zejPo+jvc1IENYmiIv"
X-TOI-EXPURGATEID: 150726::1669634756-4BFF22DC-613105A7/0/0 CLEAN NORMAL
X-TOI-MSGID: a1341b5d-0cc2-4713-a847-86ef14f5c5d7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173907

--=-J4zejPo+jvc1IENYmiIv
Content-Type: text/plain; charset=us-ascii; format=flowed

libsecret dependency has been moved to PACKAGECONFIG since its only 
needed for the 'ssh_agent'

added the ssh_agent service files to FILES:${PN} to avoid an error if 
ssh_agent PACKAGECONFIG is selected:

ERROR: gcr-4.0.0-r0 do_package: QA Issue: gcr: Files/directories were 
installed but not shipped in any package:
  /usr/lib/systemd
  /usr/lib/systemd/user
  /usr/lib/systemd/user/gcr-ssh-agent.socket
  /usr/lib/systemd/user/gcr-ssh-agent.service


Am Mo, 28. Nov 2022 um 12:22:32 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> gcr-3 recipe is still needed for gnome projects that stick to gtk+3, 
> rename to gcr3.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  ...build-fix-one-parallel-build-failure.patch |  0
>  ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
>  .../gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb}     |  8 ++-
>  meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 58 
> +++++++++++++++++++
>  4 files changed, 64 insertions(+), 2 deletions(-)
>  rename meta/recipes-gnome/gcr/{gcr => 
> gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr => 
> gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
>  rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb => gcr3_3.40.0.bb} (87%)
>  create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb
> 
> diff --git 
> a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch 
> b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> similarity index 100%
> rename from 
> meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> rename to 
> meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
> diff --git 
> a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch 
> b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> similarity index 100%
> rename from 
> meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> rename to 
> meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
> diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb 
> b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
> rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> index 917be5938b..5318768db6 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
> +++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
> @@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  inherit gnomebase gtk-icon-cache gtk-doc features_check 
> upstream-version-is-even vala gobject-introspection gettext mime 
> mime-xdg
>  UPSTREAM_CHECK_REGEX = 
> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> 
> -SRC_URI += 
> "file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch 
> <file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch/> \
> -            file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" 
> <file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch/>
> +SRC_URI = " \
> +	https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive 
> <https://download.gnome.org/sources/gcr/3.40/gcr-$%7BPV%7D.tar.xz;name=archive> 
> \
> +	file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch 
> <file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch/> \
> +	file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" 
> <file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch/>
> 
>  SRC_URI[archive.sha256sum] = 
> "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
> 
> +S = "${WORKDIR}/gcr-${PV}"
> +
>  PACKAGECONFIG ??= " \
>  	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'gtk', '', 
> d)} \
>  	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'gtk', 
> '', d)} \
> diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb 
> b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> new file mode 100644
> index 0000000000..4dede60544
> --- /dev/null
> +++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
> @@ -0,0 +1,58 @@
> +SUMMARY = "A library for bits of crypto UI and parsing etc"
> +DESCRIPTION = "GCR is a library for displaying certificates, and 
> crypto UI, \
> +accessing key stores. It also provides the viewer for crypto files 
> on the \
> +GNOME desktop."
> +HOMEPAGE = "<https://gitlab.gnome.org/GNOME/gcr>"
> +BUGTRACKER = "<https://gitlab.gnome.org/GNOME/gcr/issues>"
> +
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605" 
> <file://copying;md5=55ca817ccb7d5b5b66355690e9abc605/>
> +
> +DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
> +           ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('GI_DATA_ENABLED', 'True', 
> 'libxslt-native', '', d)}"
> +
> +CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> +
> +CFLAGS += "-D_GNU_SOURCE"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +GTKDOC_MESON_OPTION = "gtk_doc"
> +inherit gnomebase gtk-icon-cache gtk-doc features_check 
> upstream-version-is-even vala gobject-introspection gettext mime 
> mime-xdg
> +UPSTREAM_CHECK_REGEX = 
> "[^\d\.](?P<pver>\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
> +
> +SRC_URI[archive.sha256sum] = 
> "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
> +
> +PACKAGECONFIG ??= " \
> +	${@bb.utils.filter <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 
> 'systemd', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'gtk', '', 
> d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'gtk', 
> '', d)} \
> +"
> +PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
> +PACKAGECONFIG[ssh_agent] = 
> "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
> +#'Use systemd socket activation for server programs'
> +PACKAGECONFIG[systemd] = 
> "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
> +
> +FILES:${PN} += " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/gcr-4 \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
> +    ${systemd_user_unitdir}/gcr-ssh-agent.service \
> +"
> +
> +# <http://errors.yoctoproject.org/Errors/Details/20229/>
> +ARM_INSTRUCTION_SET:armv4 = "arm"
> +ARM_INSTRUCTION_SET:armv5 = "arm"
> +ARM_INSTRUCTION_SET:armv6 = "arm"
> +
> +EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +gpg2 = '${bindir}/gpg2'
> +EOF
> +}
> +
> +do_configure:prepend() {
> +    sed -i "s|ssh_add_path = find_program('ssh-add', required: 
> get_option('ssh_agent')).full_path()|ssh_add_path = 
> '${bindir}/ssh-add'|" ${S}/meson.build
> +    sed -i "s|ssh_agent_path = find_program('ssh-agent', required: 
> get_option('ssh_agent')).full_path()|ssh_agent_path = 
> '${bindir}/ssh-agent'|" ${S}/meson.build
> +}
> --
> 2.34.1
> 


--=-J4zejPo+jvc1IENYmiIv
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>libsecret dependency has been moved to PACKAGECONFIG since its only needed for the 'ssh_agent'</div><div><br></div><div>added the ssh_agent service files to FILES:${PN} to avoid an error if ssh_agent PACKAGECONFIG is selected:</div><div><br></div><div><div>ERROR: gcr-4.0.0-r0 do_package: QA Issue: gcr: Files/directories were installed but not shipped in any package:</div><div>&nbsp; /usr/lib/systemd</div><div>&nbsp; /usr/lib/systemd/user</div><div>&nbsp; /usr/lib/systemd/user/gcr-ssh-agent.socket</div><div>&nbsp; /usr/lib/systemd/user/gcr-ssh-agent.service</div></div><div><br></div></div><div id="geary-quote" dir="auto"><br>Am Mo, 28. Nov 2022 um 12:22:32 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">gcr-3 recipe is still needed for gnome projects that stick to gtk+3, rename to gcr3.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 ...build-fix-one-parallel-build-failure.patch |  0
 ...1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch |  0
 .../gcr/{gcr_3.40.0.bb =&gt; gcr3_3.40.0.bb}     |  8 ++-
 meta/recipes-gnome/gcr/gcr_4.0.0.bb           | 58 +++++++++++++++++++
 4 files changed, 64 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gcr/{gcr =&gt; gcr3}/0001-gcr-meson.build-fix-one-parallel-build-failure.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr =&gt; gcr3}/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch (100%)
 rename meta/recipes-gnome/gcr/{gcr_3.40.0.bb =&gt; gcr3_3.40.0.bb} (87%)
 create mode 100644 meta/recipes-gnome/gcr/gcr_4.0.0.bb

diff --git a/meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch b/meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
rename to meta/recipes-gnome/gcr/gcr3/0001-gcr-meson.build-fix-one-parallel-build-failure.patch
diff --git a/meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch b/meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
similarity index 100%
rename from meta/recipes-gnome/gcr/gcr/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
rename to meta/recipes-gnome/gcr/gcr3/b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch
diff --git a/meta/recipes-gnome/gcr/gcr_3.40.0.bb b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
similarity index 87%
rename from meta/recipes-gnome/gcr/gcr_3.40.0.bb
rename to meta/recipes-gnome/gcr/gcr3_3.40.0.bb
index 917be5938b..5318768db6 100644
--- a/meta/recipes-gnome/gcr/gcr_3.40.0.bb
+++ b/meta/recipes-gnome/gcr/gcr3_3.40.0.bb
@@ -20,11 +20,15 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
 
-SRC_URI += "<a href="file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch">file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch</a> \ 
-            <a href="file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" "="">file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"</a>
+SRC_URI = " \
+	<a href="https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive">https://download.gnome.org/sources/gcr/3.40/gcr-${PV}.tar.xz;name=archive</a> \
+	<a href="file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch">file://0001-gcr-meson.build-fix-one-parallel-build-failure.patch</a> \
+	<a href="file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch" "="">file://b3ca1d02bb0148ca787ac4aead164d7c8ce2c4d8.patch"</a>
 
 SRC_URI[archive.sha256sum] = "b9d3645a5fd953a54285cc64d4fc046736463dbd4dcc25caf5c7b59bed3027f5"
 
+S = "${WORKDIR}/gcr-${PV}"
+
 PACKAGECONFIG ??= " \
 	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
 	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
diff --git a/meta/recipes-gnome/gcr/gcr_4.0.0.bb b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
new file mode 100644
index 0000000000..4dede60544
--- /dev/null
+++ b/meta/recipes-gnome/gcr/gcr_4.0.0.bb
@@ -0,0 +1,58 @@
+SUMMARY = "A library for bits of crypto UI and parsing etc"
+DESCRIPTION = "GCR is a library for displaying certificates, and crypto UI, \
+accessing key stores. It also provides the viewer for crypto files on the \
+GNOME desktop."
+HOMEPAGE = "<a href="https://gitlab.gnome.org/GNOME/gcr">https://gitlab.gnome.org/GNOME/gcr</a>"
+BUGTRACKER = "<a href="https://gitlab.gnome.org/GNOME/gcr/issues">https://gitlab.gnome.org/GNOME/gcr/issues</a>"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605" "="">file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"</a>
+
+DEPENDS = "p11-kit glib-2.0 libgcrypt gnupg-native \
+           <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
+
+CFLAGS += "-D_GNU_SOURCE"
+
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
+inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
+UPSTREAM_CHECK_REGEX = "[^\d\.](?P&lt;pver&gt;\d+\.(?!9\d+)(\d*[02468])+(\.\d+)+)\.tar"
+
+SRC_URI[archive.sha256sum] = "c45855924f0ee7bab43e2dd38bfafd2ac815c6e9864341c0161e171173dcec7c"
+
+PACKAGECONFIG ??= " \
+	<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'systemd', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'gtk', '', d)} \
+"
+PACKAGECONFIG[gtk] = "-Dgtk4=true,-Dgtk4=false,gtk4"
+PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret,openssh"
+#'Use systemd socket activation for server programs'
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
+
+FILES:${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/gcr-4 \
+    ${systemd_user_unitdir}/gcr-ssh-agent.socket \
+    ${systemd_user_unitdir}/gcr-ssh-agent.service \
+"
+
+# <a href="http://errors.yoctoproject.org/Errors/Details/20229/">http://errors.yoctoproject.org/Errors/Details/20229/</a>
+ARM_INSTRUCTION_SET:armv4 = "arm"
+ARM_INSTRUCTION_SET:armv5 = "arm"
+ARM_INSTRUCTION_SET:armv6 = "arm"
+
+EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
+do_write_config:append() {
+    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
+[binaries]
+gpg2 = '${bindir}/gpg2'
+EOF
+}
+
+do_configure:prepend() {
+    sed -i "s|ssh_add_path = find_program('ssh-add', required: get_option('ssh_agent')).full_path()|ssh_add_path = '${bindir}/ssh-add'|" ${S}/meson.build
+    sed -i "s|ssh_agent_path = find_program('ssh-agent', required: get_option('ssh_agent')).full_path()|ssh_agent_path = '${bindir}/ssh-agent'|" ${S}/meson.build
+}
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-J4zejPo+jvc1IENYmiIv--


