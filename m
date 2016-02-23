Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1A24A77375
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:40:28 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id y89so138869379qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7CN4cgV0tYsG2Jjr8bf4YvgJ1iBV7ixRbyfBK2WJe4E=;
	b=RNicLgLs6hJL5m0oweKkDgqDd+bkQ61ZhThLkFi067I+naqnWbd/gMxUoHPnvjmJal
	BRU63CoWHQxeJfOZKkgr/u7gD95JgfFHowzcfKn43qbZWrql9A60aD3cFzbRX0AqrcZu
	RjGAYV9niyiriZwQ+GF4PsfO0DR/aZyEjaJa4F0J7YcTYQQ4ysEsGRkL39I2lMFoZOtf
	mot2wFFJo/8OJ5+fqQNOefqk97gkOFlswfKJDMEZt3znXyZYpcl0DSRmRPgxc8+AFIs0
	efnpRNrpjxYd3f8uSnBofcscuOoFvUWrzc4ohfooM4kUhMXdZvplWbcsjjpCEivBJsLB
	Cw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=7CN4cgV0tYsG2Jjr8bf4YvgJ1iBV7ixRbyfBK2WJe4E=;
	b=Z11lR6YXOWml+Et2zPwQzTSiCH+W68lHDNFcdze9jzhs0FlQGIImO/gsQOKIASC0nd
	SsKpOQkecXHIaQaas+CNxe1+RSfrvnU4zwRW0cZA/RiIuuePVhA4c2ezpstNIhxSwSe8
	+niaES/O2kQakpY8qhkDIdJPZIKx9cz5NfEBnPKdGp+qyso33jw2qerRzTOVrUGH1V36
	aWDU7jNAE1jzpsgXes8kNlMzNEw1SjO85qtUowWnJ57qeNZpFNWzDYd11GoASO0fTIN9
	VHiJpJtXRgoF2l75sTaFFH46TMN+aV8jt/wYgnCLoKJlOKzYOfhOu4Uhcd+rDW5QRi+o
	tHeg==
X-Gm-Message-State: AG10YOTri9jNC6jllK6VXs/OT8Y/KXsvssk2LGXYk8yHDRgJxV5TBb1eQKsZmhHpB1gSsNIfG8Yxnu1CmZEBEA==
MIME-Version: 1.0
X-Received: by 10.140.234.16 with SMTP id f16mr43378321qhc.41.1456242028730;
	Tue, 23 Feb 2016 07:40:28 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 23 Feb 2016 07:40:28 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Tue, 23 Feb 2016 07:40:28 -0800 (PST)
In-Reply-To: <1456240902-31768-1-git-send-email-maxin.john@intel.com>
References: <1456240902-31768-1-git-send-email-maxin.john@intel.com>
Date: Tue, 23 Feb 2016 10:40:28 -0500
Message-ID: <CAMKF1sox=Q5KCSZq01jkDxBphd45wFo0+eKqi=tF6D6xdHc9cw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] argp-standalone: make it available for non-musl systems too
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
X-List-Received-Date: Tue, 23 Feb 2016 15:40:29 -0000
Content-Type: multipart/alternative; boundary=001a1135364ad46ecd052c71c41a

--001a1135364ad46ecd052c71c41a
Content-Type: text/plain; charset=UTF-8

Uclibc has its own argp implemented as libuargp so please use that you dont
need yet another implementation
On Feb 23, 2016 10:18 AM, "Maxin B. John" <maxin.john@intel.com> wrote:

> Without this, uclibc build of rng-tools will fail with this error:
>
> ERROR: Nothing PROVIDES 'argp-standalone'
> (but rng-tools_5.bb DEPENDS on or otherwise requires it)
> ERROR: argp-standalone was skipped: incompatible with host
> x86_64-poky-linux-uclibc (not in COMPATIBLE_HOST)
> ERROR: Required build target 'rng-tools' has no buildable providers.
> Missing or unbuildable dependency chain was: ['rng-tools',
> 'argp-standalone']
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-support/argp-standalone/argp-standalone_1.3.bb | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
> b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
> index d61c8be..5148bbf 100644
> --- a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
> +++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
> @@ -21,9 +21,8 @@ CFLAGS += "-fPIC -U__OPTIMIZE__"
>
>  do_install() {
>         install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
> -       install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
>  }
> -#
> -# We will skip parsing for non-musl systems
> -#
> -COMPATIBLE_HOST = ".*-musl.*"
> +
> +do_install_append_libc-musl() {
> +    install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
> +}
> --
> 2.4.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1135364ad46ecd052c71c41a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Uclibc has its own argp implemented as libuargp so please us=
e that you dont need yet another implementation</p>
<div class=3D"gmail_quote">On Feb 23, 2016 10:18 AM, &quot;Maxin B. John&qu=
ot; &lt;<a href=3D"mailto:maxin.john@intel.com">maxin.john@intel.com</a>&gt=
; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Without thi=
s, uclibc build of rng-tools will fail with this error:<br>
<br>
ERROR: Nothing PROVIDES &#39;argp-standalone&#39;<br>
(but <a href=3D"http://rng-tools_5.bb" rel=3D"noreferrer" target=3D"_blank"=
>rng-tools_5.bb</a> DEPENDS on or otherwise requires it)<br>
ERROR: argp-standalone was skipped: incompatible with host<br>
x86_64-poky-linux-uclibc (not in COMPATIBLE_HOST)<br>
ERROR: Required build target &#39;rng-tools&#39; has no buildable providers=
.<br>
Missing or unbuildable dependency chain was: [&#39;rng-tools&#39;,<br>
&#39;argp-standalone&#39;]<br>
<br>
Signed-off-by: Maxin B. John &lt;<a href=3D"mailto:maxin.john@intel.com">ma=
xin.john@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/argp-standalone/<a href=3D"http://argp-standalon=
e_1.3.bb" rel=3D"noreferrer" target=3D"_blank">argp-standalone_1.3.bb</a> |=
 9 ++++-----<br>
=C2=A01 file changed, 4 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-support/argp-standalone/<a href=3D"http://argp-st=
andalone_1.3.bb" rel=3D"noreferrer" target=3D"_blank">argp-standalone_1.3.b=
b</a> b/meta/recipes-support/argp-standalone/<a href=3D"http://argp-standal=
one_1.3.bb" rel=3D"noreferrer" target=3D"_blank">argp-standalone_1.3.bb</a>=
<br>
index d61c8be..5148bbf 100644<br>
--- a/meta/recipes-support/argp-standalone/<a href=3D"http://argp-standalon=
e_1.3.bb" rel=3D"noreferrer" target=3D"_blank">argp-standalone_1.3.bb</a><b=
r>
+++ b/meta/recipes-support/argp-standalone/<a href=3D"http://argp-standalon=
e_1.3.bb" rel=3D"noreferrer" target=3D"_blank">argp-standalone_1.3.bb</a><b=
r>
@@ -21,9 +21,8 @@ CFLAGS +=3D &quot;-fPIC -U__OPTIMIZE__&quot;<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -D -m 0644 ${B}/libargp.a ${D}${libdir}=
/libargp.a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -D -m 0644 ${S}/argp.h ${D}${includedir=
}/argp.h<br>
=C2=A0}<br>
-#<br>
-# We will skip parsing for non-musl systems<br>
-#<br>
-COMPATIBLE_HOST =3D &quot;.*-musl.*&quot;<br>
+<br>
+do_install_append_libc-musl() {<br>
+=C2=A0 =C2=A0 install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h<br>
+}<br>
--<br>
2.4.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a1135364ad46ecd052c71c41a--
