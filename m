Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Szqnw-0008Hf-ME
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Aug 2012 17:07:12 +0200
Received: by ghbz2 with SMTP id z2so1503899ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=Rbul9iouZyY93wzzzK2twTHzk4UuHHGAmBB8HpZ2/VA=;
	b=kC1gFdWbiufGtoXh32DoAePW9UxjJL3WZ0iG6UXz0b2aUpZIh63nbxzjK7wIxKetH8
	i4mptubX19yOmN0wpq6fF1jqvP2LMyr6PGSbumM5pSa2/b9R8f2lSR4jWO/8plP+piYQ
	O+BnSbUpbDf7SdF/Ubl1mvPd9eiBvKzv091MoHq5e3OBb3lLoosYKzJG4U+5ml2KlKUk
	3qpy748nxcuUXb5aDS5WkjNMWn6NA2urzshdadUMHulcWwUO1rZ+MSF1vf9HWZ+9I1ij
	nMPRCKMcIluIKvzYHs7AV4N0AY9qgbNyIMtQyffp9vfYadBvNqbezjjNAw9kW2IzYU6t
	9Upw==
Received: by 10.66.87.132 with SMTP id ay4mr6637678pab.82.1344610522147;
	Fri, 10 Aug 2012 07:55:22 -0700 (PDT)
Received: from [192.168.1.66] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id jz4sm3489233pbc.17.2012.08.10.07.55.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 07:55:21 -0700 (PDT)
References: <1344475516-27640-1-git-send-email-raj.khem@gmail.com>
	<9145620D-0D9C-4269-9ED4-B0E2E81086E3@dominion.thruhere.net>
	<1384904.B8yRp5DXBX@helios>
	<1344589634.23275.284.camel@phil-desktop>
In-Reply-To: <1344589634.23275.284.camel@phil-desktop>
Mime-Version: 1.0 (1.0)
Message-Id: <30611DF2-2589-4A82-B8C9-545FCAE944FB@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (9B206)
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Aug 2012 07:55:19 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/12] gcc: Switch SRC_URI to use svn
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
X-List-Received-Date: Fri, 10 Aug 2012 15:07:12 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



-Khem

On Aug 10, 2012, at 2:07 AM, Phil Blundell <philb@gnu.org> wrote:

> On Fri, 2012-08-10 at 09:47 +0100, Paul Eggleton wrote:
>> On Friday 10 August 2012 10:03:06 Koen Kooi wrote:
>>> Op 9 aug. 2012, om 03:25 heeft Khem Raj <raj.khem@gmail.com> het volgend=
e=20
>> geschreven:
>>>> svn tar balls are 96M as compared to 1.3G git tars
>>>> its unnessary to suck in that much of data.
>>>=20
>>> That's indeed a big difference and also expected, with svn you only get
>>> revision N and N-1, with git you get everything. But even so, I can fetc=
h
>>> that 1.3GB a *lot* faster than that 0.1GB svn. Maybe I'm on the wrong si=
de
>>> of the ocean, but that gcc svn server is sloooooooooooooooooooooow.
>>=20
>> FWIW the git option was much, much, much slower for us here in the UK.
>=20
> Maybe we should just go back to using the released tarballs for gcc
> rather than any sort of SCM checkout.  That would be an 80MB download
> for the tar.bz2 and of course you can get it from your local mirror.


That's the plan when next release of gcc comes out
>=20
> I think the original reason we switched to using the SCM checkout was
> that, at the time, we were carrying around a huge number of backported
> patches that hadn't quite made it into any released version yet.  It's
> not totally clear whether that situation is likely to arise again or
> not.
>=20
> In an ideal world I suppose the SVN web UI would expose some sort of API
> that exported changesets in diff form, in which case you could write:
>=20
> SRC_URI =3D "http://gcc.gnu.org/releases/gcc-4.7.1.tar.bz2 \
>    http://gcc.gnu.org/svn/fetch?rev=3D189810"
>=20
> or whatever for the patches that you wanted to backport.  But I don't
> know of any way of doing that with the current viewvc.
>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


