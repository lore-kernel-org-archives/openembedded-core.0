Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RMMQh-0004z5-Rw
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 17:15:43 +0100
Received: by wwf4 with SMTP id 4so3110694wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 09:09:34 -0700 (PDT)
Received: by 10.216.229.3 with SMTP id g3mr4479634weq.79.1320422974007;
	Fri, 04 Nov 2011 09:09:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fr4sm16802061wbb.0.2011.11.04.09.09.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 09:09:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1320421523.20107.118.camel@ted>
Date: Fri, 4 Nov 2011 17:09:28 +0100
Message-Id: <9EE60FF1-8F0B-4F49-B807-3CC198A4F24A@dominion.thruhere.net>
References: <1320407079-24810-1-git-send-email-koen@dominion.thruhere.net>
	<1320421523.20107.118.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: "saul.wold" <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v3] rootfs_ipk bbclass: special-case base-passwd preinst to run first
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
X-List-Received-Date: Fri, 04 Nov 2011 16:15:44 -0000
X-Groupsio-MsgNum: 11906
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A3D00590-B54B-4241-9977-8AAC3E156175";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A3D00590-B54B-4241-9977-8AAC3E156175
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 4 nov. 2011, om 16:45 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-11-04 at 12:44 +0100, Koen Kooi wrote:
>> Preinst are run alphabetically which breaks when e.g. avahi-daemon =
needs /etc/passwd present.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> meta/classes/rootfs_ipk.bbclass |    6 ++++++
>> 1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> I've merged this to master. I'm not particularly happy about it but
> right now I can't see a good way to fix this short/medium term.

RP and discussed this and we're both not happy with it, but no viable =
other options short/medium term. The idea is to see if we can have opkg =
run all the preinsts since opkg does dependency resolving nowadays.

regards,

Koen=

--Apple-Mail=_A3D00590-B54B-4241-9977-8AAC3E156175
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk60DjkACgkQMkyGM64RGpGmewCeO2TrLBdxsFjSUHXmnu2LyZxz
CkQAn0/RHlBoUnlrr9jWQnFi9+XZUHZJ
=Atqt
-----END PGP SIGNATURE-----

--Apple-Mail=_A3D00590-B54B-4241-9977-8AAC3E156175--
