Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD9E571BF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 21:58:34 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id v76so1144898ybb.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 13:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PHnDjM9Bw9KlTeiqtXDmky+V+Nsck9ad59I0sIDV1ng=;
	b=B/NaAxluIwDQYWxpSRWjAHrH9uizrEHIdtRJ6OlpYiWGbEqnvNUyKJ9fY1vw79yJmv
	KSmgQ/kqlLnp08BdH5IAO0HBtwxDOt5AERPjfJFgG7HaRykzXbfBJNNmuCv0rQAQGHUk
	ZrE1DbIW8rm8LeE2uL2eu7We4BfCaZ1oicBgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PHnDjM9Bw9KlTeiqtXDmky+V+Nsck9ad59I0sIDV1ng=;
	b=m1rHwBcgo6cko781p75lWMv5OtnBO5yXFrozyAuyMZnKI2nuSGVyky3Im4WdiXaZUg
	YMQWbcYy/kSIEl1Djhr/r9vzo95MWmjwWOZm8YHEQ8EiFpAedqzKMn6wfvJF/PRqxEfB
	CDttGqC/0yYc6bC8Om3/MrFv3G6k/9wbcmBqiZ4C+vaWqQ6GKBU1LwfebEdI3KItxKC6
	SDiTGGwNYkuCCgcoZjRf7pPIIsAxzmp8Owt1GqNTP4lSiy0WQYnT+se8N0FpLCkMexcV
	TQb0ZraUAH5sMX2wND4s8Saw6vM+0bzUi5ZFyrHAtInk4Ov9pyRxRhF2W7cqQqs/XieR
	J9UA==
X-Gm-Message-State: AKwxytetk/3+WG5aa+X7sERsniLwYsLEtPYk+DYLioaDpWhPjVlyAZJq
	jv8mkltavJiv8/HwljqRRpFSj07T1qo=
X-Google-Smtp-Source: ACJfBotFuRoAJ1ekC8x4Su/VxiIfKDSJhl/tPetoUTiNQVxJyrBI7nrnFQp/pAMUB/2ZbizKbg/ZwA==
X-Received: by 10.37.233.13 with SMTP id n13mr28027099ybd.220.1516399115686;
	Fri, 19 Jan 2018 13:58:35 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	o197sm4255407ywo.23.2018.01.19.13.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 13:58:35 -0800 (PST)
Date: Fri, 19 Jan 2018 16:58:33 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20180119215833.GA4660@bill-the-cat>
References: <20180119174502.4010-1-marex@denx.de>
	<CAP9ODKrRAAc+X4aocnrpLhC=znP5thMw9jxh462TUHZMWsoO3Q@mail.gmail.com>
	<1518fd89-c875-1ced-aca6-8f4e53f65548@denx.de>
MIME-Version: 1.0
In-Reply-To: <1518fd89-c875-1ced-aca6-8f4e53f65548@denx.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.01 release
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
X-List-Received-Date: Fri, 19 Jan 2018 21:58:35 -0000
X-Groupsio-MsgNum: 107235
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXMM6Y0U0K8Flxwk"
Content-Disposition: inline

--xXMM6Y0U0K8Flxwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2018 at 10:46:56PM +0100, Marek Vasut wrote:
> On 01/19/2018 07:18 PM, Otavio Salvador wrote:
> > On Fri, Jan 19, 2018 at 3:45 PM, Marek Vasut <marex@denx.de> wrote:
> >> This upgrades the U-Boot from 2017.11 to 2018.01 release
> >> and drops patches accepted upstream.
> >>
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >=20
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> >=20
> > ...
> >>      file://MPC8315ERDB-enable-DHCP.patch \
> >=20
> > Please send this patch for next release so we can drop it as well.
>=20
> Look up the previous thread on why this patch is still here ...

Yes, and FWIW, I still think it's of the type that's safely merged
upstream.  A group of users needs additional generic functionality
enabled on a board.  CC the listed maintainer, and York, and I expect it
would come in.  Thanks!

--=20
Tom

--xXMM6Y0U0K8Flxwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaYmoJAAoJEIf59jXTHXZSdMYP/RQ7k8NuC0dLLFowFw1oJCfF
jrDR12ZN6mOt2UrBSrBZDkRTcEYEceVPF1A9SWkgIaBJ0F1c+32+lYAcJvpWOi4E
ey7pOj6cV/dmHgopMWAhdhv8st6dnywuTKKS1rqTf9z7dW6esJgUW76QHsN6JAlF
kwmh5A2eA7aR7OS3j7HmZX7QTbNag1u43/peuUpT7/lfHefaBm/zWJoph+CMrtLr
EubTH+g3KeVYhqzwIPgfa/vxv1tALdxxeTqX7li/7+bNM7UqEcrUIZtayWVf/rLU
NsWEAxBQVOp2QSkChO6Gp4kViveT33d6mpDzvqdQ898zgsMcpxNARac4bdte4ufr
z5z4OF664mRMW5sa+Afqe8K69btqLmPx3mfQWnhAnNy9wskHhV6dPICk3EBBD+YZ
SBnIEVGQSPQJtv049T36jmRgicV7rMKs6eFMAMNQ4Kz0KnH64Pr1eYm937iYdNgh
8sROfDQLo7W55AGQgQLYJQH+jlPOlGGivV1D98zVVi1Z4PDkMQXUDdmNW91LBQI1
D8uWmUZo1aV3hKgjN7F3WeLvCbiuC0vbag+NSY0gDSG8raQ3nYdFknqG1avbB3Pf
OvXU9FUkPw315R6/VtEgkazE2mZHNWubElo1nog9gCJzbBrUF0pYagSzM+T82S9k
oIjOVXYcXq3/VhagTvWR
=YoNB
-----END PGP SIGNATURE-----

--xXMM6Y0U0K8Flxwk--
