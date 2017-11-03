Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 934F578380
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 20:53:02 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so3015653pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 13:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NXEIxDoxq0eojJbKyAGWYuaskYYB9a0a0PHCV7ZX6to=;
	b=ZL3tIz6muqswEWvKyIJEXkjYtIUentI2mwmd9b2a8fwwZ6iN0REkJYdVTezaDBnDRD
	BAG6jhNvnSRENVN3rY3gPwCLnxK8UOSjZeyQAxnyZpKTT8cx6WEWJsrer9F/udQd4elf
	8aMb99BC9tPSXbuCEFtIEKFx/H6+1+6xCxs03rmk1g61N0aQNv3wb2DJQftYZHMC0HcC
	LvP94AfIrbMWTf26FkxzvjCFBxY6BLT72S8LhEjFuDa5Z+osKz3IMQMBGAqDj8b1KrVC
	7uIz7UBzpDXbIEIIkZJFqj9xPpuF/Uow9q15FYf2b9UgE8Wi/podZud0wkdr79yzNNz3
	wd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NXEIxDoxq0eojJbKyAGWYuaskYYB9a0a0PHCV7ZX6to=;
	b=ih+9ecRoXP9jzic53Aq7T1rEP8lPT/9yX3MzwLEurpnluvWQrdbhel7q0G3MvjUiLu
	UvCzT5OReXwfz6ZXhRb1GWFwhCt9odW5Qdekoa5KITv18mHjc0GdU9SuJThi4JZ4BOcU
	X7E6fV24Q/P1qBK+AMiuWNFdGub/AO8xi1edv1jzvPqPGJ56x7BjRR6s/zZNSm75nsrl
	bjbdB3/p44HIGegW757xVaCQNTZ/7RjjvfLTPdEADbfH+OvDYq/TuKQyzhb+JWhBaKnH
	mJAwYVJGbIJ8FKkgllhW5rVXRVnYXwIP2FaYMbnCs93nl5dzECcFyPAYF4wUnwI5VLPB
	YEjQ==
X-Gm-Message-State: AMCzsaW7ASa3S40VR1b8ozus8q9ObLyyNz/ooSRfgRmY+RbUioXo/raT
	N7vDETz4A55AtaXxiPnqkDx4jKZitZuXBmgZhpQ=
X-Google-Smtp-Source: ABhQp+RUyiEWLob3k5UziOsBziLqAAqa2UxkPlePpNU69KRz3hDgqnFrpSuuMvTacj0GupEbdoUbnVJ1vZ7Dn6wUI/g=
X-Received: by 10.84.151.70 with SMTP id i64mr7844735pli.114.1509742383643;
	Fri, 03 Nov 2017 13:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <1509740585-20536-1-git-send-email-matt@madison.systems>
In-Reply-To: <1509740585-20536-1-git-send-email-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 03 Nov 2017 20:52:52 +0000
Message-ID: <CAMKF1souMjPeiQX5tyKF+AvhscukbWRpQKPd8L3AT0DigMJGKw@mail.gmail.com>
To: Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go: update to go1.9.2
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
X-List-Received-Date: Fri, 03 Nov 2017 20:53:02 -0000
Content-Type: multipart/alternative; boundary="94eb2c18a86e7ac05e055d1a4a0c"

--94eb2c18a86e7ac05e055d1a4a0c
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 3, 2017 at 1:23 PM Matt Madison <matt@madison.systems> wrote:

> Update to the go1.9.2 minor release, which includes
> fixes to the compiler and runtime.
>

This is good

>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-1.9.inc | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-1.9.inc
> b/meta/recipes-devtools/go/go-1.9.inc
> index 65adaa8..7daf266 100644
> --- a/meta/recipes-devtools/go/go-1.9.inc
> +++ b/meta/recipes-devtools/go/go-1.9.inc
> @@ -1,6 +1,10 @@
>  require go-common.inc
>
>  GO_BASEVERSION = "1.9"
> +MINOR = ".2"
> +
> +PV = "${GO_BASEVERSION}${MINOR}"
> +
>  FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -16,5 +20,5 @@ SRC_URI += "\
>
>  file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
>
>  file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
>  "
> -SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
> -SRC_URI[main.sha256sum] =
> "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
> +SRC_URI[main.md5sum] = "44105c865a1a810464df79233a05a568"
> +SRC_URI[main.sha256sum] =
> "665f184bf8ac89986cfd5a4460736976f60b57df6b320ad71ad4cef53bb143dc"
> --
> 2.7.4
>
>

--94eb2c18a86e7ac05e055d1a4a0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Fri, Nov 3, 2017 a=
t 1:23 PM Matt Madison &lt;matt@madison.systems&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Update to the go1.9.2 minor release, which includes=
<br>
fixes to the compiler and runtime.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is good</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.9.inc | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go=
/go-1.9.inc<br>
index 65adaa8..7daf266 100644<br>
--- a/meta/recipes-devtools/go/go-1.9.inc<br>
+++ b/meta/recipes-devtools/go/go-1.9.inc<br>
@@ -1,6 +1,10 @@<br>
=C2=A0require go-common.inc<br>
<br>
=C2=A0GO_BASEVERSION =3D &quot;1.9&quot;<br>
+MINOR =3D &quot;.2&quot;<br>
+<br>
+PV =3D &quot;${GO_BASEVERSION}${MINOR}&quot;<br>
+<br>
=C2=A0FILESEXTRAPATHS_prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSIO=
N}:&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7=
b4e0dd74707&quot;<br>
@@ -16,5 +20,5 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-make.bash-add-GOHOSTxx-indire=
ction-for-cross-canadia.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-cmd-go-buildmode-pie-forces-e=
xternal-linking-mode-on.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[main.md5sum] =3D &quot;da2d44ea384076efec43ee1f8b7d45d2&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;a4ab229028ed167ba1986825751463605264e448=
68362ca8e7accc8be057e993&quot;<br>
+SRC_URI[main.md5sum] =3D &quot;44105c865a1a810464df79233a05a568&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;665f184bf8ac89986cfd5a4460736976f60b57df=
6b320ad71ad4cef53bb143dc&quot;<br>
--<br>
2.7.4<br>
<br>
</blockquote></div></div>

--94eb2c18a86e7ac05e055d1a4a0c--
