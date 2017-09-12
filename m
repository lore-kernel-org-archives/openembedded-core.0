Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0D77071C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:15:26 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id o22so12846591vke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JOFsZymWI7yrFSqtzdyWK0mFc4PpnZFUrfK2vpsWomw=;
	b=l5u6NS7mqE5x0a2kS3LJ6HrWkc+7eCodNNwxttuUJyP6M9Iw6neOe77K1KxG3p38Tz
	l8JRqa2W0iu4eEMjWmPpdJUv4/eb4POW6n8YylWKz0RUpg/pnZBCP4BsEzw8HCmq1UC7
	q8fT+dsZYq5qkqWUXnrPzq0OvogEqBrxC4cRs6ElokktrJN4a7HzXA5csPb9Bp0pv6y8
	j/qjjXv2KW6KfZ4y6QUIJMz31NhRZjMtzZQqONypTF2JzcpTgtQ8NbG8Ig4eVbcc3tdD
	1PoVfs/c22w9TRShutONd8Cr18kijGvytuCzvAFYKHi+a7W6mL95sBWEspAANPY7AC6L
	R63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JOFsZymWI7yrFSqtzdyWK0mFc4PpnZFUrfK2vpsWomw=;
	b=m3ity7WbxdIpB/ufKnQTeuvUR46dFZqDDVqqKdyLNO5wcZDnk6dRTxjGr9pNR+PaEJ
	jL6Z8Ug4BHhy0QAbxjF46Mb7fZGvy0twhXNnI2CV0vPVNh0Nm+2Db4vGZPYR3rEBs4bQ
	T5zyJUNfIzzifydZgnmGqCz914lUiokz/fdyZzKhVo1Zr8fnlBpDWrNdvx9g3/43F9jD
	S2CmkrtC/tDmq8s90aeFL+Iwekb0oUS+dX/xx4Qw5+eVOktATinNqUXix8ZamCbRlZP4
	EKGWymkoVWNKcD19xWTxAp2WrIKRvwz+BVnhEhCIG34X99y6HDWt/JS3Xtoe0M3EU1+s
	Txbg==
X-Gm-Message-State: AHPjjUjjWXMicc58+NlFde5ADuIlM3P+fc7wqmgl9VgY7mRFm5xIsp1k
	gsgsMcOYmntH6N+1d7tIGWpN7Z+Hhw==
X-Google-Smtp-Source: AOwi7QBIT4CQtHPoCSLhNRLpjYQ7SM/cu+jq4/Yn6VHq98t8RVEb+xQB5voc6o4ZSXBPIHArGginffqUwSfwMCuj4jY=
X-Received: by 10.31.224.134 with SMTP id x128mr9545872vkg.1.1505222128039;
	Tue, 12 Sep 2017 06:15:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Tue, 12 Sep 2017 06:15:27 -0700 (PDT)
In-Reply-To: <20170912125031.4009-7-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 12 Sep 2017 15:15:27 +0200
Message-ID: <CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Will Newton <willn@resin.io>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 13:15:27 -0000
Content-Type: multipart/alternative; boundary="94eb2c07afe23ffbce0558fdd634"

--94eb2c07afe23ffbce0558fdd634
Content-Type: text/plain; charset="UTF-8"

Doesn't this belong into:
[OE-core] [PATCH v8 03/13] go: split out go-runtime into separate recipe
where it packaging change was probably introduced?

Also just RFC question, would it make sense to use:

VIRTUAL-RUNTIME_bash ?= "bash"
RDEPENDS_${PN}-dev += "${VIRTUAL-RUNTIME_bash}"

instead of the bash dependency directly? If it's acceptable for oe-core
I'll create change to do it for all recipe (I don't mind waiting after 2.4
is released).

Because right now for reasons described in
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9217 I need to do the
above +
RDEPENDS_${PN}-dev_remove = "bash"
for many recipes with many bbappends, for our distro where we RPROVIDE bash
by busybox, which is good enough for package manager, but QA error is still
shown in cases where the real bash is built before the component
rdpenending on it.

Regards,


On Tue, Sep 12, 2017 at 2:50 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The src content has been moved to -dev package, so does the test
> routines. Fix the runtime dependency accordingly.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v8:
> - new patch
>
> Changes in v7: None
> Changes in v6: None
>
>  meta/recipes-devtools/go/go-dep_0.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb
> b/meta/recipes-devtools/go/go-dep_0.3.0.bb
> index c65b4f7cb5..5e4544a104 100644
> --- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
> +++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
> @@ -15,4 +15,4 @@ GO_INSTALL = "${GO_IMPORT}/cmd/dep"
>
>  INSANE_SKIP_${PN} += "ldflags"
>
> -RDEPENDS_${PN}-staticdev += "bash"
> +RDEPENDS_${PN}-dev += "bash"
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c07afe23ffbce0558fdd634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Doesn&#39;t this belong into:</div><div>[OE-core] [PA=
TCH v8 03/13] go: split out go-runtime into separate recipe<br></div><div>w=
here it packaging change was probably introduced?</div><div><br></div><div>=
Also just RFC question, would it make sense to use:</div><div><br></div><di=
v>VIRTUAL-RUNTIME_bash ?=3D &quot;bash&quot;</div><div>RDEPENDS_${PN}-dev +=
=3D &quot;${VIRTUAL-RUNTIME_bash}&quot;</div><div><br></div><div>instead of=
 the bash dependency directly? If it&#39;s acceptable for oe-core I&#39;ll =
create change to do it for all recipe (I don&#39;t mind waiting after 2.4 i=
s released).</div><div><br></div><div>Because right now for reasons describ=
ed in=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9=
217">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9217</a> I need to=
 do the above +</div><div>RDEPENDS_${PN}-dev_remove =3D &quot;bash&quot;<br=
></div><div>for many recipes with many bbappends, for our distro where we R=
PROVIDE bash by busybox, which is good enough for package manager, but QA e=
rror is still shown in cases where the real bash is built before the compon=
ent rdpenending on it.</div><div><br></div><div>Regards,</div><div><br></di=
v></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, S=
ep 12, 2017 at 2:50 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The src content has be=
en moved to -dev package, so does the test<br>
routines. Fix the runtime dependency accordingly.<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
---<br>
<br>
Changes in v8:<br>
- new patch<br>
<br>
Changes in v7: None<br>
Changes in v6: None<br>
<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a> b/meta/recipes-=
devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"noreferrer" target=3D=
"_blank">go-<wbr>dep_0.3.0.bb</a><br>
index c65b4f7cb5..5e4544a104 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-dep_0.3.0.bb" rel=3D"no=
referrer" target=3D"_blank">go-<wbr>dep_0.3.0.bb</a><br>
@@ -15,4 +15,4 @@ GO_INSTALL =3D &quot;${GO_IMPORT}/cmd/dep&quot;<br>
<br>
=C2=A0INSANE_SKIP_${PN} +=3D &quot;ldflags&quot;<br>
<br>
-RDEPENDS_${PN}-staticdev +=3D &quot;bash&quot;<br>
+RDEPENDS_${PN}-dev +=3D &quot;bash&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.14.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c07afe23ffbce0558fdd634--
