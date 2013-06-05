Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by mail.openembedded.org (Postfix) with ESMTP id D38496041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:12:27 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNX00AM9S4SRP70@vms173011.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 05 Jun 2013 15:12:29 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2C947200E2; Wed,
	05 Jun 2013 16:12:27 -0400 (EDT)
Date: Wed, 05 Jun 2013 16:12:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andy Voltz <andy.voltz@timesys.com>
Message-id: <20130605201227.GG10298@denix.org>
References: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
MIME-version: 1.0
In-reply-to: <1370447550-23693-1-git-send-email-andy.voltz@timesys.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Simplify tune-cortexa*.inc, and add cortex-a5 tuning
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
X-List-Received-Date: Wed, 05 Jun 2013 20:12:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 05, 2013 at 11:52:28AM -0400, Andy Voltz wrote:
> This series puts the common tuning setup in an include and reworks the
> tuning files for each cortex-a* series to use that include. A new variable,
> CORTEX_ID is used to specify which processor is used.
> 
> Add a tuning file for the cortex-a5 using this include.

And what about 53, 57 and the newly announced 12? :)

-- 
Denys

