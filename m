Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF3860C02
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 11:25:13 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id c13so5627303eek.37
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 04:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=83ceNBGwNMkhYxpHx1gShxF20qJ9J+7a4lv77VTpnHU=;
	b=riUgPiAwirJIjxOijYDqf8Nxehmai0FJbeyPQduszC1dQfifA4Muhi5bTSvcN+oquY
	FeTmOgz/ngyNxWGSmHmZfpl+4AsYCekazBhdcjViHeq4eQAyDd5ujpwYlBL/hfFsmvzO
	IhIfv/y4tK/F8JVQ+7uTrrl+n9zzvrrUDPmjVQLI+xqzIKRmQtZEd7d2ZyLVKkn+of5K
	M5/HMQIGmWdfRvTt7jadV6M+LeB0G7hlYuDCfTv43gFvaU/xB4AVp6ovzgqJbDe3I6YX
	I5PrgnBiPmA2lb4R+nqRWGe1rtSCAkMaPFsVLhfNOJe+KD7i0vVkY7sqClPYDxU8AHyD
	VGTQ==
X-Received: by 10.15.50.136 with SMTP id l8mr81359eew.73.1396178714237;
	Sun, 30 Mar 2014 04:25:14 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l42sm25146390eew.19.2014.03.30.04.25.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 30 Mar 2014 04:25:13 -0700 (PDT)
Date: Sun, 30 Mar 2014 13:25:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140330112517.GE2428@jama>
References: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
	<1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
	<1395052685.3808.27.camel@ted>
	<4118819.bWkrsFYPBI@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <4118819.bWkrsFYPBI@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCHv2] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Sun, 30 Mar 2014 11:25:14 -0000
X-Groupsio-MsgNum: 51871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline

--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 11:03:06AM +0000, Paul Eggleton wrote:
> On Monday 17 March 2014 10:38:05 Richard Purdie wrote:
> > On Mon, 2014-03-17 at 10:25 +0100, Martin Jansa wrote:
> > > * useful when distro wants to collect build statistics from
> > >=20
> > >   all users/developers without any manual interaction from them
> > >=20
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >=20
> > >  meta/classes/report-error.bbclass    | 103
> > >  ++++++++++++++++++++++++++++++++++- meta/conf/local.conf.sample.exte=
nded
> > >  |  20 +++++++
> > >  2 files changed, 121 insertions(+), 2 deletions(-)
> >=20
> > I get worried about this as people could (rightly) be very nervous about
> > the system sharing information with a remote server without their
> > knowledge. Adding in this functionality makes it look as if that is the
> > intent of the system.
> >=20
> > This is why there was a two step process, first to save out the data and
> > second to have the user upload it (once they'd looked at what it was
> > sharing).
> >=20
> > Does anyone else have thoughts on this?
>=20
> I have the same concerns. It's fine if people enable this in their own bu=
ild=20
> server's local.conf / auto.conf; but if someone were to put this into the=
ir=20
> distro config which is downloaded and used by someone to do their own bui=
lds=20
> with configuration or additional components that they do not wish to shar=
e,=20
> there's the potential for that person to be unaware that their build fail=
ures=20
> will be uploaded and shared automatically.

My use-case was private distro, where it's imho valid to gather
build stats from every build which happens in the company (we're using
it to find builds which weren't configured correctly, e.g. referencing
non-existent premirror/sstate-mirror etc).

Should I just change the description and commit message so that it
doesn't promote it for distro config to use it or should I keep it all
private?

I'm thinking about using this also in my bitbake world builds and it's
also easier to enable it in config there, than parsing the log and
calling send-error-report from jenkins job config when report was
created.

Should I use error-report-web installed on yoctoproject.org or create my own
instance somewhere?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM3/x0ACgkQN1Ujt2V2gByapQCdG10yB7cjhZuO7Ngd+WK/Ghe5
2qsAoKPDW691pA8WEmxS9wAx3YWz4xHo
=FvcK
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
