Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RQygL-0007PI-JJ
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:54:57 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A414011001B2;
	Thu, 17 Nov 2011 10:48:33 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A01C91100182;
	Thu, 17 Nov 2011 10:48:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (g225005235.adsl.alicedsl.de
	[92.225.5.235]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Thu, 17 Nov 2011 10:48:32 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 29D393C49D; Thu, 17 Nov 2011 10:48:32 +0100 (CET)
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Nov 2011 10:48:29 +0100
Message-Id: <1321523310-29625-1-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.7.3
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] useradd.bbclass: do not let depend native packages on base-passwd from target
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
X-List-Received-Date: Thu, 17 Nov 2011 09:54:57 -0000

Hi,

with the setup now in useradd.bbclass, at least dbus-native depends
on the base-passwd from target. I think this is not wanted.
My patch resets the DEPENDS line for native packages similar to
nativesdk.

Henning Heinold (1):
  useradd.bbclass: do not let depend native packages on base-passwd
    from target

 meta/classes/useradd.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.7.3


