Return-Path: <jatedev@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id 336EA7FD25
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 21:57:41 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id z22so47716974ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8vur30nD5Mb6XNefN1XSXJRpA6yBbvKpqrsOSbFHDVk=;
	b=bSQGYIJJ2PhvqKS7vRDVDEAFi/DZ3RBP4EkqmHYRhYEYJquWkzecJJX2SYP8GIYUav
	SYbgVpIZc9atOaxbwewwRn+YsMEzbV2Dcal3n5utkqzB/ePCFOlWvPeTubYo/doAly9D
	+LTMD8dnTmC5gPCiFxL4lgqwfK5Lp9+7THUnJgrixEXXaoMMM1qG6z1O1v6TwhcYQyML
	L0AzWOJNWjzIxxPWrc423Ri0uboCVCDshR0Z2UIylDeGeexZzDZGf5MzYzGKrlJU8Fq4
	+Qs+y1ozDStg0EOCHL7eS4EtMEjX9yNz2fF2R/+c9WWjz8LCbif4UeAIvvx6QJ83Mk4c
	Y63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8vur30nD5Mb6XNefN1XSXJRpA6yBbvKpqrsOSbFHDVk=;
	b=lR5W82u7f80Mr0Qb4RQBSH0UW0w5AC2dfxH6wR8mKG+ooqjzIrne1zQauoOUjF5YJ1
	Aj6823SKPPswnf3gtrWvlvrlpj6X/3Q7EisJP/sEl56NYs9aS6CR5c66HGRADhifswdh
	91QxJvDfcsmF8ZkRSgmC9O2mmrbOlnvZg2e+PNQ0uYSE7jBE+R34XO8SjRh3sqOAH6xm
	H63FDYaXr2Eoyszpb47EdSvqgvQ6eXGTD3/1z+/sMIblHv43UiTR3fQ613eZzr9PflGU
	YHhofsrFoYWp3mnIM89Yau4/WqliT+VpYeNYgk1X2XjsY7Lzpi1sIdNIagg8J5rqLK3l
	a+pA==
X-Gm-Message-State: APjAAAW34InZPon0Z/dgLat6aSBHj/37EThetzF5sDKlvy8ov1ya+3sc
	bTNg7LzvK9oWBPPo3bR9BBoNmHCQ3H5IYr/wn94XEaAI
X-Google-Smtp-Source: APXvYqxKZ+XsVKE621fKg4wcUnhlTVesE7Yzkjz9abebzQdoefWuAcVg4dh3sTsCaAAdPnrlVQrRHstVAfGY2IMbZto=
X-Received: by 2002:a2e:9942:: with SMTP id r2mr62999987ljj.182.1578347862404; 
	Mon, 06 Jan 2020 13:57:42 -0800 (PST)
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Mon, 6 Jan 2020 16:57:30 -0500
Message-ID: <CAPphmgai-jo+UYEp1MyTre1_hNn3UCCS5EpTD9psxoSNPCmPzw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Mon, 06 Jan 2020 21:57:42 -0000
Content-Type: multipart/alternative; boundary="000000000000abb43d059b7fbfbc"

--000000000000abb43d059b7fbfbc
Content-Type: text/plain; charset="UTF-8"

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zip/zip-3.0/zipnote-crashes-with-segfault.patch  | 20
++++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644
meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git
a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000..aa10add
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,20 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Upstream-Status: Pending
+
+diff --git a/zipnote.c b/zipnote.c
+index 5e02cb6..996f012 100644
+--- a/zipnote.c
++++ b/zipnote.c
+@@ -661,7 +661,7 @@ char **argv;            /* command line tokens */
+     if ((r = zipcopy(z)) != ZE_OK)
+       ziperr(r, "was copying an entry");
+   }
+-  fclose(x);
++  fclose(in_file);
+
+   /* Write central directory and end of central directory with new
comments */
+   if ((c = zftello(y)) == (zoff_t)-1)    /* get start of central */
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb
b/meta/recipes-extended/zip/zip_3.0.bb
index a2cd771..c00a932 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -12,6 +12,7 @@ S = "${WORKDIR}/zip30"
 SRC_URI =
"${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz \
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
+           file://zipnote-crashes-with-segfault.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"

-- 
2.7.4

--000000000000abb43d059b7fbfbc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This patch has been applied in several Linux distributions=
<br><br>Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail=
.com">jatedev@gmail.com</a>&gt;<br>---<br>=C2=A0.../zip/zip-3.0/zipnote-cra=
shes-with-segfault.patch =C2=A0| 20 ++++++++++++++++++++<br>=C2=A0meta/reci=
pes-extended/zip/<a href=3D"http://zip_3.0.bb">zip_3.0.bb</a> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A01 +<br>=C2=A02 files cha=
nged, 21 insertions(+)<br>=C2=A0create mode 100644 meta/recipes-extended/zi=
p/zip-3.0/zipnote-crashes-with-segfault.patch<br><br>diff --git a/meta/reci=
pes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch b/meta/recipes=
-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch<br>new file mode =
100644<br>index 0000000..aa10add<br>--- /dev/null<br>+++ b/meta/recipes-ext=
ended/zip/zip-3.0/zipnote-crashes-with-segfault.patch<br>@@ -0,0 +1,20 @@<b=
r>+Close the correct file descriptor<br>+<br>+<a href=3D"https://bugs.archl=
inux.org/task/47713">https://bugs.archlinux.org/task/47713</a><br>+<br>+Ups=
tream-Status: Pending<br>+<br>+diff --git a/zipnote.c b/zipnote.c<br>+index=
 5e02cb6..996f012 100644<br>+--- a/zipnote.c<br>++++ b/zipnote.c<br>+@@ -66=
1,7 +661,7 @@ char **argv; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* comm=
and line tokens */<br>+ =C2=A0 =C2=A0 if ((r =3D zipcopy(z)) !=3D ZE_OK)<br=
>+ =C2=A0 =C2=A0 =C2=A0 ziperr(r, &quot;was copying an entry&quot;);<br>+ =
=C2=A0 }<br>+- =C2=A0fclose(x);<br>++ =C2=A0fclose(in_file);<br>+ <br>+ =C2=
=A0 /* Write central directory and end of central directory with new commen=
ts */<br>+ =C2=A0 if ((c =3D zftello(y)) =3D=3D (zoff_t)-1) =C2=A0 =C2=A0/*=
 get start of central */<br>+ =C2=A0 <br>diff --git a/meta/recipes-extended=
/zip/<a href=3D"http://zip_3.0.bb">zip_3.0.bb</a> b/meta/recipes-extended/z=
ip/<a href=3D"http://zip_3.0.bb">zip_3.0.bb</a><br>index a2cd771..c00a932 1=
00644<br>--- a/meta/recipes-extended/zip/<a href=3D"http://zip_3.0.bb">zip_=
3.0.bb</a><br>+++ b/meta/recipes-extended/zip/<a href=3D"http://zip_3.0.bb"=
>zip_3.0.bb</a><br>@@ -12,6 +12,7 @@ S =3D &quot;${WORKDIR}/zip30&quot;<br>=
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest=
%29/3.0/zip30.tar.gz \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://=
fix-security-format.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi=
le://10-remove-build-date.patch \<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
ile://zipnote-crashes-with-segfault.patch \<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;<br>=C2=A0UPSTREAM_VERSION_UNKNOWN =3D &quot;1&quot;<br=
>=C2=A0<br>-- <br>2.7.4<br><br></div>

--000000000000abb43d059b7fbfbc--
