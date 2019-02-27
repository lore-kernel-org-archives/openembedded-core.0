Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id D07556BA10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 23:34:37 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d2so21392916qti.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 15:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rT+OnJ6ZV1fZoL7ppieidQcEN6J5ZZCquuYykfAFHI4=;
	b=aap2qOHqZGeJMxZ7wHlZ++oaun2BUHSUfqOZSi5yyamrg8aydD7Opf3bmDsY6TLQ5Q
	m373jEdFRS1Ip3mDNI/ohzLZbU9pTLF6Lr+6CtpPy3NmRqLWv98Kar3m34VdvuJJKb3j
	ekk+oPZMGvId1H3eE/9mlxT2Sx5c6CRq7YEpDNt2d47h3UZoNuRdz9E+PLcLKYgh4TFu
	ZdPloLzWP8zdvdizxCat1PKdDZO4N91vJRYIen1qS1IZdEOxKiqcFP5gM9hOFd1ELbiA
	BpnFGotuUEKPHHbfkaQ54PSYLalQI5NICQQop3TqKtFMXuE5Z4BCD1eDppF5bud2plK2
	Golw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rT+OnJ6ZV1fZoL7ppieidQcEN6J5ZZCquuYykfAFHI4=;
	b=pL9i1pcs1UiGOtSJDavS02Hf+dp5Fpa697C2Fq1/xSAB+ysDpmxAnjhN4THcsOZ6zq
	bX0p2yHJM6i7z5K0gPv2yXNv0AtWAdG0krn4t/5JV7u3Vwda6w7vJJy1DplDHvBwKKdZ
	fdwrHMQslamYdoWSYCdWYK2rDSzJ3LICVawU23XejFr+Hcps79rBMGA4liwysb/92SFX
	dalyWdJGyTNYQF8qsfd+8lpg5YmEpOsBA5wp0v0Mq+c1P2eibDvZBTHGwd1XRfQmZdRq
	4DsnDKGrXfAwXQb4EJNcgmHSfY295BLYTknc4npc7D729dzD0c9t7K0YK9UAs86/n/Je
	kiDg==
X-Gm-Message-State: APjAAAXo67wYX6X6QBwDCgyBuiuhBS6tbySDhP8494XWZH/Dp1gl/f3g
	KSfEQeFNgvHxQjZsuHQtWpdKPnrMXJ1lf7SezOM=
X-Google-Smtp-Source: APXvYqzyCMgB63C4i7gXxUcKVS9KJ+W4u6l++rXLrqIP7BKO63gew0IvhiahD9dI82CklsCmY8Knrn2PCe2muNGPO10=
X-Received: by 2002:a0c:94cf:: with SMTP id k15mr4094982qvk.55.1551310478565; 
	Wed, 27 Feb 2019 15:34:38 -0800 (PST)
MIME-Version: 1.0
References: <20190227212951.39714-1-raj.khem@gmail.com>
	<77eb8d4df1a4220e3f19d09e3ad1130cc60e817c.camel@linuxfoundation.org>
In-Reply-To: <77eb8d4df1a4220e3f19d09e3ad1130cc60e817c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Feb 2019 15:34:26 -0800
Message-ID: <CAMKF1spa7tVDq1q4tagnf9FOLmF7zQB3+4qJG5nzK7uvmXv4Ag@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glibc: Move common bits to gcc-common.inc
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
X-List-Received-Date: Wed, 27 Feb 2019 23:34:38 -0000
Content-Type: multipart/alternative; boundary="00000000000002e7380582e89ebc"

--00000000000002e7380582e89ebc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 27, 2019 at 1:48 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2019-02-27 at 13:29 -0800, Khem Raj wrote:
> > We have been duplicating few variables in glibc recipes which could
> > actually be defined once, therefore move them to gcc-common.inc which
>
> gcc-common.inc for glibc? :)
>
>
Hey thankfully it=E2=80=99s just in comments

> Cheers,
>
> Richard
>
>

--00000000000002e7380582e89ebc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Feb 27, 2019 at 1:48 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2019-=
02-27 at 13:29 -0800, Khem Raj wrote:<br>
&gt; We have been duplicating few variables in glibc recipes which could<br=
>
&gt; actually be defined once, therefore move them to gcc-common.inc which<=
br>
<br>
gcc-common.inc for glibc? :)<br>
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Hey thankfully i=
t=E2=80=99s just in comments=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Chee=
rs,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--00000000000002e7380582e89ebc--
