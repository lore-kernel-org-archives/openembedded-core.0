Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 975F06FF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 18:56:51 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id 33so3429983lfw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qZJBkkxNpFn6dbvoPZ2D7HjEY5DB+1iYOg+3B+SmzWs=;
	b=U6hJxVTFZZUxUTuDnkc83YWe+OPMG8MRy/uJTgO5KkHTyLFMAKYS7010F8qUwf6jdD
	sz7F+f0wwi1gyuRlpw01ZLydMMjEadfTjp8yhg/svkD4KvyNuRJnk3lr9smTZd5yokJu
	dCsFBJkKsLppQ5x0EQxnEuasP+TZwORDPbJAesBf0Tzu1p71IIJ864s32dEGeWXLANKv
	VpZFIN7hfS67zYwFAtFa097E5N3B+VUUp68gLsSTIb/cbQInQw40wUEl+sVTCzPAykx5
	kBbtL1kIR7PrzyGCTX2rzys78Q2qhCMHAC6S6WcqRtOEgH+ik9NA3hBIOztwWgG5qT76
	jUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qZJBkkxNpFn6dbvoPZ2D7HjEY5DB+1iYOg+3B+SmzWs=;
	b=K45sIZmXtHPEPSEl8kl76ekv5yxScCgTuHMXbMhNgOEzqORskieStCj6d9xsO9ZhOt
	IYEzxBx0TGKghnLA8qSpimmbakxtJP5qx/MpMwcCRWA9aDleZLrWqv+Gg2AxfqQSSjK4
	hSoVbxBYBSJE8YhByZbwuqivbR7nPHDRnzT6Qbdj5Yqo5QZ4SaH/eSKRE0tUlAGZr0Jv
	6XnrePnmOmbo6PPYHlowbM6e7TMfl4HQmI+IpQUwbnaBYmhZUd2FcMXkeRZfrIb0lTJY
	TIh7gARSxQnK0swrR7zgrKN+szV8IDhXdEXeMndjoOiDEC/AGL+hkW7A6S9IFmQ29Gxv
	9ehA==
X-Gm-Message-State: AEkoouvvrsjod7McJG+LKsTGbIwx54nMuEZrkYwIe6sDJxgy8g4cL/evR7wMz2EaoyK6BAFAMI1vHYL9nj4VVQ==
X-Received: by 10.25.139.214 with SMTP id n205mr2081904lfd.84.1471633010977;
	Fri, 19 Aug 2016 11:56:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.7.8 with HTTP; Fri, 19 Aug 2016 11:56:20 -0700 (PDT)
X-Originating-IP: [177.127.4.56]
In-Reply-To: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471373249-323-1-git-send-email-fabio.berton@ossystems.com.br>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 19 Aug 2016 15:56:20 -0300
Message-ID: <CAAPZna1qSkhPTsHjoQysYyEQraFZ8s+Sa9bph4SS7z88eP_crg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] python3-native: Change code style for rprovides
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
X-List-Received-Date: Fri, 19 Aug 2016 18:56:53 -0000
Content-Type: multipart/alternative; boundary=001a113fb9f4dc05ed053a7142df

--001a113fb9f4dc05ed053a7142df
Content-Type: text/plain; charset=UTF-8

ping?

On Tue, Aug 16, 2016 at 3:47 PM, Fabio Berton <fabio.berton@ossystems.com.br
> wrote:

> Use a more readable code style for RPROVIDES and sort recipes
> alphabetically.
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-devtools/python/python3-native_3.5.2.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python3-native_3.5.2.bb
> b/meta/recipes-devtools/python/python3-native_3.5.2.bb
> index 061b595..3334cba 100644
> --- a/meta/recipes-devtools/python/python3-native_3.5.2.bb
> +++ b/meta/recipes-devtools/python/python3-native_3.5.2.bb
> @@ -42,7 +42,14 @@ DEPENDS = "openssl-native bzip2-replacement-native
> zlib-native readline-native s
>
>  inherit native
>
> -RPROVIDES += "python3-distutils-native python3-compression-native
> python3-textutils-native python3-core-native python3-importlib-native
> python3-io-native"
> +RPROVIDES += " \
> +    python3-compression-native \
> +    python3-core-native \
> +    python3-distutils-native \
> +    python3-importlib-native \
> +    python3-io-native \
> +    python3-textutils-native \
> +"
>
>  EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
>
> --
> 2.1.4
>
>

--001a113fb9f4dc05ed053a7142df
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">ping?<br></div></div><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Tue, Aug 16, 2016 at 3:47 PM, Fabio Ber=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:fabio.berton@ossystems.com.br" =
target=3D"_blank">fabio.berton@ossystems.com.br</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><span class=3D"">Use a more readable code styl=
e for RPROVIDES and sort recipes<br>
alphabetically.<br>
<br>
Signed-off-by: Fabio Berton &lt;<a href=3D"mailto:fabio.berton@ossystems.co=
m.br">fabio.berton@ossystems.com.br</a><wbr>&gt;<br>
</span>Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystem=
s.com.br">otavio@ossystems.com.br</a>&gt;<br>
<div class=3D"HOEnZb"><div class=3D"h5">---<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-native_3.5.2.b=
b" rel=3D"noreferrer" target=3D"_blank">p<wbr>ython3-native_3.5.2.bb</a> | =
9 ++++++++-<br>
=C2=A01 file changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-na=
tive_3.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb=
</a> b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3=
.5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><b=
r>
index 061b595..3334cba 100644<br>
--- a/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><br=
>
+++ b/meta/recipes-devtools/<wbr>python/<a href=3D"http://python3-native_3.=
5.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-native_3.5.2.bb</a><br=
>
@@ -42,7 +42,14 @@ DEPENDS =3D &quot;openssl-native bzip2-replacement-nativ=
e zlib-native readline-native s<br>
<br>
=C2=A0inherit native<br>
<br>
-RPROVIDES +=3D &quot;python3-distutils-native python3-compression-native p=
ython3-textutils-native python3-core-native python3-importlib-native python=
3-io-native&quot;<br>
+RPROVIDES +=3D &quot; \<br>
+=C2=A0 =C2=A0 python3-compression-native \<br>
+=C2=A0 =C2=A0 python3-core-native \<br>
+=C2=A0 =C2=A0 python3-distutils-native \<br>
+=C2=A0 =C2=A0 python3-importlib-native \<br>
+=C2=A0 =C2=A0 python3-io-native \<br>
+=C2=A0 =C2=A0 python3-textutils-native \<br>
+&quot;<br>
<br>
=C2=A0EXTRA_OECONF_append =3D &quot; --bindir=3D${bindir}/${PN} --without-e=
nsurepip&quot;<br>
<br>
--<br>
2.1.4<br>
<br>
</div></div></blockquote></div><br></div>

--001a113fb9f4dc05ed053a7142df--
