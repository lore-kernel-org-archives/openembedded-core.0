Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 93C296F588
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 13:46:00 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id r15so1700573ead.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 05:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VzEr4TVZ5cfZfDbfShhQif5ik1vEhhSgZiEdNW3+ybQ=;
	b=Nw6SJ6RZ3QdibI4f7ODZ5+wGU0+jC0ky5QdYj3sTv0BIFO4VmJnxF7JCeAcOBRD+n+
	vCEot7btUXwKCZulDkGB+v6UY8h6t5ctKlXHntlzNHZjPLe6I/YuHeDn6usycTue58eP
	9018wB3Dho7+7wLObztnrF3zH3x/OUX5EYjD8ADjakUpI6H3LF3IqXG4HJh4H7EhVqSR
	fIi8L1x5Mh5k0m3PK/W1TNDjOQjCuPrNlWdABnL9eNKsBXG8Gxbl143azYt+F4FkMJ1l
	lGlroBWXHL+NU2UfL3eXHN2VooYXxHjgUfeXT30DFiEUGZf0qzjFGuMJ+ErvQ0CyyxZo
	5EEA==
X-Received: by 10.14.29.6 with SMTP id h6mr9804717eea.84.1394113561007;
	Thu, 06 Mar 2014 05:46:01 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m9sm21964257eeh.3.2014.03.06.05.45.59 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Mar 2014 05:45:59 -0800 (PST)
Date: Thu, 6 Mar 2014 14:46:07 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Proca, Andreea B" <andreea.b.proca@intel.com>
Message-ID: <20140306134607.GG26981@jama>
References: <20140306013131.GE26981@jama>
	<C76456D50C459F418509335BC413076F169032A3@IRSMSX106.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <C76456D50C459F418509335BC413076F169032A3@IRSMSX106.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: error-report-web django-nvd3 version
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
X-List-Received-Date: Thu, 06 Mar 2014 13:46:03 -0000
X-Groupsio-MsgNum: 50935
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QoiSMj+lAls+FAFy"
Content-Disposition: inline

--QoiSMj+lAls+FAFy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2014 at 11:44:54AM +0000, Proca, Andreea B wrote:
> Hi Martin,
>=20
> I should have been more specific about the versions, sorry.=20
> I've updated the README, it needs django-nvd3 0.1.11 and python-nvd3 0.6.=
0.
>=20
> I usually install those on my Ubuntu host using pip.=20

Thank you, I didn't go that far into django-nvd3 history to try 0.1.11
version :).

I've small fix to make it compatible with 0.6.0, but I'll first try it
with 0.1.11 to see if it's supposed to look like this.

Thank you very much for this project it came in right time for me :).

> -----Original Message-----
> From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
> Sent: Thursday, March 06, 2014 3:32 AM
> To: Proca, Andreea B
> Cc: openembedded-core@lists.openembedded.org
> Subject: error-report-web django-nvd3 version
>=20
> Hi,
>=20
> can you be more specific about django-nvd3 version required by error-repo=
rt-web?
> http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/tree/README
>=20
> with 0.6.* it was complaining about missing kw_args param in load_chart c=
alls, older versions were complaining about other changes.
>=20
> I'm testing it (currently without graphs) in order to extend it to collec=
t some build metrics and statistics from our builds (like every jenkins bui=
ld and very local developer build will upload back description of HW, build=
 times and other metrics so we can better evaluate icecc, sstate reuse rati=
o etc).
>=20
> If something like that would be useful for upstream I can eventually cont=
ribute it back.
>=20
> I've also updated the .bbclass to read all "configuration" from bb data a=
nd to upload the report after every build (sort of like tinderbox, oestats =
bbclass worked), that way is easier for us to globally enable it for all bu=
ilds in our distro config without any interaction from developers.
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QoiSMj+lAls+FAFy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMYfB8ACgkQN1Ujt2V2gBxDKwCgtMfUNl+dP9k8EK36SfdIzNYG
C9MAnjwvrioIC7bhSBf2k9cuusagNLZL
=v4aC
-----END PGP SIGNATURE-----

--QoiSMj+lAls+FAFy--
