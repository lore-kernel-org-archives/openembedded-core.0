Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF17731EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 08:57:19 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id l68so23316322wml.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BA4S/IoVhxuOzP0x2iao7C2TX5rbQ0uO3/nNS6a7kuQ=;
	b=HMMjAQJdRpFwPSCSgv4leoZgC0ImFbXrJtg9GwZH8YmtSUbVjvqXD/syLKHEafweVW
	zjC+OuG1iV9Ig+9iyUKZA2Oo5bTeuTLUyWYhRfAEoSb7oPzMXuk5dP+Qg6iGRJWZieru
	2tTWqwd7kZTyGuCC7f7NuSOcP2AKDCBUpvN+gRv5hG5aydzege6cSSzK3OP5ZEhioxtn
	tHsOSdR5ZeeFQ39tcAwyydzW20jGzYUZkcxPLekQA8UZHg7ByYpWPdC19OVpusXL5yN9
	HzgpXWvYRpkcrM9SWkx9hjb6IyORNvHXgHTdj9q4U3tlbj4f3AVoNRb0/S2qNyuuo7/c
	2UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BA4S/IoVhxuOzP0x2iao7C2TX5rbQ0uO3/nNS6a7kuQ=;
	b=Vw/RrTJf7Tg5bcm7m51ZS2/+fY8IHBBQ04hoxGANXZOiV13aSrcnh6hzbICQxwnEQk
	3sHW9RvpaKU7vtWdZbw17w/IDap9tTZJ/ubOx5LEEA/7h0nI7ey2II+GzDjP3HijB4IR
	Nsd0ntaUmwXgffn/F215jhpQJIPz+nmXc4Kw1Gn3tJMZN/iHB2UjJZYuqqDZWWnOZJah
	xOTr8sWGykuqa3C2excXWll9gXq3dlQ0tIiDkCczjhn5OlXLFl9O7hhUKjdjx2Oc7K78
	6UG1a/uZCYJ8PZWbp+JhBK8vAderOpXfxLsHIHmDzqfNddYP7b0CMyLMFK9mPtellM2m
	spfA==
X-Gm-Message-State: AD7BkJLJoOcXBrju8SpS+ZqEKIn6yS9dkqAHocRacCb1NZYd4Lt9/ynD7bsnB7BJGzvbcw==
X-Received: by 10.194.115.132 with SMTP id jo4mr18487246wjb.156.1456822639739; 
	Tue, 01 Mar 2016 00:57:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	up6sm29765098wjc.6.2016.03.01.00.57.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Mar 2016 00:57:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 1 Mar 2016 09:59:10 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160301085910.GB6407@jama>
References: <1456773039-5178-1-git-send-email-Martin.Jansa@gmail.com>
	<1456778449.11498.183.camel@linuxfoundation.org>
	<CAJTo0LZ6RabE0C2o4wjuKQRbgikjc3f+CH8RF=j4RdVP2nu=7w@mail.gmail.com>
	<CAJ86T=VFeZjULfZW3q06juYa90S8g93V7WhTB5Lgdhy+nJaprQ@mail.gmail.com>
	<CA+chaQfHZPKviheG2NY7miXe9YZir0pszp8qCQbb1kgzPABPDQ@mail.gmail.com>
	<20160301004309.GA2559@jama>
	<CAJTo0LbSUxP=yUD2Ga8=TeT-eudZaFjrMP7HKq-yv0B9RfK6sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbSUxP=yUD2Ga8=TeT-eudZaFjrMP7HKq-yv0B9RfK6sw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] no-static-libs.inc: add gdb
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
X-List-Received-Date: Tue, 01 Mar 2016 08:57:20 -0000
X-Groupsio-MsgNum: 78980
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JYK4vJDZwFMowpUq"
Content-Disposition: inline

--JYK4vJDZwFMowpUq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 08:40:13AM +0000, Burton, Ross wrote:
> On 1 March 2016 at 00:43, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > OE qemux86@ ~/build/oe-core $ cat
> > meta-qt5/recipes-devtools/gdb/gdb_%.bbappend
> > PACKAGECONFIG ??=3D "python"
> >
>=20
> Having fixed number of these myself it's definitely best practise to use
> PACKAGECONFIG_append and _remove in a bbappend.

That's what I did, but on other hand it's harder for DISTRO to remove
python if meta-qt5 bbappend uses _append.

So I'm thinking about changing it to
PACKAGECONFIG ??=3D "readline python"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JYK4vJDZwFMowpUq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbVWd0ACgkQN1Ujt2V2gBz+YgCgin4ZSEPrx2i9QywV+REP2s29
DpsAn0H3nNbGlIh/lzOVgKa6pnYy2dkr
=YcQj
-----END PGP SIGNATURE-----

--JYK4vJDZwFMowpUq--
