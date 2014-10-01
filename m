Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E3AA66FD28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 15:33:20 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so766439wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Oct 2014 08:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1MuJqW10MzC/oAshrcanh4XZAZN9TEC6uUWsltDBPcQ=;
	b=woqzLFTQxYuXqlZb4BldMd6u9z/7JBDojnfsyZ5kz/eK21mSw9Hg2uO1xNTnT9clqL
	JV0lXXnDqHeJZYH84O8oNNwtje+WSQBvN0WZ9u9F6YRTmQTz2egvyMQZuTNFGBtX1L47
	alWKHvO+emCSQPE6mqaTpN/QjSWbNMGD4e4885xLTf4fYOGY0096xVx7Spq/CaKj+hYs
	gRDKQS57rywYlJXefkY1zuvHgsXA+JUjK4aHu5vma78SJGjenQNhQyqVVtRhBbVOLD0z
	IQdIPeVOWpifuIrWvlpgX+5Rkx3DctpGcY/oTDkL7Ky9jlgZ5/JB82mG4/MCJqDn+hD5
	GE/A==
X-Received: by 10.180.221.107 with SMTP id qd11mr15175300wic.61.1412177601365; 
	Wed, 01 Oct 2014 08:33:21 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	pn5sm1567402wjc.4.2014.10.01.08.33.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Oct 2014 08:33:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Oct 2014 17:34:15 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20141001153415.GF25706@jama>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
	<20141001041020.GC25706@jama> <1412151136.17658.10.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1412151136.17658.10.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 15:33:25 -0000
X-Groupsio-MsgNum: 58292
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="A9k63Mnmpo23fVdx"
Content-Disposition: inline

--A9k63Mnmpo23fVdx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2014 at 09:12:16AM +0100, Richard Purdie wrote:
> On Wed, 2014-10-01 at 06:10 +0200, Martin Jansa wrote:
> > On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
> > > On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> =
wrote:
> > > > On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
> > > >> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.or=
g> wrote:
> > > >> > This line above ^^^^ has a very long trail of whitespaces and it=
 got commited
> > > >> > that way, unfortunately :(
> > > >>
> > > >> Better was if you commented before it went in.
> > > >
> > > > And how would you suggest I was supposed to see it?? Nobody saw it.=
 My email
> > > > client is no different than others - it doesn't mark trailing white=
spaces. The
> > > > reason I saw it is because I ran "git log -p" on the file and that =
explicitly
> > > > highlights trailing whitespaces in BRIGHT RED... :)
> > >=20
> > > just for that may be we should start using gerrit ;)
> >=20
> > I'm all for it, it would make my e-mail - review - patchwork -
> > master-next workflow a lot easier and reliable.
>=20
> And I am not. Why? I've actually tried using the thing and I absolutely
> *despise* its interface. This isn't just a mild dislike, I simply cannot
> do the things I want/need to do with it.
>=20
> I believe I should have some kind of a say in this since it will
> directly affect my workflow and general life (since I spend a lot of my
> time dealing with this).

> Its appears to be very easy for other people to tell me how I should work=
 though :(.

Please calm down, we just said that we like it, we're not forcing it on
anyone and I don't think khem would start installing it on OE servers
without much longer and broader discussion between all people who should
have some kind of say in this..

FWIW: I despised the UI at first as well, then I got used to it (after a mo=
nth
or so), now I really like it especially with the "New screen" UI
introduced IIRC in 2.8 version. Only annoying part for me is more
complicated permissions model (which I luckily don't need to
change so often) and missing option to use "simple" server side hooks.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--A9k63Mnmpo23fVdx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQsHvcACgkQN1Ujt2V2gBxVXwCcDp3CJ/jSlGq9JdLo3g166+dw
fjUAni85X8A9q9vmUYjJJgtuGY8Olsei
=S2GN
-----END PGP SIGNATURE-----

--A9k63Mnmpo23fVdx--
