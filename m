Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCJwN-00087r-D2
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 01:34:55 +0200
Received: by eyx24 with SMTP id 24so2425090eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 16:29:17 -0700 (PDT)
Received: by 10.223.14.153 with SMTP id g25mr11592891faa.6.1318030157457;
	Fri, 07 Oct 2011 16:29:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm15164519fab.11.2011.10.07.16.29.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 16:29:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 8 Oct 2011 01:29:10 +0200
Message-Id: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1244.3)
X-Mailer: Apple Mail (2.1244.3)
Subject: Bitbake dependency failure with git fetcher
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
X-List-Received-Date: Fri, 07 Oct 2011 23:34:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

Everytime openssl and a git recipe get changed at the same time, I end =
up with:

| =
/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/g=
it.real: error while loading shared libraries: libcrypto.so.1.0.0: =
cannot open shared object file: No such file or directory

Why is bitbake not resolving the git-native -> openssl-native dep before =
invoking the git fetcher?

regards,

Koen=


