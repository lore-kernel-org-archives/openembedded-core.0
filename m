Subject: Subject: [PATCHv2] qemuboot: change QB_MEM default strengths
To: openembedded-core@lists.openembedded.org
From: "Brett Warren" <brett.warren@arm.com>
X-Originating-Location: Manchester, England, GB (188.210.212.247)
X-Originating-Platform: Linux Firefox 81
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 08 Oct 2020 03:50:43 -0700
Message-ID: <aNp1.1602154243596831287.CumO@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wrEXzCDpHx0tKIvGwyeP"

--wrEXzCDpHx0tKIvGwyeP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Previously, to satisfy opengl's requirement for at least 512MB
of memory, QB_MEM was overriden by core-image-sato. This made it
impossible for machine configurations to specify their own values,
so this was changed to a default asssignment. To accomodate this,
qemuboot's default assignment of QB_MEM was changed to the week
variant.

Signed-off-by: Brett Warren <brett.warren@arm.com>
---
meta/classes/qemuboot.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
meta/recipes-sato/images/core-image-sato.bb | 2 +-
2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index d8f62ef6ea..8e4ee9e49b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -73,7 +73,7 @@
# IMAGE_CLASSES +=3D "qemuboot"
# See "runqemu help" for more info

-QB_MEM ?=3D "-m 256"
+QB_MEM ??=3D "-m 256"
QB_SERIAL_OPT ?=3D "-serial mon:stdio -serial null"
QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"
QB_DEFAULT_FSTYPE ?=3D "ext4"
diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sa=
to/images/core-image-sato.bb
index 673106eb6d..ec5e2e20fc 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -11,5 +11,5 @@ inherit core-image
TOOLCHAIN_HOST_TASK_append =3D " nativesdk-intltool nativesdk-glib-2.0"
TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext =3D " nativesdk-intltool =
nativesdk-glib-2.0"

-QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "=
-m 256", d)}'
+QB_MEM ?=3D '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", =
"-m 256", d)}'
QB_MEM_qemumips =3D "-m 256"
--
2.17.1

--wrEXzCDpHx0tKIvGwyeP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Previously, to satisfy opengl's requirement for at least 512MB<br />of memo=
ry, QB_MEM was overriden by core-image-sato. This made it<br />impossible f=
or machine configurations to specify their own values,<br />so this was cha=
nged to a default asssignment. To accomodate this,<br />qemuboot's default =
assignment of QB_MEM was changed to the week<br />variant.<br /><br />Signe=
d-off-by: Brett Warren &lt;brett.warren@arm.com&gt;<br />---<br />&nbsp;met=
a/classes/qemuboot.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 +-<br />&nbsp;meta/recipes-sato/ima=
ges/core-image-sato.bb | 2 +-<br />&nbsp;2 files changed, 2 insertions(+), =
2 deletions(-)<br /><br />diff --git a/meta/classes/qemuboot.bbclass b/meta=
/classes/qemuboot.bbclass<br />index d8f62ef6ea..8e4ee9e49b 100644<br />---=
 a/meta/classes/qemuboot.bbclass<br />+++ b/meta/classes/qemuboot.bbclass<b=
r />@@ -73,7 +73,7 @@<br />&nbsp;# IMAGE_CLASSES +=3D "qemuboot"<br />&nbsp=
;# See "runqemu help" for more info<br />&nbsp;<br />-QB_MEM ?=3D "-m 256"<=
br />+QB_MEM ??=3D "-m 256"<br />&nbsp;QB_SERIAL_OPT ?=3D "-serial mon:stdi=
o -serial null"<br />&nbsp;QB_DEFAULT_KERNEL ?=3D "${KERNEL_IMAGETYPE}"<br =
/>&nbsp;QB_DEFAULT_FSTYPE ?=3D "ext4"<br />diff --git a/meta/recipes-sato/i=
mages/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb<br /=
>index 673106eb6d..ec5e2e20fc 100644<br />--- a/meta/recipes-sato/images/co=
re-image-sato.bb<br />+++ b/meta/recipes-sato/images/core-image-sato.bb<br =
/>@@ -11,5 +11,5 @@ inherit core-image<br />&nbsp;TOOLCHAIN_HOST_TASK_appen=
d =3D " nativesdk-intltool nativesdk-glib-2.0"<br />&nbsp;TOOLCHAIN_HOST_TA=
SK_remove_task-populate-sdk-ext =3D " nativesdk-intltool nativesdk-glib-2.0=
"<br />&nbsp;<br />-QB_MEM =3D '${@bb.utils.contains("DISTRO_FEATURES", "op=
engl", "-m 512", "-m 256", d)}'<br />+QB_MEM ?=3D '${@bb.utils.contains("DI=
STRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'<br />&nbsp;QB_MEM_qemumi=
ps =3D "-m 256"<br />-- <br />2.17.1

--wrEXzCDpHx0tKIvGwyeP--
