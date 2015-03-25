Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 83D83723B3;
	Wed, 25 Mar 2015 16:11:54 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so32912997wgb.0;
	Wed, 25 Mar 2015 09:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wOEuXSx+uHPhgh/LoXaI62IA7x+DYsDCIFqwxD+6Tto=;
	b=AMVNdphhnGJdvXw2HL5yfseU6SKQwALIlVaO2K6M1IUfoRW4tmnyzGlqgErmhkRfSD
	oxKEw5CSdd6t3RyvyNDqg318IX3ZfEUbiQDCEFr4vvOtVhC6OL95pKWuFSH78RDxWba4
	koAbV/zvVMWhUc265KUCHVlcuHyGCYLJtGxrLR0wH19LTI0OYWOl6tlsxz7XYIMr/emz
	f7sAraTUm7NYtn5ve9WxWv/uOrDa4QxxN2rZrDyMxz9LhiDAV4eKm+fGGSfBEmtgUJOm
	LXlsin5O0ncWSIJhTk4Fk7+itzqHHTEX3NTnkCEb/vycYrMYvU54rQF8chvLWJw2l0g9
	Uhtg==
X-Received: by 10.180.9.47 with SMTP id w15mr36517954wia.13.1427299915410;
	Wed, 25 Mar 2015 09:11:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id fo8sm54520wib.14.2015.03.25.09.11.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 09:11:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Mar 2015 17:12:08 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150325161208.GK3904@jama>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Wed, 25 Mar 2015 16:11:56 -0000
X-Groupsio-MsgNum: 63703
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Content-Disposition: inline

--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 12:11:05PM +0000, Burton, Ross wrote:
> On 23 March 2015 at 22:21, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > In my case it's reproducible by adding udev-ptest to image, more
> > specifically
> > having these 2 directories in rootfs:
> > usr/lib/udev/ptest/test/sys/devices
> > usr/lib/udev/ptest/test/sys/bus
> >
>=20
> oe-core 3f799b should mean that those directories are in a tarball instead
> of unpacked on the rootfs.  Do you have that commit?

Oh, thanks for pointer. I was seeing the same issue in dizzy and master
build, but this change can explain why I wasn't able to reproduce it in
master yesterday.

> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUS3lgACgkQN1Ujt2V2gBwXuwCfTW+AG7uWUUYL8wnTAyaabFjM
zeUAnR58BzH4cHiudf3+RBodk1DhD4Cv
=t6t3
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
