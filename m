Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlznW-0003nd-PZ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 10:48:58 +0200
Received: by wwi14 with SMTP id 14so2717413wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 01:44:44 -0700 (PDT)
Received: by 10.227.55.129 with SMTP id u1mr5767666wbg.85.1311756284368;
	Wed, 27 Jul 2011 01:44:44 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fx12sm1133202wbb.25.2011.07.27.01.44.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 01:44:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311755778.2344.325.camel@rex>
Date: Wed, 27 Jul 2011 10:44:41 +0200
Message-Id: <704B147D-6F12-4534-9C34-01AE69290717@dominion.thruhere.net>
References: <346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<992efbf4ec3d7c55346953dbe82f9745590e64bf.1311683981.git.richard.purdie@linuxfoundation.org>
	<969FA904-0086-42FA-B605-07B74FB728B4@kernel.crashing.org>
	<1311688752.2344.238.camel@rex>
	<627CF4AB-F07D-4285-B31C-3C5631270420@kernel.crashing.org>
	<1311697113.2344.268.camel@rex>
	<7B0836D8-31B6-407E-848E-FED9C5BFE78A@kernel.crashing.org>
	<1311720776.2344.319.camel@rex>
	<9A300C7A-E352-4566-AB92-88DF3CF743D7@kernel.crashing.org>
	<1311755778.2344.325.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 3/3] Add basic PowerPC core tune config
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
X-List-Received-Date: Wed, 27 Jul 2011 08:48:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 10:36 heeft Richard Purdie het volgende geschreven:

> [..]

> We could also put:
>=20
> GLIBC_EXTRA_OECONF =3D "--with-cpu=3De500"
>=20
> in the machine config files.

Note that that will make glibc 'machine' specific and by association all =
userspace. So if you're going that route, you need to touch TUNE_PKGARCH =
as well.

regards,

Koen=


