Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDeGQ-0001D6-C1
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 17:29:06 +0200
Received: by ywf7 with SMTP id 7so6680390ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 08:23:20 -0700 (PDT)
Received: by 10.223.62.15 with SMTP id v15mr40114410fah.22.1318346599690;
	Tue, 11 Oct 2011 08:23:19 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n18sm38068239fah.2.2011.10.11.08.23.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 08:23:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E945D1D.8050103@balister.org>
Date: Tue, 11 Oct 2011 17:23:16 +0200
Message-Id: <A82D0AC8-59C4-4725-BF37-F957C86B15E2@dominion.thruhere.net>
References: <4E945D1D.8050103@balister.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Cmake build failure
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
X-List-Received-Date: Tue, 11 Oct 2011 15:29:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2011, om 17:13 heeft Philip Balister het volgende geschreven:

> http://pastebin.com/9ZCkLkst
>=20
> Failed building for the usrp-e1xx which is omap3 based. Distro is =
angstrom.

That looks like a -as-needed linker problem, cmake seems to be lacking a =
-ltinfo




