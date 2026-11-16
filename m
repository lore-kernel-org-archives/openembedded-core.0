Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29878.1794841286183050015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 07:01:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WQcfNiCy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so6318892a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 07:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794841284; x=1795446084; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0NdkbaF9KZJ3iwqcvtrjExkqw4PXLkaG49MA9DPUe9Q=;
        b=WQcfNiCyLt4D/MHBSLuWGIYyANJs77zUuqie/F9HTjX1YuWkVjfukExn0XUkzbFzwO
         wRVSu0S1k6jxH92bshbvW0ZYqXKLDd9Fh6NW4LuDc02GfDlndIaIDFwOKJlU1VBgB6ro
         /+CB8PWkXVOUWJjZRSt/DFnpT1C9+PI4IZKGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841284; x=1795446084;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NdkbaF9KZJ3iwqcvtrjExkqw4PXLkaG49MA9DPUe9Q=;
        b=14d8Ncm8HsLnnH5u9oDpbb53umjp3TCclEZ2GvGRddaZvcLe2DRbXu1OkVELsNxVUm
         QsbIUMXfrrEnIsbruyQtOWQu6i2zlgPW5LnZxwRwHpPed+wCtEcI18Z7hRYe4qVP3Abb
         GBHfUDH01bmAkMQ7VNibgHOQAmVnmUDV2+mGEiOlU9gR3u8DKbzJqnUvHGj4879UQb7h
         25IzivthJvJpv9pKK0GYbVSutnQTTEWjzfRCNMZ4AiyLRX9q79p00O83IMjTqNvLR/DV
         ZcMebfhxFaxY4GXYa522IKTXI9N7Toczx4aEk6QqqdKcF/q4uLaCcsZHMei6sLJEyS77
         Unjw==
X-Forwarded-Encrypted: i=1; AL+hErGlixidM61fZsHeXP9A+HcyheHCvT2urybwc++xTuebcUQVEBYCvhaV07SRTw1UWlehTkJ9QB8O+D230ftADd4dIA==@lists.openembedded.org
X-Gm-Message-State: APuU4Z9w02/ooQiHGSAx+HO1UbJJzcMF95AXf/rvHtR2Tm4/LvbvTsB4
	n2LNDfwhGN4rqYj+enRdE3LRPGRllAqvKWbQdA8sDN5PCMHd8E406zAL/aE7EKynbLo=
X-Gm-Gg: AYBFou0DKWOaMk++03kE2uZ4NDRmHEuIS3HaTLacnQNCJQ0vE3+powFXra/Gi5Jos7D
	A+zcETkAW45Hcie1DBbtwaVzn2MNjN471fhjiBavzZyqVAlvAl1o/slYf8ZWEr15Mv5ioqA6qbB
	wTTF4SI0RwK8NBVzosbFfr4NDES3abLs4DOMKonxMy3AAdpjxbfrbRI8w5ssJ6qZhf/y1AuncLV
	vYMT6oGxLJq9c2UPG2AYsrHv7hvTJHNN7Tz1VHCR7wiTK8xhDs1lnjGGU156hRgk08iHl14DdBM
	LJNh1e7SP4V995VI9qwvTkTguSgYs+eQK0bBtG5r8vkztnYMvycByfJThjkBzWLRaRaVNKm1NAW
	7TFb/OX4PwxYaq4wszD9Qmpq6WvXubpqXcB1cxwlcWQ+izG1Imkt8DsqnnjyN3KuljS/CSZviR+
	EYq1MbRIuIxs+uTHEruIKIYVbtR0QyFzBmJAtZgi5OZT76ucROmX7iSUk/8z2SXzDIo5J0jqBnR
	A3TlVSZdEEBVSdJV+iCppqPOdpgv66wT/sqeUbaixwrGPzKIJ04RsrhkNTJyKBnHL1l/lrz/u+E
	qZRE+rR5eVaE8HX4GbVKeoyzP3012RjOPRl4A110FiY9/Y1aJXYisfwtBkWpFbGV2Sss55nBLKq
	F8lCncmo/gKpf
X-Received: by 2002:a05:6402:210d:b0:6b5:709e:2196 with SMTP id 4fb4d7f45d1cf-6b7c0d0f6d3mr7287073a12.40.1794841282519;
        Mon, 16 Nov 2026 07:01:22 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e765:5fb4:66be:d7? ([2001:8b0:aba:5f3c:e765:5fb4:66be:d7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23cf6e9sm4868668a12.20.2026.11.16.07.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:01:21 -0800 (PST)
Message-ID: <5e60ae1848553391ca781a37812eb71591562078.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] lib/oe/distro_check: fix the openSUSE
 Leap package lists
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ticotimo@gmail.com, openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 16 Nov 2026 15:01:20 +0000
In-Reply-To: <20261115021914.67744-3-tim.orling@konsulko.com>
References: <20261115021914.67744-1-tim.orling@konsulko.com>
	 <20261115021914.67744-3-tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10build1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 15:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250347

On Sat, 2026-11-14 at 18:19 -0800, Tim Orling via openembedded-core wrote:
> download.opensuse.org's listings now link to "./15.6/", which
> find_latest_numeric_release() couldn't parse, so the Leap URLs had an
> empty release and failed with HTTP 404. Accept "./" links, ignore Leap
> 42.x (which came before 15.0), read the source RPMs from repo/oss/src/,
> where they now are, and allow for there being no update repository, as
> for Leap 16.
>=20
> Tested against download.opensuse.org: Leap 16.1 is fetched again.
>=20
> [YOCTO #16510]
>=20
> AI-Generated: Claude Opus 5.5
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> =C2=A0meta/lib/oe/distro_check.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 =
++++++++++++++++---
> =C2=A0.../oeqa/selftest/cases/oelib/distro_check.py | 19 ++++++++++++
> =C2=A02 files changed, 45 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
> index 814b35b8d8..e37599c5d9 100644
> --- a/meta/lib/oe/distro_check.py
> +++ b/meta/lib/oe/distro_check.py
> @@ -22,7 +22,11 @@ def get_links_from_url(url, d):
> =C2=A0=C2=A0=C2=A0=C2=A0 soup =3D BeautifulSoup(create_socket(url,d), "ht=
ml.parser", parse_only=3DSoupStrainer("a"))
> =C2=A0=C2=A0=C2=A0=C2=A0 hyperlinks =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0 for line in soup.find_all('a', href=3DTrue):
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hyperlinks.append(line['href'=
].strip('/'))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 href =3D line['href']
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Some listings (e.g. MirrorC=
ache) link to "./name/"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if href.startswith('./'):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 href =
=3D href[2:]

Being slightly picky, we could use href.removeprefix('./') here which
is slightly neater?

I mention it mainly as I think we can get better about using that and
removesuffix() and the code is better for it...

> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hyperlinks.append(href.strip(=
'/'))
> =C2=A0=C2=A0=C2=A0=C2=A0 return hyperlinks

Cheers,

Richard

