Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6AED47404D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 09:57:20 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so48727494wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 02:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qJOJVmZD6hGMZUYxTwy/jtHjeKww+9FbdAvWsSEODIU=;
	b=ZEv6Csox7jv/yhEwvDm4S0Dv9F1ftnh8C32JV2MJ6/RfD8IdDlPlR+v3xcsmLeCcD6
	YZyZ38McWfeV037dgRDkLZ3JV4+dDkgu4NA5jcVGDhZx0Z2+BkmwZRMl179fEL8rcpdO
	lThpp4r52WkCYZ2du6p0PlUxktHzE0pPpEilFZsOyzQunh1mYLlzuLlqUwtp0wU4mszr
	PTOWC62diAw+MZAxA10sPDFJNnJMurP1LyAExAZZyyUSOqI9pijIX3dPJY6IpRx6O+F6
	uO6Eu1lQUcTSdFF7Z4AfcGvy/KtKCpf0YBJ0izmY9YJWQI/6PQXw3vOZNL2JuNbmxEnh
	OaSQ==
MIME-Version: 1.0
X-Received: by 10.194.90.100 with SMTP id bv4mr13148380wjb.143.1431511041536; 
	Wed, 13 May 2015 02:57:21 -0700 (PDT)
Received: by 10.28.157.193 with HTTP; Wed, 13 May 2015 02:57:21 -0700 (PDT)
In-Reply-To: <1431510111-13714-1-git-send-email-li.zhou@windriver.com>
References: <1431510111-13714-1-git-send-email-li.zhou@windriver.com>
Date: Wed, 13 May 2015 11:57:21 +0200
Message-ID: <CA+chaQfzL=Z5S3bazQ5muLwuHy+o_ciF6i69f67qyFBeAVS0wg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Li Zhou <li.zhou@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/opkg to /var/lib/opkg
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
X-List-Received-Date: Wed, 13 May 2015 09:57:23 -0000
Content-Type: multipart/alternative; boundary=047d7bfceb061f790b0515f3a379

--047d7bfceb061f790b0515f3a379
Content-Type: text/plain; charset=UTF-8

Please make it respect the variable used in opkg.

On Wed, May 13, 2015 at 11:41 AM, Li Zhou <li.zhou@windriver.com> wrote:

