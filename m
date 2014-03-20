Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 450DA6F8D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 13:30:26 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e49so661867eek.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 06:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ka+HPE3HcxXDvQ9UXOq6H8XWKGqJJHNAZ1QGNJ4gFz0=;
	b=dSK9xGeKd2Y7eV0UjuuYgcIX2+ENni/Iv5LcGc+Tx+3jCkfYO+HLz/HAXlw8QoLOeS
	jIZWMiiW+7+gAm4i+Ld8g2d2u7Q4ratLXMiiUjLkL+9lNXqLTtyK4earLy1eRzK90Svj
	9EgIqym7N4hrszWUpKiO4FUauEtMrEgws07IXAzH1gI1i9eRPgYm/u8QKK1aY5DBqM0J
	yzu3C58UhWImwW12TShElB8sCFI00yys+NwFF7ymHpkKokaaku2ojkFAKML83v5Xp6TJ
	zNxd51p0CWSc+hl9srLrwatVwgys8o/7PQ9EGQ0lOgiBFg9l+QM1qoG9AALaIUlIMuWp
	4Wbw==
X-Received: by 10.14.176.193 with SMTP id b41mr7984974eem.55.1395322227201;
	Thu, 20 Mar 2014 06:30:27 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	p8sm4210463eef.26.2014.03.20.06.30.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Mar 2014 06:30:25 -0700 (PDT)
Date: Thu, 20 Mar 2014 14:30:26 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20140320133026.GG3726@jama>
References: <1395285985-13867-1-git-send-email-lpapp@kde.org>
	<CAJTo0LbT50pLEP+EOsjVkxgBtADiZTG7puubO+qE583X41EnfA@mail.gmail.com>
	<0EAF1183-40EE-4110-9F86-1CABDA6273A6@dominion.thruhere.net>
	<CAOMwXhP6=vJA6TjWbuTfcWw1DVvVgWZ-Js35+w-sVFLw605Bfw@mail.gmail.com>
	<CAP9ODKpY2cxK343ahPQFSYEKbTMo4L9mCLQnC4KqYdhsdwB3mQ@mail.gmail.com>
	<CAOMwXhM7zxtsgJRHN0XS196vHxe71PmXiEUQR=oF0b-gMBbB0Q@mail.gmail.com>
	<CAP9ODKqTi=PGUHOsRSkHJrS0nsxEzoYyFbQffm4UU5iedLJNWA@mail.gmail.com>
	<CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Thu, 20 Mar 2014 13:30:30 -0000
X-Groupsio-MsgNum: 51412
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Content-Disposition: inline

--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2014 at 12:44:47PM +0000, Laszlo Papp wrote:
> On Thu, Mar 20, 2014 at 12:26 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > On Thu, Mar 20, 2014 at 9:16 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >> On Thu, Mar 20, 2014 at 11:59 AM, Otavio Salvador
> >> <otavio@ossystems.com.br> wrote:
> >>> On Thu, Mar 20, 2014 at 8:34 AM, Laszlo Papp <lpapp@kde.org> wrote:
> >>>> On Thu, Mar 20, 2014 at 11:22 AM, Koen Kooi <koen@dominion.thruhere.=
net> wrote:
> >>>>>
> >>>>> Op 20 mrt. 2014, om 11:45 heeft Burton, Ross <ross.burton@intel.com=
> het volgende geschreven:
> >>>>>
> >>>>>> On 20 March 2014 03:26, Laszlo Papp <lpapp@kde.org> wrote:
> >>>>>>> +PEER=3D127.0.0.1
> >>>>>>
> >>>>>> That doesn't seem like a very useful default.  We also can't use t=
he
> >>>>>> NTP pool by default, so this should copy the behaviour of the ntpd
> >>>>>> package in meta-networking and default to no peers, and not start =
if
> >>>>>> none are specified.
> >>>>>
> >>>>> And the initscript is missing LSB headers.
> >>>>
> >>>> Just like the other similar scripts.
> >>>
> >>> This does not mean we ought to make the problem worse so add it for
> >>> new ones. If you are in good mood, send a fix for the others too ;)
> >>
> >> I do not think this is a problem. Could you please point out what
> >> functionality it breaks? Send patches for the others, and I will make
> >> this cosmetic change for this one, too. Consistency is more important
> >> than a mess of different styles, especially when it comes to cosmetic
> >> changes like this.
> >
> > Koen and I think it is important. So consider this my NACK for the patc=
h as is.
>=20
> You are free to NACK without an explanation why it is important, but
> do not expect it to weigh much that way, at least in my eyes, based on
> that you are not even a maintainer as far as I know.
>=20
> I also think that it is not constructive to give NACK without
> answering the questions, and only telling again "It is important".
> Please be more constructive and explain the real issue. That is a
> better way of convincing a contributor than telling the person it is
> bad what you are doing because it is bad.
>=20
> There was someone today publishing a blog post how important it is to
> become pragmatic to get things done. Currently, cosmetic changes are
> just in the way of getting things done. The feature shall be more
> important than cosmetic changes. I saw this frightening away
> contributors, and features actually not getting into projects.
>=20
> That being said, if you can explain your reasoning, and I find it
> reasonable and worthy, I will update it.

I don't remember the exact issue I was seeing in runtime with systemd
and SysV scripts which were missing LSB headers, but it was handling
them somehow different.

If you search meta-oe git log, then you'll find many commit messages
where LSB headers were added when e.g. importing some older recipe from
oe-classic, that's good enough reason to add them to new ntp script,
isn't it?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEUEARECAAYFAlMq7XIACgkQN1Ujt2V2gByTBQCgt1pGwJEgdeLh6ILQTeVS3Lqc
sLMAkweSP58ABu3HIYi0SOlvs1UZF0g=
=PB85
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
