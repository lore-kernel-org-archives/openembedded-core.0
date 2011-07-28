Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmNpE-0004Ig-EZ
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:28:20 +0200
Received: by wyg30 with SMTP id 30so7912wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 03:22:42 -0700 (PDT)
Received: by 10.227.10.66 with SMTP id o2mr1171608wbo.36.1311848065978;
	Thu, 28 Jul 2011 03:14:25 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fx12sm702087wbb.25.2011.07.28.03.14.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 03:14:24 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311846558.30326.420.camel@phil-desktop>
Date: Thu, 28 Jul 2011 12:14:17 +0200
Message-Id: <D489697C-D752-4255-8110-9AC1468D4D87@dominion.thruhere.net>
References: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>
	<1311846558.30326.420.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCHv2] gst-plugins: partially sync packaging with OE .dev
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
X-List-Received-Date: Thu, 28 Jul 2011 10:28:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 11:49 heeft Phil Blundell het volgende geschreven:

> On Thu, 2011-07-28 at 11:44 +0200, Koen Kooi wrote:
>> +ALLOW_EMPTY =3D "1"
>=20
> Is that necessary?  You seem to be setting ALLOW_EMPTY_${PN}-meta=3D1 =
in
> your python code anyway.

In OE classic that was to keep ${PN} alive after all libs and apps were =
removed, I'm not sure we need it in OE-core.

regards,

Koen=


