Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QK2YH-0007J0-Hu
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 08:05:41 +0200
Received: by fxm19 with SMTP id 19so133202fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 23:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=QxTekesbXS4P5HuDX1OOHEYTyqwuDfoFce/zzr9W2Q4=;
	b=MqqLI767BdUeXDmQ592xgUmFuE+oVI6HtqZOAokYzs495aU43eXrUSkuFNSloI50ap
	06lbw+j4Vj3AlYf40+VgwsIof7A2TS6L8FZDjnBKQlDp8F3OUpSZI4LGrHQp6x18v14H
	EJM9XGwhsRuXjgdQdT2a9u6eHLOiJ/g78SDrI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Z7D7C1GWUZfXbU9XrTnbhzgk9cE1Mje0GS0ZoNl56vQJxvSrfzcGGBN4Lius3aLb9q
	VNisnOu91LW0Hzhyy/PdIsiQCt/5ZtmlEbXlenKPRMhwn0bdufo3R8tN/hoB1DLD7+uY
	vMkoQmBZ2zcK0bNlM5mJAgnN7+4K1rXqIyX0k=
Received: by 10.223.2.205 with SMTP id 13mr954994fak.138.1305093775528;
	Tue, 10 May 2011 23:02:55 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id p16sm2614914fax.21.2011.05.10.23.02.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 23:02:53 -0700 (PDT)
Date: Wed, 11 May 2011 08:02:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110511060247.GC5171@jama.jama.net>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
	<BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
	<4DC9C3B2.3050201@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4DC9C3B2.3050201@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] create-pull-request: Add -l location switch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 May 2011 06:05:41 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Content-Disposition: inline

--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 04:01:06PM -0700, Tom Rini wrote:
> On 05/10/2011 12:18 PM, Otavio Salvador wrote:
> > On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
> >> Add a -l switch that takes an argument of either github or gitorious
> >> and will make the cover letter have a fill-in-the-blank of where the
> >> changes are on either github or gitorious.
> >=20
> > Another possibility would be to use git config interface to store
> > those. You might have something like:
> >=20
> > [oe-core-pull-request]
> > mode =3D github
> > user =3D foo
> >=20
> > or
> >=20
> > [oe-core-pull-request]
> > mode =3D gitorious
> > user =3D bar
> >=20
> > This could be used to fill the fields in a proper way since those are
> > predictable.
>=20
> If I had a good bit more time, I might re-write the script in python and
> parse .ini files (same syntax as gitconfig) so that lots of useful
> defaults could be saved.  But here's the real test, given that you're an
> intended user, would you use the -l switch or just make a local change
> to the script like Martin showed?

I would still use local copy of script just because in this case it has
selective name and I can find it already with right params in bash history.
To have the same comfort with -l switch you would have to provide bash
completition config :).

And yes -l switch is good thing, I can replace my copies with simple
alias now..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3siQDZowHQqNOShm--
