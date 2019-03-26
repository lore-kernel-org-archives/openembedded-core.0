Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4E54F6D5B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 10:20:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id k11so6215538wro.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 03:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iet3Rx28fuL9NAis4cx51eZKnDF7QgbK9a2Ym7XQEDE=;
	b=R8kpBmjs0tl+KUAAwLTxHtb1drrGbGd4vbOsCbLxBB3hdVJ3Pl29yvJ5amUlAteyTL
	j1ujaNUwSx8NS+dq3STPe3QmNy/OuTUaPglCLp6pfE4Kp300xXHf0nKHqRFyaaDQhqxh
	bJEea2vESzKd1bXviyJdpgVTZ0rnGjEZLY1ZK98GbwvqxVM066fRef59N2zSkrVpOvzE
	LC+ZGfkjYz0yRudCD3cwVWU0aSidhLOAO9BWYCnRzWO+AF8mL7AXpyUk3BIVgpc4XPqC
	ouPZfUdfq2YoIktnMPY2FnhlkBkWj9vvw/JFeHdz+oiNXj8JYNrWeZvnN9y4cvM/Zhqv
	BdwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iet3Rx28fuL9NAis4cx51eZKnDF7QgbK9a2Ym7XQEDE=;
	b=WyEeChc+DnIy2TDo4tLL0WiXSYfVNpSV8ANmPcGCw/l0VYwpEvcTFtgtQp7dxrFslg
	B2MaSukDySd/bpIPE6xcQW6Z+T5/oD4pQiK0ft0vCiGZyMTRFVi1fFHo2QUmM2SoPWX5
	Iu0k9/lyZx7ppkNij9fLosSFG/GGrrqJg/E7IwB0yKSgMsWgJ/vYc9yp7w2vlXKe3OGH
	LNaUe8VIGYCAuw1P2Yiy5bO3JqG99yy9/vjrWH9iQVHjAaC8kge/jpkERgF5T/itfRj0
	hdndHcRJJiewqspGclVWhJxAG8BHpF8hbti9aDE/LGA3RMVH7POiaFxCR7PB/0Sm2bTV
	UsFQ==
X-Gm-Message-State: APjAAAXzyqzJNXYiWFYSGavp9PeHKj4c3jDlpRy+6tTFmHRazkV5X+TN
	oySK8OdtCDGRqvpuuiMzUkk=
X-Google-Smtp-Source: APXvYqz4aRU+Gw/y94Xf9VMWelEm8Pkr6kA1e5EtZL9uJ+UvBgse7llEpkfmPisndPdpprZdSf199A==
X-Received: by 2002:adf:fc0b:: with SMTP id i11mr19323923wrr.145.1553595619961;
	Tue, 26 Mar 2019 03:20:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	s12sm18668155wmj.42.2019.03.26.03.20.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 03:20:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Mar 2019 11:20:17 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190326102017.GA1929@jama>
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 10:20:19 -0000
X-Groupsio-MsgNum: 122609
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline

--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 10:00:52AM +0000, Burton, Ross wrote:
> On Tue, 26 Mar 2019 at 01:39, Khem Raj <raj.khem@gmail.com> wrote:
> > > This isn't a git snapshot recipe but a release that is fetched over i=
t.  For
> > > clarity, put the PV in the filename.
> >
> > I think its better to keep it as it is. since its easy to trace git log=
 history.
>=20
> So should I be renaming gcc-8.3.bb to gcc_http.bb?  If the argument is
> that the filename should contain the transport protocol and PV is
> embedded in the recipe so that git log is easier, we should be
> applying that rule consistently.

FWIW: I agree with Khem.

http fetcher won't (usually) fetch different version just by changing 1
variable inside the recipe and vice versa, renaming the recipe won't
fetch different SRCREV with git.

If someone wants to update SRCREV in libcoms to be 10 commits behind
0.1.10, is he expected to rename the recipe back to libcomps_git.bb and
re-add the PV variable (with new +git${SRCPV} suffix)?

I got used to "+git${SRCPV}" being dropped when the SRCREV matches
exactly the git tag, but renaming the recipe and removing the PV seems
too much, what is the benefit of doing that? It's not for clarity or
easier maintenance (at least for me), because PV next to SRCREV makes
much more sense to me (and helps people not to forget updating both at
the same time).

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXJn84AAKCRA3VSO3ZXaA
HH7UAJoD0RhGH98kDSL6FITpxjOKTRnARQCeMRMynkFcvmrJT5xiYuzIjpsTSE4=
=+ZZu
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
