Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1QRdXY-00028G-A3; Wed, 01 Jun 2011 07:00:21 +0200
Received: by bwz5 with SMTP id 5so4873930bwz.6
	for <multiple recipients>; Tue, 31 May 2011 21:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=aKtZWAqgtkunAC+gRMdU40MY8HKIcrRpTgisHz0ZBV8=;
	b=tBVQlBgmDuDEVG9r52TfWWqLGgPD8OoQuGSSGdHdHox+7fY/7eStvCyKddCW7bCfUM
	ujItyajE6Tx4v6I3DOxFJiRL/umDS3XhykV9dfjVVpYnX0BEQ7cKZOQ1y3nlLLcst6Yz
	k6M10NhjfdYQGBBre8sj+wUHdMFDrqRvn6zyw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=n4avc54mqg3V7mu+adDQ+CBuSkyjShsGSBWCnaRNbmQD7lR8E+fiJuXh7fKW07WJk6
	ixtxgq4jbHZdm7Rh4gLVYPpjTlXjO57bTSSI0LnQ8O8fudjCzWIzG86POvitme/8nxLU
	ZLa6qec85qWSCf4d+u9dS8BdQ1vZ6kfI0XwqE=
Received: by 10.204.81.210 with SMTP id y18mr3377754bkk.175.1306904230068;
	Tue, 31 May 2011 21:57:10 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 5sm39036faz.2.2011.05.31.21.57.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 21:57:08 -0700 (PDT)
Date: Wed, 1 Jun 2011 06:57:07 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110601045707.GD23647@jama.jama.net>
References: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=mR7KKfXxiwiF1ZFA6epxx8hfaug@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: Parsing errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 05:00:22 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Content-Disposition: inline

--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2011 at 03:45:46PM -0700, Khem Raj wrote:
> Hi
>=20
> In slugos when I updated to today's snapshot of oe-core  and meta-oe
> its giving me this
>=20
> ERROR: Information not available for target 'all-linux'
>=20
>                                                   | ETA:  00:00:37
> ERROR: Error parsing
> /home/kraj/work/slugos/meta-openembedded/meta-oe/recipes-core/systemd/sys=
temd-compat-units.bb:
> Failure expanding variable SITEINFO_ENDIANESS, expression was
> ${@siteinfo_get_endianess(d)} which triggered exception TypeError:
> argument of type 'NoneType' is not iterable
> ERROR: Command execution failed: Exited with 1
> make: *** [slugos-image] Error 1
>=20
>=20
> I wonder if it has to do with allarch.bbclass

It's because meta-oe has own siteinfo
meta-openembedded/meta-oe/classes/siteinfo.bbclass

see contrib/jansa/allarch for needed patches I wasn't confident enough
to send pull request yet, but maybe I should..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--q9KOos5vDmpwPx9o--
