Received: from mail-pd0-f178.google.com ([209.85.192.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UVKWp-0005Vl-KT
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 13:40:05 +0200
Received: by mail-pd0-f178.google.com with SMTP id w10so1214422pde.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sA7K2P36IqzmEguVY4gsASwaQk1ag9fT9YyzNBzmFVY=;
	b=aHJPHRun2HxEEw6EjzGW/qb9/rC3w8vHxvbdYHM3LANFXA+yD65WNE23WLORefSyEV
	XtWh55wM7FxdiEe64kZsob6nbW4c4VqzgQnC96oacZYGOZJdW2gZ+d2OIqLkRvBvXZ57
	J5ZM3+mos9Sr2B3j/kyVSRuTMaLtEkWHojZZwSHKZ1EzyLBaHENfD5NVzQab91OTfiEJ
	D9QE8hOFpbI6MvS5d5YxgvlsLUOPKibioiBnUTtJAsPBdCK8zVBCLl/DnhaM8GFSrKSo
	Lis2LRZQ7fu/nUo8erAbIU42YnsACo9ozsty1/1PB5f3gXVu890jqFjCcEN2DkKWl1mz
	LbLg==
X-Received: by 10.66.233.66 with SMTP id tu2mr24287326pac.12.1366888931771;
	Thu, 25 Apr 2013 04:22:11 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id 10sm92190pbr.45.2013.04.25.04.22.09
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 04:22:10 -0700 (PDT)
Date: Thu, 25 Apr 2013 13:22:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Lewis, Nick" <nick.lewis@usa.g4s.com>
Message-ID: <20130425112221.GG5538@jama.dyndns-home.com>
References: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540D2@GBTWK10E001.Technology.local>
MIME-Version: 1.0
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540D2@GBTWK10E001.Technology.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Host distribution warning with Ubuntu LTS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 11:40:08 -0000
X-Groupsio-MsgNum: 38385
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cp3Cp8fzgozWLBWL"
Content-Disposition: inline

--Cp3Cp8fzgozWLBWL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2013 at 12:13:11PM +0100, Lewis, Nick wrote:
> Bitbake issues a warning when used on the current Pangolin LTS:
> WARNING: Host distribution "Ubuntu 12.04.2 LTS" has not been validated
> Is this an oversight or has the distro not been sanity tested yet?

Is it with danny?

dylan release has all Ubuntu-12.04* marked as sane.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Cp3Cp8fzgozWLBWL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF5Ee0ACgkQN1Ujt2V2gBzxoQCfR5SFAqyWnqq6hJP8aZoJxVif
UEAAn0fGccbFRybjbMYFXd4YCEzkb+mb
=lM70
-----END PGP SIGNATURE-----

--Cp3Cp8fzgozWLBWL--
