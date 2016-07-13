Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 589426067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 10:25:32 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id 38so42050212iol.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bckowzOEsqrqmGMNOBb0yynAuhhIScsnqU9aSvr6LNw=;
	b=edVgM1BnV05voYt+GamMVy+qF3+q1grUfscIsT88fTu80IQggdi4aY20kLFq0QAJxK
	zxAbUxtfvUaANMBRKMtLATlopX5kKF9HgEgS5PPoxCQxLRArqoiP8gqa4/hOiBpvbUo8
	xgRm6UYxESYBkYupLPFz8uCgzH58eSqv7RmxSgyRSrv6hH2Wm8FfoSPxTWuM8lI4kf6i
	ie1E4MVemoJ5d3QFwacTEAHPPiKbZPumMSCTlywgUkFD17vsBn2McIz5w26D+M6iedOc
	qXq6n9dA4aHL3m3eTX/F/KFl4WCDp2iDDmS6kd53ULOm2K9t/PArZ80s/AVenTPpboZh
	CYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bckowzOEsqrqmGMNOBb0yynAuhhIScsnqU9aSvr6LNw=;
	b=ISbwP1TQcy4tjqmjlps7S3g7yYjWCNl+iiCSh9vuO7OW8K9HGh0j2oWcSsGws2EAD2
	ZpW+zeE3e7RbLxssoPCh3dVZWpdGe56ViOaZwXLMQL1nu/YGg5CBvlrlApAvO2IRXYEu
	2iGMoWynzgCT81B2whgJ7RwPIbI6qpqrn9VlzFwv/Kn5ocaSuk7TbrOWUwAVvb1VzqMV
	7i//xSEDEPkmjgnVI76WP+sL6X+pEfU+U8WWktubqj1UboYUyFNbXbgPxjTWswvwH5jD
	5BUFCWCMMxF3WQNJzmsNkEmQXVs5ObZpOnmbEpI3MdtuPLFXXxz2J34wY7gVzOtTZS51
	Ujzw==
X-Gm-Message-State: ALyK8tLN5DKcl6lFXJ08u4Z0Gh1G/Dpl+XXBSpUlWdZJT9AM9gor/9VW5ZlDKZEncJP2L0BE8QUnYwAldlhxaIF+
X-Received: by 10.107.135.142 with SMTP id r14mr8586702ioi.133.1468405533495; 
	Wed, 13 Jul 2016 03:25:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 13 Jul 2016 03:25:14 -0700 (PDT)
In-Reply-To: <1468405379-2760-1-git-send-email-git@andred.net>
References: <1468405152-1725-1-git-send-email-git@andred.net>
	<1468405379-2760-1-git-send-email-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Jul 2016 11:25:14 +0100
Message-ID: <CAJTo0LZ1=6rf-6=9AgCy8gZky2gPcZNJSs+xtE+p7biirjdfGw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] opkg: backport patch to fix build when sha256 support is enabled
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
X-List-Received-Date: Wed, 13 Jul 2016 10:25:33 -0000
Content-Type: multipart/alternative; boundary=001a113eccbc35ddbd053781ce16

--001a113eccbc35ddbd053781ce16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

That was quicker than I was expecting, thanks :)

