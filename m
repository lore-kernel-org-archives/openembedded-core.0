Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1F92671985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 17:52:15 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id p10so9865254ywh.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 10:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=0tow3HLhEF3hzE2Wj9q9ucjAy9gmzTndleLkdF7Bb8E=;
	b=pKeXv8PqmgIYwGCxesM1nek5y9R/cPpAPboV8kUQ4B6YX7yF6dUj5KbV3fQ5/0+Ctt
	q/oIVoMocqZt8UAu48X7bJvQVThyLnfme/2KnrE3nG/q2zzxuO/f2XYTuVtFtEUIwO+8
	UgPQXDk6Nkd+R1OmEXY2dXKIyWhDDJgdnUrY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=0tow3HLhEF3hzE2Wj9q9ucjAy9gmzTndleLkdF7Bb8E=;
	b=laJT8CqU4O9lLLGFyohcf6YA5oIrfBbuwCymXxHtXlRmzc9/mVLWOQjEYBdCT0cvb0
	FxlZXzCRpo0cNhjotK1WkS1THuM8JoBXYGVnNOl0fCgIJdbAAtq+8a98pHeO4KHrtag1
	DL2civS1BLjlM/s6ITICzoCMTc/d7MKA2iDYuMzybolHwO8VP6wau3uIxYgNChhQnxBj
	0iyEsN3mmt0pnTcRBDppEGerG+0gbJowKUeSRpozaZbj3zJZfgRkrt6jahVAgCrIwEEV
	KpZ57qpnRl7U3NiOQCbddgE+9hneAIP+NckIN4pDXhCuAhNZ0VOswE4U14njJrrjdvnp
	cZPw==
X-Gm-Message-State: AHPjjUjb0T6jIt7dfE9nYZk1ujdbPm+Ykb14e4W5W0019Fm8RWeVV9hj
	78K9AXTJDUKp10UPHufqRa7tYA==
X-Google-Smtp-Source: AOwi7QC4/ssOdiu8FkYHgjJiXYsamiNLsktEA2hJJKZWjl+zCPT6tIuJbL8leVBgCjUG/IQuhOs8Bw==
X-Received: by 10.129.169.134 with SMTP id g128mr1504842ywh.57.1506534737130; 
	Wed, 27 Sep 2017 10:52:17 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:a523:8806:2b32:ed54])
	by smtp.gmail.com with ESMTPSA id k16sm999496ywh.52.2017.09.27.10.52.15
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 27 Sep 2017 10:52:15 -0700 (PDT)
Date: Wed, 27 Sep 2017 13:52:18 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170927175218.GZ3112@bill-the-cat>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<CAJTo0Lbw39PVXdjqvtksLxcsWWhYR4GGXO1+RAGuXcnH2QX4fw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbw39PVXdjqvtksLxcsWWhYR4GGXO1+RAGuXcnH2QX4fw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Wed, 27 Sep 2017 17:52:16 -0000
X-Groupsio-MsgNum: 103418
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nbhonbzV/xpXxmuC"
Content-Disposition: inline

--nbhonbzV/xpXxmuC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2017 at 06:10:58PM +0100, Burton, Ross wrote:
> On 27 September 2017 at 18:00, Tom Rini <trini@konsulko.com> wrote:
>=20
> > With RSS we need to ensure that when making a bmap image that the
> > python3 that we created is found via /usr/bin/env rather than the host
> > python3.  Otherwise we're relying on the build host to have bmaptool
> > support installed.
> >
> > Signed-off-by: Tom Rini <trini@konsulko.com>
> > ---
> > I played around with a few ways to try and fix this problem, and this
> > was the best I could come up with.  Once this is in we need this in pyro
> > as well as it's broken there too.
>=20
> Doesn't bmap in Pyro use Python 2?

I hadn't tested my fix in pyro yet, only confirmed that it was broken
there.  I'll check and get back to you on that part.

--=20
Tom

--nbhonbzV/xpXxmuC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZy+VSAAoJEIf59jXTHXZSCSUP/RCdT+goTUWy0QwfvuoNAchm
+LKnniUERa9OxdZ51zE2wLIwnfV3snFY0k2mNbr+b3zEFKqg9e50TWjtSgH2/gA1
B7P9fMqSS8VkzbUHV/RtTkV5AU69u+atf4f8FfyU/UBLsrrVwswCLLO/m2uLZzmb
TbEeaUIKTmeOPEJjTZ2TNboozwsbUE8xXQYN0T/sYDvP750SHnSO/3fM/FIIWgvO
v44Td+Fu10tNpPkgzj7wBtJKCOFFjnV+AYCu8feC6WM1ckVtCBa2HYyjELr96nlV
06hxocsGiM83E2ail073dzyzYGZon9gSqNxPk8nYLtcM/5xamUG8l+0o8XcgF76j
v6FZsOyxIV1G4ELSXNhpzC5vCJo2jcyu2kTlxXFOe+aY9m074+xmLJvsmqbyzHVy
3IAmkoGVUOMGuNpoObY986hKjHN2Gv2pFNr8vtQ5TQUdhUTZu/zM5A0N0D8EZ6ZQ
li+HO+P826L5bSaJFxjde2lwff/rjXu/GNrNMtUqlCwKhdwCiWq2iTj97TdI8+O9
3RyWo/unbM+yz4npGunAQlU1E+6LZBjAoxCQc9GyyEyLBLL+6bpM9tb7oP/htDaa
9il/5sH6hN8s6EjKrDcNr6M7z1Xy8fIX40e5SaQlEoKex9a3Hj0kmIzWcBfNjLS6
lW+p3VzL3MD3G/stqlCO
=rk68
-----END PGP SIGNATURE-----

--nbhonbzV/xpXxmuC--
