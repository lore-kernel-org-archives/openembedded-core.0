Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDdOy-00038K-Mm
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 17:10:42 +0100
Received: by mail-pa0-f47.google.com with SMTP id bj3so557267pad.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=rRZfSPDfFRo+xe2yvfZqrVyjlmiYZ/ck7TXCSUM1zq0=;
	b=c88ihRYb4ceHpHNGj/ZzLgFONJblt8JycAfhgtoio0e1KZ4tZIYM9rKSVXO1mojrSC
	DtW40qkxd3SUUuDBRdugD78nq46cgH5GAgkKPrbhBNbt2F/y6lXsY4O85ZVTM2+4dPjq
	uR5y2kvlw2nmAKL5jPVK78kTtymQ0IWkh/+doWClfMwMlKEKunopdBWCmKjmbafC9LXE
	u8UInwbdY8erOxdv3ydB3ysp2OlDfNs1t9FDccHMX1sAnMWTq+BgXygbrB5vAQPplCd2
	/XPTTIF5au1ukih4F02yMc8p0Y34QF+dravSbxrH04nppOXnEkXx+mSJOJScHSLQHMPI
	Go/Q==
X-Received: by 10.68.196.129 with SMTP id im1mr54194958pbc.206.1362671647619; 
	Thu, 07 Mar 2013 07:54:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id iv3sm2083984pbc.40.2013.03.07.07.54.04
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:54:06 -0800 (PST)
Date: Thu, 7 Mar 2013 16:54:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Olivier Guiter <olivier.guiter@linux.intel.com>
Message-ID: <20130307155401.GP32228@jama.dyndns-home.com>
References: <1362669728-4132-1-git-send-email-olivier.guiter@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1362669728-4132-1-git-send-email-olivier.guiter@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nfc: Update neard commit sha1 and start path.
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
X-List-Received-Date: Thu, 07 Mar 2013 16:10:52 -0000
X-Groupsio-MsgNum: 36307
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dJyWBSYfjLochwFK"
Content-Disposition: inline

--dJyWBSYfjLochwFK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Mar 07, 2013 at 04:22:08PM +0100, Olivier Guiter wrote:
> ---
>  meta/recipes-connectivity/neard/neard/neard  |    2 +-
>  meta/recipes-connectivity/neard/neard_0.9.bb |    8 +++++---
>  2 files changed, 6 insertions(+), 4 deletions(-)

subject should start with neard: not nfc:
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dJyWBSYfjLochwFK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE4uBkACgkQN1Ujt2V2gBxlNwCfU3+uwKGlvlMYoPkRuK7Dr6XK
lK8AoK6FnswIUBgw3bTWVqnhRpUJ199L
=J4Z4
-----END PGP SIGNATURE-----

--dJyWBSYfjLochwFK--
