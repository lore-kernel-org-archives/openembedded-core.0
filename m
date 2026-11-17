Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1003.1794936849420402938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 09:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=nWFKgvYo;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9210f2622ccso5023396d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 09:34:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794936848; cv=none;
        d=google.com; s=arc-20260327;
        b=pMyKFHicpuQFMYpHy8yT9ksrJmzHRCboBZbHJ6u1RpTbOT5J/gTP2AKloLcS+bO8QA
         d/9HzdaT/4rT0q2huDAfxQ0GEkq54ZJ/1q8z5sJQLvZrwzGuszK/KU3t4seB1DUr5RDl
         IfYmfWGy4+fqsTmmHBHNEHr/m1qIMLlcDCioIw6uBgq/gPFxFKR9SMUwjLi9926DrEt/
         7Wn2CHNf9n2DxSki0lfVB3vLBdeuaABre8f9lucFDgVzZt/4cnN6tHf54QMkN+x0OBkc
         DmaD1DIftkEmGQgZLTPzTr/ZTGv36qAi+cW4EpSTBTC8cc1W83natjbJ+lmRqY8C/hZD
         sG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q+clvlfZ5juxi9uldCSeYee+c29UWpGNbCktjbl8q4w=;
        fh=OjdXgK6/NxP2kmcviChngGny+DgQGUkwg5WMRV0UejA=;
        b=XSyqfeJcfpDk05bRwxCsupc/dIwmc2LVMfgmS6Rmr3tf3OG+lfXcGfYSvTLLiXL8Xr
         IKyqvMegC02yUb4hUgIYpUe/GjbUqTFA6F9uJJeBpDshwc9EtMtG3wY5sJG82FtfNoyH
         N00xIUbYRJOS5PUukJUJMgIBi27ftPyUs2z5a6M8nCE9mA0Z86RGUuxWJTG0DKTgL7zP
         NyDxIE4quQb0BTAXm1gWJ/DIFcqOELZE2Fkm/zknjkf0PMMrmd77tgCytWxtQAPENSzD
         0qGRcLQGA1Bh4XKxxX+tiXILZYL3znA5+vZQwPd/VS7fBo4eWefGZs10DHL2ZBL2TU+R
         2hjQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936848; x=1795541648; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q+clvlfZ5juxi9uldCSeYee+c29UWpGNbCktjbl8q4w=;
        b=nWFKgvYoVyk9/e/IOflnH+ODO62oOrBvy44yO3MeQhccrfXh5qoasADpXthtLOJ+K5
         cnkigGoCPkqs5yXOlmiG7iNhZviswV3fgqkogFwYXuMxdj3U8O69tBK9YOdMrPIl4s3c
         +gOImhqL1bGTxnfJlWbJxdkvMBoQUrRPS8UBKQgau7U5yvaiw5OEBDECWZHdvu6VlHM5
         5ev4kRsHTsJBZUxVQiT6Nlm6qlZ+Ej34HfxiaiZAMG/q//GOYZ/3OaX5iumMlBRnItNM
         +vRWhIz7Zymp9TFfrS4CTkzXxQbIU0pgE7NNK4K/9VUwmlBVnEMxHOYXg6FsVCI5WcLG
         Zg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936848; x=1795541648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Q+clvlfZ5juxi9uldCSeYee+c29UWpGNbCktjbl8q4w=;
        b=y/gJMdGAFm9k2MZNXal5YrVB4yKAjDOp8UvC309CaXZEPHztWrFDzKKNPcXPrBOA9E
         y7ERB5dkzEZIeaghUFkgzcc3btkreQyeTRIF1dKilTwStE2rj+eM5PybKgcNW1V+3KX7
         lewmTuAaRB8ya5jMlfmECCqw5v4Yynzn9Hth+Q6Q4j2mA2Eb0/CgL2j8yo3wuAQiRFfw
         5v+D7lYrgwZ0j+vC4QRjlcubFD1OQTB9JM6/zG0uhJ/x68b1Hv6pd5nnM8/lnwMugh+8
         yUYrw3gUeBsF+O95EYoVarIot3ELfvkwFmQESfXSlYt8SNIgoh0J6hgHYA/a3ZcD9O4+
         EcOg==
