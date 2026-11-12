Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9039.1794471661017792139
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 00:21:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hISCWbRj;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b32b2e691aso6148097b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 00:21:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794471660; cv=none;
        d=google.com; s=arc-20260327;
        b=DtCanGlJe2x4HPDjgHxspa8xwdj3loosAImQvSDgLeETypnPoqQ/d/UOA6I8cU0W8g
         KRVYcd3Rr64FhuhSH567fT4UYuD3eGCbuILfqjIiyPGDWjPbVmb7jUWSqlNKLKaAFN2h
         CxPkNIunGS2wowodWkGTGJFmt6+iyGVQVjr2ql06x2ElPi98D2IDu+7465WDUTz2qseU
         21SdhIk2pb778qBF681lzkOgFg8eNMRikRZqwg2SW4Bm1EhVVT9oRsj0GsvOXoKcgZq5
         rK+rA7dNg3LUyHBJFlkBJsi37o9BK9YRXO4YEyXclw9NOJee2Rvsst3HwiifLj8HILzi
         bfYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0euhhPqIi1Z0Jb+0jJwZPr5pkl8m8Ab32v2hMolvZ10=;
        fh=wJLD6zetCfjYthwLiAEels19uL6o2/FT2mHHrVoI57Y=;
        b=Z6RryCaF3cIXo736pKDDQCHErgILY79SKq15uayOeiGTAodVvusHcCzUuL7HYPBzhQ
         8K3QrzZFrgdUQdD3nSz/rv5Tda5QcvB7tJi6fS1Azn1URlcFwDKhs07o3DXvuljEahJN
         ALh3q3kd627cpdbbB7Re695zDuvpS/ugVxrpkn5VvoTk/PCL/RLAlkQT763TVVECXMhb
         LtuYWUYoaKeMNLTru1+CJR9fYOV77M/Zz0cF0wI+Ra2gJGoW5NT/u4cMtkEQ0WbqBSal
         g1dJpF3arqRQSNnUC1zaGiJGBNy/N5imop212H8lXkWrqA4FlGEnTl3asVPg7YD9th3b
         QATw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471660; x=1795076460; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0euhhPqIi1Z0Jb+0jJwZPr5pkl8m8Ab32v2hMolvZ10=;
        b=hISCWbRj7RNO/Xdp1jLVHbuXGNkr7hY71+xw4ZOjmELJGTO49UVtTt/t4o487wnVLR
         2blj62UIt+U0LPd8Png/on+aUBI6jqG6GFKESe9h8UBJ86NF41kqX4J5lkZ0sII2E3G3
         NcAGBBVVuY0LG5jw2Pw4shKbDs4nng6oRZIELA3tiEp/7owG5RFiMGgxDaHaZASbP33o
         iVcxIhI7ymqea/VVpoGNB97gKngK95tKdBk2TFfSue1rxhcG4SeuV8qEXQsMUEZv4o6G
         +RmB7f5zxY0iQaLV0h3AyndrfHRzofDHIQ4cUomME4fJbHo3gSX8wyPzPoGukCcA4SsA
         QMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471660; x=1795076460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0euhhPqIi1Z0Jb+0jJwZPr5pkl8m8Ab32v2hMolvZ10=;
        b=0ATHTAPHx7tzbBW1tTGORaAKlcqbRvR6E3rhsZHmyMYYea3m/f9zslrpmB3pBELNH/
         NS4AxP67emcrgKx0gkU6YtPkIx/RRGBbbbQdfn+9aONDYLtF107fOn6Vn2F68k7ByzTp
         S2Y2GCAMGQ6zKJghO5aXQKtOXZIpOBcozrWTjR0PKGHmLq0OymEPB7THS6fg/Nu6Ccaf
         t3DR+tdaYKi+ruc7R4KdgXF9lujxHMczzc0zK2IvW7qk952nRngbI+gLsyx5MqyDAual
         LClHzLz5nQvUM7gIdY3OsyCNDs9McgH5RK5bN/xpeIQrLkSW4o4Oa+mu9nq5AXQ0bFp5
         vPvg==
X-Gm-Message-State: APuU4Z8nIAEKTBoU1LHVTbsc83HlF3c/cd6mNNhpTCHRwdjAH9o1FDah
	P86H1RZi5+qoBiEhfs3MdZkM59aKUPZ55l8rKhXH66672o1IQYYi3+V4Ju+4Ztd1TjB66oyekpk
	B7EBAHz6CH6+d+cLKAc9blJU95GRnVpz6RQ==
X-Gm-Gg: AYBFou2RMldN3jS3wIzVc0PJJQaDBuP2/Uu0/E4lZTCQkwMNb699CIF6ATV9dz3w9Jf
	EIb2WNCpGdc6KYdWcANvJTR/77YTCzRQtJz5c90luxusVMV3XbvIzPBxFUiBmJAGWiRscC9H3Ri
	D7+sfaipH65h3byWTD0Js9hjkx7WgtyxE3i5PRHuC5vBob9daGipjIEIHfz5gji/pyJL8I05IP/
	R2HH9sKaV6WkT8EOR8DgKFfJldAUu1w6JW0r+y8k+B553Wne1Vezc0FtGVNXOiOO3Dah/JUou3A
	GX85lR6lUA10F/5Y+5OOiXfhEGVmZFT4UU1wAeTTOlXuIFzB6qj3rYFy2nKRAvJyamftzwjQ2Jn
	135W8kxJXZIe/WwoQMd0GeKPHI0cOHRSQukOre/7I7OI1z+WuyK6ei50k6R6Q2cwEwdtcgBc=
X-Received: by 2002:a05:690e:4011:b0:67b:e7b9:7a58 with SMTP id
 956f58d0204a3-67c78c03820mr1540788d50.44.1794471659814; Thu, 12 Nov 2026
 00:20:59 -0800 (PST)
MIME-Version: 1.0
References: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
In-Reply-To: <F1E91B20-6F2B-413B-B4B2-3EF9769D0E6B@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2026 09:20:47 +0100
X-Gm-Features: AclHuK_0PusfNulfcPtxBEAws_lsCzJUxOzR7g34ximu-arhobhe8_XBRs57JvU
Message-ID: <CANNYZj9DLje7=bQC2PLsb_rkDCePKPM2yWWxFLmx5dZUcHbQ9w@mail.gmail.com>
Subject: Re: [OE-core] INCOMPATIBLE_LICENSE
To: sean@geanix.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d7c53f06600ffdb0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 08:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250077

--000000000000d7c53f06600ffdb0
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 08:17, Sean Nyekjaer via openembedded-core <sean=
geanix.com@lists.openembedded.org> wrote:

> This works but is there a smarter solution?
>

I'm slightly confused, where is INCOMPATIBLE_LICENSE specified exactly?
Image recipe or globally?

Alex

--000000000000d7c53f06600ffdb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, 12 Nov 2026 at 08:17, Sean Nyekjaer v=
ia openembedded-core &lt;sean=3D<a href=3D"mailto:geanix.com@lists.openembe=
dded.org">geanix.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">This works but is there a smarte=
r solution?<br></blockquote><div><br></div><div>I&#39;m slightly confused, =
where is INCOMPATIBLE_LICENSE specified exactly? Image recipe or globally?<=
/div><div><br></div><div>Alex</div></div></div>

--000000000000d7c53f06600ffdb0--
