Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED9671637
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 15:18:01 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIL005AW3TJHU10@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 22 Jan 2015 09:17:44 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ko/6AtSI c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=mDIH4RUHE0oDTGoIp7YA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3F09B2018E; Thu,
	22 Jan 2015 10:17:42 -0500 (EST)
Date: Thu, 22 Jan 2015 10:17:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20150122151742.GP20639@denix.org>
References: <1421165391-30203-1-git-send-email-denis@denix.org>
	<CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
	<CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
	<20150122145715.GO20639@denix.org>
	<CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 15:18:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 22, 2015 at 03:02:06PM +0000, Burton, Ross wrote:
> On 22 January 2015 at 14:57, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > Please note that he's talking about current 2014.07 version, not the
> > update!
> > Can you confirm that it works or fails on the autobuilder?
> >
> 
> Sorry, got lost in the thread.  The old version works fine, the upgrade
> breaks.

That's not the case for the rest of us, unfortunately...

I'm suspecting sstate got something to do with the fact that it still works 
for the old version on autobuilder.


Let me emphasise it - this specific u-boot-fw-utils-cross recipe used to 
build fine, but now fails in the same exact way regardless of the version, 
either current 2014.07 or the updated 2015.01.

So, it seems to me that fixing it is rather out of scope of this version 
update patch... :)

I'm thinking of 2 short-term workarounds - don't update this particular recipe 
to the new version; or remove it altogether. I'm sure Otavio wouldn't be happy 
either way, but fixing it should probably be a separate effort...

-- 
Denys

