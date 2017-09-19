Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 68357780A1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 13:26:32 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id p10so2459097ywh.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=4+FFp62Ekmy3/OfHruD/OeTTHYYUy+lnCoNi5wSIB80=;
	b=kAoEFNVGduIC+vrTaWlTEA58Vr9zXufiAzC80cfFWYg6mRjfLfOpZNd81MRB42Lkat
	y96KELybriQyZLTmMShWLVSgwwWu138sNhjjeYf8DjEXZceEQ6m1KkQTDDiTGlWWDMSC
	MaP8g8v0I+JiKNxf21KqMrrEl0AHGMK+R634Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=4+FFp62Ekmy3/OfHruD/OeTTHYYUy+lnCoNi5wSIB80=;
	b=mriFPQM/pAFkyc55KZpEPiLgU2dO4tRs+CHP/9PHpjY1DRS53ZRBFeK8PW6IzGtZ4E
	PghonUESmfaY3ws1KSCSaf/XKzzblOi9LjGgGNbdSo7BHTeMVDKOb6xW7bXkJNgRBq0j
	AYUSeQJPlY44ZWV6Sgy5G42IVxwwA4fpds2TWjTxmdcxAO1NCEZHxSLcGR0SIAQwc4XB
	r7/jAq6ZKj1FJFNTZafHfE7f2MfWZW4jYuCE3GNjAjNz9sDaxHRetEMEdAw6wR4T7JTb
	374mwNovwcIU5wi+EcVSWfX4rsAIkg5v1WnGglIQloTD3q5odVjndsSQna5N1E23+n2u
	34RA==
X-Gm-Message-State: AHPjjUjEftLA269ki0GEBLkpeV7Tt8q/uVzoDZM3WNo+F9fSsQ8aA/G1
	Ol87vM8lulaZTlPGX7G90eF9sQ==
X-Google-Smtp-Source: AOwi7QB/lPtSrC+ErrIpzTGOMXeco9XZVM0sdEae7JgC4SDGUngXAE2zAqKRaLqgBW8z/uf/wOK4IA==
X-Received: by 10.37.97.83 with SMTP id v80mr611967ybb.333.1505827593352;
	Tue, 19 Sep 2017 06:26:33 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	u123sm4234011ywg.93.2017.09.19.06.26.31
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 06:26:32 -0700 (PDT)
Date: Tue, 19 Sep 2017 09:26:31 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170919132631.GN17137@bill-the-cat>
References: <20170919131941.23618-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170919131941.23618-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marek.vasut@gmail.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot-fw-utils: Fix cross and target builds
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
X-List-Received-Date: Tue, 19 Sep 2017 13:26:32 -0000
X-Groupsio-MsgNum: 103134
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Osvg0bgWkLaeQPMj"
Content-Disposition: inline

--Osvg0bgWkLaeQPMj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 10:19:41AM -0300, Otavio Salvador wrote:

>  - The environment tools target has change to envtools;
>  - The HOSTCC variable must be used to set CC for cross;
>  - Drop ARCH variable as it is set on config;
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--Osvg0bgWkLaeQPMj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZwRsHAAoJEIf59jXTHXZSR8MP/3HL5T7wtyacNHGy0+BADZyZ
LzJoh2q+UOfQqRCaqyVKj5zyJtZPC+0DofM0fLkpP5PbjcFyflLrXbCYeZf8B8qh
5BgOOXyOu4ckGthJmY+hnigmxlscZB24+POdh7we7YnhmFfjmuJoEERedAjF3SGp
RMDjhRMrnuTilK647j2xiNAFIKqhzCNz1YsT7irZhKdalSuAHBw/DJHZqpqNkNsl
wAaQa5V4V2sIU/EAWKzgr8Mx+AGjtncOl2GxoZ6uT7Sn46uw+ol3z7Hp7Dc+O8J1
PGb114F/xEpLE3z4/4hHRnKH5u2pkAPJHTAU8ycrV8bLgHjR0FjJ5OoUjF0tXWmJ
kotBFBV31RcNV9+pGOdZpOBVoF81RMzNFPHvD08sidVRzCUjJ6SPNgfORF3hcTMM
kUDqodzasAJkkCLX+MpYrzki/oK8GdYPONiwH8DUp0fw9zZFCClkMHcFnTIHwSPE
1+1Rr1vtu2Ens+Mr/yoDpHFiYFj7FOSw1MKshxdXgUsbH/+U544UjHzxG6FUQtJp
fBBPB8cy+qOYwgOkTsgYOMmrL9sAASge0WQZ8a3PRHv7jNOtpkWz5P43kUvE8Nb8
Fji9rljSbAIB63R6ACSNv2RENt1WdWNjc9mEjhRv56z/rVEBLnEYdGxDV88XJvWa
Gcn2MjlQKA8bv/msfikw
=vc1i
-----END PGP SIGNATURE-----

--Osvg0bgWkLaeQPMj--
