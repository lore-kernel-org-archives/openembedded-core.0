Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9066B6CC8C;
	Tue, 19 Nov 2013 18:24:33 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id d51so3467309eek.31
	for <multiple recipients>; Tue, 19 Nov 2013 10:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IKgX4eax9VgbxfM/BblpbkWeqTFUnJL/fBiAIk4ncts=;
	b=zu5O42K1oyo6xi7LAQXX+6XcsYsej2dJsZESKRf02gnbSNgBnoRsbAkBY1GVvpuw+J
	xX3txkcKBtZF1E7sXr5CEe0H3lcQxmZN5gz+1NWvz3swcBbHRRoQXAvyvbE2al/RsLi0
	sjWsxf8rd98aoEIYlgxsih4uxkZ2Es3RmeUapr8j/nyVvVM1nPXtypaSc/TvPPDzqUh9
	MgFKZUmwP/Vm1i3BJTEJRYX4lbwOt7k20mQLQdSO9IpDLcfdYyUe3EKCr2LwulSE7sU3
	yTr3PNtHhoKnAkLC45pKvlkjZczMWecfI3dX1RRXP6E5qzAa93wCQFfWzgswjGWEoDU/
	iSBQ==
X-Received: by 10.14.6.73 with SMTP id 49mr66252eem.117.1384885475095;
	Tue, 19 Nov 2013 10:24:35 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm51336080eem.15.2013.11.19.10.24.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 10:24:34 -0800 (PST)
Date: Tue, 19 Nov 2013 19:24:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131119182436.GG3708@jama>
References: <20130520130635.GA32431@jama> <20131030230825.GB32015@jama>
	<20131119155040.GD3708@jama> <4441466.Qb3TimoIEF@helios>
MIME-Version: 1.0
In-Reply-To: <4441466.Qb3TimoIEF@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 18:24:35 -0000
X-Groupsio-MsgNum: 47294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline

--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2013 at 04:30:09PM +0000, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Tuesday 19 November 2013 16:50:40 Martin Jansa wrote:
> > On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> > > Starting now I'll use
> > > http://openembedded.org/wiki/Bitbake_World_Status
> > > to post results from my bitbake world buils.
> >=20
> > It was updated few times since this e-mail and I've received no
> > feedback.
> >=20
> > Should I continue to post them or nobody except me is really interested?
>=20
> I'm interested in this; I haven't contributed much to the fixing though. =
I hope=20
> that most of the production of the reporting can be automated if it isn't=
=20
> already...?

Good, thanks for feedback. Generating report is automated since I've
started adding it to wiki, but still needs me to select "best" world
builds (where most issues weren't hidden by some greater temporary
problem) and update it on wiki + e-mail. I wonder if I should automate
that as well :).

> FWIW however I did just send a patch to fix the lowpan-tools do_install=
=20
> failure.

Great, thank you.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLrOQACgkQN1Ujt2V2gBwcigCghll5WiTGQMX5ERFGaZYgidCU
A/gAnRcK64nbNbSizD0Y+KaQhzgBM1/x
=odlX
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
