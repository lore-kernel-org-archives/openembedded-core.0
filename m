Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTJ5D-0007Vq-Kp
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 21:06:15 +0100
Received: by wwf25 with SMTP id 25so9417083wwf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 11:59:42 -0800 (PST)
Received: by 10.216.182.1 with SMTP id n1mr1628519wem.53.1322078382434;
	Wed, 23 Nov 2011 11:59:42 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fy13sm21534273wbb.18.2011.11.23.11.59.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 11:59:41 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4ECD4B23.1010604@linux.intel.com>
Date: Wed, 23 Nov 2011 20:59:36 +0100
Message-Id: <F0D09963-24D8-40FF-8609-881E776D03F8@dominion.thruhere.net>
References: <cover.1322032702.git.xiaofeng.yan@windriver.com>
	<5a1109761eb7eba8ddd028bea09ec12c63bc6bbb.1322032702.git.xiaofeng.yan@windriver.com>
	<27383A15-EAE2-4714-8E61-F9B194CFB581@dominion.thruhere.net>
	<4ECD4B23.1010604@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] directfb: change check sum
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
X-List-Received-Date: Wed, 23 Nov 2011 20:06:15 -0000
X-Groupsio-MsgNum: 12842
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E4F7C9F6-1932-45B5-9323-04BBE3FDFBCE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E4F7C9F6-1932-45B5-9323-04BBE3FDFBCE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 23 nov. 2011, om 20:36 heeft Saul Wold het volgende geschreven:

> On 11/22/2011 11:37 PM, Koen Kooi wrote:
>>=20
>> Op 23 nov. 2011, om 08:21 heeft Xiaofeng Yan het volgende geschreven:
>>=20
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>=20
>>> Change check sum of directfb. The previous check sum is wrong.
>>=20
>> Why is it wrong? What has changed?
>>=20
>>=20
> Seems that when the recipe update occurred, the checksums where not =
properly updated at the same time, this is a valid and needed patch as =
it corrects the checksums for the 1.4.15 tarball.

Now put that in the commit message :)=

--Apple-Mail=_E4F7C9F6-1932-45B5-9323-04BBE3FDFBCE
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7NUKsACgkQMkyGM64RGpGR7gCeKUB/tPGjgundXo7+0ZRvJhTD
4bgAoIWC6bEvMBetMn0uVyUaXDm7dN6z
=gWrF
-----END PGP SIGNATURE-----

--Apple-Mail=_E4F7C9F6-1932-45B5-9323-04BBE3FDFBCE--
