Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QkKAx-0001zH-JD for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 20:10:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI66SX030525
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:06:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30123-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:06:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6MI61EW030518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 19:06:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Jul 2011 19:05:58 +0100
Message-ID: <1311357958.2344.160.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Mutltilib patch status
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
X-List-Received-Date: Fri, 22 Jul 2011 18:10:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm not as far advanced as I'd like to have been with the multilib
patches today but I've posted out the current cleaned up patches I have
to give an idea of where things are heading. I appended them to the
previous three patches I sent out and believe those patches so far so
stand on their own merit.

The complete series of my cleanup work so far are available at:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/ml3

and you can enable multilib with lines like:

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE_virtclass-multilib-lib32 = "i586"
DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"

in local.conf.

I've completed the ia32 tune files, I have not handled arm/mips/powerpc
yet. I've used a slightly improved formatting from Mark's version and
included more information in the commit messages to help people
understand the changes.

I've included two of Paul's bitbake BBCLASSEXTEND fixes in the series
for completeness.

Cheers,

Richard




