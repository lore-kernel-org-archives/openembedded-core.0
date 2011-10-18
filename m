Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGAay-0006ay-36
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 16:24:44 +0200
Received: by eyd9 with SMTP id 9so599903eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 07:18:54 -0700 (PDT)
Received: by 10.14.15.96 with SMTP id e72mr308990eee.95.1318947532974;
	Tue, 18 Oct 2011 07:18:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a49sm6235029eea.2.2011.10.18.07.18.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 07:18:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
Date: Tue, 18 Oct 2011 16:18:50 +0200
Message-Id: <7B75FA82-846A-4B85-872E-0B611C41C11D@dominion.thruhere.net>
References: <bb4834366391a733cbb331a52cae44f295bda2a1.1318901607.git.raj.khem@gmail.com>
	<32b67c2bc8ebfcbf0db650e93a2152399ca89ee7.1318901607.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Tue, 18 Oct 2011 14:24:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 okt. 2011, om 03:39 heeft Khem Raj het volgende geschreven:

> We have been hitting this issue on ARM/thumb and
> have a workaround in place to compile samba
> =
http://git.openembedded.org/openembedded/commit/recipes/samba/samba_3.2.15=
.bb?id=3D4ba7aa07c0dcd28f94515ff9927e2a04403fcf15
> This backport should fix the gcc bug

Can I have a rough ETA when this is going into master? There are meta-oe =
patches depending on this. No rush, this is just to order my patch queue =
more intelligently :)

regards,

Koen=


