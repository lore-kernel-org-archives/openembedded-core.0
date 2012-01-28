Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rr3jj-0000KW-W2
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 09:34:16 +0100
Received: by wgbdt11 with SMTP id dt11so2412920wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jan 2012 00:26:26 -0800 (PST)
Received: by 10.180.84.201 with SMTP id b9mr16072532wiz.4.1327739186184;
	Sat, 28 Jan 2012 00:26:26 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q2sm4903489wiy.7.2012.01.28.00.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jan 2012 00:26:25 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327737477-16477-1-git-send-email-andrea.adami@gmail.com>
Date: Sat, 28 Jan 2012 09:26:22 +0100
Message-Id: <D34BB5AA-865E-45AE-823A-328044DE1C6D@dominion.thruhere.net>
References: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
	<1327737477-16477-1-git-send-email-andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH v2] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Sat, 28 Jan 2012 08:34:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jan. 2012, om 08:57 heeft Andrea Adami het volgende geschreven:

> * Introduce DEFAULT_TIMEZONE variable ('Universal', present in base =
package)
> * and add /etc/timezone during do_install.
> * While there, fix hardcoded references to $exec_prefix (/usr).
> * Add the pkg_postinst script (adapted from Gentoo).
> * Create /etc/localtime during postinst.
> * Bump PR
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

A quick look makes me think this patch is a lot better than the current =
situation.=


