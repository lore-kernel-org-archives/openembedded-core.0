Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id B375760746
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 06:13:20 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n129so163228000wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=7x8ngzL9iqPJbAVZaRX2tCksYi+SdkwtIsteElP4RKQ=;
	b=KhWDxQNS/rFb8HfRTw6hnxZHySHuuSNy5JLAZ0+ri7L1eLKLUjI+1wkskIyn3VWTq/
	VrZr6T1ul3FTKBvMo9ig1yHZibvPL5poCJvYbiqrTGa+Lp0Ncd1PpSoU5GfL2QKWsHdS
	vQj5QGGW9XssTcGNcqRAaGKuUwzJVHEMI/uGGXcXzt5aIATsm4BMvV6WgWu1AAaUKlmo
	b8Ve+AJeniy5fKPnAz5LLBb/s73uyVHt1e1GEs8f33Dg16HC5q6LT4HPNQ0JV0ZLlAoC
	PRhCzo9gJQutQNUUFLlGS2ZJHtuPCBjNeHOTKJLpNF3ofi7T4rs8Y50eu7qm+UXqOuI7
	r+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=7x8ngzL9iqPJbAVZaRX2tCksYi+SdkwtIsteElP4RKQ=;
	b=TqZwpo8Qz8p/u500fdxB+tntnBIbDlnozqVHMmAL31/UACDva0tFtDCFUDqBqy/7Zb
	616B+oKOSrVINwJosqZtWS5wy7sX06cVCJoRMAG0br8i+3TU06VKnvKf25alQK2tp/kC
	RiRyWjXtoH3BrvIXa1i0oOZ86Zk/hDSMQ/TlFqm+gBaPpNBAITINSNyJ2AKd6MI9vJWw
	4V5z4T/YrgxUaBE21bDJOI9WRo81uRCL8DVpejsEaVDF0co9o+KaRoa10fu/smyybFrC
	urlG/OkEOJNFJclo7n0lcFkeLCxxLRXkMfViiv9A5FaEu5eoFB2cyYPIZoFjN7Gt7ka6
	IvZQ==
X-Gm-Message-State: ALyK8tLdbDoo/OX+Lfx2q8Vb61ep4mdLbfjUsMkEGEiB28LhqbhuX82Rblz8O1UzaVzaUg==
X-Received: by 10.194.192.10 with SMTP id hc10mr1758320wjc.71.1464156800636;
	Tue, 24 May 2016 23:13:20 -0700 (PDT)
Received: from [192.168.1.2] ([80.106.206.88])
	by smtp.gmail.com with ESMTPSA id c2sm7134329wme.4.2016.05.24.23.13.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2016 23:13:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <57453968.9080600@mlbassoc.com>
Date: Wed, 25 May 2016 09:13:13 +0300
Message-Id: <60AB59B2-92D3-426A-8EB8-9FC717EC087E@gmail.com>
References: <57453968.9080600@mlbassoc.com>
To: Gary Thomas <gary@mlbassoc.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sip.bbclass?
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
X-List-Received-Date: Wed, 25 May 2016 06:13:21 -0000
X-Groupsio-MsgNum: 82625
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A71E6777-A3A2-4303-8550-387B2A7374C4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A71E6777-A3A2-4303-8550-387B2A7374C4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 25, 2016, at 8:34 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>=20
> I was just wondering why sip.bbclass is in OE-core (at least
> the Poky version master:c7e614c438706) when nothing uses it?

OE-core can have components which are commonly used in OE =
infrastructure, especially bindings
may be checking all layers in layerindex would better answer your =
question
>=20
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A71E6777-A3A2-4303-8550-387B2A7374C4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldFQn0ACgkQuwUzVZGdMxSkTACfWdobhBXh3IwCNA6S3dfTriuV
g/UAnAwimB/aFv4v7zeOXVod1glAgdUU
=QftL
-----END PGP SIGNATURE-----

--Apple-Mail=_A71E6777-A3A2-4303-8550-387B2A7374C4--
