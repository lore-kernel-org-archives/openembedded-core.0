Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A3B560C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:57:39 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id a2so4383129vso.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pFC7XqwG9GrRh6UXm9Eqr19rcEAOTEqdzORrrEkTh4Q=;
	b=R3qgAzxXeC/vazKw1GTCdB7bx0QbhvbTxPB0wpSsIoCNLnX8v2u6qLUvf5s3hhwpOf
	f2bN4+LaQ63H4kQT5B7fhnxZjTWzi3bddkfmRiKwZglmGRk60Mta1MaewXdnP+iPHynb
	rHGXSIaOyfoG6yaCPVfuViHI4mCtUHvm4MSHwHxvBAAOC0rfke2A5MFNXcocwzgVCX0a
	pDV4voHwWnAzPCKFGeGu1VKC61CwOHXJ1y1A1uOJUMJc5hFtLMNuv2V8idKmqELlgxWT
	Z/iN01sp9CCTx8+768i4gtsPnse8zxO+neI0jfqDcPjIYyuj5b9oR59ZEPO1BZf7snKr
	qEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pFC7XqwG9GrRh6UXm9Eqr19rcEAOTEqdzORrrEkTh4Q=;
	b=Mqa6PkqgJe6vFp62zbgmfroJAgZB/WnSpKFm6lMhdKSjwVFGph6fdVqwQE7BJkw/R3
	+TRWsjl4fBANQRpRgSakQcnU+twSf1fEtcwPAeIE+UCMNV5ODAJV/ZA7+Mez+JGa0xo9
	vENyrUJxPBxnx4Xb8JLauPjJ+VTd4ETB9zYDy2gYdo4EJf+68/dyM8S8k4gJ5ElVnU5Q
	ETrVpqydCw2OIXSz7Kp7CAhMzplBzbdRqF69y8fEUMb365pCZaIKHV0NhqzdhpnOUmbV
	oQD810mdh4ROsREjnYYnGZUcGwfJm9NwUB2oj+gd0DEG4dsos37R5oih//mUjtIuTTeE
	AKuw==
X-Gm-Message-State: APjAAAXDWb/UDx3HjEwCYwynf9tZ/nRJvzi0qhuYb0NzCm4i2vUpLGO+
	gpU5LzLJklOY0nDgqzf7sAGkZr/XI4fikkeliMg=
X-Google-Smtp-Source: APXvYqzUhr3u6ehOKDSFuYMBd+RbRZ0VZodSoimWt1u7K+mZ91zNH6VxjY3479mg7DlrNKH+s1L64QyLOrQ8E4lyCV4=
X-Received: by 2002:a05:6102:103:: with SMTP id
	z3mr2655219vsq.23.1581613060472; 
	Thu, 13 Feb 2020 08:57:40 -0800 (PST)
MIME-Version: 1.0
References: <20200212191927.2708197-1-raj.khem@gmail.com>
	<CANNYZj9-oPmywGhB8S6aaoJyfs7mdYLTsPTdDULgdyt6yQJb5g@mail.gmail.com>
	<CAMKF1sowa6qCZwD=1Q7RRMpY1q7SbuW4izg4YFTqOhB2sAuUWw@mail.gmail.com>
	<CANNYZj8kTvu7Z3C5JtXbjLNvu1NymoTbOgiJnLS3cqLMOKO3pw@mail.gmail.com>
	<CAMKF1spSwxqzVW0r2wxQQqPg6PW3ZwZM+HcNh9L0zai7wz4HfQ@mail.gmail.com>
	<CANNYZj_7n9NKm22GDjT9rBU+XokBhuqZthM20Gz-X-AoAxNP=A@mail.gmail.com>
	<CAMKF1sqiOxhyd98HTVbqCLWhxBeqW1sZ_d5cvT8E+OMUQejMHQ@mail.gmail.com>
	<CANNYZj8FsGqPQ9dOVSiOpg0DEGK-+rXLa3Xr86+ZjDcyyDDoPg@mail.gmail.com>
	<CAMKF1srJRQMqhhQtKJaqLxQdsRsWeb1OC-r=sRL7JD5A-70L3w@mail.gmail.com>
In-Reply-To: <CAMKF1srJRQMqhhQtKJaqLxQdsRsWeb1OC-r=sRL7JD5A-70L3w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2020 17:58:09 +0100
Message-ID: <CANNYZj_3Cyf4N-g_rMd+GX=8Upxca4BKkGaR8OEZvjOj=cQtUQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] dnf, libdnf: Ignore if PACKAGE_CLASSES does not have rpm
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
X-List-Received-Date: Thu, 13 Feb 2020 16:57:39 -0000
Content-Type: multipart/alternative; boundary="000000000000a444d2059e77fc5f"

--000000000000a444d2059e77fc5f
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2020 at 17:42, Khem Raj <raj.khem@gmail.com> wrote:

> This still sneaks in pieces of rpm into distros where rpm is not needed so
> better would be to retool dnf to not demand rpm support in libsolv and
> break the dependency chain. Opkg is usually sought for small systems and
> last thing we want is unneeded dependencies
>
> I would rather use the OE configuration powers as such but I am not
> opposed to such a solution
>

You can always set these things (rpm disabling in libsolv, blacklisting
libdnf/dnf) in your distro configuration, but I would like less complexity
and special-casing in poky, not more, for the pieces that I maintain at
least.

Alex

--000000000000a444d2059e77fc5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 13 Feb 2020 at 17:42, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><div>This still sneaks=
 in pieces of rpm into distros where rpm is not needed so better would be t=
o retool dnf to not demand rpm support in libsolv and break the dependency =
chain. Opkg is usually sought for small systems and last thing we want is u=
nneeded dependencies=C2=A0<br></div><div><div class=3D"gmail_quote"><div di=
r=3D"auto"><br></div><div dir=3D"auto">I would rather use the OE configurat=
ion powers as such but I am not opposed to such a solution</div></div></div=
></blockquote><div><br></div><div>You can always set these things (rpm disa=
bling in libsolv, blacklisting libdnf/dnf) in your distro configuration, bu=
t I would like less complexity and special-casing in poky, not more, for th=
e pieces that I maintain at least.</div><div><br></div><div>Alex=C2=A0</div=
></div></div>

--000000000000a444d2059e77fc5f--
