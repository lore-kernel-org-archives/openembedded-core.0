Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7F14B607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2016 02:59:55 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id q124so7693582itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 18:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=uwOddLfGn4BUbghTDfq6a0AngokvraiGTDihlFAED2w=;
	b=APSmn94WR8m1La0vtfAHw7uWNIuwOO+RZiGFhqGdCU12Niv+bpmoWjRbZUkBK/AHAQ
	f4OLofxhDNmu51QQ660e8WU7wkR0w6LUQbrm0omfxojW2FmInD/To6mclZyTh8jhaG4C
	NSe0JeaSi2z/DIvj1/VNdy5zchP80z6V8p5qEs9fxyzspCLO8RpXRoMwcmmo7bjbfvRc
	YVBvsKRJQBaHB97OQkfMETa8l3PJhrXH3S8OZlTsd0ZVqPXrHu8ezyEfoOrqM/9ggJbA
	QLeEFNqgjvXyS/LOycOeF5VyGYJaZVgrO6VtUljbC79G90NOAqUXpxZeVAhmkVrvJkmu
	5iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=uwOddLfGn4BUbghTDfq6a0AngokvraiGTDihlFAED2w=;
	b=PMTRE+eeB2VZRkpYjLZgTRhXsgDmqqUt9l+rvFr1+LhHyQpvFD43xHNOzJnUjmo4Eo
	nH9VsJq9euNO3N5v9WdbX627Cz9ViVqocp1ObAHQ0NKKK4Sv+zEJFBHfS2Im/izKM+Qn
	Ci4sHyMqPpNacn43TwtT/qATGenxUi0Ka3eDKUfFNIFEgy6JDBCF5DsHqq6kWOuf6whG
	H+2jfIOmVceGJc66q9piIS9Whf7/4v+69behwBDRZ2uYeuPh7pz0LkB67XtmSiuaZBdR
	3WLoAtN5FWDCPQzfTSS6bqJG7NS9Qxt+Od4U1PJoUt/wv094A/GVNJHz/nyoqYtXldPJ
	4cqg==
X-Gm-Message-State: ABUngvdVfdU/FBF/uASOt5or9amKN+w27Ekwws0HiPM1fOVgSFTmz7Pjqc/Yr9098Kde2t+l6vcJGhlfbm2Zww==
X-Received: by 10.157.24.109 with SMTP id t42mr293710ott.166.1478833196492;
	Thu, 10 Nov 2016 18:59:56 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.35.166 with HTTP; Thu, 10 Nov 2016 18:59:36 -0800 (PST)
In-Reply-To: <20161110003935.1858-2-raj.khem@gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<20161110003935.1858-2-raj.khem@gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 10 Nov 2016 19:59:36 -0700
X-Google-Sender-Auth: -8t-eDk-zx4One4dH3V6hNLx2F0
Message-ID: <CABcZANmkhnCF0-p75sAC-p2fOrYmjSPo9==OqDjPDwnZd-uUzQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] go-examples: Add an example, helloworld written in go
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
X-List-Received-Date: Fri, 11 Nov 2016 02:59:55 -0000
Content-Type: multipart/alternative; boundary=001a1142ebfe5bf8950540fdaf7b

--001a1142ebfe5bf8950540fdaf7b
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 9, 2016 at 5:39 PM, Khem Raj <raj.khem@gmail.com> wrote:

> diff --git a/meta/recipes-extended/go-examples/go-examples.inc
> b/meta/recipes-extended/go-examples/go-examples.inc
> new file mode 100644
> index 0000000..c632681
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/go-examples.inc
> @@ -0,0 +1,10 @@
> +DESCRIPTION = "This is a simple example recipe that cross-compiles a Go
> program."
> +SECTION = "examples"
> +HOMEPAGE = "https://golang.org/"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=
> 0835ade698e0bcf8506ecda2f7b4f302"
> +
> +S = "${WORKDIR}"
> +
> +inherit go
> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> new file mode 100644
> index 0000000..af9d3b7
> --- /dev/null
> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
> @@ -0,0 +1,15 @@
> +require go-examples.inc
> +
> +
> +SRC_URI += " \
> +  file://helloworld.go \
> +"
> +
> +do_compile() {
> +  go build helloworld.go
> +}
>

Under what circumstances would one use the go_do_compile from go.bbclass vs
this?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1142ebfe5bf8950540fdaf7b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Nov 9, 2016 at 5:39 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":2k2" class=3D"a3s a=
XjCH m1584bad6ff3633b4">diff --git a/meta/recipes-extended/go-<wbr>examples=
/go-examples.inc b/meta/recipes-extended/go-<wbr>examples/go-examples.inc<b=
r>
new file mode 100644<br>
index 0000000..c632681<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/go-<wbr>examples/go-examples.inc<br>
@@ -0,0 +1,10 @@<br>
+DESCRIPTION =3D &quot;This is a simple example recipe that cross-compiles =
a Go program.&quot;<br>
+SECTION =3D &quot;examples&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://golang.org/" rel=3D"noreferrer" targ=
et=3D"_blank">https://golang.org/</a>&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/<wbr>MIT;md5=3D<wb=
r>0835ade698e0bcf8506ecda2f7b4f3<wbr>02&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}&quot;<br>
+<br>
+inherit go<br>
diff --git a/meta/recipes-extended/go-<wbr>examples/<a href=3D"http://go-he=
lloworld_0.1.bb" rel=3D"noreferrer" target=3D"_blank">go-helloworld_0.1.bb<=
/a> b/meta/recipes-extended/go-<wbr>examples/<a href=3D"http://go-helloworl=
d_0.1.bb" rel=3D"noreferrer" target=3D"_blank">go-helloworld_0.1.bb</a><br>
new file mode 100644<br>
index 0000000..af9d3b7<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/go-<wbr>examples/<a href=3D"http://go-helloworl=
d_0.1.bb" rel=3D"noreferrer" target=3D"_blank">go-helloworld_0.1.bb</a><br>
@@ -0,0 +1,15 @@<br>
+require go-examples.inc<br>
+<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 file://helloworld.go \<br>
+&quot;<br>
+<br>
+do_compile() {<br>
+=C2=A0 go build helloworld.go<br>
+}</div></blockquote></div><br>Under what circumstances would one use the g=
o_do_compile from go.bbclass vs this?<br>-- <br><div class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1142ebfe5bf8950540fdaf7b--
