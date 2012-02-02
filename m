Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rsvpb-0008W5-EX
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 13:32:03 +0100
Received: by eaal10 with SMTP id l10so386180eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 04:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XlN14/VFeI777Li/r3vBAuHxvMgQ0LVwYzGHDXB3Wro=;
	b=OsHgrKN7ZLKfGpOuesgpetPlDepC9kxRePw2pV8sgsm9hrfKIm3hxCF6Z/2BGXyxzz
	dNpCMHOq6Z5dd92gCk+B+f172rexcmsz18BAAeY2NmRGDNa5afmbhHCyhG/O8VurpfFm
	tZIt6sBMiIRluMwvoArIQBta5IiGn7k4Xvab4=
Received: by 10.213.22.78 with SMTP id m14mr1751517ebb.51.1328185447411;
	Thu, 02 Feb 2012 04:24:07 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b3sm8747157een.2.2012.02.02.04.24.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Feb 2012 04:24:05 -0800 (PST)
Date: Thu, 2 Feb 2012 13:24:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120202122403.GI3697@jama.jama.net>
References: <CAGiJk9f9Mc06KbPVBcTFi_icr=P3ZGuBYrDT7oH+gC5dKVKpbA@mail.gmail.com>
	<20120202115658.GH3697@jama.jama.net>
	<CAGiJk9fa4b6ZABhmsWGxRu3MhC503WB-AYiJRdGPNc2cpezc4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9fa4b6ZABhmsWGxRu3MhC503WB-AYiJRdGPNc2cpezc4A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: RFC: Porting KDE Plasma Active (WIP)
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
X-List-Received-Date: Thu, 02 Feb 2012 12:32:03 -0000
X-Groupsio-MsgNum: 16909
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline

--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 02, 2012 at 01:18:38PM +0100, Samuel Stirtzel wrote:
> 2012/2/2 Martin Jansa <martin.jansa@gmail.com>:
> > On Thu, Feb 02, 2012 at 12:50:16PM +0100, Samuel Stirtzel wrote:
> >> Hi,
> >>
> >> for some time now I've been working on a port of Plasma Active, the
> >> next generation touch user interface from KDE.
> >> If you never heard about Plasma Active see [1].
> >> For touch devices it is much more satisfying to use a GUI that is
> >> designed for this input method, so I started porting it.
> >> Someone already built Plasma Active for the Pandaboard [2] but it was
> >> compiled native on the device, but somehow this inspired me to start
> >> this project.
> >
> > Hi,
> >
> > are you "darkh" on IRC? Because he wrote me about his meta-kde layer few
> > months ago, but haven't seen him since then.
> >
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> No, I am not.
> However if there are already existent recipes it may be worth a look,
> but I guess as you didn't post a link he had not provided more info?

Unfortunately not
13:20:52 < ibot> darkh <~dark@93.199.81.252> was last seen on IRC in
channel #openmoko-cdevel, 264d 20h 11m 16s ago, saying: 'Linux om-gta02
2.6.37.6 #1 Fri May 13 08:06:01 CEST 2011 armv4tl GNU/Linux <-- l
finally got the right clock values JaMa|Off... or at least one that are wor=
king'.

So yes it was almost year ago..

And when he told me about it and send me link to repository I was on
holidays and irssi wasn't logging private query.. :/

> This "project" started 2 week ago after I watched amazing videos about
> Plasma Active two :)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8qgGMACgkQN1Ujt2V2gBz/4QCfTje7bq2QzMT4ds68fIi8LDcp
N2MAnjX64wWGwXJsSlj4gLnHsIgrS2bI
=qeCF
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--
