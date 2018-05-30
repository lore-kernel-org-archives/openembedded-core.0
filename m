Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E644060750;
	Wed, 30 May 2018 13:08:46 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t11-v6so47823327wmt.0;
	Wed, 30 May 2018 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PhB0yw8zziJcOFOZykrsHy8fQgc2FBkQT7AT5sp9OTU=;
	b=tphMrEsgAb71hdG2qelwraAojbAFXbxFFWFUJ7fe+cwevYv9tPpxyRsSFwR0gi3HZG
	RpO8lkS0zZWjPeRVJNx4k104Rrdv8jdIxpOgJ63F15LsTccfdlRaTN/VnQJEg2gpD1MQ
	ikL9ImG2ZkCGLVMfj9/sbD45I7WhcFvow0r7SxAp2yyzvsEJBfzPMcYdL8Oq6NGHHSAa
	YR9j3pENKU3w8iofGOqrNzqm+BBOoL6bDB9zBZyL9b3qrZ5FqD9mVm5btC48S2Od1KmM
	ya6TRFZB27nV6FXFTP6O88x+Zle04OFAYwjjwj9c16kOho2r7oO9CDse09x76tQ9WgGE
	r55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PhB0yw8zziJcOFOZykrsHy8fQgc2FBkQT7AT5sp9OTU=;
	b=UG6JkTqmQjDfIMpJ1+br4yvkCv9q+T5LlS9uXPEIWk5dnnzyyOb7b51J+ctbZlOK/s
	A5KIHhIbyNxNm/podKp9rs5LRtND118LmqXXuR8QixBlPPA55xakJofRFZqqRDuNFYYe
	Hy2Rh1bAd/4laNtME3sChEFl6cT7+3jFr3Kypz6SDpBIJ052NfMxHusrogO/NTD1p/re
	urR8erp4ZuOPXmHE+oHKb0JUfPfSKCUFNHHVE3ydqh3ev0tFVqxogPc339xfwsxo59pi
	TZMBMyfAf2LilBTKO1UzlKwp/s+fFegtC+u/55z0nO+gUHU/m/qOruC2UAM7pCDIT0kr
	JPOA==
X-Gm-Message-State: ALKqPwept8QLaE1c6ixPIDjVDtMvFvp85x7pw6qni48vqMsGEOsb7+um
	Tamr7lpTrE7JpiT54KW1p4y+FrdhEmixql3DPhY=
X-Google-Smtp-Source: ADUXVKKdNmJB66OvNdWlw9OiESzeb4l34Adc1e7wsfgWnxj2SaJitTPZWbxSabC+W7qnC1mbkW0iOW/GNMTSpg3WXTc=
X-Received: by 2002:a1c:4249:: with SMTP id
	p70-v6mr1458702wma.17.1527685727480; 
	Wed, 30 May 2018 06:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180530130016.18864-1-george.mccollister@gmail.com>
In-Reply-To: <20180530130016.18864-1-george.mccollister@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 May 2018 15:08:36 +0200
Message-ID: <CA+chaQfsqr6opc79LGEswd48uodj2ergv_8Lfb1A8iGPXQgqTw@mail.gmail.com>
To: george.mccollister@gmail.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][rocko][PATCH] protobuf: fix SRC_URI by removing branch
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
X-List-Received-Date: Wed, 30 May 2018 13:08:47 -0000
Content-Type: multipart/alternative; boundary="0000000000001d7173056d6c0de4"

--0000000000001d7173056d6c0de4
Content-Type: text/plain; charset="UTF-8"

This doesn't just rely on SRCREV (bitbake fetcher would be complaining if
the SRCREV isn't found in the branch used in SRC_URI), it relies on this
SRCREV to be in master branch (which is the default branch for git fetcher):

docker-shr @ ~/projects/protobuf $ git branch -a --contains
b04e5cba356212e4e8c66c61bbe0c3a20537c5b9
* master
  remotes/origin/3.5.1.1
  remotes/origin/3.5.x
  remotes/origin/3.6.x
  remotes/origin/HEAD -> origin/master
  remotes/origin/cython_protobuf
  remotes/origin/master
  remotes/origin/php-generated-dev
  remotes/origin/python-wheel
  remotes/origin/python_deps


