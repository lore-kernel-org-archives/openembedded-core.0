Return-Path: <joe@deserted.net>
Received: from mail-qe0-f45.google.com (mail-qe0-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 36E126CEDB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 15:56:26 +0000 (UTC)
Received: by mail-qe0-f45.google.com with SMTP id 6so183450qea.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 07:56:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=wboI/PL4Yb4UFZsOgyY7TuWGvJnhJHAJQOepLnD2gkQ=;
	b=iIOCAsCjuOwCU248yMWsKwDx/Rctn7laO7xgqyK6aJ62ZNB3xts/rFh+8S+WEehseT
	tz5BUA87Z2iNwNf64vukHXqVEHMIe/hO/wNNgUID/UpWihpqdYLcAjOhddwV4kWR39M1
	t+DUg+xXH+dv37AVz1jgC0KaKXOQBwcwoaQx/Qm5aKwpiL1t67KM+v7SylxXc8MG4rf8
	jbhEEgfAX50hkyhUhfJcTRSQdtJUldKY+3DL/A/ILapEEe99iaAT7d2SSrf8lib6lzGB
	SD9fCYD1Q8KsNvHGGU3RLYlpZAdZwSCX55M3sPJgqSLvl/zw+I846IjLIeGP6urH43bW
	2WBw==
X-Gm-Message-State: ALoCoQmt3WycHjtPkIerpIE4tErxkdIPc1MSF1CRPv5SB20f+Vzdh757KICspUPhty+35O0yASRu
X-Received: by 10.224.22.20 with SMTP id l20mr44182956qab.17.1384876587397;
	Tue, 19 Nov 2013 07:56:27 -0800 (PST)
Received: from deserted.net ([128.224.252.2])
	by mx.google.com with ESMTPSA id p17sm52994458qak.4.2013.11.19.07.56.26
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 19 Nov 2013 07:56:26 -0800 (PST)
Date: Tue, 19 Nov 2013 10:56:24 -0500
From: Joe MacDonald <joe@deserted.net>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20131119155622.GA10619@deserted.net>
References: <20130603151008.GC3279@jama> <20130611160434.GI3233@jama>
	<20130622181656.GK14021@jama> <20130725162341.GA3280@jama>
	<20130808225419.GB17945@jama> <20130811114403.GG17945@jama>
	<20130917123058.GC7313@jama> <20131020194345.GB3709@jama>
	<20131030230825.GB32015@jama> <20131119155040.GD3708@jama>
MIME-Version: 1.0
In-Reply-To: <20131119155040.GD3708@jama>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 15:56:26 -0000
X-Groupsio-MsgNum: 47275
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline

--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] State of bitbake world] On 13.11.19 (Tue 16:50) Martin Jansa=
 wrote:

> On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> > Starting now I'll use
> > http://openembedded.org/wiki/Bitbake_World_Status
> > to post results from my bitbake world buils.
>=20
> It was updated few times since this e-mail and I've received no
> feedback.
>=20
> Should I continue to post them or nobody except me is really interested?

I'm interested.  I've not had nearly as much time to hunt down the ones
I own as I'd like, but I do appreciate the mail and I flag them in my
mailboxes for easy reference later.

-J.

>=20
> The stats also show that nobody is interested in fixing them, some issues=
 are
> there for 6+ months.
>=20
> Date	                 Failed tasks	         QA	QA-w/o-unrecognized
>                 qemuarm	qemux86	qemux86_64	qemuarm	qemux86	qemux86_64	qem=
uarm	qemux86	qemux86_64
> 2013-11-19	12	17	19	141	142	131	29	27	18
> 2013-11-03	11	18	19	96	127	123	22	21	16
> 2013-10-31	9	17	19	74	114	107	23	21	14
> 2013-10-30	11	16	18	224	191	184	28	23	16
>=20
>=20
--=20
-Joe MacDonald.
:wq

--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlKLigcACgkQwFvcllog0XyznACgg+IBuKtCkYJSV+nK1Wpp91IZ
TmYAn3QiGP/zPas1mbvvs+jI30KA+XwS
=Lnff
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
