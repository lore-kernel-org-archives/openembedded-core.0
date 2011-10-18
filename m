Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGD1a-0002o2-JF
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 19:00:22 +0200
Received: by eyd9 with SMTP id 9so771076eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 09:54:32 -0700 (PDT)
Received: by 10.14.11.4 with SMTP id 4mr433501eew.79.1318956872110;
	Tue, 18 Oct 2011 09:54:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z58sm7497806eea.3.2011.10.18.09.54.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 09:54:31 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E9DAD99.9080508@intel.com>
Date: Tue, 18 Oct 2011 18:54:24 +0200
Message-Id: <8006C9FD-F679-4D27-8729-22A8C01A9E9B@dominion.thruhere.net>
References: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
	<32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
	<7B75FA82-846A-4B85-872E-0B611C41C11D@dominion.thruhere.net>
	<4E9DAD99.9080508@intel.com>
To: Saul Wold <saul.wold@intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gcc-4.6: Backport PR46934 fix
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
X-List-Received-Date: Tue, 18 Oct 2011 17:00:22 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 18 okt. 2011, om 18:47 heeft Saul Wold het volgende geschreven:

> On 10/18/2011 07:18 AM, Koen Kooi wrote:
>>=20
>> Op 18 okt. 2011, om 03:39 heeft Khem Raj het volgende geschreven:
>>=20
>>> We have been hitting this issue on ARM/thumb and
>>> have a workaround in place to compile samba
>>> =
http://git.openembedded.org/openembedded/commit/recipes/samba/samba_3.2.15=
.bb?id=3D4ba7aa07c0dcd28f94515ff9927e2a04403fcf15
>>> This backport should fix the gcc bug
>>=20
>> Can I have a rough ETA when this is going into master? There are =
meta-oe patches depending on this. No rush, this is just to order my =
patch queue more intelligently :)
>>=20
> Koen,
>=20
> We are working on it, I am doing builds with these changes to day and =
will submit a consolidated pull for tonight and if all goes well RP will =
pull tomorrow.

Thanks! I'll check again after tomorrow :)




