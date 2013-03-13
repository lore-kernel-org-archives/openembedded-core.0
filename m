Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>)
	id 1UFnCb-0004Qx-Hl; Wed, 13 Mar 2013 16:03:05 +0100
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id 0A289D22CD; Wed, 13 Mar 2013 15:46:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 34B1CD22B2;
	Wed, 13 Mar 2013 15:45:48 +0100 (CET)
Message-ID: <5140911A.90604@linaro.org>
Date: Wed, 13 Mar 2013 15:45:46 +0100
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: linaro-dev@lists.linaro.org, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.4.6
Subject: ATTENTION: OpenEmbedded layers from Linaro have new structure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2013 15:03:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello

Today I made several changes to OpenEmbedded layers hosted on
git.linaro.org:

- - meta-aarch64
- - meta-linaro

Meta-aarch64 is now empty and is obsolete. Probably will be removed from
server in about month or two.
Meta-linaro repository got new structure based on meta-openembedded one
and contains three layers:

- - meta-aarch64
- - meta-linaro
- - meta-linaro-toolchain

Today meta-aarch64 is just a copy of old one but everything not related
to ARMv8 will be moved from it to meta-linaro.

Meta-linaro-toolchain contains just gcc-linaro and support for external
Linaro cross toolchains (armv7a and armv8 ones).

I considered creation of meta-aarch64-arm-toolchain one with ARM Ltd.
version of gcc but it is not often used option so can stay where it is
now (meta-aarch64).

Instructions how to start building for ARMv8 (with OE) are in wiki:
https://wiki.linaro.org/HowTo/ARMv8/OpenEmbedded

Note that any scripts present in 'meta-aarch64' got dropped. If you want
easy way then use 'jenkins-setup' scripts like it is described in wiki.
They are written to be as easy to use as possible.

If you have any problems/questions: reply to this email.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJRQJERAAoJECbKqQEReiUeKFgQAMUYDB1ymQs8ZspWVynJVJMQ
InFsFQUd/QZCgNB9GcG6IepzmViHeMlIxNQ7u+KFABGV8uAz8gwdgcPtWwa/dc1b
wu8u84mmwy77WBIMuX087AiXdg8WhJDJz5sztBoK2PL8Ljn1TFB/R17Ew90eN3zn
o1DpPnbgMGs67phNiTy8GiQxyaaLZub0ZZZ5v00tWdt7x4vazw6n2r8/o+wzGLj2
536KI13Sepso2dg2mrpqzrwVH8KFP7S/rRiDdKI4Gw9FlTPiaiEEadX7OPKx8YC5
j1WIR0u66LCSe+F3NsfNfEgTOXPGVUNgqvemwGYXQuOLUKz7nnnkEdVRUegSuEVj
+bZsgzFunghOsvEgX4ynxLVXgOrkiH4PPMhD+OWcB1pso9+ZdVFTVO2oGOnDg9pK
ov7lidEoUDDIZqHxjy5cV36jDnXt8BTI9uEIjVo9gH/0g/67QImXHVONcppg2MfM
GDfhYorkah3VTo9zgHZKCDEIstT1OsCSg+PNeKCAN6fDUdmnzGxCJNEj2CaRAzaI
vJekxAK0+ptscJ9c+bUmAtcBK+XRvJ9K3naN+apUm13Y6INwKuS68knWzOJc0xhd
rpPQ2EcYd8FP1gspjNJPyQKWr2pAUGQkOGkhHrsrb4nj6mkMDDgZ2ET1x8uxI056
vMRn7PKF7x3bItUP9NzA
=GNf7
-----END PGP SIGNATURE-----


