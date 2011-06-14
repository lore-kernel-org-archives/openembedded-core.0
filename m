Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWOLF-0000dx-1n
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 09:47:17 +0200
Received: by wwb17 with SMTP id 17so4672440wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 00:43:49 -0700 (PDT)
Received: by 10.216.237.136 with SMTP id y8mr388923weq.76.1308037429057;
	Tue, 14 Jun 2011 00:43:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm1445245wes.10.2011.06.14.00.43.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 00:43:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308029130-29774-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 09:43:46 +0200
Message-Id: <1836E884-F668-4D8C-B4DF-A27B7FC6FFF8@dominion.thruhere.net>
References: <1308029130-29774-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] allarch.bbclass: Set FEED_ARCH to 'allarch'
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
X-List-Received-Date: Tue, 14 Jun 2011 07:47:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 07:25 heeft Khem Raj het volgende geschreven:

> PACKAGE_ARCH is set to BASE_PACKAGE_ARCH so we do not
> need to define it here since we already define BASE_PACKAGE_ARCH
>=20
> Additionally set FEED_ARCH to 'allarch'

That would break all existing feeds and feed-configs, which I don't =
think is acceptable.=


