Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1RiWPX-00030f-38; Wed, 04 Jan 2012 20:22:08 +0100
Received: from gandalf.denix.org ([unknown] [71.163.124.23])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LXA003HSDBC9OH3@vms173003.mailsrvcs.net>; Wed,
	04 Jan 2012 12:14:01 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8767A202C2; Wed,
	04 Jan 2012 13:14:00 -0500 (EST)
Date: Wed, 04 Jan 2012 13:14:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-id: <20120104181400.GD587@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: BlueZ old releases have new checksums
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jan 2012 19:22:08 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

The main archive of BlueZ/obexd/hcidump releases on kernel.org[1] finally 
re-appeared after missing for long time since kernel.org compromise. 
Unfortunately, all previous tarballs have new checksums, breaking builds for 
anyone w/o previous copy cached. Old copies were also extensively mirrored, 
so you never know which one you fetch next time...

I pinged the upstream, but I doubt it will be changed or fixed in any way. 
So the proper solution for us would be to upgrade recipes to the latest 
released versions - bluez-4.97, obexd-0.43 and bluez-hcidump-2.2.

Are there any other suggestions?

[1] http://www.kernel.org/pub/linux/bluetooth/

-- 
Denys


