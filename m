Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QjoS1-0002Wj-Nv
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:17:45 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 14FBB11000AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:13:40 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 751F2110009A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g225145048.adsl.alicedsl.de
	[92.225.145.48]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:13:39 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id F30363C155; Thu, 21 Jul 2011 10:12:09 +0200 (CEST)
Date: Thu, 21 Jul 2011 10:12:09 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110721081209.GA3423@rhein.zuhause.netz>
References: <1311228617-29732-1-git-send-email-raj.khem@gmail.com>
	<1311228617-29732-3-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1311228617-29732-3-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [PATCH 3/6] libiconv: Fix build failure on 1.13.1
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
X-List-Received-Date: Thu, 21 Jul 2011 08:17:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

what was the reason to patch out the libtool-macros instead of deleting them? That would be
reduce the changelines a lot.

Bye henning


