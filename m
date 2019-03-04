Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id B2EA57C8CB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:41:02 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p27so4772660edc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k17dk824x7lz/std45ySUzZIrTimuD6tYdH6cRq/2J0=;
	b=B/JZO2L5primF0ChLtFOdkNeQK5JQlgQufKajVjuedziJ8mAVUo2koXrS2TdvQVqrH
	E5b0zX2z33dpPPmM1o/Jhm+UAJHCuTZv38wyErmNPtSi3MMcKwW+zwU6F+25Y+y86acd
	qBzuWXLyruYu/oZAQ1u+wedQvgEz/ABCmKV6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k17dk824x7lz/std45ySUzZIrTimuD6tYdH6cRq/2J0=;
	b=IDMnRlXGKShguJWH96hwlmiucLirCfxmHLBL5IyBREBDg2BzTaKEqmtZstVkradecI
	HZuAEI6HiZ2ano6q+/pUFuPuxtQu3R5qNdthZgwceSrdZqpLvPmn9INDNbiqrCbsxhmU
	QdMuEzwjwiDnSBK5AvtIFHsFxbd7iEPbfKRKb0crNYZaG9Vl3aD93qbCexAhyxB4RHdm
	LPLYh4EdWcF0AxwTJWcVVY5dJXsQUT1Id9vlfQ4U1if/BWL4KMhjhfPRDgLuU+UmwGbV
	ARs/eEKBv+e3Z3FmKuRWjpyhPWGkXf9WxeaulBa5GHkWYYimqhpnc7lB8XvipUqO1x9F
	BJwg==
X-Gm-Message-State: APjAAAVYvrQF7UUr59oWbwxo7aXS5tfTeCuYPPN5hAdurjFqSORZdsfw
	53DGr+a9h72P6U2ALNa5QxOWfIPIOGo=
X-Google-Smtp-Source: APXvYqzigbDr1pvtm6Mb4vs0h4MNgktzLF+XqOlg73dHarxrjDQ0lYxMoulIFyrLExvZ3soGMzv2xA==
X-Received: by 2002:a17:906:c406:: with SMTP id
	u6mr13008260ejz.95.1551717663329; 
	Mon, 04 Mar 2019 08:41:03 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-D0BF-27DA-BE9A-269E.dyn6.twc.com.
	[2606:a000:1401:880d:d0bf:27da:be9a:269e])
	by smtp.gmail.com with ESMTPSA id m10sm2224450edd.2.2019.03.04.08.41.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 08:41:02 -0800 (PST)
Date: Mon, 4 Mar 2019 11:40:58 -0500
From: Tom Rini <trini@konsulko.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
Message-ID: <20190304164058.GT5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-3-git-send-email-trini@konsulko.com>
	<e58b385ea7debc2eedf481372bcfb5203ad61987.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <e58b385ea7debc2eedf481372bcfb5203ad61987.camel@andred.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Mon, 04 Mar 2019 16:41:03 -0000
X-Groupsio-MsgNum: 121920
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dO6Thh8T/cwyDjv9"
Content-Disposition: inline

--dO6Thh8T/cwyDjv9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2019 at 09:47:57AM +0000, Andr=E9 Draszik wrote:
> On Fri, 2019-03-01 at 17:26 -0500, Tom Rini wrote:
> > In order to have more robust stand-alone network tools in oe-core, bring
> > in vim from meta-openembedded/meta-networking.  This imports the recipes
>      ^^^
>=20
> vim for networking? :-)

Noted, fixed for next round.  Thanks!

--=20
Tom

--dO6Thh8T/cwyDjv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcfVUaAAoJEIf59jXTHXZSkS4P/i7VrgXvAcPtLKBHWsMRymfX
RY8acE1h0ho2/ljUr3yGOldfbMzot39vaaDzrVeUBpAbXSKsPdtUL8K2iJ17zmes
Yc+4xollEm3cNGYsTT31Y69cclw/qHWP0c1r+CgI0V956KKJTMMZMQE8z11JEDWM
VXna05HzeEFEd2gaf0pyqis2Il/8uog2+bY9e/Ni7TOKSZGvvvR0L2uK5rkgG6/M
hULWhIsGmt++Dq2pdMypUF+vjcD1oqG/BAwM3I4TSaoUW1GIJopyhhhDh6f9VEBr
YCw0102CFnpv6ppri1dXDbFpP9yCD5XNGfOTY3VnP7B7QBPffg+FejNiryUDQXuV
KvUWHKucblLRWBF2xCF6rqmJEEOlow4kwmdu6FOlSWXJu6xgXDM8h09Laa3Ih2iG
lkbWbz30fzkkHpBE/pmSDQ8bhy+qHUyVzIFJi8ZpPibjCtcTgrXiUOR9HBNGXGDS
TaDiOInm0iYBqfFYzQyL29YKrzfoy05DKE5tXNmK8xL7s/7U8L2IUpaJ1TVmq3vL
HWvyFeoEdlYw95OwBbBPQkYwobn0ek8fvPJKKZ5jEUevUQ1Az5vR7jUMCR0n8D0D
GswD5Aqaw67InaJmESq3zetui3d/hsaIPfsm6S5sVYkeyn7W9CWl6TW3z/Mjs2T4
vOFziY8LHMDCRxY5N+OH
=g7Sa
-----END PGP SIGNATURE-----

--dO6Thh8T/cwyDjv9--
