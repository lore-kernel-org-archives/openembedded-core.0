Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJUgU-0004bQ-SP
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 19:55:54 +0200
Received: by wye20 with SMTP id 20so4565100wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 10:53:06 -0700 (PDT)
Received: by 10.227.10.141 with SMTP id p13mr1579618wbp.75.1304963585708;
	Mon, 09 May 2011 10:53:05 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	l24sm3898690wbc.64.2011.05.09.10.53.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 10:53:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201105091932.06238.leitl@fim.uni-passau.de>
Date: Mon, 9 May 2011 19:53:02 +0200
Message-Id: <69719FEB-AD08-4D01-B1B0-D8291AD1DEFC@dominion.thruhere.net>
References: <201105090016.46391.leitl@fim.uni-passau.de>
	<1304958486.18625.11.camel@doubt>
	<201105091932.06238.leitl@fim.uni-passau.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Patch for fixing build issues with external kernel modules.
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
X-List-Received-Date: Mon, 09 May 2011 17:55:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2011, om 19:32 heeft Franz Leitl het volgende geschreven:

> Hi,
>=20
> Am Montag 09 Mai 2011, 18:28:06 schrieben Sie:
>>> I've tried to get compcache kernel module building against 2.6.34 =
from
>>> shr- core but found some issues with kernel.bbclass and =
module.bbclass.
>>>=20
>>> The kernel.bbclass deletes the .c files from scripts directory which =
are
>>> later needed by make prepare to recreate bound.h and other files.
>>> Compcache kernel module, for example, depends on bounds.h.
>>=20
>> The bounds.h should not need to be recreated. It is created during =
the
>> build of the kernel, and since 2.6.26, the makefile knows not to =
remove
>> it.
> Compache does not build without bounds.h and this file is missing in =
the staging directory for what ever reason.

I ran into the same and I did the following:

=
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstrument=
s/commit/?id=3D7bcba149f05cc9c5d8ce956ee40e2c6849601470

regards,

Koen=


