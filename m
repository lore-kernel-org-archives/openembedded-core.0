Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 498ED7D1F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 16:37:23 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c11so5331241qkk.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KFRFkkuRdOGR97TY+1NAnGyyrIiyOsGiwjYKNUBTwJI=;
	b=pT40iV9RNuq5XuxhbnAiMBiun8Qr84Qcb0apFFFnnXdSNFjwLoGKIt0aMxqhT4BfPI
	7YJSkyirTXYbUHZuGtV30wyCNqy9TlKCcw+0dura9VggoyMKICW9JWXgbcMFbblw+zct
	ZKM3wC0HQS6N4cqc/kMzNTXlEDai0nuAxPMYDWjAVLEmNfjtKU9EetyH2mr6mqqEe8Ty
	NiUxTRU0kY91FbBcT+dp8R3Zkb/YZpLJN+NNzUcl3+K9uDKfe7K8mFHVLwGTjf/WGTtG
	fVtLpFWH/eDY9ed9Y9c6ZqgrkW1VMVrJAqu9+X6cH3AEZAYVu8h77gaelxCUcBrsdshU
	GEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KFRFkkuRdOGR97TY+1NAnGyyrIiyOsGiwjYKNUBTwJI=;
	b=f6DtLKl7DCfuD8dO51RjPjps2YqV//6ZU3uoJ23KSBqoSBdLb69LAD0MpoLgp3Xly/
	NRmDWL/hraIIxJPPANrPw3fNJhqX1QAXh0cjB35bWlYWCc2XEVQJ/tcU2At8x6g482g/
	KepFIBvWQY82PPMus3lryKC+Qth2DIIcg/mrmql4lIrazQKgs/Br8hgN7MAgK1PwSpI2
	638qtJGQUU9Xj4OYOBFzdbm79jUPtg/v0Dbb9BJV9OxPhTYcr+q+2uYcx3Et+AnE+7WP
	EUNk4BCSRdlSLzzA4m10qhwKeWDq8FL/UeJBkpABktiGjFjW6YO4T2oPwMIWIcdnxEju
	HktQ==
X-Gm-Message-State: APjAAAUhW9v9gVO7timIWdX9jqhif0tTZMU505gtLUgdJ8E3zFt14W8H
	5o5M4wvk6yJuHoAF85CyIMMIa4by6KTjYcLqmXE=
X-Google-Smtp-Source: APXvYqxamSA7w2pWGdNe3ZomznISvIjAIDMUUFlmFiCoUwkIIy7ltzHXyWLC7wkCe8EQapeQXbsQWgZLc7VeFscXujw=
X-Received: by 2002:a37:4243:: with SMTP id p64mr9516855qka.9.1561739843910;
	Fri, 28 Jun 2019 09:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190627135440.15815-1-JPEWhacker@gmail.com>
In-Reply-To: <20190627135440.15815-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jun 2019 12:37:13 -0400
Message-ID: <CAMKF1srnRNisnxfnhypBQuwO9F5q72LSDzuBZqdStBoXaR1kDQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Fri, 28 Jun 2019 16:37:23 -0000
Content-Type: multipart/alternative; boundary="000000000000a0c02f058c64e469"

--000000000000a0c02f058c64e469
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2019 at 9:54 AM Joshua Watt <jpewhacker@gmail.com> wrote:

> gettext is required to generate the glibc locales in do_compile. If not
> present, glibc will skip the generation which isn't reproducible.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.29.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.29.bb
> b/meta/recipes-core/glibc/glibc_2.29.bb
> index 073d1533e37..c400ee10b0f 100644
> --- a/meta/recipes-core/glibc/glibc_2.29.bb
> +++ b/meta/recipes-core/glibc/glibc_2.29.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSES;md5=3Dcfc0ed77a9f62fa62eded042ebe31d72 \
>
>  file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a13b2332ec1c785f5d83a =
\
>        file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b364516c"
>
> -DEPENDS +=3D "gperf-native bison-native make-native"
> +DEPENDS +=3D "gperf-native bison-native make-native gettext-native"


I think we have had this dependency proposed in past and one think that
worries me is that it will cause serialization a bit more and can affect
bulls times wasn=E2=80=99t there a minimal gettext at some point and I wond=
er if
that could satisfy needs here

>
>
>  PV =3D "2.29"
>
> --
> 2.21.0
>
>

--000000000000a0c02f058c64e469
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Jun 27, 2019 at 9:54 AM Joshua Watt &lt;<a href=3D"=
mailto:jpewhacker@gmail.com">jpewhacker@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">gettext is required to generate the glibc loc=
ales in do_compile. If not<br>
present, glibc will skip the generation which isn&#39;t reproducible.<br>
<br>
Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com" targ=
et=3D"_blank">JPEWhacker@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.29.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.29.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.29.bb</a><br>
index 073d1533e37..c400ee10b0f 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.29.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.29.bb</a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3Dcfc0ed77a9=
f62fa62eded042ebe31d72 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb3=
94a13b2332ec1c785f5d83a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D4fbd65380cdd25595107900=
8b364516c&quot;<br>
<br>
-DEPENDS +=3D &quot;gperf-native bison-native make-native&quot;<br>
+DEPENDS +=3D &quot;gperf-native bison-native make-native gettext-native&qu=
ot;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think we ha=
ve had this dependency proposed in past and one think that worries me is th=
at it will cause serialization a bit more and can affect bulls times wasn=
=E2=80=99t there a minimal gettext at some point and I wonder if that could=
 satisfy needs here=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
=C2=A0PV =3D &quot;2.29&quot;<br>
<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div></div>

--000000000000a0c02f058c64e469--
