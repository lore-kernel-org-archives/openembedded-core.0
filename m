Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.7407.1613044796606143369
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 03:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QOeBlAw5;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: raymsmithuk@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id u4so7024529ljh.6
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 03:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZ6oHoYGoWDa7rfVCf53O72N8eqVre3ctuF0XR2yaAg=;
        b=QOeBlAw5A5jNs6VzuUAy1j7dTx4DWrcfjTpYunxPDhOTt2pSKfRGIkSRYwNdWsvMkG
         t4Pr3j17mKY9NX0mEPpu63oJalfKpP/b7oaJvzpHm8DESKrw79w1MuvQHMJE9GxrQcV/
         06hz+wXJ49I0PJMT/uzHS7HjroC6jazRLuL9rEmvM9adw0C3k0Cx51Ohexp9agZaOz2L
         ucU7MsGf/rbwhO7M6VQx53bbCjskwAYwomDgU+gVxJ1MMYVkI/RJ+sTQl6HlF4BUesAp
         eSOrgpIqPFZL4lbHy7IxmZKs1QemwEWZOFsMfNE3JSDUClibVx/K9W9pHa7F0KTrKAPv
         FbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZ6oHoYGoWDa7rfVCf53O72N8eqVre3ctuF0XR2yaAg=;
        b=CWxfHDYWFKAubMjv/cSo+MLYM1AILWsf+Tl/fTb9wqWqwd8Ee9pLQCfW6/NEPlwg40
         3j+VEBCFa3M+zuDlFQbWHmrzSATp+C8+oMM2R4h6Pd+jMcoq23IBC5+9Pgxq329VpVZD
         hbuIKCA2FtGMz+rgFBM6/58AGbjltEwg9MWWXJfdLkUvSDdHAzfJkNsIrx8zGLf2BDHg
         pQcKRztmFOWnX18jhM02keCAtM3nZDrnx7G8d1XGC7Gt9pqz4XbaXVgEJrVqLni2odT2
         Nhpi2Lcaxfm2fWxY96BF8WnzmJRkus0b7WV1A2YvTQ6XSlHa1RS4PAzHfgtYOZZZ4hEh
         7mhQ==
X-Gm-Message-State: AOAM53145puqhEQuJ28UTXfB/Fm8DFdAKhCLiIxx1SlqDEURhCOP/JYC
	SRanpyiJnj1bxbYNju9UA89PyqXb7nz4z2618tI=
X-Google-Smtp-Source: ABdhPJxSL4vlpaQ/W/+6cKSKs3clb4+y+4KAoqUuT139JxX96p9vFIU39i/YLSCweFt8TdXhom+mPZhqeogh8OjVfWE=
X-Received: by 2002:a2e:974f:: with SMTP id f15mr4826444ljj.412.1613044794708;
 Thu, 11 Feb 2021 03:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20210210111113.17318-1-raymsmithuk@gmail.com> <CAP9ODKqqrhboqgEGa_7MRprs2OZhE8GMRFCS3K77Jt2-4G9KKw@mail.gmail.com>
 <CAHS1ALKpm9+5Fa+roQ8ZJ3m3jGa3m=yymWpG8ftfEkVdAk+RqA@mail.gmail.com>
 <CAHtQpK7rFBrGHUJ2TG-Xke4V-kZc2jJF4hZgO5LtdGef4vNQfA@mail.gmail.com> <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
In-Reply-To: <CAP9ODKorRTxwsCdJPGT4hzG5cd560EUuOeGzVgnJ6CNLAhxjYQ@mail.gmail.com>
From: "Ray Smith" <raymsmithuk@gmail.com>
Date: Thu, 11 Feb 2021 11:59:43 +0000
Message-ID: <CAHS1ALL+u0sRMTVb5uXJg67aLdxm4aYoCriv-1vM4WKNfyh0Qw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Remove dependency on opengl or vulkan DISTRO_FEATURES
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Andrey Zhizhikin <andrey.z@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fed81105bb0e41dd"

--000000000000fed81105bb0e41dd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2021 at 9:36 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Em qua., 10 de fev. de 2021 =C3=A0s 17:21, Andrey Zhizhikin <andrey.z@gma=
il.com>
> escreveu:
>
>>
>> Should this be clarified with Mesa folks upfront? If you believe that
>> this limitation is rather "artificial", then there has to be a proper
>> explanation from Mesa developers why OGL is provided when OGLES-only
>> is built.
>>
>
> Agreed ... I'd rather not drop the check until we hear from upstream the
> reasoning behind it.
>

This patch is really about the first line:

> Mesa doesn't _require_ either of these features of the distribution,
> it (conditionally) _provides_ them.

Even if we had an opengles distro feature that solved the GLES vs OpenGL
issues, having a 'ANY_OF_DISTRO_FEATURES_class-target =3D "opengl vulkan
opengles"' line instead still wouldn't make sense (although it would solve
my problem), because mesa doesn't require any of those features. This line
is effectively saying it depends on the things it provides.

I will raise the build issue with mesa, but I think it's not related to the
core issue here. There are no responses yet, but I see
https://gitlab.freedesktop.org/mesa/mesa/-/issues/4176 was raised a couple
of weeks ago with a very similar issue.

--000000000000fed81105bb0e41dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Feb 10, 2021 at 9:36 PM Otavio Salvador &lt;<a href=3D"mailt=
o:otavio.salvador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
Em qua., 10 de fev. de 2021 =C3=A0s 17:21, Andrey Zhizhikin &lt;<a href=3D"=
mailto:andrey.z@gmail.com" target=3D"_blank">andrey.z@gmail.com</a>&gt; esc=
reveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Should this be clarified with Mesa folks upfront? If you believe that<br>
this limitation is rather &quot;artificial&quot;, then there has to be a pr=
oper<br>
explanation from Mesa developers why OGL is provided when OGLES-only<br>
is built.<br>
</blockquote></div><div><br></div><div>Agreed ... I&#39;d rather not drop t=
he check until we hear from upstream the reasoning behind it.<br></div></di=
v></blockquote><div><br></div><div>This patch is really about the first lin=
e:</div><div><br></div><div>&gt; Mesa doesn&#39;t _require_ either of these=
 features of the distribution,<br>&gt; it (conditionally) _provides_ them.<=
/div><div><br></div><div>Even if we had an opengles distro feature that sol=
ved the GLES vs OpenGL issues, having a &#39;ANY_OF_DISTRO_FEATURES_class-t=
arget =3D &quot;opengl vulkan opengles&quot;&#39; line instead still wouldn=
&#39;t make sense (although it would solve my problem), because mesa doesn&=
#39;t require any of those features. This line is effectively saying it dep=
ends on the things it provides.</div><div><br></div><div>I will raise the b=
uild issue with mesa, but I think it&#39;s not related to the core issue he=
re. There are no responses yet, but I see <a href=3D"https://gitlab.freedes=
ktop.org/mesa/mesa/-/issues/4176">https://gitlab.freedesktop.org/mesa/mesa/=
-/issues/4176</a> was raised a couple of weeks ago with a very similar issu=
e.<br></div></div></div>

--000000000000fed81105bb0e41dd--
