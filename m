Received: from server505g.appriver.com ([98.129.35.12]
	helo=server505.appriver.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@brightsign.biz>) id 1UaSj1-0004dy-HD
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 17:25:52 +0200
X-Note-AR-ScanTimeLocal: 5/9/2013 10:02:35 AM
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Primary: philb@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-ALLOW: @brightsign.biz ALLOWED
X-Virus-Scan: V-
X-Note: Spam Tests Failed: 
X-Country-Path: PRIVATE->UNITED STATES->UNITED STATES
X-Note-Sending-IP: 98.129.35.1
X-Note-Reverse-DNS: smtp.exg5.exghost.com
X-Note-Return-Path: philb@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G319 G320 G321 G322 G326 G327 G338 G434 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: ALLOWEDSENDER
X-Note: Headers Injected
Received: from [98.129.35.1] (HELO smtp.exg5.exghost.com)
	by server505.appriver.com (CommuniGate Pro SMTP 6.0.2)
	with ESMTPS id 379750189; Thu, 09 May 2013 10:02:35 -0500
Received: from [172.30.1.45] (86.30.57.232) by smtp.exg5.exghost.com
	(98.129.23.33) with Microsoft SMTP Server (TLS) id 8.3.297.1;
	Thu, 9 May 2013 10:02:32 -0500
Message-ID: <1368111750.14512.415.camel@phil-desktop.brightsign>
From: Phil Blundell <philb@brightsign.biz>
To: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 16:02:30 +0100
In-Reply-To: <1368108482.14512.397.camel@phil-desktop.brightsign>
References: <1368104132-30116-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1368105605.16243.65.camel@pb-ThinkPad-R50e>
	<CAMZjud2TzEqknP_0wH=CdAjvrz1MRXgfKRo+ytC1h+mOEXCYJg@mail.gmail.com>
	<1368108482.14512.397.camel@phil-desktop.brightsign>
Organization: BrightSign Digital Ltd
X-Mailer: Evolution 3.4.4-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc: include libgcc when libpthread is enabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 15:25:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-09 at 15:08 +0100, Phil Blundell wrote:
> There was some previous discussion of how to detect the precise
> situation that caused libgcc_s to be required, though my recollection
> of all the details is a bit hazy.  I'll see if I can find it in the
> archives.  

It turns out that the previous discussion was actually on irc, not on
the mailing list.  See:

http://ibot.rikers.org/%23oe/20080725.html.gz

from about 21:56 onwards, and:

http://ibot.rikers.org/%23oe/20080729.html.gz

from about 21:10 onwards.

p.




