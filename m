Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFmcO-0003DT-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 15:25:24 +0100
Received: by mail-gh0-f178.google.com with SMTP id g24so174257ghb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 07:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=YT9CPLYPmJJiFoe4iWED72tACNWMK/h939ntVnGzQGs=;
	b=zPLYPWmntpr43Z8KYrEQEEWuR/4pLKbn/hvL/hZjshTBb/vB1FeKxyOkKxWK++athh
	l6HpOMxdOUd0kelCTk668djlaj7+CZ9MOjCo/FpdNWXQZ7fgibBjRC6GGvhDy3AIuEnW
	ixzGipTobRgWcCN1p40KSFYY2uPn34LYNxDMwea25Y6zwy9jKywMwqV5ET0yzpPAyZJY
	cimFFczDXIJaOMrlkVOPUQOWMdW4ziBmqjd3EwvULLLA6yTDtBG4eY/vrvbKjyrKroc8
	OcOTBkBO1SQAjhK4xvzPtbRwxgk5nkncTjrsRjhFMtbkz5t/14Vb4LHUzmhgKHjrhPng
	QKYg==
X-Received: by 10.236.157.8 with SMTP id n8mr15231932yhk.76.1363183723159;
	Wed, 13 Mar 2013 07:08:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s34sm35556336yhe.9.2013.03.13.07.08.40
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 07:08:41 -0700 (PDT)
Date: Wed, 13 Mar 2013 15:08:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130313140834.GJ3260@jama>
References: <1363087472-32085-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LZypsC9Ai9ZyBhEmS8gv4zSQd7ViJ4k_KppqwD2oBMeKw@mail.gmail.com>
	<513F4BF9.4090903@windriver.com>
MIME-Version: 1.0
In-Reply-To: <513F4BF9.4090903@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: add debug-without-src PACKAGE_DEBUG_SPLIT_STYLE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 14:25:24 -0000
X-Groupsio-MsgNum: 36571
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tu8ztk+XgTAiG9Id"
Content-Disposition: inline

--Tu8ztk+XgTAiG9Id
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 10:38:33AM -0500, Mark Hatle wrote:
> On 3/12/13 10:28 AM, Burton, Ross wrote:
> > On 12 March 2013 04:24, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> * same as original and default version, but does not package source fi=
les in PN-dbg
> >
> > You can mark this as closing
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3621, which would be
> > good for my bug list.  Richard had concerns that he listed in the bug,
> > so having done tests and demonstrating that the loss of source doesn't
> > impact the usefulness of the debug files would be good.
>=20
> I am curious as to the use of the dbg package (w/o) source on the target =
system.
>=20
> In my experience, the dbg binaries are useless without the associated sou=
rce.=20
> Most of the people I know either use an on-target debugger or a cross deb=
ugger,=20
> both of which need the associated sources to tell you anything about what=
 is=20
> going on.
>=20
> For someone who just wants pure backtrace information, it's usually easie=
r to=20
> avoid the whole split-and-strip process that generates the dbg files.  Bu=
t of=20
> course this can sacrifice the usefulness of being able to do field debugg=
ing.
>=20
> (Note, I'm not against the patch.. it looks fine to me... I just don't=20
> understand the usefulness..  other then the associated defect says they a=
re "too=20
> big", which again, I don't doubt.)

I've added my use-case for this in bug report:

My use case was a bit different: to be able to build proprietary blobs
with OE and exchange resulting .ipk files with partners without
revealing source in PN-dbg.

So better backtrace is all we want from PN-dbg and devs with access to=20
sources can download/checkout source on target (while using the same=20
PN-dbg package to reproduce reported issue).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Tu8ztk+XgTAiG9Id
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAiGEACgkQN1Ujt2V2gBzE2QCgnSVquD+/rw/uKwK3QLoEukpn
y7EAoJ2b4ArbInmNJC7Jv3cKKusjkfrp
=jxD2
-----END PGP SIGNATURE-----

--Tu8ztk+XgTAiG9Id--
