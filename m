Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id CA41D6CE74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 17:13:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N35005NRP6QQZ80@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 28 Mar 2014 12:13:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 70FD220357; Fri,
	28 Mar 2014 13:13:38 -0400 (EDT)
Date: Fri, 28 Mar 2014 13:13:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20140328171338.GI3370@denix.org>
References: <cover.1395825881.git.kai.kang@windriver.com>
	<CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKpRZXUxM=QGOBR4xmh=vBWBd6VOqYK0AZwvon_MG4pQGA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Replace ocf-linux with cryptodev-linux
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
X-List-Received-Date: Fri, 28 Mar 2014 17:13:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 26, 2014 at 11:42:39AM -0300, Otavio Salvador wrote:
> Hello Kai,
> 
> On Wed, Mar 26, 2014 at 7:15 AM, Kai Kang <kai.kang@windriver.com> wrote:
> > Replace ocf-linux with cryptodev-linux because linux-yocto use cryptodev-linux to implement /dev/crypto.
> 
> Thanks for handling it; I was going to address same issue this week so
> we could have it upstreamed and drop the Freescale bbappends for it.

So, we also have a recipe of cryptodev for TI builds. But it's not just a 
header file and we need the actual module to be built and packaged...

I'm rather surprised it was merged so quickly w/o further discussion... :(

-- 
Denys

