Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPxNd-0006Tb-OK
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:51:41 +0200
Received: by bkcjm2 with SMTP id jm2so1556872bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fHv0v6HeYVVyrPYXuKigN+dlIhVuE+AXLU7NeE2HVI0=;
	b=xxvrkcaA7oHAuegEwvBqNZtE/NG4nIHGsmokTSk/wj+rA+Baa63/jtYtJm5uW3z+vr
	7IelMBZGO+l9EwlyTBJHh15PdhVcNDZcwwehwABrpGlSMdqBJFZMVcI1twUzerlV8X5Z
	ykfcLUVhs00jhWQpzkx0N8uAzNiUGG9HbIc7B22noWmScWJeYBpeH8sHil/99nEoNiSR
	XDRQHKy+yStE2A1AO+jJ2OJLnGxB17Ku5g2HOl3cliagbCs10INVZ24rQpqtVHyZwz9q
	3mQgbowihwWC6vsnm6tTIPduvkVWn/Z9f9k7xnyAL9RIkuLGTFq0V2wv8X88CkUwiOe1
	1Qyw==
Received: by 10.204.13.78 with SMTP id b14mr839123bka.32.1336056116182;
	Thu, 03 May 2012 07:41:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e20sm11131731bkv.10.2012.05.03.07.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 07:41:55 -0700 (PDT)
Date: Thu, 3 May 2012 16:41:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503144157.GB14648@jama.jama.net>
References: <eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net>
	<1336035344.30113.51.camel@ted>
	<20120503092955.GE4658@jama.jama.net>
	<1336051765.30113.107.camel@ted> <1336052808.30113.116.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1336052808.30113.116.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 14:51:41 -0000
X-Groupsio-MsgNum: 21576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 03, 2012 at 02:46:48PM +0100, Richard Purdie wrote:
> I should also note that there is a wider problem here I'm complaining
> about. The glib issue is actually less of a concern.
>=20
> People keep sending patches without sensible descriptions in the commit
> message. I think I've made some comments on list to Saul about this to
> pick on someone in particular. The last set of patches from Khem
> contains one which removed pretty much the whole qemu patch set from the
> git version with no explanation in the commit message.
>=20
> No, its not going in and I find it a a bit of an insult that I'm being
> expected to read the diffs, notice these changes and spent time replying
> to the patch with a nicely worded rejection email. I might just start
> replying "no".

True I should be more precise in saying what was tested, in cover letter
I've said:
Tested on my images and fixed failing recipe, mostly it's about
including header files like:
glib-2.0/glib/gthread.h:28:2: error: #error "Only <glib.h> can be
included directly."

And by my images I mean SHR image which cover much more then just
oe-core (mostly meta-oe and meta-smartphone layers). So I had to fix
9 recipes in meta-oe layer and 3 more in meta-smartphone while testing
rebuild from scratch with gcc-4.7 which needed another 3 recipes fixed
in meta-oe, firefox in meta-mozilla and 2 more recipes in
meta-smartphone. So yes I was quite busy whole weekend just because I
wanted to provide good gcc-4.7 coverage with more layers than just
oe-core. Whole glib upgrade was just one of steps in order to be able to
upgrade failing webkit-efl... And it wasn't my decision to make gcc-4.7
default version.

And when talking with Saul on IRC I've
said that I'm not building world (because my desktop is too slow, so
your autobuilder can find broken recipes sooner then my machine even
gets to building them).

So that's why I felt a bit insulted too when it's my fault that I wasn't
testing all this also on e.g. mips.

And FWIW as soon as I've discovered there is problem with other archs
I've replied to this patch (saying that other archs need similar patch)
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/021774.html
and submited site changes for x86/x86-64 where I was able to test it
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/021779.html

So if that's not enough to report there is known problem with such patch
I cannot do more and I'll rather go out for a walk in such nice weather.

Cheers,
=20
> So what I'm asking is that people think about the changes they submit
> and try and help me, not use patch submission as a sounding board and
> not to hope I don't spot something.
>=20
> To scale this project we need to develop trust relationships with people
> taking ownership of areas of the codebase. I consider Mark Hatle to
> "own" most things rpm for example. To scale we need to do more of this
> but trust is important. If some people don't want to do this and just
> contribute things when they can which interest them, that is fine but we
> are going to reach a point where we have to take longer to test and take
> such changes.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+imTUACgkQN1Ujt2V2gBzeUgCfeOM4I+X4GFVOvB/20FrFtpPU
picAn2FcHNPQjiKPe19uSgGUuG0TDS93
=ffou
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
