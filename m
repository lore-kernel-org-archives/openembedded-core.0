Received: from mail-gg0-f179.google.com ([209.85.161.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFmIr-0002gu-QZ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 15:05:14 +0100
Received: by mail-gg0-f179.google.com with SMTP id h4so162886ggn.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=MjvtYx2QxE3/gJLPuSIGJdCuQOTecsK55n4AbxeRcRo=;
	b=yBKytU3xXsbe2NFO4Aq7tiGCImjRVXB+KnGz5f57QUeTQYe5uFbiHdqrgCDKYXuUgi
	Nf/utn71TcepbwclZTj8jN1HnRMWgKNKYt+20O1quiU4561ASWQJmWsDiZq9Yfps4bc5
	FLNVFWFJiKo3GvHgGq89KDyTWcyHjOWCW9FNlYxH4FtuQoCNxn9JmfBUgWsAHbCmo7bx
	v82X9ps743XI8pcasmVYCa2HDpLPvxobA/m6SanmXY1fLYBs0Z4nXBCpQbJ6mDdVMabd
	pMydOUvjZywNCSBh1CfG08MYpRon0Bfy/RX7lxA4BpOxw0+YIEl07IcIXjBMrFUBKR9e
	sF7g==
X-Received: by 10.236.126.202 with SMTP id b50mr15710181yhi.25.1363182511621; 
	Wed, 13 Mar 2013 06:48:31 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e22sm35457442yhm.18.2013.03.13.06.48.29
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Mar 2013 06:48:30 -0700 (PDT)
Date: Wed, 13 Mar 2013 14:48:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130313134823.GI3260@jama>
References: <513FACF7.5000907@windriver.com>
	<CADkTA4O+=ot0kt-aMzHTiVLEsYMNCrWutpDUCfgxTKrBd4zcVQ@mail.gmail.com>
	<51408086.6020703@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51408086.6020703@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: update-alternatives and kernel modules
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
X-List-Received-Date: Wed, 13 Mar 2013 14:05:19 -0000
X-Groupsio-MsgNum: 36570
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="54ZiyWcDhi/7bWb8"
Content-Disposition: inline

--54ZiyWcDhi/7bWb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2013 at 08:35:02AM -0500, Mark Hatle wrote:
> On 3/13/13 8:07 AM, Bruce Ashfield wrote:
> > On Tue, Mar 12, 2013 at 5:32 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
> >> I have someone who is trying to use update-alternatives with kernel mo=
dules.
> >>
> >> They discovered that the rename code changes the name of the module to=
 end
> >> in .ko.${BPN}.  While the package.bbclass code specifically looks for =
the
> >> file name to end in '.ko' in order to avoid stripping the modules... s=
o of
> >> course the modules get stripped and no longer work properly.
> >>
> >> So my question is, is it even reasonable to use update-alternatives wi=
th
> >> kernel modules?  If it is, we probably need to change the trigger in
> >> packages.bbclass to look for either .ko or .ko.${BPN} (or something
> >> similar).
> >>
> >> Any comments/suggestions?
> >
> > I'm having a hard time wrapping my head around what they are trying
> > to achieve. Can you describe it from a non-packaging point of view ?
> >
> > i.e. do they have two kernel modules that provide the same sort of
> > services to the kernel and they want to switch between the two of
> > them based on the alternatives mechanism ?
>=20
> Yes, that is exactly it.  For some reason they have two kernel modules th=
at have=20
> the same name, same external behavior.. but internally there are code cha=
nges.=20
> Using the update-alternatives mechanism they have selected one version is=
=20
> "better" then the other.
>=20
> (Frankly this seems bogus to me.. which is why I'm asking the question.  =
Is this=20
> even supported or is this simply "don't do that".)

Cannot you rename them in do_install to module-foo.${BPN}.ko and set
ALTERNATIVE_TARGET_kernel-module-foo[foo] to module-foo.${BPN}.ko ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--54ZiyWcDhi/7bWb8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFAg6cACgkQN1Ujt2V2gBwZPACfSooXLBtHxQCnglBaqtepUZif
qsAAmgNmcZRw8ETfjy/l3hxW/KPVqKz2
=az1o
-----END PGP SIGNATURE-----

--54ZiyWcDhi/7bWb8--
