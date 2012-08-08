Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1SzBtA-0004PQ-2n
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 21:25:52 +0200
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7CDF12232546
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 21:14:06 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 6613F223202E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 21:14:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (g230116152.adsl.alicedsl.de
	[92.230.116.152]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2012 21:14:05 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 015A63C65B; Wed,  8 Aug 2012 21:14:03 +0200 (CEST)
Date: Wed, 8 Aug 2012 21:14:03 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120808191403.GA5174@mail.familie-heinold.de>
References: <50212459.8080801@nedap.com>
	<CAMKF1soH+456jfMtDtQWHtgV-05ZcGe9U4w7PEm0FRnhtkiAcw@mail.gmail.com>
	<502260AE.5040902@nedap.com>
MIME-Version: 1.0
In-Reply-To: <502260AE.5040902@nedap.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: libtool
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
X-List-Received-Date: Wed, 08 Aug 2012 19:25:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 08, 2012 at 02:50:54PM +0200, Jaap de Jong wrote:
> 
> On 08/07/2012 05:15 PM, Khem Raj wrote:
> >On Tue, Aug 7, 2012 at 7:21 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> >>I've seen this one before, but can't remember where...
> >>
> >>     | libtool: link: warning: cannot determine absolute directory name of
> >>`=/usr/lib'
> >>
> >>Anyone knows how to fix?
> >this package uses old libtool update the libtool scripts for it
> >
> what would be the easiest way to do that?

Remove the libtool m4 macros and use autotools, serval recipes in oe-core
and meta-oe does this.

Bye Henning