On Wed, May 30, 2018 at 3:01 PM George McCollister <
george.mccollister@gmail.com> wrote:

> The 3.4.x branch was removed upstream but the commit referenced in
> SRCREV is the 3.4.1 release and is still available:
> https://github.com/google/protobuf/releases/tag/v3.4.1
>
> Drop branch=3.4.x from SRC_URI and just rely on SRCREV.
>
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> index fae7c18a1..fe28f475a 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.4.1.bb
> @@ -18,7 +18,7 @@ SRCREV = "b04e5cba356212e4e8c66c61bbe0c3a20537c5b9"
>
>  PV = "3.4.1+git${SRCPV}"
>
> -SRC_URI = "git://github.com/google/protobuf.git;branch=3.4.x"
> +SRC_URI = "git://github.com/google/protobuf.git"
>
>  EXTRA_OECONF += " --with-protoc=echo"
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001d7173056d6c0de4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This doesn&#39;t just=C2=A0rely on SRCREV (bitbake fe=
tcher would be complaining if the SRCREV isn&#39;t found in the branch used=
 in SRC_URI), it relies on this SRCREV to be in master branch (which is the=
 default branch for git fetcher):</div><div><br></div><div>docker-shr @ ~/p=
rojects/protobuf $ git branch -a --contains b04e5cba356212e4e8c66c61bbe0c3a=
20537c5b9</div><div>* master</div><div>=C2=A0 remotes/origin/<a href=3D"htt=
p://3.5.1.1">3.5.1.1</a></div><div>=C2=A0 remotes/origin/3.5.x</div><div>=
=C2=A0 remotes/origin/3.6.x</div><div>=C2=A0 remotes/origin/HEAD -&gt; orig=
in/master</div><div>=C2=A0 remotes/origin/cython_protobuf</div><div>=C2=A0 =
remotes/origin/master</div><div>=C2=A0 remotes/origin/php-generated-dev</di=
v><div>=C2=A0 remotes/origin/python-wheel</div><div>=C2=A0 remotes/origin/p=
ython_deps</div><div><br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr">On Wed, May 30, 2018 at 3:01 PM George McCollister &lt;<a href=3D=
"mailto:george.mccollister@gmail.com">george.mccollister@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">The 3.4.x branch was removed=
 upstream but the commit referenced in<br>
SRCREV is the 3.4.1 release and is still available:<br>
<a href=3D"https://github.com/google/protobuf/releases/tag/v3.4.1" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/google/protobuf/releases/ta=
g/v3.4.1</a><br>
<br>
Drop branch=3D3.4.x from SRC_URI and just rely on SRCREV.<br>
<br>
Signed-off-by: George McCollister &lt;<a href=3D"mailto:george.mccollister@=
gmail.com" target=3D"_blank">george.mccollister@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">protobuf_3.4.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3=
.4.1.bb" rel=3D"noreferrer" target=3D"_blank">protobuf_3.4.1.bb</a> b/meta-=
oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">protobuf_3.4.1.bb</a><br>
index fae7c18a1..fe28f475a 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">protobuf_3.4.1.bb</a><br>
+++ b/meta-oe/recipes-devtools/protobuf/<a href=3D"http://protobuf_3.4.1.bb=
" rel=3D"noreferrer" target=3D"_blank">protobuf_3.4.1.bb</a><br>
@@ -18,7 +18,7 @@ SRCREV =3D &quot;b04e5cba356212e4e8c66c61bbe0c3a20537c5b9=
&quot;<br>
<br>
=C2=A0PV =3D &quot;3.4.1+git${SRCPV}&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/protobuf.git;b=
ranch=3D3.4.x" rel=3D"noreferrer" target=3D"_blank">github.com/google/proto=
buf.git;branch=3D3.4.x</a>&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/google/protobuf.git" =
rel=3D"noreferrer" target=3D"_blank">github.com/google/protobuf.git</a>&quo=
t;<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot; --with-protoc=3Decho&quot;<br>
<br>
-- <br>
2.11.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000001d7173056d6c0de4--
