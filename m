Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Si0Yg-0005Ad-2H
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 11:53:42 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id A3638223202F;
	Fri, 22 Jun 2012 11:34:24 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 10EA2223202E;
	Fri, 22 Jun 2012 11:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052225205.adsl.alicedsl.de
	[78.52.225.205]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Fri, 22 Jun 2012 11:34:23 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id B25E03C647; Fri, 22 Jun 2012 11:34:21 +0200 (CEST)
Date: Fri, 22 Jun 2012 11:34:20 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120622093420.GA21097@rhein.zuhause.netz>
References: <CALbNGRQaXTcnNPX+W04tnZzchkTZDvYdUJd2CYT03CWbW6pF9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQaXTcnNPX+W04tnZzchkTZDvYdUJd2CYT03CWbW6pF9g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] (no subject)
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
X-List-Received-Date: Fri, 22 Jun 2012 09:53:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

yes, that means the recpies are deleted in oe-core. For a quick workaround just delete the append files.
Another issue for now is the removing of the linux-tools.inc So you have to delete the include in all
the kernel recipes.

Bye Henning


