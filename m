Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCEs5-0004iw-Rn
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 21:14:42 +0200
Received: by obblz20 with SMTP id lz20so5204680obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 12:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=6Oi8exp1163hCAyZLK312sLF3+IuD5gprUOWhJz/bxo=;
	b=TSiTpjfVmDp9wDCNhjKZMc/AYkW6oLSK9fg9LueYHTZmTkALZweSHPGx2U2ZqZtGsM
	TL/iF2TO1YFqYQfhNhUrJyNm+LNTMv7onGrif7HuJcNonVvAdtV0mVToi8qDoLw11ecb
	eLQSprzc2kqHSNyB26XaqUDdB7t1NLj5vyCVDq0GL2ayP4DZkLmo0Fkkv8JXwmsLSwSC
	QYSqyiqygxplwqP/XwiR12S4iXL/n+RutzNRPkDzwENnfbRkR5WL9woDu5j6GT8sK+wd
	lUPx+e+FbAfcvv6TtL5vXqLlTz807wSZM9fy27mGPjDI5zxPB9PJ67e+rLGt7qEd1QgU
	HbHQ==
Received: by 10.60.4.163 with SMTP id l3mr126953oel.74.1347561071857; Thu, 13
	Sep 2012 11:31:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Thu, 13 Sep 2012 11:30:51 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <82333322e10699bb82f724f14c906d2eabbb60a2.1347559925.git.peter.seebach@windriver.com>
References: <cover.1347559925.git.peter.seebach@windriver.com>
	<82333322e10699bb82f724f14c906d2eabbb60a2.1347559925.git.peter.seebach@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 13 Sep 2012 21:30:51 +0300
Message-ID: <CAK18fxFgdcBcQfsi02Em0nfEhWN5c5Ap7zyYBK4=SbMsRrVtrg@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
X-Gm-Message-State: ALoCoQlsoYBdRKu+qCYUcAUwaHoaRdgDQ7hoanSczEFbaEJ27vrAiSKwfHJsKqKZwyQgRcq325Cd
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] pseudo_1.4.1.bb: update to pseudo 1.4.1, fixing 32-bit host problems
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 19:14:42 -0000
Content-Type: multipart/alternative; boundary=e89a8fb2072a004f7b04c99983b7

--e89a8fb2072a004f7b04c99983b7
Content-Type: text/plain; charset=ISO-8859-1

Ack

On Thu, Sep 13, 2012 at 9:29 PM, Peter Seebach
<peter.seebach@windriver.com>wrote:

> There were a number of cases where pseudo used plain old stat()
> to get dev/inode data for files; on 32-bit hosts, this could fail
> if the files were over 2GB, causing pseudo to prevent removing of
> large files. This is fixed in 1.4.1.
>
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> ---
>  meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 ++++++++
>  meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 --------
>  meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
>  3 files changed, 11 insertions(+), 11 deletions(-)
>  create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.1.bbb/meta/recipes-devtools/pseudo/
> pseudo_1.4.1.bb
> new file mode 100644
> index 0000000..70fe9c0
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
> @@ -0,0 +1,8 @@
> +require pseudo.inc
> +
> +PR = "r13"
> +
> +SRC_URI = "
> http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "b49bb87c7e1de33f37fea479ddb99dca"
> +SRC_URI[sha256sum] =
> "ae4bfba2bd1e3954ea8f83bf06571ee4958bf7623e4fa897056281dddfe6446d"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.bbb/meta/recipes-devtools/pseudo/
> pseudo_1.4.bb
> deleted file mode 100644
> index e1e1f6f..0000000
> --- a/meta/recipes-devtools/pseudo/pseudo_1.4.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -require pseudo.inc
> -
> -PR = "r12"
> -
> -SRC_URI = "
> http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "bc04c6c9d13cfdb789ffc2f3cca9ab08"
> -SRC_URI[sha256sum] =
> "147fa7b177061a145d330b9e159529a185be94550f123c6acb0d3b75d480c5b4"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bbb/meta/recipes-devtools/pseudo/
> pseudo_git.bb
> index 27ae4b2..e394ffb 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,8 +1,8 @@
>  require pseudo.inc
>
> -SRCREV = "9b792e4cb91bc22374f47d0b0902dbc4ecd7d6dd"
> -PV = "1.4+git${SRCPV}"
> -PR = "r27"
> +SRCREV = "398a264490713c912b4ce465251a8a82a7905f45"
> +PV = "1.4.1+git${SRCPV}"
> +PR = "r28"
>
>  DEFAULT_PREFERENCE = "-1"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8fb2072a004f7b04c99983b7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ack<br><br><div class=3D"gmail_quote">On Thu, Sep 13, 2012 at 9:29 PM, Pete=
r Seebach <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.seebach@windriver.c=
om" target=3D"_blank">peter.seebach@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">

