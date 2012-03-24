Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SBOzZ-0002Sz-Fn
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 12:18:41 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 804FA223263B;
	Sat, 24 Mar 2012 12:09:46 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id CCDBE2232639;
	Sat, 24 Mar 2012 12:09:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225005117.adsl.alicedsl.de
	[92.225.5.117]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Sat, 24 Mar 2012 12:09:45 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 2E7613C4C0; Sat, 24 Mar 2012 12:09:45 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 12:09:41 +0100
Message-Id: <1332587383-23633-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.9.1
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] relocatable.bbclass: do not erease already existing ORIGIN
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
X-List-Received-Date: Sat, 24 Mar 2012 11:18:41 -0000

Hi,

while building openjdk I discovered that relocatable.bbclass strips
all PATHS with ORIGIN, that is problematic, when binaries like an jdk
is installed not in the standard paths /lib or /usr/lib.

This patch let all exisiting ORIGIN stay in the binary. So
far I only saw problems with some perl-native libs, where chrpath fails
now, because the path is to long. But it seems they work anyway.

While letting the path stay in binary it occurs that whitespaces at the end
of the last path sneaked some how in. So I made re.sub line to clean this up.

Bye Henning

PS: I have to appologize, that I send it to oe-dev before.

Henning Heinold (1):
  relocatable.bbclass: do not erease already existing ORIGIN paths and
    sanity resulting rpath

 meta/classes/relocatable.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

-- 
1.7.9.1


