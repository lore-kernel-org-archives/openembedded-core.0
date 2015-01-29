Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 657B06012B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 20:06:48 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIY003O0FVDST50@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 29 Jan 2015 14:06:49 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=QM3fnbPO c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=SvBtbvtsoeh27k_zETQA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DB8DE20150; Thu,
	29 Jan 2015 15:06:48 -0500 (EST)
Date: Thu, 29 Jan 2015 15:06:48 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20150129200648.GC2517@denix.org>
References: <0NIX00GV1Z8KO910@vms173019.mailsrvcs.net>
	<20150129193358.GB2517@denix.org>
	<CAJTo0LYQp-tMeY+1+0tpwJ0kBZccMSWtYu1e2Tnk96RBtCYbhw@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LYQp-tMeY+1+0tpwJ0kBZccMSWtYu1e2Tnk96RBtCYbhw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot: update to version 2015.01
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
X-List-Received-Date: Thu, 29 Jan 2015 20:06:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 29, 2015 at 07:59:09PM +0000, Burton, Ross wrote:
> On 29 January 2015 at 19:33, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > >    I believe I had that in DEPENDS... I'll check.
> >
> > So, yes, the patch does have DEPENDS = "openssl"
> >
> > Does it become openssl-native due to BBCLASSEXTEND = "native"? Or do I
> > need a
> > separate DEPENDS_class-native?
> 
> 
> Unless you have an explicit DEPENDS_class-native assignment, openssl will
> become openssl-native.

Ok, as I suspected... Then, I'm not really sure what the problem might be.

-- 
Denys

