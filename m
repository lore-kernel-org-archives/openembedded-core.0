Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 455B67D17B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 15:26:53 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a25so17585320edc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 08:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y9mmfg66LAgibh0la9k4cSOQAAF1UikSpREP1uR0ob0=;
	b=riccm+FWIs80LbmZ/1sXZvQdgqHYLDZSwqRh24dBC1GC0ud0b+QkQfNnac28DBFtF6
	z3YYcmQ6sYeHM4l9j84Bo+cLB9Kq6hYiqElFOSApO5ngMpLE+5GIhEdZerP4AAgo38NP
	vGVRj2yD7uoQ5nn73jgKPFG6hTPRe7gbN2xo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y9mmfg66LAgibh0la9k4cSOQAAF1UikSpREP1uR0ob0=;
	b=g+3kbTeR/+zLL5hSic6vE5Ad4KI9C3QQWcg95a4zkYMJTCIx1750bKMysDgSSZkzrr
	6nixhKxRO2ch9uIqgHEpuGkZzszYduIz66UtygwaZSgAjt3TlE0RMZIepHgVa8PNv573
	YLM9kVxPSTK39AlgbyokL5xpuKyaU/msVz8tr55GRl17GDweUz0PHw7+VjNHu8TZLGbL
	KtvqUKSedDoGvl+noJYB7bSNxCtIW9K0tRsrHwq1pf7J1OSadz4CISdD6/E3ln/ccQXn
	cE4tZr7w+nMSZ+QF4gV0DxdV3V0N+Vc2rRq4Hhf0n1jwbNS4MvLXHLDBPmTAGENcLjaT
	MUkg==
X-Gm-Message-State: APjAAAUhAPZ2Yx45bb2grOPSw/UmyKY+sXK3U7UepMIUCPdxSGl+qWo5
	lFG9QzLlr62gy/d7CosiICwpsw==
X-Google-Smtp-Source: APXvYqxzzpSj46d9+TeYfMZVSOD59YwBcHLvdqh0FoihZLGxMN2Kp/yCeA0682aCA+7+GYBvUiDY1Q==
X-Received: by 2002:a50:b7b6:: with SMTP id h51mr27067350ede.277.1553786813958;
	Thu, 28 Mar 2019 08:26:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	h34sm8354478edb.13.2019.03.28.08.26.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Mar 2019 08:26:52 -0700 (PDT)
Date: Thu, 28 Mar 2019 11:26:49 -0400
From: Tom Rini <trini@konsulko.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20190328152649.GO18421@bill-the-cat>
References: <20190328144105.31018-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190328144105.31018-1-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] binutils: set CVE_VERSION
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
X-List-Received-Date: Thu, 28 Mar 2019 15:26:53 -0000
X-Groupsio-MsgNum: 122729
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uSq2Gy3oURbCATAm"
Content-Disposition: inline

--uSq2Gy3oURbCATAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2019 at 02:41:05PM +0000, Ross Burton wrote:

> PV is 2.32.0 even though the actual release upstream is 2.32.  To a human=
 this
> is insignificant, but to automated tooling it matters.  Specifically,
> cve-check-tool can't identify CVEs that are in 2.32.
>=20
> Set CVE_VERSION for now, which should be removed when PV and the upstream
> version match again.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

--=20
Tom

--uSq2Gy3oURbCATAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcnOe4AAoJEIf59jXTHXZSjFgP/ipzo5/V+uMWILMem3lk3eCL
gQWlqYgfw5m0Vu6bTIHwK/fl3qogZdSfKJbElBK6Pc6GQkPaDHFNyj63+E6bJAhi
oIr2EGc2WEmU2dv14risxTzt+gpKeTd1wccBbH1I7KKY2rWWkgarwQ/pP7TuLJne
APqly+Tj8AKMLnXYaBbhZ9RS7qga5BxwA7GpSkUhihKImXCnrZHuWL/XtwvVth5H
jVXFC60eBpe14mbPHn2+UKkAV8OU8lzHmJ/peB6HZZV+bfI/EE7y4xtkIkQk5MFo
2RGNAW3xU6n1el0THMnNalWJGPajS+wJlaQsHSq+oUWd250Dve+47XlnhdUUmhZC
OctkOeFZ6AV9VL09ISEHSCO1hx3uL3Eq4LsZZqg/WBbw7Vv8jjuyHfvyjtSsOuHL
pQaDpT13ESfCMGw5ojUDUF9VqUMk53Pau5+2WQQ/ZzBRySsFt6ZGzPiXDUXBIC0y
BkZQGvZE+RZLYqQvKSec987WYWLkgVykUj80HqXTf6dVPzWYl4pFKkYDikHae0dm
/B4jaEYSpDnpfNPtDyJ1RMFx0SnNxD65WWGvOx7XEMOFteh8nQRWgsweZoUefJ0i
wUvJIYISXdPg5toiYDQhumVANYUc54j1eLkofTf45WPDA7m4C/z62CVaKvrhYlqo
9D2WtQ4LJG1ewv5GO4pk
=MzuT
-----END PGP SIGNATURE-----

--uSq2Gy3oURbCATAm--
