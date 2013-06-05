Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id CF40F6A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 16:04:53 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MNX0041WGNQ1JP0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 05 Jun 2013 11:04:44 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0C56620091; Wed,
	05 Jun 2013 12:04:38 -0400 (EDT)
Date: Wed, 05 Jun 2013 12:04:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20130605160437.GA10298@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: eglibc-2.17 build breaks with nptl #include nested too deeply
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
X-List-Received-Date: Wed, 05 Jun 2013 16:04:54 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Has anyone seen this issue before - my builds are failing with the following:

                  from ../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23,
                  from ../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23,
                  from ../ports/sysdeps/arm/nptl/pthread_spin_lock.c:23:
../ports/sysdeps/arm/sysdeps/../nptl/pthread_spin_lock.c:23:47: error: #include nested too deeply

Google only returns a recent discussion on the Cygwin list:

http://cygwin.1069669.n5.nabble.com/BUG-Ability-to-access-nonexistent-directories-td98708.html

But, I'm building this on Ubuntu 12.04, not Cygwin. Any pointers, while I 
keep digging? Thanks.

-- 
Denys

