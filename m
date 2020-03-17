Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 964BC6062D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 05:38:05 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id h3so18964749ils.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 22:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NAkgQ4//kjTLImccdCH2C9HBiLIX+GKpVmaSUIOPV1s=;
	b=dFTS2qNbkW5OduPyO+ZlXgcjgGvL2Xz8XG6qfTSbq9WlD7JBfjS+Zx2a4tq+YvMeJS
	qXgkwyOm7AaRZTCUiFK46lk+xKRj00u6ixDtzRAt9wzJUOHLTA7c4Ou3Pibabz+vN5ST
	RzmfJF4WAiNVtjGOpJo8qj023/DGXGWwKcAf0K/JzuGZSvs6AbShwA1zqwOBM93QDBaw
	impZSPbGMK0yHR/Cx2UHHAk8f8y0K2Dg9qQrJsnYNj9q8Ad8m1VNKr/6SQLUKyuQHycZ
	S+2xzlBOuGx97M79XtEwKEHTU9CB7fyfodgoASAuImFT2Mq95JCY9O9m1rzMZz47ABQi
	oNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NAkgQ4//kjTLImccdCH2C9HBiLIX+GKpVmaSUIOPV1s=;
	b=Am+1HCnUPEUuBj9a2a8/Xm6GPpA9qteuYWt7CrQL1mbm0GcLjLDChQtk38fss8t82O
	Dp1tIn8UsqhShPGvC+YEbRuz8O59Ud3xDwi+exWdpO88XkVxTLh8ZyOS64F5pxMNkTgw
	NNs5lX7m1zJCRkmHJMW84IfaKEKM+0wsylp4MhvpUygK3XGnHSHioif+SKJVV9QqCa/v
	cilMWIonGeCl6KGJ7DSujA6eSKctAPUglARTy1588Vhn2+QV0KVsJGXN3YIqLe/Th4yL
	JB6aj+/fg8smiRtOOngZ1BYR21opP5evTMOt5lYsBZI/HXAqpAU4bb+AIfn8Hz0U3bUx
	I8IA==
X-Gm-Message-State: ANhLgQ2ZzC+0U5iuBRlbYOL95u0KCISxpbAOqZu0ubMI8XgpXIoWHlVF
	vUWOvxUpbQmOhoYTTHP8LeBem+xwB5cjxgf+L/w=
X-Google-Smtp-Source: ADFU+vuU28UkmIBqgxTbMj+Z41HAh1I3VUYcaXEQMt/Dr+vdQ4BR6kBK4FOPC2bd30kmb7Tu8KH+iy/u9WVeAcJuMA8=
X-Received: by 2002:a05:6e02:1090:: with SMTP id
	r16mr3488660ilj.198.1584423486340; 
	Mon, 16 Mar 2020 22:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <1584429410-1890-1-git-send-email-wangmy@cn.fujitsu.com>
	<1584429410-1890-3-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1584429410-1890-3-git-send-email-wangmy@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 16 Mar 2020 22:37:55 -0700
Message-ID: <CANx9H-Dr8CZFSWRqNb6BGLcpvUKeeBarQSfG2UodOwEqAMat0Q@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] stress-ng: upgrade 0.11.01 -> 0.11.02
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
X-List-Received-Date: Tue, 17 Mar 2020 05:38:05 -0000
Content-Type: multipart/alternative; boundary="00000000000013c34805a1065743"

--00000000000013c34805a1065743
Content-Type: text/plain; charset="UTF-8"

0.11.03 is already released.

On Mon, Mar 16, 2020 at 6:44 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../stress-ng/{stress-ng_0.11.01.bb => stress-ng_0.11.02.bb}  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/stress-ng/{stress-ng_0.11.01.bb =>
> stress-ng_0.11.02.bb} (83%)
>
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
> b/meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
> similarity index 83%
> rename from meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
> rename to meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
> index 3486be1b03..e79ee49e24 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.11.01.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.02.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz
> \
>
> file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
>             "
> -SRC_URI[md5sum] = "a558fc7fb9d0a851afe6de09080b5401"
> -SRC_URI[sha256sum] =
> "9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b77527549a7736f65494"
> +SRC_URI[md5sum] = "a353287968818f7181eae9a90ddc4f25"
> +SRC_URI[sha256sum] =
> "ad1a6fca8f90f67a4364aa6ff0c406995960dc4f8689e9d5289fc083e1d8986f"
>
>  DEPENDS = "coreutils-native"
>
> --
> 2.17.1
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000013c34805a1065743
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">0.11.03 is already released.</div></div><div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 1=
6, 2020 at 6:44 PM Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com"=
>wangmy@cn.fujitsu.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" =
target=3D"_blank">wangmy@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../stress-ng/{<a href=3D"http://stress-ng_0.11.01.bb" rel=3D"norefer=
rer" target=3D"_blank">stress-ng_0.11.01.bb</a> =3D&gt; <a href=3D"http://s=
tress-ng_0.11.02.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.02=
.bb</a>}=C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/stress-ng/{<a href=3D"http://stress-ng_0=
.11.01.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.01.bb</a> =
=3D&gt; <a href=3D"http://stress-ng_0.11.02.bb" rel=3D"noreferrer" target=
=3D"_blank">stress-ng_0.11.02.bb</a>} (83%)<br>
<br>
diff --git a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.=
11.01.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.01.bb</a> b/m=
eta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.02.bb" rel=
=3D"noreferrer" target=3D"_blank">stress-ng_0.11.02.bb</a><br>
similarity index 83%<br>
rename from meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.1=
1.01.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.01.bb</a><br>
rename to meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.=
02.bb" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.02.bb</a><br>
index 3486be1b03..e79ee49e24 100644<br>
--- a/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.01.b=
b" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.01.bb</a><br>
+++ b/meta/recipes-extended/stress-ng/<a href=3D"http://stress-ng_0.11.02.b=
b" rel=3D"noreferrer" target=3D"_blank">stress-ng_0.11.02.bb</a><br>
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://kernel.ubuntu.com/~cking/tarball=
s/$%7BBPN%7D/$%7BBP%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:/=
/kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Do-not-preserve-owner=
ship-when-installing-example-jo.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;a558fc7fb9d0a851afe6de09080b5401&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9fe19548c87aa1a1b9b2be3b359ec2621b88bcb16998b=
77527549a7736f65494&quot;<br>
+SRC_URI[md5sum] =3D &quot;a353287968818f7181eae9a90ddc4f25&quot;<br>
+SRC_URI[sha256sum] =3D &quot;ad1a6fca8f90f67a4364aa6ff0c406995960dc4f8689e=
9d5289fc083e1d8986f&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;coreutils-native&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--00000000000013c34805a1065743--
