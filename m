Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RO78A-0004NS-OL
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 13:19:50 +0100
Received: by wyh5 with SMTP id 5so1630760wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2011 04:13:35 -0800 (PST)
Received: by 10.180.80.98 with SMTP id q2mr2397869wix.53.1320840815331;
	Wed, 09 Nov 2011 04:13:35 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id db1sm2735752wib.19.2011.11.09.04.13.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Nov 2011 04:13:33 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 9 Nov 2011 13:13:25 +0100
In-Reply-To: <CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
	<4EB90155.3070705@hale.at> <1320761558.10843.39.camel@ted>
	<4EB9507C.8060507@hale.at>
	<CAPhnLPACHNsFC6rx1uNOcLKgn68D6qeTYcN=VGns+eRAEqKstw@mail.gmail.com>
Message-Id: <92D35213-63C5-49E2-A1A8-3D6AC8F00079@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on non physical disks
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
X-List-Received-Date: Wed, 09 Nov 2011 12:19:50 -0000
X-Groupsio-MsgNum: 12209
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0EB23968-3424-4288-BB52-13BFF23C9A21";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0EB23968-3424-4288-BB52-13BFF23C9A21
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 8 nov. 2011, om 16:57 heeft Flanagan, Elizabeth het volgende =
geschreven:

> On Tue, Nov 8, 2011 at 7:53 AM, Wolfram Stering =
<wolfram.stering@hale.at> wrote:
>> On 11/08/2011 03:12 PM, Richard Purdie wrote:
>>> On Tue, 2011-11-08 at 11:15 +0100, Wolfram Stering wrote:
>>>> On 11/02/2011 07:41 AM, Beth Flanagan wrote:
>>>>> From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
>>>>>=20
>>>>> tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This =
modifies
>>>>> buildstats to not collect diskio statistics when we encounter a =
case where
>>>>> the os.major/os.minor is not represented with an entry in =
/proc/diskstats.
>>>> A similar issue exists for building on a btrfs partition.
>>>> I posted a message on Oct 28 concerning buildstats on btrfs =
volumes.
>>>> The problem there is, that btrfs's stat() reports fake device ids =
that
>>>> cannot be found in /proc/diskstats.
>>> Did this patch help address that problem for you too?
>>=20
>> I'll be able to check that tomorrow and report back.
>=20
> It should as the patch will just disable diskio collection if it
> cannot find a valid device id in /proc/diskstats. Let me know if it
> doesn't and I'll rework it and resubmit.

Related question: what do you use to visualize the buildstats? I heard =
rumours about getting bootchart to support our format natively, is that =
the case? I will be needing pretty graphics for a report on the oe-core =
buildflow in a few weeks :)

regards,

Koen=

--Apple-Mail=_0EB23968-3424-4288-BB52-13BFF23C9A21
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk66bmcACgkQMkyGM64RGpHMCQCguHdgtS3SrIVV5+T1dOktTpAT
FkQAnRZzZqwPJlGa3QlGGmxRrZnNtv/8
=fEA3
-----END PGP SIGNATURE-----

--Apple-Mail=_0EB23968-3424-4288-BB52-13BFF23C9A21--