On 13 July 2016 at 11:22, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
>  ...-implicit-declaration-of-release_get_sha2.patch | 78
> ++++++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.3.2.bb           |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644
> meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-of-=
release_get_sha2.patch
>
> diff --git
> a/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-o=
f-release_get_sha2.patch
> b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-o=
f-release_get_sha2.patch
> new file mode 100644
> index 0000000..57f5fe8
> --- /dev/null
> +++
> b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration-o=
f-release_get_sha2.patch
> @@ -0,0 +1,78 @@
> +From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D <ad@andred.net>
> +Date: Fri, 24 Jun 2016 13:18:52 +0100
> +Subject: [PATCH] release: fix implicit declaration of release_get_sha256=
()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +| ../../opkg-0.3.2/libopkg/release.c: In function =E2=80=98release_verif=
y_file=E2=80=99:
> +| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: implicit
> declaration of function =E2=80=98release_get_sha256=E2=80=99
> [-Wimplicit-function-declaration]
> +|      const char *sha256 =3D release_get_sha256(release, pathname);
> +|                           ^
> +| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: initialization
> makes pointer from integer without a cast [-Wint-conversion]
> +| ../../opkg-0.3.2/libopkg/release.c: At top level:
> +| ../../opkg-0.3.2/libopkg/release.c:324:13: error: conflicting types fo=
r
> =E2=80=98release_get_sha256=E2=80=99
> +|  const char *release_get_sha256(release_t * release, const char
> *pathname)
> +|              ^
> +| ../../opkg-0.3.2/libopkg/release.c:120:26: note: previous implicit
> declaration of =E2=80=98release_get_sha256=E2=80=99 was here
> +|      const char *sha256 =3D release_get_sha256(release, pathname);
> +|                           ^
> +
> +At the same time, make it static, too, similar to
> +release_get_md5().
> +
> +Signed-off-by: Andr=C3=A9 Draszik <adraszik@tycoint.com>
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +---
> +Upstream-Status: Backport
> +
> + libopkg/release.c | 28 ++++++++++++++--------------
> + 1 file changed, 14 insertions(+), 14 deletions(-)
> +
> +diff --git a/libopkg/release.c b/libopkg/release.c
> +index b6aceb4..7db0bd4 100644
> +--- a/libopkg/release.c
> ++++ b/libopkg/release.c
> +@@ -109,6 +109,20 @@ static const char *release_get_md5(release_t *
> release, const char *pathname)
> +     return '\0';
> + }
> +
> ++#ifdef HAVE_SHA256
> ++static const char *release_get_sha256(release_t * release, const char
> *pathname)
> ++{
> ++    const cksum_t *cksum;
> ++
> ++    if (release->sha256sums) {
> ++        cksum =3D cksum_list_find(release->sha256sums, pathname);
> ++        return cksum->value;
> ++    }
> ++
> ++    return '\0';
> ++}
> ++#endif
> ++
> + int release_verify_file(release_t * release, const char *file_name,
> +                         const char *pathname)
> + {
> +@@ -319,17 +333,3 @@ int release_download(release_t * release, pkg_src_t
> * dist, char *lists_dir,
> +
> +     return ret;
> + }
> +-
> +-#ifdef HAVE_SHA256
> +-const char *release_get_sha256(release_t * release, const char *pathnam=
e)
> +-{
> +-    const cksum_t *cksum;
> +-
> +-    if (release->sha256sums) {
> +-        cksum =3D cksum_list_find(release->sha256sums, pathname);
> +-        return cksum->value;
> +-    }
> +-
> +-    return '\0';
> +-}
> +-#endif
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.3.2.bb
> b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
> index 0251b7d..5731939 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.3.2.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.3.2.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://opkg-configure.service \
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +
>  file://0001-release-fix-implicit-declaration-of-release_get_sha2.patch \
>  "
>
>  SRC_URI[md5sum] =3D "b2cc1baa89d0b3d49e63ab002fd2e0a6"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113eccbc35ddbd053781ce16
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That was quicker than I was expecting, thanks :)</div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 13 July 2016 at 11=
:22, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.=
net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:=
git@andred.net">git@andred.net</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0...-implicit-declaration-of-release_get_sha2.patch | 78 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 79 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/0001-release-fix-i=
mplicit-declaration-of-release_get_sha2.patch<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-decl=
aration-of-release_get_sha2.patch b/meta/recipes-devtools/opkg/opkg/0001-re=
lease-fix-implicit-declaration-of-release_get_sha2.patch<br>
new file mode 100644<br>
index 0000000..57f5fe8<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/0001-release-fix-implicit-declaration=
-of-release_get_sha2.patch<br>
@@ -0,0 +1,78 @@<br>
+From 3fe6c043f5d62710f86ca92692b02f4ffd3bb5c9 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Andr=3DC3=3DA9=3D20Draszik?=3D &lt;<a href=3D"mailto:ad@=
andred.net">ad@andred.net</a>&gt;<br>
+Date: Fri, 24 Jun 2016 13:18:52 +0100<br>
+Subject: [PATCH] release: fix implicit declaration of release_get_sha256()=
<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+| ../../opkg-0.3.2/libopkg/release.c: In function =E2=80=98release_verify_=
file=E2=80=99:<br>
+| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: implicit declaration=
 of function =E2=80=98release_get_sha256=E2=80=99 [-Wimplicit-function-decl=
aration]<br>
+|=C2=A0 =C2=A0 =C2=A0 const char *sha256 =3D release_get_sha256(release, p=
athname);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+| ../../opkg-0.3.2/libopkg/release.c:120:26: warning: initialization makes=
 pointer from integer without a cast [-Wint-conversion]<br>
