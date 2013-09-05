Return-Path: <philb@brightsign.biz>
Received: from server505.appriver.com (server505d.appriver.com [98.129.35.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4997160F1B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 12:07:22 +0000 (UTC)
X-Note-AR-ScanTimeLocal: 9/5/2013 7:07:23 AM
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Policy: GLOBAL - brightsign.biz
X-Primary: philb@brightsign.biz
X-Note: This Email was scanned by AppRiver SecureTide
X-Virus-Scan: V-
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-68/SG:2 9/5/2013 7:07:03 AM
X-GBUdb-Analysis: 0, 98.129.35.1, Ugly c=1 p=-0.917716 Source White
X-Signature-Violations: 0-0-0-3145-c
X-Note-419: 15.6007 ms. Fail:0 Chk:1348 of 1348 total
X-Note: SCH-CT/SI:0-1348/SG:1 9/5/2013 7:07:09 AM
X-Note: Spam Tests Failed: 
X-Country-Path: PRIVATE->UNITED STATES->UNITED STATES
X-Note-Sending-IP: 98.129.35.1
X-Note-Reverse-DNS: 
X-Note-Return-Path: philb@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G340 G341 G342 G343 G347 G348 G455 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
X-Note: Headers Injected
Received: from [98.129.35.1] (HELO smtp.exg5.exghost.com)
	by server505.appriver.com (CommuniGate Pro SMTP 5.4.8)
	with ESMTPS id 113965667; Thu, 05 Sep 2013 07:07:23 -0500
Received: from [172.30.1.45] (86.30.57.232) by smtp.exg5.exghost.com
	(98.129.23.45) with Microsoft SMTP Server (TLS) id 8.3.327.1;
	Thu, 5 Sep 2013 07:07:22 -0500
Message-ID: <1378382840.6940.78.camel@phil-desktop.brightsign>
From: Phil Blundell <philb@brightsign.biz>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Thu, 5 Sep 2013 13:07:20 +0100
In-Reply-To: <20130905115913.GC17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
	<1378377834.6940.66.camel@phil-desktop.brightsign>
	<20130905111155.GB17481@lpalcu-linux>
	<1378381064.6940.75.camel@phil-desktop.brightsign>
	<1378381226.6940.77.camel@phil-desktop.brightsign>
	<20130905115913.GC17481@lpalcu-linux>
Organization: BrightSign Digital Ltd
X-Mailer: Evolution 3.4.4-4+b1 
MIME-Version: 1.0
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2013 12:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-09-05 at 06:59 -0500, Laurentiu Palcu wrote:
> On Thu, Sep 05, 2013 at 12:40:26PM +0100, Phil Blundell wrote:
> > Actually, that last sentence is slightly incorrect.  image.bbclass does
> > have the knowledge, it just seems to be failing to act on it.  So
> > perhaps the easiest fix for the time being is simply to move the
> > remove_packaging_data_files call in rootfs_uninstall_unneeded () a few
> > lines higher up so that it's inside the "if [ -z $(delayed_postinsts) ]"
> > block.
> What you're suggesting means that we will have the PM metadata present
> if there are delayed postinstalls present. But, since the PM is not
> present, what's the use of that? 

Well, er, that it will make the postinstalls work.  Isn't that exactly
the problem here?

p.



