Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Jun 2015 23:59:23 UTC
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id CA203740C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 23:59:23 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQ000BX5D64T990@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 15 Jun 2015 17:59:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=XAFQembCKUMA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=d_Hx7kMDtuSz4J9EYnEA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 28501161AA9; Mon,
	15 Jun 2015 18:58:52 -0400 (EDT)
Date: Mon, 15 Jun 2015 18:58:52 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20150615225852.GF2465@denix.org>
References: <1434049675-15986-1-git-send-email-denis@denix.org>
MIME-version: 1.0
In-reply-to: <1434049675-15986-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [daisy][PATCH 0/1] Backport BAD_RECOMMENDATIONS fix from master/dizzy
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
X-List-Received-Date: Mon, 15 Jun 2015 23:59:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

I know Daisy is rather old, but is there any chance to get this fix pulled in? 
Or should I look for a local workaround instead? Thanks!

-- 
Denys


On Thu, Jun 11, 2015 at 03:07:54PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This is a self-contained clean backport of BAD_RECOMMENDATIONS fix for opkg.
> Please consider applying to daisy.
> 
> Paul Barker (1):
>   package_manager: Fix BAD_RECOMMENDATIONS for opkg
> 
>  meta/lib/oe/package_manager.py | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> -- 
> 2.2.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

