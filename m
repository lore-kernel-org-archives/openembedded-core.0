Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrTIp-0002k4-Ba
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:24:27 +0200
Received: by bkcik5 with SMTP id ik5so1061658bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vU+OlcJd+QJMJ2RachzJUthzi26eWd3t/mzQWDOtoKw=;
	b=COX/a+hnT4zP9/ZLxfWjLAamip+ZY1qutT+3zPbHBiVFQHjv/gkvqNkY0AExD6ld7d
	079/ykq1D5qqQpxpIK+c2LbYqf3IEjmZueBd4jF1BgrudSgPfxi6AjqlLktx7pqrCT3V
	9GM6YOZTY6DpgHR/7fVBNWyUutD+dCTQfriFUjWIa9Sdmne+40RSsVtDZ9f12vld9xvw
	Q3HWkppuhmQd4O0weiE0qFsEUv3o4yN16uz9znHCJN1BPdAgFSkL69Akj/JUHMrD473O
	TzYVdAraQgxNvkN0jbxgFTnJYz4wDq8Z7w+mS8zk8KIJKDWn+RQRATL165M/wMTCTBH+
	v9iw==
Received: by 10.204.155.146 with SMTP id s18mr1449092bkw.23.1342613586890;
	Wed, 18 Jul 2012 05:13:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm11724139bkv.8.2012.07.18.05.13.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 05:13:05 -0700 (PDT)
Date: Wed, 18 Jul 2012 14:13:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120718121316.GL22569@jama.jama.net>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
	<20120718112359.GC29030@mi.fu-berlin.de>
	<CAJTo0LYO9xT3sfBR_cQw6=76HqEaYaOzktG861_QXaVwsV5c0Q@mail.gmail.com>
	<CAJTo0LYn58DZcjxDnR_iLHd8pF+Km9+5ph8Y2s7vnpqE-+hTkg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYn58DZcjxDnR_iLHd8pF+Km9+5ph8Y2s7vnpqE-+hTkg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: eglibc-initial trying to remove files in /usr
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
X-List-Received-Date: Wed, 18 Jul 2012 12:24:27 -0000
X-Groupsio-MsgNum: 25631
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TxukmIqg3MmZ0Kmh"
Content-Disposition: inline

--TxukmIqg3MmZ0Kmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2012 at 01:10:07PM +0100, Burton, Ross wrote:
> On 18 July 2012 12:40, Burton, Ross <ross.burton@intel.com> wrote:
> > On 18 July 2012 12:23, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
> >> NOTE: make PARALLELMFLAGS=3D-j 8 cross-compiling=3Dyes prefix=3D/usr
> >>
> >> So it tries to install eglibc to the host dirs which is of course fail=
ing.
> >
> > The mechanics of building eglibc is beyond me -- yesterday's clean
> > build worked fine so something in the last day must have broken it.
> > Any ideas?
>=20
> So I reverted to GNU Make 3.82 (debian experimental) to 3.81 (debian
> unstable), and eglibc-initial builds.
>=20
> I'm just going to pretend this never happened. :)

with make-3.81 eglibc-2.15 was sometimes failing for me..
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2314

Haven't failed like this since I've upgraded make to 3.82..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TxukmIqg3MmZ0Kmh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAGqFwACgkQN1Ujt2V2gByWwACfavmFsAtFAmAl9viwt0NTipgl
sgwAn0feSZ+55KMsK5IHxtopTrLdPoQE
=9d3v
-----END PGP SIGNATURE-----

--TxukmIqg3MmZ0Kmh--