There were a number of cases where pseudo used plain old stat()<br>
to get dev/inode data for files; on 32-bit hosts, this could fail<br>
if the files were over 2GB, causing pseudo to prevent removing of<br>
large files. This is fixed in 1.4.1.<br>
<br>
Signed-off-by: Peter Seebach &lt;<a href=3D"mailto:peter.seebach@windriver.=
com">peter.seebach@windriver.com</a>&gt;<br>
---<br>
=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.1.bb" target=
=3D"_blank">pseudo_1.4.1.bb</a> | =A0 =A08 ++++++++<br>
=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.bb" target=3D"=
_blank">pseudo_1.4.bb</a> =A0 | =A0 =A08 --------<br>
=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" target=3D"=
_blank">pseudo_git.bb</a> =A0 | =A0 =A06 +++---<br>
=A03 files changed, 11 insertions(+), 11 deletions(-)<br>
=A0create mode 100644 meta/recipes-devtools/pseudo/<a href=3D"http://pseudo=
_1.4.1.bb" target=3D"_blank">pseudo_1.4.1.bb</a><br>
=A0delete mode 100644 meta/recipes-devtools/pseudo/<a href=3D"http://pseudo=
_1.4.bb" target=3D"_blank">pseudo_1.4.bb</a><br>
<br>
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.1.bb=
" target=3D"_blank">pseudo_1.4.1.bb</a> b/meta/recipes-devtools/pseudo/<a h=
ref=3D"http://pseudo_1.4.1.bb" target=3D"_blank">pseudo_1.4.1.bb</a><br>
new file mode 100644<br>
index 0000000..70fe9c0<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.1.bb" targe=
t=3D"_blank">pseudo_1.4.1.bb</a><br>
@@ -0,0 +1,8 @@<br>
+require pseudo.inc<br>
+<br>
+PR =3D &quot;r13&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://www.yoctoproject.org/downloads/${BPN}/=
${BPN}-${PV}.tar.bz2" target=3D"_blank">http://www.yoctoproject.org/downloa=
ds/${BPN}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;b49bb87c7e1de33f37fea479ddb99dca&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ae4bfba2bd1e3954ea8f83bf06571ee4958bf7623e4fa=
897056281dddfe6446d&quot;<br>
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.bb" =
target=3D"_blank">pseudo_1.4.bb</a> b/meta/recipes-devtools/pseudo/<a href=
=3D"http://pseudo_1.4.bb" target=3D"_blank">pseudo_1.4.bb</a><br>
deleted file mode 100644<br>
index e1e1f6f..0000000<br>
--- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.4.bb" target=
=3D"_blank">pseudo_1.4.bb</a><br>
+++ /dev/null<br>
@@ -1,8 +0,0 @@<br>
-require pseudo.inc<br>
-<br>
-PR =3D &quot;r12&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://www.yoctoproject.org/downloads/${BPN}/=
${BPN}-${PV}.tar.bz2" target=3D"_blank">http://www.yoctoproject.org/downloa=
ds/${BPN}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;bc04c6c9d13cfdb789ffc2f3cca9ab08&quot;<br>
-SRC_URI[sha256sum] =3D &quot;147fa7b177061a145d330b9e159529a185be94550f123=
c6acb0d3b75d480c5b4&quot;<br>
diff --git a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" =
target=3D"_blank">pseudo_git.bb</a> b/meta/recipes-devtools/pseudo/<a href=
=3D"http://pseudo_git.bb" target=3D"_blank">pseudo_git.bb</a><br>
index 27ae4b2..e394ffb 100644<br>
--- a/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" target=
=3D"_blank">pseudo_git.bb</a><br>
+++ b/meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" target=
=3D"_blank">pseudo_git.bb</a><br>
@@ -1,8 +1,8 @@<br>
=A0require pseudo.inc<br>
<br>
-SRCREV =3D &quot;9b792e4cb91bc22374f47d0b0902dbc4ecd7d6dd&quot;<br>
-PV =3D &quot;1.4+git${SRCPV}&quot;<br>
-PR =3D &quot;r27&quot;<br>
+SRCREV =3D &quot;398a264490713c912b4ce465251a8a82a7905f45&quot;<br>
+PV =3D &quot;1.4.1+git${SRCPV}&quot;<br>
+PR =3D &quot;r28&quot;<br>
<br>
=A0DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.7.0.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br>

--e89a8fb2072a004f7b04c99983b7--
