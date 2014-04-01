Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id F34B46F242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:50:14 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id x48so6304507wes.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 07:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Afem1MJe2UIneIYWE4MnI7X8aAGxM0Gae7sgYBJZJjY=;
	b=FweZ0zVb5003+EQeS+bdTlEEfNgtJgXO9w+2XUBbYYpq68s86xwa4xNYkzm20JTe30
	MKaJVOzyAXZv38K85A/ZEECbQldvEu5YNHxgSG53yGbF4kv98PIgGRSMGD5fTNvK82RB
	q4obbIAvb5GsPW7twPl63lulcsNAb8tPqq3ebH3/ysYu7jcGqm9NCO6AcSOObHItW8+o
	ZRG/uyB6NJZFNuL68qoFgo275g2uFyEmQxwi9J+NE9GXeyD3mDUt9cgPGoZRGJVD8nLx
	ZwTEgOzHg2UjTNw6tIFmUGk+D8DmjwxCpRWNUtLAU3pHMrX12KreeJU2ftMT/7NWh9vj
	k+yQ==
X-Received: by 10.180.39.173 with SMTP id q13mr3132333wik.26.1396363815467;
	Tue, 01 Apr 2014 07:50:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o5sm41067171eeg.8.2014.04.01.07.50.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 07:50:14 -0700 (PDT)
Date: Tue, 1 Apr 2014 16:50:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20140401145014.GQ2425@jama>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
	<5339C30B.1060005@windriver.com>
	<CAMKF1srfDpeGkQMnHkK_AFPy6N7pujtLwMRsgbsDeHem82_5nA@mail.gmail.com>
	<5339C6FD.1070506@windriver.com>
	<A5D0F3B0-A739-4D0D-A9C5-926BBEB9CD35@gmail.com>
	<533AB712.2000809@windriver.com>
MIME-Version: 1.0
In-Reply-To: <533AB712.2000809@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Tue, 01 Apr 2014 14:50:22 -0000
X-Groupsio-MsgNum: 52033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X9hp/qFlD/MyfJCu"
Content-Disposition: inline

--X9hp/qFlD/MyfJCu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2014 at 08:54:42AM -0400, Bruce Ashfield wrote:
> On 14-04-01 02:42 AM, Khem Raj wrote:
> >
> > On Mar 31, 2014, at 12:50 PM, Bruce Ashfield <bruce.ashfield@windriver.=
com> wrote:
> >
> >>> i dont believe you tested all layer combinations
> >>
> >> I've tested everything I can, as has the autobuilder. I can't offer
> >> any more than this.
> >>
> >>>>
> >>>>
> >>>>> at this point. 3.10 being LTS
> >>>>> I would assume its a better option to keep at 3.10
> >>>>
> >>>>
> >>>> I disagree, this is consistent with other releases and the documented
> >>>> plan of action. I'd rather not have a massive version jump in the fa=
ll.
> >>>
> >>> its probably not a bad option to stick to LTS version for kernel head=
ers
> >>> after all
> >>
> >> Again, I disagree.
> >>
> >> We can maybe keep the 3.10 recipe around,
> >
> > Thats ugly too. We decided to stick to one version of headers last time.
> >
> >> but the default should
> >> be 3.14, we need a matched kernel and libc-headers to get the best int=
egration
> >> and leveraging of the latest features.
> >>
> >> If we pull the headers, pull the kernel.
> >
> > this all is understood, however we have to get better with timings espe=
cially
> > changing something like kernel headers whose impact is far reaching then
> >   just updating kernel proper.
>=20
> We do the best we can and I can only play the timing that is dealt
> by the upstream projects ... but we all know that!
>=20
> We arranged for as much soak testing and building as we could behind
> the scenes.
>=20
> That being said, we are going to introduce the versioned kernel and
> libc-headers recipes in the -rc1 timeframe next time around and we
> captured that intention on the kernel planning wiki for 1.7 .. so that
> should help in the next cycle.

This failure also seems new:

|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/qemuarm-oe-linu=
x-gnueabi/lttng-modules/2.3.3-r0/git/probes/../instrumentation/events/lttng=
-module/../../../probes/../instrumentation/events/lttng-module/block.h:344:=
24:
error: 'struct bio' has no member named 'bi_sector'
|    tp_assign(sector, bio->bi_sector)
|                         ^

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--X9hp/qFlD/MyfJCu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM60iYACgkQN1Ujt2V2gBzyUACgoxtwjEI1sV6fnYdcEUol7l8i
NfQAoJ7r68A4Wi+gxFvMkIY5senA8a2r
=Reeu
-----END PGP SIGNATURE-----

--X9hp/qFlD/MyfJCu--
