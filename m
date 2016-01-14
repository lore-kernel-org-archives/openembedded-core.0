Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5040D731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:18:01 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id y67so29713234qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 04:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=40eAfccqfQoeby9yrcKrfMwbiO74LzOWlYh9I/uw+7Q=;
	b=GrIl6QtXttd31rTOD+vWG2AfVimFdvfXK1c2o34c4zJNa5kHm35rYen61/s8cgSAPd
	d9PjjBgPoo9VsYkXL+02QCxfgngvF7ro/EzaRV6dEwboWeVTBFUUq3c0iecyvlxLhhcY
	8Sa+nBhPt6MLNH6jSGdznGV9skD8aaIHN36c0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=40eAfccqfQoeby9yrcKrfMwbiO74LzOWlYh9I/uw+7Q=;
	b=IdIlCVh/oFVRAbBsNts3OSAaT6YH03oINQnBsBM8valEX40kfuHyWvjzMvMLIDsRLe
	1KYnfzdc8XuJ/272wRsouLWnsQUAFmIIdjRhSHORIzs91p9/OK7spSMOgehgsyBw/Yfr
	r2RqXvuPhlL5pIhWYadkhD5fZMLnYzoaLiJ2JGGanllKxqyGjPA9qVa1r/65D4p5EK3A
	D+Z92lHPg8W3Z6XomQYbQ/hqsBU00ImRvla89xltcyCBREWZ8Sz6fmVh8I2HaOYl1OmG
	lNlXoDohOaAyrxDG2wkJjDTENdsGRDNvxakDyF58qmIca47oTlGU9kEqRqsQOQAk30S/
	k3xA==
X-Gm-Message-State: ALoCoQkG1f+91EpLJ0b3zQL/sXr7GOV/W9RMWEf03WifmQDVC82EcXcSElQyCKWFRWWqA8YSJVLVF99WhCHex9kbkq8s29/VUA==
X-Received: by 10.129.90.136 with SMTP id o130mr2544898ywb.340.1452773881863; 
	Thu, 14 Jan 2016 04:18:01 -0800 (PST)
Received: from bill-the-cat ([2001:470:8:32a:166:3614:4ae4:6eb4])
	by smtp.gmail.com with ESMTPSA id
	l187sm4222493ywf.40.2016.01.14.04.18.00
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 14 Jan 2016 04:18:00 -0800 (PST)
Date: Thu, 14 Jan 2016 07:18:19 -0500
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20160114121819.GV3359@bill-the-cat>
References: <1452741432-10746-1-git-send-email-marex@denx.de>
MIME-Version: 1.0
In-Reply-To: <1452741432-10746-1-git-send-email-marex@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 12:18:03 -0000
X-Groupsio-MsgNum: 76042
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jsyVD0HvY7zwMlg9"
Content-Disposition: inline

--jsyVD0HvY7zwMlg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2016 at 04:17:12AM +0100, Marek Vasut wrote:

> Upgrade U-Boot to latest version and drop upstreamed patches.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--jsyVD0HvY7zwMlg9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWl5ILAAoJEIRElH1W1v7N3nsP/RQ57ZwS+f9xGbLOYHDGQoEp
QaUVRgZzAKKjLw3MAJtgjB00JmvFZyZGEdKtaGexcJyWpWQ6q/r5wo5HYDed6JoD
Heqgwcnbv92Cots0QcCRM5UBV6vj/2UwjK3FpappSyvNEtC3fPW3JYmH3mnYBsbD
7pxeC/Z6y3Kk3nfKrv/ALY9n9i+r8qCvcSn2FPEcaz8f+Fn+TXdNRU3smBmKZ7ee
NJbsw2W6JHcI9aWlV9jh4jnNkTCo6klehnHBjfMm5qUpfNOvSfBvi6VMoQC8VsXM
2A4L+gaWnbWhiI+dMBw4+/bmzN/2v5zryF3ghVUeij281cK6OaEe2zYW4dYevduF
kl9qVhRPk+ir9zzF5+M6aAFVemeP73gPSzqEYoSFh1MKmiBE3ZpNg0V08ihp7Sla
77imnWbQRrGn/aBa78VZOG0XU5M+KHQPX7MEOndzsiCj6/o7oaP89Co4xF8E1ce0
C0H0ZuLJpiCi2iJeWMyTprVe0bNXBTT1Z5h+gj0hpFVZ53ONGQfPOU4G9LOjPhYJ
vEQMYA1XeSRu7IPMNZXcbyUw2W+N+qdy1sTRmb4XC3liKiszsO2lxeS4MP52vLw+
VVrQxP66S0a4huLD309PAnNWa3kCSaY17TLM4D+q9+pvuzknc4dGi+Uxl7FlDEoT
KiMrQ+ZxE9e2T3fejA+Q
=y2lJ
-----END PGP SIGNATURE-----

--jsyVD0HvY7zwMlg9--
