Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mail.openembedded.org (Postfix) with ESMTP id 68C9D6BE11;
	Mon,  2 Sep 2013 21:41:55 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0MSI00CFVPLG7B50@vms173005.mailsrvcs.net>; Mon,
	02 Sep 2013 16:41:50 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 030F920088; Mon,
	02 Sep 2013 17:41:38 -0400 (EDT)
Date: Mon, 02 Sep 2013 17:41:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-id: <20130902214138.GA30776@denix.org>
References: <5772089.rktQrocuuR@helios>
MIME-version: 1.0
In-reply-to: <5772089.rktQrocuuR@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Heads up: _remove in recipe namespace - check your layers
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
X-List-Received-Date: Mon, 02 Sep 2013 21:41:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Sep 02, 2013 at 10:54:20AM +0100, Paul Eggleton wrote:
> Hi all,
> 
> With the recent addition of a _remove operator into BitBake in master [1] any 
> use of _remove_ within a name or _remove at the end of a name within recipe 
> namespace (i.e. function and variable names) needs to be changed to avoid 
> unexpected behaviour. This change is now in master and will be in the upcoming 
> release. Please check the layers you maintain and change any instances of 
> these to avoid the use of _remove. You can use the following command to find 
> these (of course ignoring anything that's not in a recipe, bbclass, inc file 
> etc.):
> 
>   git grep _remove[^a-zA-Z]
> 
> In particular I've checked a number of layers that I have fetched locally, and 
> references exist in meta-arago-distro and meta-angstrom, so these will need to 
> be fixed as soon as possible.

Paul,

Thanks for the heads up! While meta-arago is currently based on Dylan, I've
made the necessary change in my layer so it will be ready for the master.
Thanks.

--
Denys

