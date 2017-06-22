Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 37F3F77E50
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 22:19:48 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id c11so41731616wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=SD+2pamrZHWrjjphwhyytitW27ED/pdP6ZeQ/KcyPQE=;
	b=TlRlVZPdNCcXLIq+4jj4u9/ch8Vhm0Q/WIFT3GJWILj5N2h+gozMs/gzqwhBihWPmS
	HYAxsGN1eNZovaRiEmLsKXO/6RJGEOne7cKFYa9SoyuucH46gIv9aNZA77Zw6xj6nw6z
	OInK6x1O44REdZrpEbgPbkrs2/FwqQALF1e+giIiKELi2Yv+LnZeoDwMGaLtyTDGZp9+
	svBSFmalWghXpRuuSkDyAGslaBfbMv69JK6JQxvtKRodCSOwT+jWT8ohhSZeeSftDwFk
	a8x9ybowInZEXMOasnY4z7gPkbiHqeNaXIr5jOiZWx4+vrwjeYJKkPTms9ZHUi7D5Qnr
	bGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=SD+2pamrZHWrjjphwhyytitW27ED/pdP6ZeQ/KcyPQE=;
	b=iaXTuxX6af/M9A+IT/b6uQUaSksTGecDLGGD4+dZSOamwEA9ZFZA4CzQuvsMGxXSLb
	6yH16eMV5hd9MxYsOjXOkeTYnyZ5Pu5vg1CxYuSVhdGLRksY0VG0EiO+uRwh6bpXnPze
	mFHEDeYRwa/nvIZzEXDJimai6ciGEeH1+FIAOOe9Agm+Owm/+o9QolUn9o1EcV7pZt51
	+RC1tiBJCiIOC33FoVNgv2by4b/AvV1DofDOUh4EIQSjLqqu2E2LwTF/5beGqixMmfF6
	9ljWP+9FCsC7WEXYr7XAtuCFnJOhm1pUhtxtz/2Kpxg8IGG7JoekjLY6UcU3imYvcBgb
	VetA==
X-Gm-Message-State: AKS2vOz19I8pS0XrSkooa7vl4PItpT3lkRIgl8j1vUmNniFvLpBTiyrT
	LDfqZLZQ4lDJnuOEkQd7snPjv6PS9g==
X-Received: by 10.80.154.129 with SMTP id p1mr4020805edb.131.1498169989629;
	Thu, 22 Jun 2017 15:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <1498093514-5501-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1498093514-5501-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Jun 2017 22:19:37 +0000
Message-ID: <CAMKF1srN1h3fU9ko=jVNfQCe-D_H6D1z721VGyBdBXcz9zb39Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	zhengrq <zhengrq.fnst@cn.fujitsu.com>
Subject: Re: [PATCH v2] (jethro) rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Thu, 22 Jun 2017 22:19:49 -0000
Content-Type: multipart/alternative; boundary="f403045c27740b8f12055293e2ba"

--f403045c27740b8f12055293e2ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2017 at 9:06 PM zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote=
:

> Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug
>
> When use bitbake to build a SRPM package, some sections of SRPM can't be
> displayed normally.
> For example:
> $ rpm -qpi zlib-1.2.8-r0.src.rpm
> warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID
> e64962a6: NOKEY
> Name        : zlib
> Version     : 1.2.8
> Release     : r0
> Architecture: i586
> Install Date: (not installed)
> Group       : =EF=BA=A9
> Size        : 633007
> License     : Zlib
> Signature   : DSA/SHA1, 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=8238=
=E5=88=8603=E7=A7=92, Key ID bc5e0520e64962a6
> Source RPM  : (none)
> Build Date  : 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=8238=E5=88=860=
3=E7=A7=92
> Build Host  : force
> Relocations : (not relocatable)
> Packager    : Poky <poky@yoctoproject.org>
> URL         : http://zlib.net/
> Summary     : =C2=A8=C2=AF
> Description :


We need to get rid of special chsrtacters in commit message