X-Forwarded-Encrypted: i=1; AL+hErG/Fig/8SctQAoOXBLsryCLdc2vZUee1P0M9prAuVz4io3iMwcHuEpy0ixOfol93OJV1KPYbSVyx2VSE2dFR0KoqQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/gt8kcnQ98mGK1dW+Ub8lM+Hv9GGDfDarHSOf9mjyTuj4+1CSR
	wfeqCOk91B+5jRbGoKogE7qtzoNp7hueyMxHMVc4Dz6F8G7boZ7hUhF/nL6+epVSE/IX4HdyLF7
	ylpb7a3xcDBKB5I1rQ+O4Y+VMvPdCFms=
X-Gm-Gg: AZFdTZcrEEIJAHhyGEk/QaRJrq4IusvlCFgFcfE8ZQ5XKt2fv/7eBonTBSjXFMiW9Ci
	w3PyPlfSp9atnqPm684F9ZecZvLguYeWcM823GHdgAVJ0a9Je1EjGB6u7IN20yrwfLDn7GN4Ozy
	N7QM1lcN5OFFhTg5yJMANWnT8aglfrRpdWl9Qv+UxWaZDtZRR+IrxjxK0gCrLTb8oLWZCxMsyAc
	hsmnym+XeuflBD162X6aLW17Y3RS80nYeNN5i3auQExLoULsMqdNou4w+kOa9rAkTGA6+HTk9iw
	mf2aR+W82h3W1w9vLE+88/4HRA9jeOT+XGI0Wb3IxLe0KERI2hU4SjLBD9/mjH4uFBZAFCb68zt
	z1Spd6nKp4hUnMIHXQjoM1RolVRupIjHAxCuGPBOz27ZpNrPJLwEk05nAYlTSM5fZxSUXLdM=
X-Received: by 2002:a05:6214:3211:b0:91e:ac55:fe72 with SMTP id
 6a1803df08f44-91f24201eaamr248559626d6.36.1794936848133; Tue, 17 Nov 2026
 09:34:08 -0800 (PST)
MIME-Version: 1.0
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-3-sean@geanix.com>
 <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com>
In-Reply-To: <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2026 18:33:56 +0100
X-Gm-Features: Aa3M54oZ-ipBSsxhwxCe-8WBj6UNksMZF1r2064Sz_JA5zMofynk-qv1XAbSnwE
Message-ID: <CANNYZj9BMxBRqO+VVcxQFumB-w4UNyLA0qAe+QGP49vC+6_XXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
To: sean@geanix.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003a330a06607c4d73"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 17:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250466

--0000000000003a330a06607c4d73
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 14:27, Sean Nyekjaer via openembedded-core <sean=
geanix.com@lists.openembedded.org> wrote:

> The open question is the default:
> - INCOMPATIBLE_LICENSE_SDK ?= "${INCOMPATIBLE_LICENSE}" keeps the
>   current master behaviour, and the rest of us have to opt out.
>

I think this should be the best option, yes.

Alex

--0000000000003a330a06607c4d73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 17 Nov 2026 at 14:27, Sean Nyekja=
er via openembedded-core &lt;sean=3D<a href=3D"mailto:geanix.com@lists.open=
embedded.org">geanix.com@lists.openembedded.org</a>&gt; wrote:</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">The open question is the default:<br>
- INCOMPATIBLE_LICENSE_SDK ?=3D &quot;${INCOMPATIBLE_LICENSE}&quot; keeps t=
he<br>
=C2=A0 current master behaviour, and the rest of us have to opt out.<br></b=
lockquote><div><br></div><div>I think this should be the best option, yes.<=
/div><div><br></div><div>Alex=C2=A0</div></div></div>

--0000000000003a330a06607c4d73--
