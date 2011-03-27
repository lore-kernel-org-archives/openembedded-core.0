Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q3oQi-0003lP-BA
	for openembedded-core@lists.openembedded.org;
	Sun, 27 Mar 2011 13:46:50 +0200
Received: by wwb17 with SMTP id 17so2541327wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2011 04:44:49 -0700 (PDT)
Received: by 10.216.143.88 with SMTP id k66mr1876124wej.15.1301226288941;
	Sun, 27 Mar 2011 04:44:48 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p5sm1435628wbg.62.2011.03.27.04.44.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Mar 2011 04:44:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 27 Mar 2011 13:44:47 +0200
Message-Id: <600E597B-5D02-419E-A378-5EE511B848FA@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1084)
X-Mailer: Apple Mail (2.1084)
Subject: Using meta-toolchain output as prebuilt toolchains
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
X-List-Received-Date: Sun, 27 Mar 2011 11:46:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

What is the preferred way of 'importing' prebuilt toolchains into =
OE-core? In oe.dev I can use this: =
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/meta/exter=
nal-toolchain-angstrom.bb to 'import' an angstrom toolchain built with =
'bitbake meta-toolchain', but I'm not sure how to do that in OE-core.

My actual use case is actually 2 use-cases:

1) Hand people a prebuilt angstrom toolchain and migrate them to OE =
while keeping the toolchain
2) "Get started in 10 minutes" type of thing, I suspect an sstate mirror =
might be better.

So any suggestions for #2 as well?

regards,

Koen=


