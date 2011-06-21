Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ5Cu-0001UY-7q
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:57:48 +0200
Received: by wwg12 with SMTP id 12so7365wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 10:54:15 -0700 (PDT)
Received: by 10.227.24.72 with SMTP id u8mr6484357wbb.94.1308678854754;
	Tue, 21 Jun 2011 10:54:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej7sm4186162wbb.36.2011.06.21.10.54.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 10:54:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201106211842.09743.paul.eggleton@linux.intel.com>
Date: Tue, 21 Jun 2011 19:54:12 +0200
Message-Id: <331DEFC1-20ED-45EE-B84F-429E55EB6C75@dominion.thruhere.net>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
	<1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
	<D1BE4C62-7336-430E-9072-F827A2513CAD@dominion.thruhere.net>
	<201106211842.09743.paul.eggleton@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 17:57:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 19:42 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 21 June 2011 18:34:54 Koen Kooi wrote:
>> Can you add a comment above the rev in the lines of "bitbake sucks, =
we need
>> to use a rev instead of a tag, this one maps to 2011.03"?
>=20
> I will add a comment about the revision corresponding to the tag, good =
idea.
>=20
> However, if you do specify a tag for SRCREV and SRCPV is part of PV

Since we're using the 2011.03 tag, why is SRCPV in PV at all? It should =
be exactly the same as the tarball.=


