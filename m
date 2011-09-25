Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R7mgq-0005Nq-2L for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 13:16:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PBH2O3006125 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 12:17:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iAggIE-rgfNL
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 12:17:02 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8PBGwkr006115
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 12:17:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 25 Sep 2011 12:10:35 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316949043.8185.4.camel@ted>
Mime-Version: 1.0
Subject: Quick note about one of the autobuilder failures
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
X-List-Received-Date: Sun, 25 Sep 2011 11:16:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the autobuilder now stressing out sstate more, we're seeing some
interesting build failures. One example which caught my eye is:

http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/100/steps/shell_57/logs/stdio

What this is telling us is we actually have some dependency issues in
the metadata. I've already established that:

libXinerama.so.1 is needed by libgtk-2.0-2.22.1-r4.armv5te
means that gtk+ needs to disable xinerama (preferred) or depend on
xinerama.

I've also seem a local error which showed:
neon needs to depend on libproxy (preferred) or to explicitly disable
it.

Once you understand these messages mean we need to look into the base
recipes dependencies, they become easier to dig into and fix.

Cheers,

Richard







