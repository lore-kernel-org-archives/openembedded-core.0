Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDD96CEE8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 08:09:31 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so5050968eek.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 01:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=A6EocAhNUEk/CmzhGkV8rxV+adj/l/t+IdE/EeDSM/A=;
	b=unzjEE7V+/FbViyVl8DZFKNMn9NqfupXzTPEUDppsuCNi8q8T09GrjxNC3I39g0yhM
	H/YV9xUEFWia8n+y4ipHKp0cVtavGzGIsx0J7XolPcXQFkqtDZE7PLkHQXKMetWBu1jX
	er5xoXRY9TErcf0PcyEuhX/7iDdSvzXH4Lk2ZZqXLhb/mUXlny1WgEYSGa5UcuMxgE7f
	cGsdcQJyniEZEoIVLwAOCg92WAtQBPtpC/iejttRn1ylblhoPl9xC+7JWfF2vnCVLxtf
	Kf7nRIH/fT6JdNd6iwaZOQOP89hrKByxaLCMCi32pJ25SzD3aa3zaligXKTrHCr+1tat
	OXFw==
X-Received: by 10.14.45.70 with SMTP id o46mr26326309eeb.19.1383034173365;
	Tue, 29 Oct 2013 01:09:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm67150719eeg.13.2013.10.29.01.09.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Oct 2013 01:09:32 -0700 (PDT)
Date: Tue, 29 Oct 2013 08:09:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20131029070946.GB3697@jama>
References: <1382345775-1338-1-git-send-email-ml@communistcode.co.uk>
	<CAMKF1spfQ7hiR8S_=cboV1+p2B4yMF+vqfHpWr1bha883MbvTg@mail.gmail.com>
	<526ECEBE.508@communistcode.co.uk>
	<CAMKF1sqChkPK36LNdP2x5WcWgB51md8iB4x9V3cUEPEB5M2OfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqChkPK36LNdP2x5WcWgB51md8iB4x9V3cUEPEB5M2OfA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv2] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Tue, 29 Oct 2013 08:09:32 -0000
X-Groupsio-MsgNum: 46325
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline

--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2013 at 03:48:17PM -0700, Khem Raj wrote:
> On Mon, Oct 28, 2013 at 1:53 PM, Jack Mitchell <ml@communistcode.co.uk> w=
rote:
> > As for the BPN-PV, I don't really understand, I just grepped for libjso=
n,
> > and changed all the occurrences... the separate build dir being one of =
them,
> > how would you expect the change to look?
>=20
> just in SRC_URI use BPN-PN instead of P

And in next step BP instead of BPN-PV :)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJvXzoACgkQN1Ujt2V2gBxXNACgsd5dihFaWx7MAoVuX/iYp2FH
p50AoJcSGXTv467vpPP66jGwTA1gJ0bu
=sDPY
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
