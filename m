Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20238.1792666218980227653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=20sd00Lq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D99C2C58472;
	Thu, 22 Oct 2026 10:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FCD260360;
	Thu, 22 Oct 2026 10:50:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD8D510328E3D;
	Thu, 22 Oct 2026 12:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792666215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=SCVzjq7AiVdidgsvGsdF6lZWZU9RT5aqHQ5NJabarT4=;
	b=20sd00LqmBN6JspvKc9NX+60q8p8+EJMFhhLdFer2ZNjpexcWlkWpkIboINewoDLi83IjQ
	fr0+JsO+S4j1E71C81rLrmaf5GUjfhV6IxoqjT6k4Y+scNt2pZM58xXS9jl7S05IRt3XZK
	amWD6R2eNHHWq8+CXEKxGVdRF28NqMCaQ3OWnfbgoNaF0sIQWecfLe8QAwOObpEVRIlRmN
	cZsAkWqVq9lXjdaqU5M5zCLLB/nzT/WGHoDV4bBs8lZTfnyalDBFCh8TG6HcQ2WyEDttvQ
	ljZorE9fVNrBgO+XH2+S/5pKLKJ+ygp75jh3sIIq+H3H2SDjwcPr2u6PW0usTw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 12:50:14 +0200
Message-Id: <DMBB4XP04OIS.1XC5GWKFMTVFV@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Subject: Fwd: [OE-core] [PATCH] image, populate_sdk_base: warn on ';' in
 *_COMMAND function lists
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248439

Hi Bruce,

I just wanted to let you know, this patch will add warnings on meta-virt
once merged:

Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta=
-virtualization/recipes-containers/images/app-container-curl.bb: ROOTFS_POS=
TPROCESS_COMMAND contains ';' but is a space separated list of functions, r=
emove the ';' delimiters or the functions will not be part of the task sign=
ature: set_user_group rootfs_fixup_var_volatile ;  zap_empty_root_password =
     rootfs_update_timestamp   write_image_test_data  set_systemd_default_t=
arget systemd_sysusers_check systemd_handle_machine_id empty_var_volatile  =
tidy_shadowutils_files add_empty_root_password_note rootfs_reproducible
WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/re=
cipes-containers/images/app-container-mosquitto.bb: ROOTFS_POSTPROCESS_COMM=
AND contains ';' but is a space separated list of functions, remove the ';'=
 delimiters or the functions will not be part of the task signature: set_us=
er_group rootfs_fixup_var_volatile ;  zap_empty_root_password      rootfs_u=
pdate_timestamp   write_image_test_data  set_systemd_default_target systemd=
_sysusers_check systemd_handle_machine_id empty_var_volatile  tidy_shadowut=
ils_files add_empty_root_password_note rootfs_reproducible
WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/re=
cipes-containers/images/app-container-python.bb: ROOTFS_POSTPROCESS_COMMAND=
 contains ';' but is a space separated list of functions, remove the ';' de=
limiters or the functions will not be part of the task signature: set_user_=
group rootfs_fixup_var_volatile ;  zap_empty_root_password      rootfs_upda=
te_timestamp   write_image_test_data  set_systemd_default_target systemd_sy=
susers_check systemd_handle_machine_id empty_var_volatile  tidy_shadowutils=
_files add_empty_root_password_note rootfs_reproducible
WARNING: /srv/pokybuild/yocto-worker/meta-virt/build/meta-virtualization/re=
cipes-containers/images/app-container-valkey.bb: ROOTFS_POSTPROCESS_COMMAND=
 contains ';' but is a space separated list of functions, remove the ';' de=
limiters or the functions will not be part of the task signature: set_user_=
group rootfs_fixup_var_volatile ;  zap_empty_root_password      rootfs_upda=
te_timestamp   write_image_test_data  set_systemd_default_target systemd_sy=
susers_check systemd_handle_machine_id empty_var_volatile  tidy_shadowutils=
_files add_empty_root_password_note rootfs_reproducible  rootfs_install_ent=
rypoint_sh ;
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4690

Thanks,
Mathieu

Forwarded message from Etienne Cordonnier via lists.openembedded.org on Wed=
 Oct 21, 2026 at 2:05 PM:
From: Etienne Cordonnier <ecordonnier@snap.com>

Since c3365dfd9ddd ("classes: Drop ';' delimiter from ROOTFS/IMAGE*COMMAND
variables") these variables are space separated function lists, used as
vardeps of themselves. A stray ';' is still tolerated when the list is
executed, but at parse time "func;" names no variable, so the function is
not part of the do_rootfs/do_image/do_populate_sdk signature and a stale
rootfs or SDK can be reused from sstate.

Warn when a variable from rootfs_command_variables() or
sdk_command_variables() contains ';'. Tested by adding "foo;" entries and
checking the warning, and that stock core-image-minimal parses without it.

AI-Generated: Uses Claude Code (claude-sonnet-5-5)
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/image.bbclass             | 7 ++++++-
 meta/classes-recipe/populate_sdk_base.bbclass | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.=
bbclass
index 460e5ab39f..1e3c784ec9 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -127,7 +127,12 @@ def rootfs_command_variables(d):
 python () {
     variables =3D rootfs_command_variables(d)
     for var in variables:
-        d.setVarFlag(var, 'vardeps', d.getVar(var))
+        value =3D d.getVar(var)
+        if value and ';' in value:
+            bb.warn("%s contains ';' but is a space separated list of func=
tions, "
+                    "remove the ';' delimiters or the functions will not b=
e part "
+                    "of the task signature: %s" % (var, value.strip()))
+        d.setVarFlag(var, 'vardeps', value)
 }
=20
 def rootfs_variables(d):
diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-r=
ecipe/populate_sdk_base.bbclass
index 2c6dd1828c..0d67ab6ac6 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -423,7 +423,12 @@ do_populate_sdk[vardeps] +=3D "${@sdk_variables(d)}"
 python () {
     variables =3D sdk_command_variables(d)
     for var in variables:
-        d.setVarFlag(var, 'vardeps', d.getVar(var))
+        value =3D d.getVar(var)
+        if value and ';' in value:
+            bb.warn("%s contains ';' but is a space separated list of func=
tions, "
+                    "remove the ';' delimiters or the functions will not b=
e part "
+                    "of the task signature: %s" % (var, value.strip()))
+        d.setVarFlag(var, 'vardeps', value)
 }
=20
 do_populate_sdk[file-checksums] +=3D "${TOOLCHAIN_SHAR_REL_TMPL}:True \
--=20
2.43.0





--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