+| ../../opkg-0.3.2/libopkg/release.c: At top level:<br>
+| ../../opkg-0.3.2/libopkg/release.c:324:13: error: conflicting types for =
=E2=80=98release_get_sha256=E2=80=99<br>
+|=C2=A0 const char *release_get_sha256(release_t * release, const char *pa=
thname)<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>
+| ../../opkg-0.3.2/libopkg/release.c:120:26: note: previous implicit decla=
ration of =E2=80=98release_get_sha256=E2=80=99 was here<br>
+|=C2=A0 =C2=A0 =C2=A0 const char *sha256 =3D release_get_sha256(release, p=
athname);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
+<br>
+At the same time, make it static, too, similar to<br>
+release_get_md5().<br>
+<br>
+Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:adraszik@tycoint.c=
om">adraszik@tycoint.com</a>&gt;<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com">alejandro.delcastillo@ni.com</a>&gt;<br>
+---<br>
+Upstream-Status: Backport<br>
+<br>
+ libopkg/release.c | 28 ++++++++++++++--------------<br>
+ 1 file changed, 14 insertions(+), 14 deletions(-)<br>
+<br>
+diff --git a/libopkg/release.c b/libopkg/release.c<br>
+index b6aceb4..7db0bd4 100644<br>
+--- a/libopkg/release.c<br>
++++ b/libopkg/release.c<br>
+@@ -109,6 +109,20 @@ static const char *release_get_md5(release_t * releas=
e, const char *pathname)<br>
+=C2=A0 =C2=A0 =C2=A0return &#39;\0&#39;;<br>
+ }<br>
+<br>
++#ifdef HAVE_SHA256<br>
++static const char *release_get_sha256(release_t * release, const char *pa=
thname)<br>
++{<br>
++=C2=A0 =C2=A0 const cksum_t *cksum;<br>
++<br>
++=C2=A0 =C2=A0 if (release-&gt;sha256sums) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cksum =3D cksum_list_find(release-&gt;sha256s=
ums, pathname);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cksum-&gt;value;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 return &#39;\0&#39;;<br>
++}<br>
++#endif<br>
++<br>
+ int release_verify_file(release_t * release, const char *file_name,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const char *pathname)<br>
+ {<br>
+@@ -319,17 +333,3 @@ int release_download(release_t * release, pkg_src_t *=
 dist, char *lists_dir,<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0return ret;<br>
+ }<br>
+-<br>
+-#ifdef HAVE_SHA256<br>
+-const char *release_get_sha256(release_t * release, const char *pathname)=
<br>
+-{<br>
+-=C2=A0 =C2=A0 const cksum_t *cksum;<br>
+-<br>
+-=C2=A0 =C2=A0 if (release-&gt;sha256sums) {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cksum =3D cksum_list_find(release-&gt;sha256s=
ums, pathname);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return cksum-&gt;value;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 return &#39;\0&#39;;<br>
+-}<br>
+-#endif<br>
+--<br>
+2.8.1<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.3.2.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.3.2.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.3.2.bb</a><br>
index 0251b7d..5731939 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.2.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.3.2.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.3.2.bb</a><br>
@@ -15,6 +15,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoprojec=
t.org/releases/${BPN}/${BPN}-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz<=
/a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg-configure.service \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-release-fix-implicit-=
declaration-of-release_get_sha2.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;b2cc1baa89d0b3d49e63ab002fd2e0a6&quot;<br>
--<br>
2.8.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br></div>

--001a113eccbc35ddbd053781ce16--
