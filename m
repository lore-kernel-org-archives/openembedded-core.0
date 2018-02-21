Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D895360684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 09:08:15 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id s5so2309656wra.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 01:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZjetEmBaDDpAGGwUan2uBzwZc1McFSbdybE6kJMVcKU=;
	b=Zre9MIVZA5etUSj1DZqiIcr5vxcXq2C1D10dwrGJryTbLTJRplHiJFjeLkiiOoIyt9
	jHqSYf3v8YysUGR0V7jKdcaDfGkhPPBaOnH8prPkC59VNiLkvrhQE/ezPapIN/+3Wo5L
	MTlCA2Ofx2OzJDDDOyPb11cprwoX6A8kHHNUda8nnnLHImRFNS5R7dR870J4aCInmfsb
	TtqeYU87N/h/jK5nOknyys72dbLRj26RdppnTokHtoR0zTXVHj/99tMhlr4A66U0x9VN
	qtJKTvgkpgBlpnW1KZ8PzrA78o7s/0ZTK8Up1Xa2HXYIPaN6H8n14xa1U4UUfwW9wv8M
	woCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZjetEmBaDDpAGGwUan2uBzwZc1McFSbdybE6kJMVcKU=;
	b=lievFc3VL99d9TxmA4y1A4vaRHZkNK25YX+MWajVmyDJEKUl6EpGr7eYVh02QcxBW1
	ECVCeOTvqRf3mIJj8KzdAT71JVRrFMe4GQoKZlkIwOCfTF4QKwwdqaNFPKsQppo64CzS
	lIiVb6mDMXPpJMLKPp/4v2E+jAIRdox/CwswdFz6o0WXErE0HVOSPZwjp7FmfaoEpa3o
	pBdxWM8DKEPbKMe5Vhb+FuvNRh/JU2iuaL0PQvp9DCnNwqT+rPwbb0FVbw22h8X98y7D
	WrAj+i2+NfB52Pgyu5YVkCGFCW7qGsPGc3JgSCpdIMGZBHoImxIhDcATUGpNeVHMKLai
	Sq3g==
X-Gm-Message-State: APf1xPCKeh3nBK6CNQDYNVoPSLtJw3B+IBhhQGYBRz4m2+5gFdNjv3uf
	kwYq85RH+NnaCS3hKeoi1qa6a+twXd9L06ddKwW7lQ==
X-Google-Smtp-Source: AH8x2277Le83P/aAnqds9xZKdDwkcc36aXTsENBjxH/L1NJjcsjJN7Tg2hrAvCR2NXQO9Jg1m1yjGziI6WhF2FAWFNE=
X-Received: by 10.28.196.200 with SMTP id u191mr1571049wmf.17.1519204096646;
	Wed, 21 Feb 2018 01:08:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 21 Feb 2018 01:08:16 -0800 (PST)
In-Reply-To: <20180221063532.29161-1-mgloff@emacinc.com>
References: <20180221063532.29161-1-mgloff@emacinc.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 21 Feb 2018 10:08:16 +0100
Message-ID: <CA+chaQcxm+B4AZdxRAX=aPRaRJ5J7DNUnn=1J0-UdwfuUDwgEg@mail.gmail.com>
To: Michael Gloff <mgloff@emacinc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.py: Use minimum value for PARALLEL_MAKE.
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
X-List-Received-Date: Wed, 21 Feb 2018 09:08:16 -0000
Content-Type: multipart/alternative; boundary="94eb2c1935a685a22f0565b54467"

--94eb2c1935a685a22f0565b54467
Content-Type: text/plain; charset="UTF-8"

http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147525.html

On Wed, Feb 21, 2018 at 7:35 AM, Michael Gloff <mgloff@emacinc.com> wrote:

> feded5fe2755fc6523c235fd6e82a0972e197c08 introduces
> parallel_make_argument with optional limit value. We need
> the min of PARRALLEL_MAKE and limit.
>
> Signed-off-by: Michael Gloff <mgloff@emacinc.com>
> ---
>  meta/lib/oe/utils.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index ec91927233..80f0442d0a 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -195,7 +195,7 @@ def parallel_make_argument(d, fmt, limit=None):
>      v = parallel_make(d)
>      if v:
>          if limit:
> -            v = max(limit, v)
> +            v = min(limit, v)
>          return fmt % v
>      return ''
>
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c1935a685a22f0565b54467
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><a href=3D"http://lists.openembedded.org/pipermail/openemb=
edded-core/2018-February/147525.html">http://lists.openembedded.org/piperma=
il/openembedded-core/2018-February/147525.html</a><br></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 21, 2018 at 7:35 AM,=
 Michael Gloff <span dir=3D"ltr">&lt;<a href=3D"mailto:mgloff@emacinc.com" =
target=3D"_blank">mgloff@emacinc.com</a>&gt;</span> wrote:<br><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">feded5fe2755fc6523c235fd6e82a0<wbr>972e197c08 introduces<=
br>
parallel_make_argument with optional limit value. We need<br>
the min of PARRALLEL_MAKE and limit.<br>
<br>
Signed-off-by: Michael Gloff &lt;<a href=3D"mailto:mgloff@emacinc.com">mglo=
ff@emacinc.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/utils.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py<br>
index ec91927233..80f0442d0a 100644<br>
--- a/meta/lib/oe/utils.py<br>
+++ b/meta/lib/oe/utils.py<br>
@@ -195,7 +195,7 @@ def parallel_make_argument(d, fmt, limit=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0v =3D parallel_make(d)<br>
=C2=A0 =C2=A0 =C2=A0if v:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if limit:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D max(limit, v)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D min(limit, v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return fmt % v<br>
=C2=A0 =C2=A0 =C2=A0return &#39;&#39;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.16.2<br>
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

--94eb2c1935a685a22f0565b54467--