>
> =EF=BA=A9
>
> Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../0001-Fix-the-Bug-of-SRPM-String-error.patch    | 48
> ++++++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.patch
>
> diff --git
> a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.pat=
ch
> b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.pat=
ch
> new file mode 100644
> index 0000000..b962617
> --- /dev/null
> +++
> b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.pat=
ch
> @@ -0,0 +1,48 @@
> +Subject: [PATCH] Fix the Bug of SRPM String error
> +
> +Upstream-Status: Pending
> +$ rpm -qpi zlib-1.2.8-r0.src.rpm
> +warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID
> e64962a6: NOKEY
> +Name        : zlib
> +Version     : 1.2.8
> +Release     : r0
> +Architecture: i586
> +Install Date: (not installed)
> +Group       : =EF=BA=A9
> +Size        : 633007
> +License     : Zlib
> +Signature   : DSA/SHA1, 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=823=
8=E5=88=8603=E7=A7=92, Key ID bc5e0520e64962a6
> +Source RPM  : (none)
> +Build Date  : 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=8238=E5=88=86=
03=E7=A7=92
> +Build Host  : force
> +Relocations : (not relocatable)
> +Packager    : Poky <poky@yoctoproject.org>
> +URL         : http://zlib.net/
> +Summary     : =C2=A8=C2=AF
> +Description :
> +=EF=BA=A9
> +
> +Signed-off-by: zhengrq <zhengrq.fnst@cn.fujitsu.com>
> +---
> + rpmdb/tagname.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c
> +index cfd1459..dbcafd1 100644
> +--- a/rpmdb/tagname.c
> ++++ b/rpmdb/tagname.c
> +@@ -518,9 +518,9 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, size_t
> dbiNTags)
> + void tagTypeValidate(HE_t he);
> + void tagTypeValidate(HE_t he)
> + {
> +-    /* XXX Re-map RPM_I18NSTRING_TYPE -> RPM_STRING_TYPE */
> ++    /* XXX RPM_I18NSTRING_TYPE is treated as strings. */
> +     if (he->t =3D=3D RPM_I18NSTRING_TYPE)
> +-      he->t =3D RPM_STRING_TYPE;
> ++      return;
> +
> +     /* XXX Arbitrary tags are always strings. */
> +     if ((he->tag & 0x40000000)
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> index 73b3734..f8bdfe9 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
> @@ -100,6 +100,7 @@ SRC_URI =3D "
> http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
>            file://rpm-macros.in-disable-external-key-server.patch \
>            file://rpm-opendb-before-verifyscript-to-avoid-null-point.patc=
h
> \
>            file://configure.ac-check-for-both-gpg2-and-gpg.patch \
> +          file://0001-Fix-the-Bug-of-SRPM-String-error.patch \
>           "
>
>  # Uncomment the following line to enable platform score debugging
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045c27740b8f12055293e2ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Jun 21, 2017 =
at 9:06 PM zhengrq &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com">zheng=
rq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug<=
br>
<br>
When use bitbake to build a SRPM package, some sections of SRPM can&#39;t b=
e displayed normally.<br>
For example:<br>
$ rpm -qpi zlib-1.2.8-r0.src.rpm<br>
warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e64962=
a6: NOKEY<br>
Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 : zlib<br>
Version=C2=A0 =C2=A0 =C2=A0: 1.2.8<br>
Release=C2=A0 =C2=A0 =C2=A0: r0<br>
Architecture: i586<br>
Install Date: (not installed)<br>
Group=C2=A0 =C2=A0 =C2=A0 =C2=A0: =EF=BA=A9<br>
Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 633007<br>
License=C2=A0 =C2=A0 =C2=A0: Zlib<br>
Signature=C2=A0 =C2=A0: DSA/SHA1, 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=
=99=8238=E5=88=8603=E7=A7=92, Key ID bc5e0520e64962a6<br>
Source RPM=C2=A0 : (none)<br>
Build Date=C2=A0 : 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=8238=E5=88=
=8603=E7=A7=92<br>
Build Host=C2=A0 : force<br>
Relocations : (not relocatable)<br>
Packager=C2=A0 =C2=A0 : Poky &lt;<a href=3D"mailto:poky@yoctoproject.org" t=
arget=3D"_blank">poky@yoctoproject.org</a>&gt;<br>
URL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: <a href=3D"http://zlib.net/" rel=3D"=
noreferrer" target=3D"_blank">http://zlib.net/</a><br>
Summary=C2=A0 =C2=A0 =C2=A0: =C2=A8=C2=AF<br>
Description :</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">We =
need to get rid of special chsrtacters in commit message=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
=EF=BA=A9<br>
<br>
Signed-off-by: zhengrq &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" t=
arget=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-Fix-the-Bug-of-SRPM-String-error.patch=C2=A0 =C2=A0 | 48 +++=
+++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_5.4.14.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 49 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-=
SRPM-String-error.patch<br>
<br>
diff --git a/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-=
error.patch b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String=
-error.patch<br>
new file mode 100644<br>
index 0000000..b962617<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rpm/rpm/0001-Fix-the-Bug-of-SRPM-String-error.p=
atch<br>
@@ -0,0 +1,48 @@<br>
+Subject: [PATCH] Fix the Bug of SRPM String error<br>
+<br>
+Upstream-Status: Pending<br>
+$ rpm -qpi zlib-1.2.8-r0.src.rpm<br>
+warning: zlib-1.2.8-r0.src.rpm: Header V4 DSA/SHA1 Signature, key ID e6496=
2a6: NOKEY<br>
+Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 : zlib<br>
+Version=C2=A0 =C2=A0 =C2=A0: 1.2.8<br>
+Release=C2=A0 =C2=A0 =C2=A0: r0<br>
+Architecture: i586<br>
+Install Date: (not installed)<br>
+Group=C2=A0 =C2=A0 =C2=A0 =C2=A0: =EF=BA=A9<br>
+Size=C2=A0 =C2=A0 =C2=A0 =C2=A0 : 633007<br>
+License=C2=A0 =C2=A0 =C2=A0: Zlib<br>
+Signature=C2=A0 =C2=A0: DSA/SHA1, 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=
=E6=99=8238=E5=88=8603=E7=A7=92, Key ID bc5e0520e64962a6<br>
+Source RPM=C2=A0 : (none)<br>
+Build Date=C2=A0 : 2017=E5=B9=B404=E6=9C=8822=E6=97=A5 00=E6=99=8238=E5=88=
=8603=E7=A7=92<br>
+Build Host=C2=A0 : force<br>
+Relocations : (not relocatable)<br>
+Packager=C2=A0 =C2=A0 : Poky &lt;<a href=3D"mailto:poky@yoctoproject.org" =
target=3D"_blank">poky@yoctoproject.org</a>&gt;<br>
+URL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: <a href=3D"http://zlib.net/" rel=3D=
"noreferrer" target=3D"_blank">http://zlib.net/</a><br>
+Summary=C2=A0 =C2=A0 =C2=A0: =C2=A8=C2=AF<br>
+Description :<br>
+=EF=BA=A9<br>
+<br>
+Signed-off-by: zhengrq &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.com" =
target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
+---<br>
+ rpmdb/tagname.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/rpmdb/tagname.c b/rpmdb/tagname.c<br>
+index cfd1459..dbcafd1 100644<br>
+--- a/rpmdb/tagname.c<br>
++++ b/rpmdb/tagname.c<br>
+@@ -518,9 +518,9 @@ tagStore_t tagStoreFree(tagStore_t dbiTags, size_t dbi=
NTags)<br>
+ void tagTypeValidate(HE_t he);<br>
+ void tagTypeValidate(HE_t he)<br>
+ {<br>
+-=C2=A0 =C2=A0 /* XXX Re-map RPM_I18NSTRING_TYPE -&gt; RPM_STRING_TYPE */<=
br>
++=C2=A0 =C2=A0 /* XXX RPM_I18NSTRING_TYPE is treated as strings. */<br>
+=C2=A0 =C2=A0 =C2=A0if (he-&gt;t =3D=3D RPM_I18NSTRING_TYPE)<br>
+-=C2=A0 =C2=A0 =C2=A0 he-&gt;t =3D RPM_STRING_TYPE;<br>
++=C2=A0 =C2=A0 =C2=A0 return;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0/* XXX Arbitrary tags are always strings. */<br>
+=C2=A0 =C2=A0 =C2=A0if ((he-&gt;tag &amp; 0x40000000)<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.14.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_5.4.14.bb</a> b/meta/recipes-devtools=
/rpm/<a href=3D"http://rpm_5.4.14.bb" rel=3D"noreferrer" target=3D"_blank">=
rpm_5.4.14.bb</a><br>
index 73b3734..f8bdfe9 100644<br>
--- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_5.4.14.bb</a><br>
+++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.14.bb" rel=3D"nor=
eferrer" target=3D"_blank">rpm_5.4.14.bb</a><br>
@@ -100,6 +100,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.rpm5.org/files/=
rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e" rel=3D"noreferrer" target=3D"_=
blank">http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;=
e</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpm-macros.in-disable-exter=
nal-key-server.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpm-opendb-before-verifyscr=
ipt-to-avoid-null-point.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.ac-check-for-both=
-gpg2-and-gpg.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-the-Bug-of-SRPM-String-=
error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# Uncomment the following line to enable platform score debugging<br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--f403045c27740b8f12055293e2ba--
