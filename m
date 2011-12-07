Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYGHf-0001Ej-Pr
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 13:07:35 +0100
Received: by eaao14 with SMTP id o14so341008eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 04:00:47 -0800 (PST)
Received: by 10.213.26.10 with SMTP id b10mr474416ebc.38.1323259247085;
	Wed, 07 Dec 2011 04:00:47 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm4961654eec.1.2011.12.07.04.00.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 04:00:46 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 7 Dec 2011 13:00:41 +0100
In-Reply-To: <4EDF4D98.7060803@emagii.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EDF2360.7090402@emagii.com> <1323249403.19363.66.camel@ted>
	<4EDF4D98.7060803@emagii.com>
Message-Id: <E5CF0974-DCA6-4DAA-859C-ED40990CC11E@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Possible stale tags in the download directory
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
X-List-Received-Date: Wed, 07 Dec 2011 12:07:35 -0000
X-Groupsio-MsgNum: 13726
Content-Type: multipart/signed;
	boundary="Apple-Mail=_01D282CD-C412-483A-B0A1-309D895D85F8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_01D282CD-C412-483A-B0A1-309D895D85F8
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 7 dec. 2011, om 12:27 heeft Ulf Samuelsson het volgende geschreven:

> On 2011-12-07 10:16, Richard Purdie wrote:
>> On Wed, 2011-12-07 at 09:27 +0100, Ulf Samuelsson wrote:
>>> When I look at the "downloads" location I find a lot of files called.
>>> 
>>> "11_usagi_fix.patch.done"
>>> 
>>> but no  "11_usagi_fix.patch" file in the directory.
>>> 
>>> If this is a indication of that a patch has been downloaded,
>>> what happens if you for some reason or other delete your
>>> OE-core directory and keep the downloads directory.
>>> 
>>> When you start from fresh, all the tags are then stale.
>>> 
>>> (Deleting the "downloads" directory seems a bad idea)
>>> 
>>> I think that if there should be tags in the "downloads" directory,
>>> they should only reflect things which are downloaded to the
>>> "downloads" directory, and nothing else.
>>> 
>>> As for the tags in the directory, I think a better approach
>>> is to download a file "tarball.tar.bz2" to a different filename first
>>> I.E: "tarball.tar.bz2.in-progress"  and if the download completes
>>> then move the file to "tarball.tar.bz2".
>>> Should remove a lot of clutter from the "downloads" directory.
>> What we've tried to do is simplify the fetcher code paths in fetch2.
>> There were some many corner/special cases and different code paths it
>> was near impossible to tell what was going on. One of the side effects
>> is that local file:// urls do touch the done stamp in the same way as
>> other downloads. The main reason for those files is now checksum
>> tracking. If the done stamps were part of tmpdir, we'd keep checksumming
>> the contents of the downloads at each build rather than once after the
>> download. The way the implementation works, there is very little risk
>> from stale stamps, it would just mean the checksum code wouldn't get
>> triggered and that is likely unneeded for a local file:// url anyway.
>> 
>> So yes, its not ideal but looking at the code I'd be surprised if a
>> build ever broke due to it.
>> 
> Maybe I am paranoid, but I think I remember seeing tarballs developing
> bit rot when moved between different machines.

And that's why checksums are checked before do_unpack.



--Apple-Mail=_01D282CD-C412-483A-B0A1-309D895D85F8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7fVWsACgkQMkyGM64RGpGPVgCfcKITnx0HGdkFnDww9QCPTt4Z
MqwAnA5VxV4iNfysaLEv5K+/+pwJ0+bW
=GuGP
-----END PGP SIGNATURE-----

--Apple-Mail=_01D282CD-C412-483A-B0A1-309D895D85F8--
