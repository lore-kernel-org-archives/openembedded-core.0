Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3099C6FA29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 15:35:25 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so1809675eek.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QoOB5dvDt2hlYOZ1xe+3pOr+z6KTnUxUUrxZssrJMhE=;
	b=0Q1f1Xw1PkU/gTIronoEzPaH7iNxcHGwYA6nbQHfwaAP+uc3TCx45Kdv0RIK/NIj4t
	rPa1VSfAV47pvw/wkLKez9MPZlAJULZqGRzVxTs5SdLZplde17rFWyJl4oejpD7yoPcW
	HR4pCiqrYKU8RC8YQd0J2DaZLYsbudrd8nX3Ea9escJo/xGC4JcWRBYn2HuobJLtBlNY
	xCgkhaULr9DTufAZd1YfZ9Z0m83ZBKxTz64hZB5VvKBseGLIkMJeojw4B4/Za9dPRMWD
	pb8hRdBWMfPpaOLTvIzXplQ9IkXBnjyh5K+b+YnSHVNm4wWBtcRGZO+RPzDo+y0p5KtW
	WQZA==
X-Received: by 10.14.198.197 with SMTP id v45mr76376877een.9.1395848126071;
	Wed, 26 Mar 2014 08:35:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm47829687eeg.11.2014.03.26.08.35.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 08:35:24 -0700 (PDT)
Date: Wed, 26 Mar 2014 16:35:24 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140326153524.GC3709@jama>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<20140326145102.GB3709@jama>
	<CAP9ODKqkyfGzQROW=QZig2zvh-KrcyRFeKn9FtPndPUXWNDTUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqkyfGzQROW=QZig2zvh-KrcyRFeKn9FtPndPUXWNDTUw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/11] Change all bluez4 references to virtual/bluez
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
X-List-Received-Date: Wed, 26 Mar 2014 15:35:26 -0000
X-Groupsio-MsgNum: 51658
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2014 at 12:07:13PM -0300, Otavio Salvador wrote:
> Hello Martin,
>=20
> On Wed, Mar 26, 2014 at 11:51 AM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Wed, Mar 26, 2014 at 09:27:54AM -0500, Lauren Post wrote:
> >> This group of patches support the change of hardcoded bluez4 to
> >> virtual/bluez so that the upgrade to bluez5 is easier.
> >>
> >> This group of patches must be applied together.  Bluez4 is still
> >> default provider but it will be easier to override and provide bluez5
> >> support in future.
> >>
> >> Note there is one related patch for openobex in meta-oe.
> >
> > virtual/* still doesn't work correctly in runtime variables, use
> > VIRTUAL-RUNTIME_bluez variable.
> ...
>=20
> Those patches are for /depends/. Did I miss any runtime dependency here?

yes, in 11/11 4/11 2/11 and 1/11

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMy87wACgkQN1Ujt2V2gBxHdACgpU/iiHJfeOhCmwm3h4csO9Tv
1mEAn2KzazXVVvSJW+rRa40fKF143cGt
=bvpl
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
