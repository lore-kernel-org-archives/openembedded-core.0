Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QxwoK-0001vt-Rs
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 10:03:12 +0200
Received: by wwe32 with SMTP id 32so4311159wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 00:58:21 -0700 (PDT)
Received: by 10.216.135.208 with SMTP id u58mr3357109wei.110.1314604700938;
	Mon, 29 Aug 2011 00:58:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y61sm2710185wec.30.2011.08.29.00.58.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 00:58:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
Date: Mon, 29 Aug 2011 09:58:16 +0200
Message-Id: <D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Graeme Gregory <dp@xora.org.uk>, Jason Kridner <jdk@ti.com>, k-kooi@ti.com
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
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
X-List-Received-Date: Mon, 29 Aug 2011 08:03:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2011, om 08:12 heeft Joel A Fernandes het volgende =
geschreven:

> Script written by Graeme Gregory
> http://www.angstrom-distribution.org/demo/beagleboard/mkcard.txt
>=20
> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> Cc: Graeme Gregory <dp@xora.org.uk>
> Cc: Jason Kridner <jdk@ti.com>
> Cc: k-kooi@ti.com
> ---
> .../mkcard/mkcard-0.5/COPYING.patch                |  344 =
++++++++++++++++++++
> meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt |   79 +++++
> meta/recipes-devtools/mkcard/mkcard_0.5.bb         |   19 +
> 3 files changed, 442 insertions(+), 0 deletions(-)
> create mode 100644 =
meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch
> create mode 100755 meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
> create mode 100644 meta/recipes-devtools/mkcard/mkcard_0.5.bb

This script is BSP specific and shouldn't live in the OE-core layer.=


