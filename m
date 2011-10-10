Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDKXu-0001nV-Cr
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 20:25:54 +0200
Received: by gyg8 with SMTP id 8so5706886gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 11:19:53 -0700 (PDT)
Received: by 10.223.65.76 with SMTP id h12mr33780213fai.7.1318270792840;
	Mon, 10 Oct 2011 11:19:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id w14sm32932762fae.13.2011.10.10.11.19.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 11:19:52 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 10 Oct 2011 20:19:46 +0200
Message-Id: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: Multiple git repos in SRC_URI and/or git submodules support
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
X-List-Received-Date: Mon, 10 Oct 2011 18:25:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

In meta-oe we have a recipe that is using git submodules to drag it =
parts of the source and to do it is doing the submodule fetching in =
do_configure. This is bad for various reasons, so I'd like to fix it. =
The options I see:

1) Make fetch2 to do git clone --recursive and later realize it is now =
non-determistic
2) Use multiple git repos in SRC_URI and then to cp/mv/etc to emulate =
submodules
3) convince upstream submodules are bad

I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is =
already supported. I've seen various patches that add an 'unpackdir' or =
similar, but I can't find any docs on it. Can someone enlighten me on =
the current status of that?

regards,

Koen=


