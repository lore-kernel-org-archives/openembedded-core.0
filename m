Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5rV-0003Hx-5P
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:17:29 +0200
Received: by wwi18 with SMTP id 18so1301451wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:13:15 -0700 (PDT)
Received: by 10.227.60.140 with SMTP id p12mr171403wbh.30.1311779594593;
	Wed, 27 Jul 2011 08:13:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fo2sm173392wbb.65.2011.07.27.08.13.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:13:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311779288.30326.363.camel@phil-desktop>
Date: Wed, 27 Jul 2011 17:13:07 +0200
Message-Id: <6F3C6EDF-430E-41D4-978D-C1EB57F2DAFD@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
	<CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>
	<4E30256F.7060503@windriver.com>
	<1311778665.30326.359.camel@phil-desktop>
	<332008BD-527C-4D2C-9C39-848D4CB3E74A@dominion.thruhere.net>
	<1311779288.30326.363.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 15:17:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 17:08 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-07-27 at 17:01 +0200, Koen Kooi wrote:
>> the s3c6410 is arm1176 which should support T2. Having said that, I'm =
not  sure if that actually works since T2 was broken in silicon for =
early cortex a8 revisions.
>=20
> What makes you think that ARM1176 has T2?  I haven't actually tried
> executing Thumb-2 on one, but my recollection is definitely that it =
was
> Thumb-1 only.

In this case it's (yes, you may start making fun of me at this point) =
wikipedia: http://en.wikipedia.org/wiki/ARM#Thumb-2=


