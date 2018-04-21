Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC06745FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 18:11:34 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id a2so5958300pff.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Apr 2018 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7g5rxZhkT6ydVpOhMqXquM1Fx7DQkaIfeclMpg4Zv5s=;
	b=aMzHjw0CSh3eiJzNW3MnoLzfS2cbQcPAsFZyG/92OkUPagz0rdQ0gyjhs1rGk+hvxr
	/lNbX70/dhiw9iFGsG3m21mg+OO/w4h8j6Dc0uZMxfm+aeXz0WAm4wNr6fGO6Hn7qf/6
	onfBWKJv9N85nKl9jDez8LMVePAswUyrCA/KrvNyEY17b1SIhnN1DIfEUKzHCKXsTP29
	o4rIwZTdbEDf1QuKf41SxWOhGJyaljhBS2SFc7/xwO/oxykB+YT+Vzx73CcC+1Zwhwts
	ynaiHCYP9caSD685P7uOxNi9Op96m9HGlyDygjfKHTQLdXY/1+f0ms6qv9l2Cd/O6oIB
	y2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7g5rxZhkT6ydVpOhMqXquM1Fx7DQkaIfeclMpg4Zv5s=;
	b=lN+zKvRABrlWaDIIO8vxzA8GQTxhU6jANMFdbZ4B2CKJ1GvHWoZ52ZCEkULcNNCUau
	t/mDKvY55GZSua7YQ5WMxxNgmhITmngMXsVHf+EJvoog6NGXh3IF+ifFXU9AJevXeGyQ
	5h3YsuFSy2FQPxBoiV2v6WnE9pwtCb3aY3uPHQZkzU1Kg0ZolsKSvSBN+vjfpEurs9+X
	GkNzEZaNybE4oO5fu1KqJUemBasz7JeXsnRKEau4rtH+1F2Xzl7+Qy/iG18hN+tTtqFg
	IHkqngixL53ohwGAnjHRFobQZF12kUA+/Jq76ADc4s+2JDmRzyIeNSFvsCAv3iCP3b+j
	bmrA==
X-Gm-Message-State: ALQs6tBtg7zyGN/MKsFXKTudB8byxw/GG82yfHl75L8d1yMPireRkLpo
	kWmGp3L2Xy0DnEerjjShnpmO/cDCePA0rDwT34c=
X-Google-Smtp-Source: AIpwx4+pjp7OqnuUr+ISk5KmfV48KwwTWhLU3FrsCj3EP5cLKqS7P6aHkRwOCicPVHL4/MqvycWOzpBpUTU/Dy0nKoQ=
X-Received: by 10.98.60.16 with SMTP id j16mr6077191pfa.7.1524334295301; Sat,
	21 Apr 2018 11:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180421131937.13745-1-matt@madison.systems>
In-Reply-To: <20180421131937.13745-1-matt@madison.systems>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Apr 2018 18:11:24 +0000
Message-ID: <CAMKF1spFm8NzzYmsAQWy_QPDFRfdj8kY+7EmLJ1xb2qBZvad0w@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: otavio@ossystems.com.br, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] go-runtime_1.9: pass BUILD_ flags to cgo for host-side build
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
X-List-Received-Date: Sat, 21 Apr 2018 18:11:34 -0000
Content-Type: multipart/alternative; boundary="94eb2c11335030c25a056a5fbcf0"

--94eb2c11335030c25a056a5fbcf0
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 21, 2018 at 6:20 AM Matt Madison <matt@madison.systems> wrote:

> When running the make.bash script to build the host-side
> tools, make sure that cgo is using CFLAGS and LDFLAGS for
> the build host, rather than those for the target.


LGTM I have tested similar patch last night it should fix the issue at hand
Thanks for quick fix


>
> [YOCTO #12704]
>
> Signed-off-by: Matt Madison <matt@madison.systems>
> ---
>  meta/recipes-devtools/go/go-runtime_1.9.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb
> b/meta/recipes-devtools/go/go-runtime_1.9.bb
> index a99cc30f63..d5279ea897 100644
> --- a/meta/recipes-devtools/go/go-runtime_1.9.bb
> +++ b/meta/recipes-devtools/go/go-runtime_1.9.bb
> @@ -11,7 +11,7 @@ do_compile() {
>         export CC=$BUILD_CC
>
>         cd src
> -       ./make.bash --host-only
> +       CGO_CFLAGS="${BUILD_CFLAGS}" CGO_LDFLAGS="${BUILD_LDFLAGS}"
> ./make.bash --host-only
>         cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
>         rm -rf ${B}/pkg/${TARGET_GOTUPLE}
>         ./make.bash --target-only
> --
> 2.14.1
>
>

--94eb2c11335030c25a056a5fbcf0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sat, Apr 21, 2018 =
at 6:20 AM Matt Madison &lt;matt@madison.systems&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">When running the make.bash script to build the hos=
t-side<br>
tools, make sure that cgo is using CFLAGS and LDFLAGS for<br>
the build host, rather than those for the target.</blockquote><div dir=3D"a=
uto"><br></div><div dir=3D"auto">LGTM I have tested similar patch last nigh=
t it should fix the issue at hand</div><div dir=3D"auto">Thanks for quick f=
ix</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
[YOCTO #12704]<br>
<br>
Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" rel=3D"=
noreferrer" target=3D"_blank">go-runtime_1.9.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" =
rel=3D"noreferrer" target=3D"_blank">go-runtime_1.9.bb</a> b/meta/recipes-d=
evtools/go/<a href=3D"http://go-runtime_1.9.bb" rel=3D"noreferrer" target=
=3D"_blank">go-runtime_1.9.bb</a><br>
index a99cc30f63..d5279ea897 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" rel=3D"=
noreferrer" target=3D"_blank">go-runtime_1.9.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.9.bb" rel=3D"=
noreferrer" target=3D"_blank">go-runtime_1.9.bb</a><br>
@@ -11,7 +11,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 export CC=3D$BUILD_CC<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd src<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CGO_CFLAGS=3D&quot;${BUILD_CFLAGS}&quot; CGO_LD=
FLAGS=3D&quot;${BUILD_LDFLAGS}&quot; ./make.bash --host-only<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap =
${B}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${B}/pkg/${TARGET_GOTUPLE}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ./make.bash --target-only<br>
-- <br>
2.14.1<br>
<br>
</blockquote></div></div>

--94eb2c11335030c25a056a5fbcf0--
