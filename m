Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RM1mv-0003HQ-U3
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 19:13:18 +0100
Received: by wwf4 with SMTP id 4so1923089wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 11:07:07 -0700 (PDT)
Received: by 10.227.209.21 with SMTP id ge21mr13754979wbb.6.1320343627685;
	Thu, 03 Nov 2011 11:07:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id es5sm11565279wbb.11.2011.11.03.11.07.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 11:07:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADkTA4PQspBbSFTVS9GZcGokvSR7zgyAqSq_kEE-EUqxpbfYQw@mail.gmail.com>
Date: Thu, 3 Nov 2011 19:07:04 +0100
Message-Id: <93B560B0-AFAE-4B57-B1A4-6516085B4E9E@dominion.thruhere.net>
References: <cover.1320340081.git.bruce.ashfield@windriver.com>
	<8B9E217B-2135-4E8D-9180-FAFD7E7478E0@dominion.thruhere.net>
	<CADkTA4PQspBbSFTVS9GZcGokvSR7zgyAqSq_kEE-EUqxpbfYQw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: dvhart@linux.intel.com, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update base to v3.0.8 + meta config changes
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
X-List-Received-Date: Thu, 03 Nov 2011 18:13:18 -0000
X-Groupsio-MsgNum: 11877
Content-Type: multipart/signed;
	boundary="Apple-Mail=_71FD9E38-56B4-4038-9DD0-93DDA65C649A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_71FD9E38-56B4-4038-9DD0-93DDA65C649A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 3 nov. 2011, om 18:53 heeft Bruce Ashfield het volgende geschreven:

> On Thu, Nov 3, 2011 at 1:22 PM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>=20
>> Op 3 nov. 2011, om 18:11 heeft Bruce Ashfield het volgende =
geschreven:
>>=20
>>> Richard/Saul,
>>>=20
>>> Here's a bump to 3.0.8 for the 3.0 kernel, and some config changes =
from TomZ.
>>> These are destined for master and separate from any point updates to =
the 1.1
>>> release.
>>>=20
>>> In case anyone cares my -dev kernel also has these changes, and it =
will take
>>> them to the latest kernel shortly.
>>>=20
>>> This also doesn't bump the preempt-rt branches, since they'll be =
updated
>>> to the new -rt first, before taking the 3.0.x stable updates.
>>>=20
>>> Built and booted for all the qemu targets.
>>>=20
>>> cc: Tom Zanussi <tom.zanussi@intel.com>
>>> cc: Darren Hart <dvhart@linux.intel.com>
>>>=20
>>> Cheers,
>>>=20
>>> Bruce
>>>=20
>>> The following changes since commit =
9b76e6a2cfc5a4d779f3b06e3acc5ff7b8275470:
>>>=20
>>>  meta: glib-2.0: don't apply qsort_r test removable patch for native =
version (2011-11-02 09:08:28 +0000)
>>>=20
>>> are available in the git repository at:
>>>  git://git.pokylinux.org/poky-contrib zedd/kernel
>>>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/kernel
>>=20
>> Do you also have a tree against oe-core?
>=20
> I don't have a contrib branch, I asked a few week ago, but still don't =
have it
> created. So I have a tree, but no where to push submissions.

Forking https://github.com/openembedded/oe-core is easy enough :)



--Apple-Mail=_71FD9E38-56B4-4038-9DD0-93DDA65C649A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6y2EgACgkQMkyGM64RGpF8pQCfZf/ZKNINr8BJC9g/YX5HC9a5
5H8An3UQQQg7RqJxRw/OWL4xR1HHsPHU
=Adzp
-----END PGP SIGNATURE-----

--Apple-Mail=_71FD9E38-56B4-4038-9DD0-93DDA65C649A--
