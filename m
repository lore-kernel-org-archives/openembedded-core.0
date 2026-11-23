Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53228.1795438552870487204
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=P7lSwCKw;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-55d30c054dfso37007781cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 04:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795438552; cv=none;
        d=google.com; s=arc-20260327;
        b=nW9RORl5zn/QLJnjyUjO3rwajiryJc7IlKYT1A38cx/dtA0zWxO5AvxLi4kG0TP8i4
         RDEKCWbfrqM+3va6pqn1AChtW4A/Okm51V0d7UFjqiZXzRpCrDJ0PmeA8u6VNjjCexY2
         orKxbEtw2f4iVW0tAJ+i4bB1z5FU28Yiac0FFN87/SLIHExzxDJ9tj7Rr8CYfpfg+M+C
         Lb/wD9SXZjzHAJORGfat9p33+e5XhFoE1cLhqOFbLPEfdVTsWYR2qgsvYs3Td+Slfov9
         bbM28TMTSNOJKxY/Tgm/RSO6ekl+yoB0pJGlqOXapaPtWGj7rLKFF0V43/NNc0j+J1X7
         /lHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uOH/RI/hHf2lyHGRMdaDD+pSiQhYykPpSyUcoezAgT4=;
        fh=26GJkEC7ayR3YlFPXCirp3vLx0oygFdGWmeUc8lCxKI=;
        b=PhIlh3bnfBrvKYle6dhNYEVSyHdjOuqY/Kpbd83Q4h9wK8lQXN+i+APELf+RVZFqNZ
         fApK3qImeGUHliOb1yAZ6zDnGjxPKhn1wDlsWHFqm6bVt5+/xgfTYBORASdCOcbpXiv/
         2MW/x9RamYCE8g5vMrv8x/7eUOWtgWvCBkH0jYgdzIUA+WKsa1zx32RPflPF5LzPfQeH
         X9rp4xeago6HcVqoDmeCLzFqgIdi94nLArb1NyaQP8Ge7LolNshJBJbL+uqRO0wcOS74
         /vaXsIT/+OglPGquV8+0DxZmZpCEiXVDdFRClfCS+bPs+lYNjB1Np88BW/fO+AnkgVM5
         ST5A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438552; x=1796043352; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOH/RI/hHf2lyHGRMdaDD+pSiQhYykPpSyUcoezAgT4=;
        b=P7lSwCKw7Yf5OxKLoJDiOhMt092ddljRl9agSuDIRfGzU4Ce4L3ugy4O11uXN/Mkgl
         +asbfcs4P0KRFoYIYW2zKUtEW0S3NTnufLaa2ijMouT4XuFVcaob55Vf5rSC/PASd2Dk
         96sLInUXIcdAF2GLOrJcJwgpnXB6HWB67abspx6bYYaGWMI9PiV99qx391Pe2JJKTvzR
         GVapYA1CEX4+iXgC05aN3Vs49DtD+vQ37JB+bIyUIkbe/GxOe9yfOx4VVI62vjP5VCGF
         y7IF4mIajCeaWqv3xhHvukl6tk6neBnw4QKbyPvRF44I6ubeGoGFyN6j/iQZx7lBwXy7
         6nLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438552; x=1796043352;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uOH/RI/hHf2lyHGRMdaDD+pSiQhYykPpSyUcoezAgT4=;
        b=w9SAE889dfg1KsD1VNdmiasQkId7muRN6XgGx3EEUNNydL0TiqFu+nDKw/PTD/7mKC
         Dista1TZ22PRa6EXQVlbErAW4G/CWF6/qryyYLDfpM55bM3TDPzTdjT+/pAymWnm7caV
         Ln/6rrw1y85OEE3uoGPSi0+5hdTat4suS+q1dxzJO2oq/ymnMyOOi+9TXmaHAn0vEvYW
         MiHnksdRbKQ04MnjJFAZWkEBEUdBeUx39ilyI0bkh/KD4a9Sg+zbyjacYss6QEL+tlND
         Quw3VfHcJbzQf//TZcQAvbrCnWpnxU5gxg7ZsqHRpB85rjZEkE9BGFdnq13E2FM4JoKB
         1ukw==
