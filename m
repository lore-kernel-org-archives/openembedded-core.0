Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QRtdE-00022K-TG
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 00:11:16 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id DD488110017B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 00:08:05 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 370EB110017A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 00:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,BAYES_40
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052230155.adsl.alicedsl.de
	[78.52.230.155]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2011 00:08:05 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 38E1C3C0E8; Thu,  2 Jun 2011 00:07:00 +0200 (CEST)
Date: Thu, 2 Jun 2011 00:07:00 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110601220659.GA4601@rhein.zuhause.netz>
References: <1306944074.2529.107.camel@phil-desktop>
	<1306944235.2529.109.camel@phil-desktop>
	<5DBF32A5-22D5-4499-AD32-9C48680B7EBA@dominion.thruhere.net>
	<1306945014.2529.113.camel@phil-desktop>
	<4DE66D53.30505@windriver.com>
	<1306947245.2529.148.camel@phil-desktop>
	<4DE66FC6.4030607@windriver.com>
	<1306959728.3119.5.camel@lenovo.internal.reciva.com>
	<4DE6B685.6060501@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4DE6B685.6060501@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: dbus-native --with-x
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
X-List-Received-Date: Wed, 01 Jun 2011 22:11:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2011 at 03:00:37PM -0700, Tom Rini wrote:
> On 06/01/2011 01:22 PM, Phil Blundell wrote:
> > On Wed, 2011-06-01 at 11:58 -0500, Mark Hatle wrote:
> >> It "should" be as simple and adding --without-perl and --without-python to the
> >> configuration line...  but I haven't tried it.
> > 
> > Turns out that rpm-native already does this, but (like the dbus case)
> > there is no matching logic to get the DEPENDS right.
> > 
> > Another instance of a similar thing appears to be sqlite3-native, which
> > DEPENDS on tcl-native even though it's configured --without-tcl.
> 
> Since this keeps coming up, maybe it needs a comment.  sqlite3 needs
> tcl-native (tclsh) to generate a header file.  No tclsh, no sqlite3.

I thought that is diffrent with 3.7.x version of sqlite3.

Bye Henning


