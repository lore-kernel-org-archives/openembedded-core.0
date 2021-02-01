Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.34076.1612187560214291639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 05:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOSk0kG1;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id 186so9080639vsz.13
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 05:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYAU7iCrQTHIVgxQr11Q0s1P3S13gTSYv1A5udLSVVw=;
        b=LOSk0kG1ICnOsVsxfGceiVSLRA7vl/yc65u9t5G+yMGqSRFUPYHRc0bHtVAlYDqcsl
         3Q6/228Fp3rACOwj1hJqjZiAoBvEGhzh40vTxHNz293I6Fj1icAEADyQhjTxLMgucSFc
         Euav0gVHVMAxsO5PrJwz+aLNBEksEsH9pM9fqdrrDQiWpP2nSgT7yXKGmLWwY+fo347p
         waUWYwXvvSE/v9BehMmehKS5L/9/4qv6FS9fScjfSkuJ7Bl4jtv+OXHmB4c4VfDtIa4p
         mVBA9MxLOFLbt8NbI7wYydLLwUzMmthN5ONrGH+PLUNoAWkx+/DmjXLRXvZiWgf2QX+A
         sKuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYAU7iCrQTHIVgxQr11Q0s1P3S13gTSYv1A5udLSVVw=;
        b=NU4T9Q6TogjG5L6RyUteIJThMrYzP+RCusVOnEtocfs/5dvW9R7Ol4dBZW69h3/JXS
         w+r3E0DWrFhg5SJAI7EyOfbL26eDgJ3+dg2nNEkUGq3naEDuXeagvLztXGFjL8xHt3r4
         8/R1HdOCsskSbMHF4kNwlszAIyZr8ZM6nFLIO9AcpQoutuwTzPRFNchF1gVvfLZWy/zC
         y9bdJjpjkmU2Vc0DA/cD4JoHyllx3EqWPU3WyzyBN8pDaW2nrHhTF9ypWbUjD1zk2OkK
         x7vHEaSm4pOYwuNWEtwfsb3ZoiYQRMSCSMer2uNA2oZFcjZu1DsB4QRPOySP/ktN+ti7
         xYug==
X-Gm-Message-State: AOAM531b0xP7O488lRehAGzOx4qUxWA83uMuhiId2dgUdq+WjUXhhA2h
	0zjwlwnYCaMcO8hCnL213N1BEXlRbGWAdjkhgkU=
X-Google-Smtp-Source: ABdhPJzwBUAdZVwXPposnuPWGjSJ6ssBHiYM5chDCFdZBJ+iLyRHh6XRY2a2AtpEMaCKGcahwQPF8mnnbCYzln+3IC4=
X-Received: by 2002:a05:6102:7b1:: with SMTP id x17mr2306855vsg.41.1612187559397;
 Mon, 01 Feb 2021 05:52:39 -0800 (PST)
MIME-Version: 1.0
References: <1612156126-77401-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
In-Reply-To: <1612156126-77401-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 1 Feb 2021 14:52:28 +0100
Message-ID: <CANNYZj-_673_Xk2XkmTvu4hJ7jE-2uNsC1E8GbmrCW+nnzbWTA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mc: upgrade 4.8.25 -> 4.8.26
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca0be705ba46aa74"

--000000000000ca0be705ba46aa74
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Feb 2021 at 06:09, zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
wrote:

> +COMPATIBLE_HOST_libc-musl = 'null'
> +
>

This needs to be addressed, and not just disabled without explanation.

Alex

--000000000000ca0be705ba46aa74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 1 Feb 2021 at 06:09, zhengruoqin &lt;<a href=3D"mailto:zheng=
rq.fnst@cn.fujitsu.com">zhengrq.fnst@cn.fujitsu.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">+COMPATIBLE_HOST_libc-mu=
sl =3D &#39;null&#39;<br>
+<br></blockquote><div><br></div><div>This needs to be addressed, and not j=
ust disabled without explanation.</div><div></div><div><br></div><div>Alex<=
br></div></div></div>

--000000000000ca0be705ba46aa74--
