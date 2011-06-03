Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QSNf1-000167-Tp
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 08:15:08 +0200
Received: by bwz5 with SMTP id 5so1804192bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 23:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LR4wbWTE94XUwaZEBBr4UVoodK2rterGyn3DwkGraDY=;
	b=W+Ge9QgZ+qUIZBmGBBabN8mAcBe1oHd/HGXjNaxN9OCPCo+a6dA5+suTe+gNkWgU3r
	DxQe96cZTQqCLSZB+IKlBkr2Fda0mzuN1kfUXIJtfJbUOdyDJeTJD6ll/HVeq/7+o9gm
	ui5RnZzPnA2rl4I1zriAT9Q2Au8xw8F4pLKPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fr4dLool3wKLmx8QZqb+gzdwNrCWVi9CNZw6mw1QY/zmhqiqRQ1D8XkMKqH8ge4pQK
	2fzixxxo17IwnFumc8haiGvJu+y0xsKucvw+TH1Uiux2VXh0nSPO6JOIPZtQny6MIzmW
	CJtzHRmg43Eqik3O0kGN9lQaLtwuY5rNOWE0c=
Received: by 10.204.116.134 with SMTP id m6mr1546619bkq.7.1307081017144;
	Thu, 02 Jun 2011 23:03:37 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id l24sm996732bkw.15.2011.06.02.23.03.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Jun 2011 23:03:36 -0700 (PDT)
Date: Fri, 3 Jun 2011 08:03:34 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20110603060334.GK3281@jama.jama.net>
References: <cover.1306856806.git.Martin.Jansa@gmail.com>
	<4fdf0bdf57b56d363e0b2ae8747e85fc84fbf8ca.1306856806.git.Martin.Jansa@gmail.com>
	<4DE87343.6010209@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DE87343.6010209@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'
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
X-List-Received-Date: Fri, 03 Jun 2011 06:15:08 -0000
X-Groupsio-MsgNum: 3581
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VB1oQhYtJt8uuzk+"
Content-Disposition: inline

--VB1oQhYtJt8uuzk+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2011 at 10:38:11PM -0700, Darren Hart wrote:
> Hi Martin,

Hi Darren,

> No objection if this is a valid URL. I didn't include this because 1) I
> didn't know about it and 2) it isn't listed in the git pull man page,
> which is what I developed to. Is git+ssh... equivalent to ssh:// ?

before this change my pull requests had url like this
are available in the git repository at:
  git+ssh://git@git.openembedded.org/meta-openembedded-contrib jansa/meta-oe
  http://cgit.openembedded.org/cgit.cgi/git+ssh://git@git.openembedded.org/=
meta-openembedded-contrib/log/?h=3Djansa/meta-oe

because RE wasn't matching my URL at all

OE @ ~/shr-core/openembedded-core $ git config remote.contrib.url
git+ssh://git@git.openembedded.org/openembedded-core-contrib

IMHO this is equivalent to ssh:// or git@ without protocol but haven't=20
checked documentation to be sure. But I'm sure this is valid and that=20
this works right (as I'm able to push to contrib).

> As a minor nit, please include a body message for anything more
> complicated than whitespace or typographical fixes.

I use git+ssh:// for many projects so I'm used to it, so I expected that
this is widely used and this patch would be clear enough.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VB1oQhYtJt8uuzk+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk3oeTYACgkQN1Ujt2V2gBx1rQCfUQloj84DJRI9VhXwj5ANyWBH
7bwAoJHtdsWLQOAgt49Mqooroek1h/Ah
=e+mo
-----END PGP SIGNATURE-----

--VB1oQhYtJt8uuzk+--