> When update-alternatives is moved from opkg to opkg-utils, a line in
> the file is changed
> from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
> to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
> But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
>  in oe-core build by configuring --with-opkglibdir.
> opkg-utils can't get the var value in opkg, so here change back the
> directory in update-alternatives only.
>
> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> ---
>  ...Change-alternatives-lib-path-from-usr-lib.patch |   36
> ++++++++++++++++++++
>  meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    4 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
>
> diff --git
> a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
> b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
> new file mode 100644
> index 0000000..60d2a1f
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch
> @@ -0,0 +1,36 @@
> +From 5ca5f2f4a6b1bd82a1349542f4541c017cb5c132 Mon Sep 17 00:00:00 2001
> +From: Li Zhou <li.zhou@windriver.com>
> +Date: Wed, 13 May 2015 15:12:10 +0800
> +Subject: [PATCH] opkg-utils: Change alternatives lib path from
> /usr/lib/opkg
> + to /var/lib/opkg
> +
> +When update-alternatives is moved from opkg to opkg-utils, a line in
> +the file is changed
> +from <ad="$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives">
> +to <ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives">.
> +But opkglibdir doesn't equal to "/usr/lib" here, but equal to "/var/lib"
> + in oe-core build by configuring --with-opkglibdir.
> +opkg-utils can't get the var value in opkg, so here change back the
> +directory in update-alternatives only.
> +Upstream-Status: Inappropriate [It is related with oe-core configuration.]
> +Signed-off-by: Li Zhou <li.zhou@windriver.com>
> +---
> + update-alternatives |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/update-alternatives b/update-alternatives
> +index c332309..b08ecc0 100644
> +--- a/update-alternatives
> ++++ b/update-alternatives
> +@@ -21,7 +21,7 @@
> + set -e
> +
> + # admin dir
> +-ad="$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives"
> ++ad="$OPKG_OFFLINE_ROOT/var/lib/opkg/alternatives"
> +
> + usage() {
> +       echo "update-alternatives: $*
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> index 2800a5d..68d9a19 100644
> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> @@ -10,7 +10,9 @@ PROVIDES += "virtual/update-alternatives"
>  SRCREV = "53274f087565fd45d8452c5367997ba6a682a37a"
>  PV = "0.1.8+git${SRCPV}"
>
> -SRC_URI = "git://git.yoctoproject.org/opkg-utils"
> +SRC_URI = "git://git.yoctoproject.org/opkg-utils \
> +
>  file://0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.patch \
> +"
>
>  S = "${WORKDIR}/git"
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bfceb061f790b0515f3a379
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please make it respect the variable used in opkg.</div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, May 13, 2015=
 at 11:41 AM, Li Zhou <span dir=3D"ltr">&lt;<a href=3D"mailto:li.zhou@windr=
iver.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">When update-alternatives is moved from opkg =
to opkg-utils, a line in<br>
the file is changed<br>
from &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives&quot;&=
gt;<br>
to &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives&quot;&gt;.<b=
r>
But opkglibdir doesn&#39;t equal to &quot;/usr/lib&quot; here, but equal to=
 &quot;/var/lib&quot;<br>
=C2=A0in oe-core build by configuring --with-opkglibdir.<br>
opkg-utils can&#39;t get the var value in opkg, so here change back the<br>
directory in update-alternatives only.<br>
<br>
Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou=
@windriver.com</a>&gt;<br>
---<br>
=C2=A0...Change-alternatives-lib-path-from-usr-lib.patch |=C2=A0 =C2=A036 +=
+++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a> |=C2=A0 =C2=A0 4 ++-<br>
=C2=A02 files changed, 39 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-o=
pkg-utils-Change-alternatives-lib-path-from-usr-lib.patch<br>
<br>
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Ch=
ange-alternatives-lib-path-from-usr-lib.patch b/meta/recipes-devtools/opkg-=
utils/opkg-utils/0001-opkg-utils-Change-alternatives-lib-path-from-usr-lib.=
patch<br>
new file mode 100644<br>
index 0000000..60d2a1f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-opkg-utils-Change-al=
ternatives-lib-path-from-usr-lib.patch<br>
@@ -0,0 +1,36 @@<br>
+From 5ca5f2f4a6b1bd82a1349542f4541c017cb5c132 Mon Sep 17 00:00:00 2001<br>
+From: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zhou@windriv=
er.com</a>&gt;<br>
+Date: Wed, 13 May 2015 15:12:10 +0800<br>
+Subject: [PATCH] opkg-utils: Change alternatives lib path from /usr/lib/op=
kg<br>
+ to /var/lib/opkg<br>
+<br>
+When update-alternatives is moved from opkg to opkg-utils, a line in<br>
+the file is changed<br>
+from &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT@opkglibdir@/opkg/alternatives&quot;=
&gt;<br>
+to &lt;ad=3D&quot;$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives&quot;&gt;.<=
br>
+But opkglibdir doesn&#39;t equal to &quot;/usr/lib&quot; here, but equal t=
o &quot;/var/lib&quot;<br>
+ in oe-core build by configuring --with-opkglibdir.<br>
+opkg-utils can&#39;t get the var value in opkg, so here change back the<br=
>
+directory in update-alternatives only.<br>
+Upstream-Status: Inappropriate [It is related with oe-core configuration.]=
<br>
+Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@windriver.com">li.zho=
u@windriver.com</a>&gt;<br>
+---<br>
+ update-alternatives |=C2=A0 =C2=A0 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/update-alternatives b/update-alternatives<br>
+index c332309..b08ecc0 100644<br>
+--- a/update-alternatives<br>
++++ b/update-alternatives<br>
+@@ -21,7 +21,7 @@<br>
+ set -e<br>
+<br>
+ # admin dir<br>
+-ad=3D&quot;$OPKG_OFFLINE_ROOT/usr/lib/opkg/alternatives&quot;<br>
++ad=3D&quot;$OPKG_OFFLINE_ROOT/var/lib/opkg/alternatives&quot;<br>
+<br>
+ usage() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;update-alternatives: $*<br>
+--<br>
+1.7.9.5<br>
+<br>
diff --git a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_=
git.bb" target=3D"_blank">opkg-utils_git.bb</a> b/meta/recipes-devtools/opk=
g-utils/<a href=3D"http://opkg-utils_git.bb" target=3D"_blank">opkg-utils_g=
it.bb</a><br>
index 2800a5d..68d9a19 100644<br>
--- a/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
+++ b/meta/recipes-devtools/opkg-utils/<a href=3D"http://opkg-utils_git.bb"=
 target=3D"_blank">opkg-utils_git.bb</a><br>
@@ -10,7 +10,9 @@ PROVIDES +=3D &quot;virtual/update-alternatives&quot;<br>
=C2=A0SRCREV =3D &quot;53274f087565fd45d8452c5367997ba6a682a37a&quot;<br>
=C2=A0PV =3D &quot;0.1.8+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-utils"=
 target=3D"_blank">git.yoctoproject.org/opkg-utils</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/opkg-utils"=
 target=3D"_blank">git.yoctoproject.org/opkg-utils</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-opkg-utils-Change-alt=
ernatives-lib-path-from-usr-lib.patch \<br>
+&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7bfceb061f790b0515f3a379--
