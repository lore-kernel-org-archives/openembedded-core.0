Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 208CE60043
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 20:53:19 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so101881564qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 12:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hPy3XsY+VML2py5dmdvQOwL5JG57Ion6J0q5Darw01Y=;
	b=ZRAhHH9tqi7UoyLh3+xbAHsNrvtJ6hJytY+kdtBoXaCEv4DCrq4J8kkv/Cw+yx2/++
	koGy8WkH7YuCPv0XRfzx7hcqbyCHETv34LYcXW0jbv1HTeJJlX/zdyQlI8SJf1K2OxLe
	DAbGjPmjc9RYdPCgZSpvvVuan72h2OHB1dI/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=hPy3XsY+VML2py5dmdvQOwL5JG57Ion6J0q5Darw01Y=;
	b=F19KbYsd2rvyp8ymzTmBFN/aC7btM18loTh0UsPsxRXwurRaS8MKEkkEYeHfDTx4gN
	Mj9IoquxXZ0vdgiA5R4jN0WxJiPC/QNqYiT/ZGjxIcm6BXqO2P2LLQQWx+8+mlfL6b73
	e7wCM/GBR3/bqfR3vO38gdlwlKIM3dFpvOqLV7y05z0FhWGAQdhtNdYViOSWEeN1ynYK
	6Uc3dSA7HCtnDjLr8LJrHIRATPh3gt/Fy5/Hr7zA2xUoTe7ZmkaqFIyS9Z3SDEXuyxNK
	/Eb6x1VcGbR0B4ZzvQ43RkC6qvEg9ScKwmxgmI9nQcJRTGipAh0gEl3ynyNljU3C/EXp
	b9aQ==
X-Gm-Message-State: ALoCoQlcCLky+7d36h3VVwsUDOIYSiYr65f5f6BwwXcFubJG2UWkZUdeY2D8oFsck8U8+pK4vgDX
X-Received: by 10.140.195.143 with SMTP id q137mr35086581qha.44.1447102399620; 
	Mon, 09 Nov 2015 12:53:19 -0800 (PST)
Received: from bill-the-cat (cpe-75-180-230-22.ec.res.rr.com. [75.180.230.22])
	by smtp.gmail.com with ESMTPSA id
	s48sm5629187qgs.4.2015.11.09.12.53.18
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Nov 2015 12:53:18 -0800 (PST)
Date: Mon, 9 Nov 2015 15:54:00 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20151109205400.GI8499@bill-the-cat>
References: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <1445961940-12110-1-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2015.10 release
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
X-List-Received-Date: Mon, 09 Nov 2015 20:53:21 -0000
X-Groupsio-MsgNum: 73121
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AEH82lDRgeOHdrbe"
Content-Disposition: inline

--AEH82lDRgeOHdrbe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 02:05:40PM -0200, Otavio Salvador wrote:

> The U-Boot 2015.10 has been released at October 20th 2015. This also
> removes the GCC workaround, for the inline behavior, as this version
> properlu supports the GCC 5.2 as compiler.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Sorry for being late on this.  Please make sure to cherry-pick at least
c139b5ff0999ec3d44a02ebdb623a92e5782e53e from upstream (or a number of
boards won't boot Linux) and possibly even
fb3db635757f68e68ab3e943396c34886529b88e /
2bb5b638791d0f4f7d2f0e5c276e70a1034805ce /
347ea94e2a954ab70f64a3f43d9b374cf4640f26 which are some important MIPS
fixes.

--=20
Tom

--AEH82lDRgeOHdrbe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJWQQfoAAoJEIRElH1W1v7N/UoP/Az/8gHuubEcGbVXkxrn8z1/
Vn+zEZCXgW4vC0+bCZKXC0JKOudY5/HuyU1db5fR/6tNMjafDEjMcvaBf/z15381
cs8ZPa3zWA17RFRJ1bEa7/WGtMTz/t5Z37U2Ti/zGnOQfMGdguBzTN/meWax601q
Jv4BOTQokwHwAJTImNIGUhl3N+Ex9bduPnhvTgQ7W/t5LFjw2InwYAI2sJ8LeB1j
DCchhugtYDJEqbLnroe0Ko060X88KcmV4WEu8pk6uvMGtDC5+7yjtLoWFCt+wv5Z
Pz7m+f6hadNSlMVhak3wNyr6F7Nn9f7xKZU7cKXrID/9wPoA9fWVOsUwkR0gBHWC
akFLQkqC75VjnH7CbEZLAhR8Y7HX3gCwChWYKqRkm59WZrAW3ISIDJFu114C9RJW
5rAs8sw8dt6VQhcto80W0UiNJKMV0EcTIxTHJ3RsL5uHLVt5/ET/mAOE/Wko0hU+
8ty1X4JIpfhEc7e1bUfHDwLM5vnXxVuPvcCSNM0BtqjX6WalwlbKwL0Wp3sg8pNc
RCVgR0B44tzEoS/v1jCUS8OF5EFXFfAkOY46QvqUj8GA2cLigeV5Wt3C3vFVVbMQ
yQvgPOGo/vpwRDsD3YBrhWBoOJf2o7VRQLHtJH3VeeJ7woHUcnJZ0Y20WGsmfHfR
DqZd7XK06gRQWTFiTGn3
=zj4f
-----END PGP SIGNATURE-----

--AEH82lDRgeOHdrbe--
