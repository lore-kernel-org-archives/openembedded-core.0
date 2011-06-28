Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbZoO-0000jX-Ni for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 17:02:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SEx54M025550
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:59:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25383-03 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:59:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SEx0xL025542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 15:59:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jun 2011 15:58:45 +0100
Message-ID: <1309273125.20015.319.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: A few random things on my to fix list
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
X-List-Received-Date: Tue, 28 Jun 2011 15:02:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I've been merging patches but there are a few things I've noticed which
could use some attention. I've kept a quick list of these:

* Need to have eglibc-dev not
include /usr/include/eglibc-locale-internal-i586-poky-linux/*

* Need to use something like  gnomebase.bbclass for glib-networking

* Is the new gcc config, I'd prefer not to hardcode SYSTEMLIBS_DIR for 
  lib, lib32 and lib64 in GLIBC_DYNAMIC_LINKER* but code them 
  separately and allow for future manoeuvring in the multilib code

* Consider having the locale generation done by a Makefile and use 
  PARALLE_MAKE to enable parallelism.

* Consider stripping binaries/libraries in the sysroot (less diskspace 
  usage, smaller sstate package and faster linking if there is less 
  file to read?)

* Take a long hard look at the way distrodata is using overrides as it 
  looks suboptimal

* Move things out of local.conf.sample to local.conf.extended

Cheers,

Richard



