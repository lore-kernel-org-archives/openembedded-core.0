Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 82D0D6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:49:03 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id u206so19830572wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vBXtK1vTojeFb5w4lKyLymXTKmm/PehqynbSYgdUA4Q=;
	b=ckVEmbiAfX8vuqe8ZDB1rcE7Up2xRkMvASNlkvf9j1SzXzuL/ucVAZWgYBKmAp4XNm
	WLb8HuxFeBQqTk0GO+dBq76fEUYYtaz+uTFTI9tibM+7Jg+M/yaR/+kY0KIPAlUbbZUk
	MEj66QK4zc9GK1NqoVBIBDZl4E6/bU4bCYXitmSTJFmDRzSTXfhMs28EIin2RkUCwByG
	VZekXlqnNIbLzXzFuZzyyXbCbJyClPkY67w364DZPz0IuOxszp1lCboTW4aXK6eE6sao
	7zfZKuh14R96ueZzbMW5IFJU6E/cqmyI41v5/MXX0S2xQc8EPcwu9KEVEUlybQureKld
	q1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vBXtK1vTojeFb5w4lKyLymXTKmm/PehqynbSYgdUA4Q=;
	b=bsuZYOjXdnxtZwJEbxC5kViDRA7e2V70kO9QdEtjcatchR1uwn0CBbzhM2q0viftBE
	o1tkXvDNqLBuDNiHWXWMHteFVkjGJnPK9ID4uaaZ9dNpa/04WdUzxq8YQVVMspOTLm0X
	G6jT4n+xZhVvcPTCDog+R9S2/ZmZ5Xg3lhLZd95Y2ieE2S0TM80AGZwpyW6mBYRNwVTO
	aXviixRFRJSHRd5z6147p7oXTMtq0Um7gFCx0/doFfhVDO9/fRhAhmL9z7nu1EfLfQnQ
	xO+/Kp45O1CTcGBMtUu4cZq+/qNPeZTUwE8s2RlQp5NJ19k2DbYkhdWH4UQOgQa6iIEW
	wnsQ==
X-Gm-Message-State: AOPr4FXyZk/VYV5EHOYI1tsGhLP6F7d1hx8DBWwtD91SP93W1DMEuTW8bceQDx7CikrinA==
X-Received: by 10.28.226.213 with SMTP id z204mr1951889wmg.99.1461059343083;
	Tue, 19 Apr 2016 02:49:03 -0700 (PDT)
Received: from localhost ([86.49.34.37]) by smtp.gmail.com with ESMTPSA id
	dd10sm68700414wjb.38.2016.04.19.02.49.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 02:49:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 19 Apr 2016 11:50:52 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160419095052.GB2562@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
	<20160325105025.GC2555@jama>
	<1458905339.3073.53.camel@linuxfoundation.org>
	<20160325115503.GE2555@jama>
	<CAP9ODKpZc=zKfUHtbJOJt5sTdXDkrEOMdKOZXBkxPUJCwmxFyg@mail.gmail.com>
	<1461019553.9308.223.camel@linuxfoundation.org>
	<CAP9ODKoNFy_=_q4mCDnr7hCbtKccmjAfwK=4Syrn8pd9UyJs4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoNFy_=_q4mCDnr7hCbtKccmjAfwK=4Syrn8pd9UyJs4w@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Tue, 19 Apr 2016 09:49:05 -0000
X-Groupsio-MsgNum: 81001
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 07:49:51PM -0300, Otavio Salvador wrote:
> On Mon, Apr 18, 2016 at 7:45 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2016-04-18 at 19:31 -0300, Otavio Salvador wrote:
> >> On Fri, Mar 25, 2016 at 8:55 AM, Martin Jansa <martin.jansa@gmail.com
> >> > wrote:
> >> > Was there some agreement about variable name?
> >>
> >> meta-qt5 5.6 is using this so we need a final decision if it will be
> >> merged or not. I am in favor it as I think it is clear enough.
> >
> > It was an RFC and I still don't get a good feeling about the names
> > used.
> >
> > I suggested:
> >
> > PACKAGECONFIG_CONFPARAMS
> > or
> > PACKAGECONFIG_CONFARGS
>=20
> I like CONFARGS.

I'll send patch with PACKAGECONFIG_CONFARGS and wait until it's merged
somewhere, before updating usages of this in other layers (so that I
don't need to redo it again if the name is changed again).

> > as it then makes things slightly clearer these things are coming from
> > PACKAGECONFIG. We have a namespace which is a bit of a mess and I'd
> > prefer to try and improve with new things if we can...
> >
> > The fact meta-qt5 is already using this is bad, it really shouldn't be.
> > We're also very close to the final build of 2.1 right now so this would
> > be a very late change :/.

meta-qt5/master isn't using it, it's only in master-next, because
without this change the builds are broken when people use
openembedded-core/meta/conf/distro/include/no-static-libs.inc
e.g. with default Poky config.

> I think it is a safe change but I am fine in postponing it for 2.2. In
> this case we need to revert the usage of it in meta-qt5 (which I also
> support).

Nothing needs to be reverted, because it wasn't merged in any permanent
layer.

If it doesn't go to 2.1 then I'll leave meta-qt5/krogoth version broken
for Poky builds with no-static-libs.inc.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcV/3sACgkQN1Ujt2V2gByz8gCeP+kLrWl8J4lyyo6mga7U5NwA
sfAAn1cBuD/VLk2cRN6rUexl4tINiFWe
=/aKX
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
