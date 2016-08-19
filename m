Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E05F977071
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:56:58 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l89so3436564lfi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 11:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=unZ/HEqhTJPw6gWH2gTTUIFA0okptjnEb796yGeFZJM=;
	b=Iko5/fHg88z/fqheNvJhyWF1UIhe0VAAiybv7/qIbaPkpeKpj7DmTqjG7KTS32XbHi
	EXwonJ1SHOjUZNk8E13p5oMhLq0/b24Coff+19w0x5B3+5p6DQ9Vl8kUOM2sP6cLmNXH
	KHKfFuVBi/gUqY34J0hJlanDjEPg8kB3eGbN45C604IKR4/GGSi8OVOXVp2oC+22jJpo
	FXuGpS7hgGPOauz/yfFeqW/Ilm0lkpJeowgrauSXaUggZaZNCfd6xR5YrT3cPZKeMs5/
	UzYNOAIhmw9KRWboin6PlQL+3b9V06NyXmfMu+Y3GyTtJK4dWOoaZG0iN3TAP+Igmsd2
	1B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=unZ/HEqhTJPw6gWH2gTTUIFA0okptjnEb796yGeFZJM=;
	b=HiLh++ESvMWHCYbQLJaA47Go19BoRmccGmcTX4aaN8p+KNZ1IyBq0Z0GnW9NwP8SrV
	KlSErM81wY+WwxyCWfzUk4aFWnx4LJmr2b0Ur8DgddUm2cM6RMBpHZaD91CkfAn3veGu
	Rx7onDoW10boqezjiG/iJhZhZ4IJfh4W3EZd2GDmuedVPNTBj0YH7hRlHuQ2Uf86M+xI
	AyiUYEkV9mqwJWyflA5XZd/lHMSyZaxuGEQwkgGveANvQgoVNtXN14BOt7lJwX/my7gA
	/iyZmF4QMx+lRyAgPTTuaTNfe3CxDy/9xRDFW+6ZTfJBUvY4bcqrkW3cRBsFLs5v++OA
	f19Q==
X-Gm-Message-State: AEkoout2QEbteERmpgh1iGeB616iWFVjkcw39wQ6F7ndCtPX6Rbgsn94HsjqOJlnTiQQlv3gBwfATGO221o8ug==
X-Received: by 10.25.158.140 with SMTP id h134mr2093615lfe.0.1471633019168;
	Fri, 19 Aug 2016 11:56:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Fri, 19 Aug 2016 11:56:28 -0700 (PDT)
X-Originating-IP: [177.127.4.56]
In-Reply-To: <1471373249-323-2-git-send-email-fabio.berton@ossystems.com.br>
References: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
	<1471373249-323-2-git-send-email-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 19 Aug 2016 15:56:28 -0300
Message-ID: <CAAPZna1A-VUosmEW47aVfvTQU6hYhtY1zinB7_q=0xnPK-oGpQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 2/2] python3-native: Extend python3-native rproviders
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
X-List-Received-Date: Fri, 19 Aug 2016 18:57:00 -0000
Content-Type: multipart/alternative; boundary=001a114102a458fed8053a7143a8

--001a114102a458fed8053a7143a8
Content-Type: text/plain; charset=UTF-8

ping?

On Tue, Aug 16, 2016 at 3:47 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Add the following modules to RPROVIDES:
>
>   - python3-email-native
>   - python3-io-native
>   - python3-json-native
>   - python3-lang-native
>   - python3-misc-native
>   - python3-netclient-native
>   - python3-netserver-native
>   - python3-numbers-native
>   - python3-pkgutil-native
>   - python3-pprint-native
>   - python3-re-native
>   - python3-shell-native
>   - python3-subprocess-native
>   - python3-threading-native
>   - python3-unittest-native
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/python/python3-native_3.5.2.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb
> b/meta/recipes-devtools/python/python3-native_3.5.2.bb
> index 3334cba..594f15c 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
> @@ -46,9 +46,23 @@ RPROVIDES += " \
>      python3-compression-native \
>      python3-core-native \
>      python3-distutils-native \
> +    python3-email-native \
>      python3-importlib-native \
>      python3-io-native \
> +    python3-json-native \
> +    python3-lang-native \
> +    python3-misc-native \
> +    python3-netclient-native \
> +    python3-netserver-native \
> +    python3-numbers-native \
> +    python3-pkgutil-native \
> +    python3-pprint-native \
> +    python3-re-native \
> +    python3-shell-native \
> +    python3-subprocess-native \
>      python3-textutils-native \
> +    python3-threading-native \
> +    python3-unittest-native \
>  "
>
>  EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
> --
> 2.1.4
>
>

--001a114102a458fed8053a7143a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">ping?<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Aug 16, 2016 at 3:47 PM, Fabio Ber=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" =
target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">Add the following modules to =
RPROVIDES:<br>
<br>
=C2=A0 - python3-email-native<br>
=C2=A0 - python3-io-native<br>
=C2=A0 - python3-json-native<br>
=C2=A0 - python3-lang-native<br>
=C2=A0 - python3-misc-native<br>
=C2=A0 - python3-netclient-native<br>
=C2=A0 - python3-netserver-native<br>
=C2=A0 - python3-numbers-native<br>
=C2=A0 - python3-pkgutil-native<br>
=C2=A0 - python3-pprint-native<br>
=C2=A0 - python3-re-native<br>
=C2=A0 - python3-shell-native<br>
=C2=A0 - python3-subprocess-native<br>
=C2=A0 - python3-threading-native<br>
=C2=A0 - python3-unittest-native<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
</span>Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br">otavio@ossystems.com.br</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-native_3.5.2.b=
b" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-native_3.5.2.bb</a> | =
14 ++++++++++++++<br>
=C2=A01 file changed, 14 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-na=
tive_3.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb=
</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3=
.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><b=
r>
index 3334cba..594f15c 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><br=
>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><br=
>
@@ -46,9 +46,23 @@ RPROVIDES +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-compression-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-core-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-distutils-native \<br>
+=C2=A0 =C2=A0 python3-email-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-importlib-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-io-native \<br>
+=C2=A0 =C2=A0 python3-json-native \<br>
+=C2=A0 =C2=A0 python3-lang-native \<br>
+=C2=A0 =C2=A0 python3-misc-native \<br>
+=C2=A0 =C2=A0 python3-netclient-native \<br>
+=C2=A0 =C2=A0 python3-netserver-native \<br>
+=C2=A0 =C2=A0 python3-numbers-native \<br>
+=C2=A0 =C2=A0 python3-pkgutil-native \<br>
+=C2=A0 =C2=A0 python3-pprint-native \<br>
+=C2=A0 =C2=A0 python3-re-native \<br>
+=C2=A0 =C2=A0 python3-shell-native \<br>
+=C2=A0 =C2=A0 python3-subprocess-native \<br>
=C2=A0 =C2=A0 =C2=A0python3-textutils-native \<br>
+=C2=A0 =C2=A0 python3-threading-native \<br>
+=C2=A0 =C2=A0 python3-unittest-native \<br>
=C2=A0&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append =3D &quot; --bindir=3D${bindir}/${PN} --without-e=
nsurepip&quot;<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div>

--001a114102a458fed8053a7143a8--
