Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3F69D6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:52:21 +0000 (UTC)
Received: by wmww144 with SMTP id w144so139054072wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 13:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0JNMdsIFZ/OGBdBTHqwrQx/E9tp3MsD84JEOMD2Bqrs=;
	b=t2hlwCDXvrEBJHPVpLp7v0vwqT0Tf6BMUt7Tdcg8cPXaaoCmwoc4GOg2egJhTT/oF+
	3mdmSzHmZlof3cErKlPcl/eLRrffPv0Ffy4ks59wd0EBWCUhACs5mpHC8lkkNZUCqwpp
	5yJvuoZws6mCB5ykRtizRccfoDXmSR63LQ+O7ElwIUl7V4P+nDl94HyCVRbi9/q3QLpR
	UBBwhKXQvCULuoDshRmkQUnlQpzhtfZFekqvEL0TBmzlyVSZiXgjJc5E6jgG/cuaLSOM
	Nx1FGJ368rdZDzC9jDwhQaxCodw1OS6CHUhIOwp/EuHUWAajR39lQ/JrA83WvyhL+Xc3
	D2kQ==
X-Received: by 10.28.7.138 with SMTP id 132mr7576918wmh.100.1447710741683;
	Mon, 16 Nov 2015 13:52:21 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q1sm36531653wjy.31.2015.11.16.13.52.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Nov 2015 13:52:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Nov 2015 21:52:35 +0100
To: Michael Halstead <michael@yoctoproject.org>
Message-ID: <20151116205235.GB2240@jama>
References: <56451D46.50707@gmail.com> <20151113115958.GD2567@jama>
	<056F5AC5-DD52-4BF7-B88D-4312C40DFA2A@gmail.com>
	<564658A0.60609@yoctoproject.org>
	<DC4D8315-D63D-495C-B3AF-2932584B319C@gmail.com>
	<564659EF.8070606@yoctoproject.org>
	<447B01D9-C528-4B24-9B45-812CA1C6685D@gmail.com>
	<56465E1B.8040900@yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <56465E1B.8040900@yoctoproject.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: oecommit ml
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
X-List-Received-Date: Mon, 16 Nov 2015 21:52:24 -0000
X-Groupsio-MsgNum: 73513
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline

--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 02:03:07PM -0800, Michael Halstead wrote:
>=20
> On 11/13/2015 01:50 PM, Khem Raj wrote:
> >> On Nov 13, 2015, at 1:45 PM, Michael Halstead <michael@yoctoproject.or=
g> wrote:
> >>
> >> Bitbake is disabled with the note:
> >>
> >> # interferes with patchwork sice it sends emails after the patches are
> >> closed
> >> # we could re-enable it if the mails went to someother ml may be
> >> bitbake-commits
> >>
> >> This happens because it was mailing bitbake-devel@lists.openembedded.o=
rg
> >>
> >> We can mail openembedded-commits@lists.openembedded.org which would wo=
rk
> >> fine. Or I can create a bitbake-commits@lists.openembedded.org. Which =
is
> >> better?
> > I think mailing to openembedded-commits@lists.openembedded.org might be=
 ok. with [bitbake] in message subject for filtering help.
>=20
> I've altered the script to include [reponame] in the subject of all
> e-mails and enabled for bitbake.

Seems to be causing some new warnings when pushing to the repo:

OE @ ~/meta-openembedded $ git push origin master
Counting objects: 204, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (193/193), done.
Writing objects: 100% (204/204), 38.00 KiB | 0 bytes/s, done.
Total 204 (delta 147), reused 0 (delta 0)
remote: Scalar found where operator expected at /home/git/git-notify line 1=
40, near "$subject"
remote:         (Missing semicolon on previous line?)
remote: Global symbol "@openembedded" requires explicit package name at /ho=
me/git/git-notify line 60.
remote: syntax error at /home/git/git-notify line 140, near "$subject "
remote: Execution of /home/git/git-notify aborted due to compilation errors.
remote: E: failed to find patch for rev 7df2b574f1c4ad445b1656666878cb2ceff=
ca2e0.
remote: E: failed to find patch for rev ea5bc66444a1e9b5fb330d8a6d42dc95e4b=
c9500.
remote: E: failed to find patch for rev 1ec69e6b3891c01734e57a908a2a675128f=
126eb.
remote: E: failed to find patch for rev a1d3dce036f80867d30993742d55abb17c6=
bc057.
=2E..

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZKQhIACgkQN1Ujt2V2gBy6rgCePFUu79OD1Q5tnbsg1kH0gUpc
pn0An0pTFnHFH4/KY36td93IwEdfKU1M
=nfNu
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
