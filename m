Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id A14E578258
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 21:19:50 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id o143so4965389ywd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 14:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hCb+bGV1P3mKgjLFO55hvqSct3wMokdH9PwzPNQS2fg=;
	b=iIN0BptHLDIkePlaS67cHGlJaPNJCOjf/V8ztZSMR8z6S8NraxUpYSUeHRdHCGmywF
	jPT6ml5tUewP0R94tofQg53cv9aQHBVGzwvmtIt744fd/BY07gU3qhCbP/bQYvRyJnoo
	G/LY4psVJ49X1EZR0ssTMXBturX4LsRwVIg9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hCb+bGV1P3mKgjLFO55hvqSct3wMokdH9PwzPNQS2fg=;
	b=BY5odlqIPhVlaOYnBiE2v9WevIQS63q9NmwshGDrYbmhX1gPVqjoIB8YngOu035sHA
	CCCSisroOzeIjINK+fR+zArX4Wz8Thf2Jd2J2wPO8adbnwNU8rXDzVD4FvnUGsJVGMHg
	rfSga6jJ3WXgwDEd2QoB40jTuBSbPC6P7rNdphvZJHCHsIb5hpK8Yuxx5sF3q7kWOXxN
	epVAXneyLnht17fieISk3acceHmWVJB4Ic3SqabJGduPi8Rsxe/1cJyHr7kVy5N4babq
	/u8myGM0vPl6zWb3aum8VvjGRJ83Sw8Wk1y7KLPVRLmX99HoE0iZ7Ju1g38+OZSRrtHd
	4aiQ==
X-Gm-Message-State: AHPjjUjMwYbovguH/5xBTY2S5HQaG/9Mal0hdkHztNpWJL6MRecOcmUa
	BgMr6YrY1cDjz7B9QVRqHjjOER4t6s4=
X-Google-Smtp-Source: AOwi7QBMMR9EEH7K2ZZaUcZOvh4NtYRRgRMyb/fA/h4O1hqG+Vf9aDX6gQUXWvBCXSYIHbkmF+XN8A==
X-Received: by 10.13.208.69 with SMTP id s66mr1295941ywd.450.1506028791754;
	Thu, 21 Sep 2017 14:19:51 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:24e9:4a96:6457:ac31])
	by smtp.gmail.com with ESMTPSA id
	j144sm895836ywb.43.2017.09.21.14.19.50
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 14:19:50 -0700 (PDT)
Date: Thu, 21 Sep 2017 17:19:50 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170921211950.GL30205@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKquj79BCNcRg66C+GSbDeoAeO6nb61Nk2FQG75w_CCTjg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Thu, 21 Sep 2017 21:19:50 -0000
X-Groupsio-MsgNum: 103239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ONvqYzh+7ST5RsLk"
Content-Disposition: inline

--ONvqYzh+7ST5RsLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 21, 2017 at 06:15:56PM -0300, Otavio Salvador wrote:
> On Thu, Sep 21, 2017 at 2:46 PM, Tom Rini <trini@konsulko.com> wrote:
> > When we have been told to use the UUID we should also update the fstab
> > to make use of PARTUUID instead of hard-coding the device in question.
> > This will make the resulting image much more portable.
> >
> > Signed-off-by: Tom Rini <trini@konsulko.com>
>=20
> Adding more features which changes the fstab goes to the opposite
> direction of reproducible builds; is it desirable?

UUIDs are already something that would be different every time.  It's
also (at least with just this patch) opt-in.  The second patch shows
that it's quite useful (and there's real-world examples, ie Minnow SD
card vs USB/SATA, various ARM systems where mmcblkX can change depending
on regulators.

--=20
Tom

--ONvqYzh+7ST5RsLk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZxCz2AAoJEIf59jXTHXZSVvAQAKg4etlMCFePl07FHKtTtl9+
j5YrcT0dJbIE7/1a90CrHY3TYOUn6lx5aoEiupycdC6NXCpPOD3R6Y+T+V1Ie7IV
8MzBbBoDyPEnam5Ss2lQiYrt5S+x+ggJeMW1MnzCPyChPq4EdcszfRouaFP3aUuP
wAhAMRLXZ+M7TsARVEDX0JqE5Jvm9qfTbz3MWedKmfoudKGjziqsoX8GPDOD3Glx
7Tu+6M/ieO6yFpPqIxwvG9O3SmVxZlESJXdaRs28zktTZybpJB9QkxZolzZcwJEp
kWMC/b+B5bu/EAWPSRJQr4kJRU4XjBuADoPDb4D+bzY6gfSXUK3hY8auiVuodZis
V2+g+9R9TGwJ4Hu0rBPu3UziCxI+KSKFSiUelTfSSOCbqrrqe8OzeA/L2YbsXN9f
7Xq4YaR7QuHwOMJh+nxhYUhiIhV3JytNzLx1kNqHFWArL9ikXO8xFyTplJ9gWQau
cZNhMXrEI/duqhLQOrndPCUEOrMCiT4s1C2rDRilnW85gfEpyQm1jbuXjJJB1j3e
qC4/nqrINpf9CVTC46h6raGQATptaVeRY1XigPwfHuAkSbB7YsueRL76or5SjE1A
KWFlDBbWvnyUt6tHuli+Hq+xJ1FG8C7aIU3TrETu3RddPccupsaSXrdsE5MPCago
U9m6lurM9u8RCNvoQ3Ej
=Id6C
-----END PGP SIGNATURE-----

--ONvqYzh+7ST5RsLk--
