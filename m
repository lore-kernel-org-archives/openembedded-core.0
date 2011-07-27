Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm5fy-0002s2-QN
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:05:34 +0200
Received: by wwi18 with SMTP id 18so1289797wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 08:01:20 -0700 (PDT)
Received: by 10.227.11.134 with SMTP id t6mr6325702wbt.21.1311778880429;
	Wed, 27 Jul 2011 08:01:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm167289wbb.54.2011.07.27.08.01.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 08:01:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311778665.30326.359.camel@phil-desktop>
Date: Wed, 27 Jul 2011 17:01:14 +0200
Message-Id: <332008BD-527C-4D2C-9C39-848D4CB3E74A@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<1311769062.30326.322.camel@phil-desktop>
	<1311773637.2344.365.camel@rex> <4E302051.1010308@windriver.com>
	<CA4DDB0D-23FC-449D-B5CF-66C230471794@dominion.thruhere.net>
	<4E30256F.7060503@windriver.com>
	<1311778665.30326.359.camel@phil-desktop>
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
X-List-Received-Date: Wed, 27 Jul 2011 15:05:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 16:57 heeft Phil Blundell het volgende geschreven:

> On Wed, 2011-07-27 at 09:49 -0500, Mark Hatle wrote:
>> On 7/27/11 9:33 AM, Koen Kooi wrote:
>>> As I understand it:
>>>=20
>>> arm1136 doesn't have t2
>>> arm1176 does have t2
>>>=20
>>> both are armv6 :)
>>=20
>> They also don't have "thumb" support either.  So armv6 & thumb =3D=3D =
t2.
>=20
> No, that's incorrect.  Both ARM1136 and ARM1176 do have Thumb-1 and, =
as
> I wrote in my last mail, I can't think of any plausible target =
processor
> for OE that has both ARMv6 and Thumb-2.  So, for all current intents =
and
> purposes, (armv6 && thumb) =3D=3D thumb-1.

the s3c6410 is arm1176 which should support T2. Having said that, I'm =
not  sure if that actually works since T2 was broken in silicon for =
early cortex a8 revisions.=


