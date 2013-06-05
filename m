Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mail.openembedded.org (Postfix) with ESMTP id D4CFD6041D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 20:00:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNX00HQGRJWUD21@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 05 Jun 2013 14:59:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0B263200E2; Wed,
	05 Jun 2013 15:59:56 -0400 (EDT)
Date: Wed, 05 Jun 2013 15:59:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20130605195956.GE10298@denix.org>
References: <20130605160437.GA10298@denix.org>
MIME-version: 1.0
In-reply-to: <20130605160437.GA10298@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: eglibc-2.17 build breaks with nptl #include nested too deeply
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
X-List-Received-Date: Wed, 05 Jun 2013 20:00:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 05, 2013 at 12:04:37PM -0400, Denys Dmytriyenko wrote:
> Has anyone seen this issue before - my builds are failing with the following:
> 
>                   from ../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23,
>                   from ../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23,
>                   from ../ports/sysdeps/arm/nptl/pthread_spin_lock.c:23:
> ../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23:47: error: #include nested too deeply
> 
> Google only returns a recent discussion on the Cygwin list:
> 
> http://cygwin.1069669.n5.nabble.com/BUG-Ability-to-access-nonexistent-directories-td98708.html
> 
> But, I'm building this on Ubuntu 12.04, not Cygwin. Any pointers, while I 
> keep digging? Thanks.

Well, a clean build seems to fix it... It's rather unfortunate that 
periodically incremental builds of the master break like that and can't 
recover on their own w/o cleaning up the temp directory.

-- 
Denys

