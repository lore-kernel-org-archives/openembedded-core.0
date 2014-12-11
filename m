Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 34FFB6017E;
	Thu, 11 Dec 2014 12:44:55 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so1331283wiv.0;
	Thu, 11 Dec 2014 04:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9hEs2z7Yk0IKSDu0N3Y7ZxCIJt+wkJniyG1XnA+ilfA=;
	b=e2sk3XeYE4yTqLjI9VKTMba/l8F2Nrolqk2/fr73bh+XlhbNJaTFpNaJwC+fC4ROAp
	Sj7ve/hjxSZzSTfKfW8+hcZ4dW+O6v76y3ljMp4vrKrWWbaCXyblGClauVzGvsNV4iTA
	JouDAH4sVKmTzSveI+nAnHKyIDKCnC2uFHHqDigyZD1Ut7ud7Geyg+vJuAX2WXK2A91E
	WPZyiGYkuS3XdVLy45Lp8OmUAzgZsYwNAzLETAZ/quZAIs8i9rvKVpzplzyDs/I8J+iT
	UkQSywEpwm/cLkivImM9QS+qn9jmf+LSZ5YfLI6wZusJaorafi3fmuL/0OgYYuX0dqOC
	flHQ==
X-Received: by 10.180.101.98 with SMTP id ff2mr2536947wib.83.1418301895704;
	Thu, 11 Dec 2014 04:44:55 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ej10sm1986885wib.1.2014.12.11.04.44.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Dec 2014 04:44:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 11 Dec 2014 13:44:59 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141211124459.GC2467@jama>
References: <20141211092332.GA2467@jama>
	<CAJTo0LYwYW40XvxNN=rY4z6fK+4NJ2ZFxa2xsUvuspERa_MT+A@mail.gmail.com>
	<20141211121417.GB2467@jama>
	<CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYEvdspWOu=_LQTtD6xZTFZvHTyZpwQOEXbtpbSnPE-5Q@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, test-dependencies 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 12:44:57 -0000
X-Groupsio-MsgNum: 60442
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline

--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 11, 2014 at 12:31:45PM +0000, Burton, Ross wrote:
> On 11 December 2014 at 12:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > > > WARN: gst-plugins-bad: gst-plugins-bad-meta rdepends on
> > > > gst-plugins-bad-rtmp, but it isn't a build dependency?
> > > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp package isn't created =
when
> > > > building with minimal dependencies?
> > > > ERROR: gst-plugins-bad: gst-plugins-bad-rtmp-dev package isn't crea=
ted
> > > > when building with minimal dependencies?
> > > >
> > >
> > > Coincidently last night my world run gave me warnings that
> > > gst-plugins-bad-rtmp was depending on rtmpdump without a build depend=
s,
> > so
> > > I've copied the PACKAGECONFIG[rtmp] from gstreamer1.0-plugins-bad to
> > > gst-plugins-bad.  Presumably this will fix these errors, although that
> > > warning seems odd.
> >
> > Why odd? It just means that gst-plugins-bad-rtmp* packages aren't
> > created at all when rtmp isn't autodetected.
>=20
>=20
> But gst-plugins-bad-meta won't depend on -rtmp when rtmp isn't detected as
> the splitting is dynamically done.

gst-plugins-bad-meta depends on gst-plugins-bad-rtmp when built after
world (rtmp is detected) and doesn't depend on gst-plugins-bad-rtmp when
built in minimal TMPDIR.

test-dependencies.sh is showing this warning when the dependencies
between "maximal" and "minimal" builds aren't equal.

I still don't get what's wrong with that warning.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSJkcsACgkQN1Ujt2V2gBxo0wCfcWZSWU13PBu/OVU/0BmFrr+2
704AoKRjrUPLI/u2m+o7KAYM1s/1TJlg
=S6yq
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
