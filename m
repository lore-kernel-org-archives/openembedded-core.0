Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 934BF60E68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 01:31:24 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so809831eek.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 17:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=MuvWoXFlkLem17PEponGhchzz237AGzbcVAm7V5Yn5k=;
	b=VbY64MuPc8yV6dPkZO/5KdQOqylAHWTLAtISpiTMwLT/rSImbucNROJOXKKzcJLAAi
	VOeFmtjAEiT+GEu1tWCgrmY8d1sgesMMsQAUUObxaLgNQo4YpKYVwxO2ShfBUrBtjZu3
	kyE3FEPd9ikwmbnF9gDOi/Zmox3YxLH/KqraG/uOiQwtG6hPsHyqphmM6zQNFkIeV47R
	c9ZEngsI6/c2T61rrmODXVibbixe9++clQQgZll3hYS1K8AVjwof/QqIctR9uCZw6x2T
	FzngXfcYvoo1NYfCLDwWCwRBOG6m/KpHX/4NUmhxwP2uuR++1cpg9s4EVRWBbtTb2DGO
	Fa+A==
X-Received: by 10.15.44.202 with SMTP id z50mr6173848eev.81.1394069485267;
	Wed, 05 Mar 2014 17:31:25 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	46sm15674774ees.4.2014.03.05.17.31.23 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Mar 2014 17:31:24 -0800 (PST)
Date: Thu, 6 Mar 2014 02:31:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreea Proca <andreea.b.proca@intel.com>
Message-ID: <20140306013131.GE26981@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: error-report-web django-nvd3 version
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
X-List-Received-Date: Thu, 06 Mar 2014 01:31:28 -0000
X-Groupsio-MsgNum: 50916
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uY6A4WM8GrQcEArj"
Content-Disposition: inline

--uY6A4WM8GrQcEArj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

can you be more specific about django-nvd3 version required by
error-report-web?
http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/tree/README

with 0.6.* it was complaining about missing kw_args param in load_chart
calls, older versions were complaining about other changes.

I'm testing it (currently without graphs) in order to extend it to collect =
some build metrics and
statistics from our builds (like every jenkins build and very local
developer build will upload back description of HW, build times and
other metrics so we can better evaluate icecc, sstate reuse ratio etc).

If something like that would be useful for upstream I can eventually
contribute it back.

I've also updated the .bbclass to read all "configuration" from bb data
and to upload the report after every build (sort of like tinderbox,
oestats bbclass worked), that way is easier for us to globally enable it
for all builds in our distro config without any interaction from
developers.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uY6A4WM8GrQcEArj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMXz/MACgkQN1Ujt2V2gBzX7gCeOJ1Rs9KhY/wdjsiXXfDESBn5
XhsAoIWO++HyNpT5x0QFEvbzSJgkgVZr
=TFrI
-----END PGP SIGNATURE-----

--uY6A4WM8GrQcEArj--