X-Forwarded-Encrypted: i=1; AL+hErH07xxxIs1JBhj4z9OMV/BgfETG8t8Gony0Bqfd/zoXa2srJUIyoDR+shOJOSGRQ+ab/3u4bEz6ZYWZ0io1/alXrQ==@lists.openembedded.org
X-Gm-Message-State: APuU4Z/4uXDNa5RL85fwLaGEW3id/ks3TGimx0ILvNOMPcIlmDPdqzMs
	8VdQOnfDfNs3GuXLD6af7bdwVQdMGbygijceePIMYyLSQLfz6K6JRaX43Elyx3MwmsGJ2z25Faf
	X/izVYnX57Tb3WA4N6kz+YbT+235XGSQ=
X-Gm-Gg: AZFdTZdXBz3jiKpfd2JLC+M3eTSCncJ6DpVosW3SNpTbILy91ecjFmPFaci+DvCakGh
	kNWDE/dkK9uZkILBeQIjiC89vbt1XR2qFVedUJ8cp3UEHAbrI6ObCqgw6iPkwsMTe/k8cpQ7Vbv
	2mn2sCjojyQuXzYCDNpGG3HnTaBM2744XCv/Mo8W4oZjXK75n5rFi35nrq+6x9cjUgVrMKMmmzm
	LCAQ4i4NTGORbZic2RlcRSLHS4fgZtWcj7Rie3tDIyuRZbdiSIHgAjQW9RC9z0/2zo4bj3aK6aK
	lUpCuQFxndDFVe/CbinSXYQlGCp7Ae2lvIMoicvAbcQC6HCkYlvcOSedpK5bqKb0XvwkCGj/hFZ
	oEnoOa60SN44dZGTR3XdjaA5QbweOTDCOF7rNhSLu0bE4yYPKkoyG40HvOnMsK8Lb95fPZJY=
X-Received: by 2002:a05:622a:5a1b:b0:55d:2d18:cea9 with SMTP id
 d75a77b69052e-55d769e11d1mr195652001cf.17.1795438551798; Mon, 23 Nov 2026
 04:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20261117120155.3986876-1-sean@geanix.com> <20261117120155.3986876-3-sean@geanix.com>
 <DB5PR02MB102130D7248FCFE07318026E7EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <8E72F94E-03F6-432E-B1AB-C4B7B42FD4A3@geanix.com> <DB5PR02MB10213B63F5917CAD5A8070AB4EF7B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <46D00DCD-2239-4A77-B776-EC59838FD31E@geanix.com> <7d835c61-abbc-49b8-82b0-6e1ea9a67f6b@emlix.com>
 <18990849-B4AB-4C55-A1E9-31602F973614@geanix.com>
In-Reply-To: <18990849-B4AB-4C55-A1E9-31602F973614@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Nov 2026 13:55:39 +0100
X-Gm-Features: Aa3M54pwJvi0J4PqV8pZaVlrn0iQ64eSq2vFN-hO60WxauKL52Ux75cRckMlCec
Message-ID: <CANNYZj8ucHDHgjxvxBW_gFnfcRcZqUqDz8r593cpcPRAubWoag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] license_image: don't apply
 INCOMPATIBLE_LICENSE to SDK host tools
To: Sean Nyekjaer <sean@geanix.com>
Cc: =?UTF-8?B?SsO2cmcgVmVobG93?= <joerg.vehlow@emlix.com>, 
	peter.kjellerstedt@axis.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000018a3220660f11dfc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250912

--00000000000018a3220660f11dfc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Nov 2026 at 11:07, Sean Nyekjaer <sean@geanix.com> wrote:

> That seems to do what I=E2=80=99m after, cool :)
>
> Should we add a note in the documentation?


Yes please. Can you make a patch?

Alex

--00000000000018a3220660f11dfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 23 Nov 2026 at 11:07, Sean Nyekja=
er &lt;<a href=3D"mailto:sean@geanix.com">sean@geanix.com</a>&gt; wrote:</d=
iv><div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">That seems to do what I=E2=80=99m after, cool :)=
<br>
<br>
Should we add a note in the documentation?</blockquote><div><br></div><div>=
Yes please. Can you make a patch?</div><div><br></div><div>Alex=C2=A0</div>=
</div></div>

--00000000000018a3220660f11dfc--
