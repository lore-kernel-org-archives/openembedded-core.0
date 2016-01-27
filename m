Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 924E877195
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:16:46 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1M00AQ3LJ2V2F0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 27 Jan 2016 13:16:19 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=kj9zAlcOel0A:10 a=7aQ_Q-yQQ-AA:10	a=0gcC27t9AAAA:8
	a=70xRKmAa80XiIEj3_EEA:9 a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4F63D161E35; Wed,
	27 Jan 2016 14:16:14 -0500 (EST)
Date: Wed, 27 Jan 2016 14:16:14 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160127191614.GH1652@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
	<20160126142023.GE1652@denix.org>
MIME-version: 1.0
In-reply-to: <20160126142023.GE1652@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Wed, 27 Jan 2016 19:16:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 26, 2016 at 09:20:23AM -0500, Denys Dmytriyenko wrote:
> On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
> > On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
> > 
> > > A clean room re-implementation and extension of the original stress tool.
> > >
> > 
> > What's the rationale for adding this to oe-core over another layer?
> 
> None, besides the original stress is in oe-core. What other layer would you 
> suggest?

Ross,

Care do make your own suggestion? Do you think meta-oe would be a better fit? 
Are there any other considerations, since stress-ng is a replacement of the 
original stress and it was added to oe-core? Thanks.

-- 
Denys

