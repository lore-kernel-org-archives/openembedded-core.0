Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4000660069
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 17:10:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x75so6999515wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ma0EA8niuQapZl5YlqH/xGGfGbYR522vu3Z/bqktUaI=;
	b=mRjO+Zdjccef+xpZZ0ZWaAIB8l/KmDVLOzuINnwkZkziR2umHpu5qwIo52aWmw5CFk
	nxss6JGIlXYGIHsilYsqbSyYHhoGUwpTKz3rGQ71nHpCVB8iuXSl1DDJF95+G8BE3bCG
	8iPz8rYGvsVjj+XxnPbLf0UDwDeZbt2EHTScTRRUfQmiLeAad5+4s1zinpQLWG81MWfO
	adAD+akMvZ46IReXcKTn4m9cySww4BK+43xUT6RRdqvA73TtUjKqj98yRNGfdyEmLxpS
	0P4xPhDVt67DkmxNDlHVSakDP5imwWETgsm/HgUXRA8UrjE0bMEr5hHV78lG7ONIYHVF
	YO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ma0EA8niuQapZl5YlqH/xGGfGbYR522vu3Z/bqktUaI=;
	b=NvqKv0i0JHK39N+KBwcDCw2tQusxzqjAVSskVBew4D8IfYuiu1rMSn5z9rbCMPZ3df
	z9i9VPgwERO9s/cD8a9JQ+DctNMqe6T+Kui/OrZgB4BEV+ncHBaxupd0qxOICfbPkEw5
	ryQZ5LpMarRbIR5+PXtFcopShTYcqJUlWAr5ymE7f9xqynuzHNlGruESOVD7RGupwmC7
	zn6WvG9RuQihLHdgtMtbYDQUXfwqwbiAXpvCd75WOfHFQmDGvmYSAW9B5GNWO8ZGK8Jp
	5OFi5ObWLva57JDXFYEApzAwd80ZrupxHRAlS9flfaz0JsG5bq573CQt1LxLuvQZ2iYp
	vJXQ==
X-Gm-Message-State: AFeK/H1XMdzuZ87z/w4vEpqQCIFZpdYISQFmIwqYjR8M2+FbBtNiA2tY
	7FBe5PKORZROJg==
X-Received: by 10.28.74.18 with SMTP id x18mr9961044wma.64.1491325827957;
	Tue, 04 Apr 2017 10:10:27 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 92sm23111253wrh.8.2017.04.04.10.10.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 04 Apr 2017 10:10:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 4 Apr 2017 19:10:27 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170404171027.GC3316@jama>
References: <1d818d62-704e-61f4-1f0c-a3980a09b502@windriver.com>
	<20170404080203.6985-1-Martin.Jansa@gmail.com>
	<CAJTo0LbUrTDOrXU4VzPe=+iiZtFyasL7LhNtpb4YiX6eLTkTWQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbUrTDOrXU4VzPe=+iiZtFyasL7LhNtpb4YiX6eLTkTWQ@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x86-base.inc, qemuarm.conf: prefer 4.10 version of linux-yocto
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
X-List-Received-Date: Tue, 04 Apr 2017 17:10:27 -0000
X-Groupsio-MsgNum: 95767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Content-Disposition: inline

--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2017 at 10:48:54AM +0100, Burton, Ross wrote:
> On 4 April 2017 at 09:02, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > -PREFERRED_VERSION_linux-yocto ??=3D "4.8%"
> > +PREFERRED_VERSION_linux-yocto ??=3D "4.10%"
> >
>=20
> The qemuppc and qemumips machines don't have a preferred version, so shou=
ld
> we be setting it in all the machine configurations, or can we remove it
> from these recipes?

I don't really care, I don't use linux-yocto for anything useful, only
when testing the regressions in "bitbake world" builds and those 188
lines of NOTEs is all I care about.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOPTggAKCRA3VSO3ZXaA
HNQHAJ99iuHmggeN8gTnu588svkDNKEe2ACeLyzNCGcxAX/sFqcFAL4mqXyKznE=
=xD2/
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
