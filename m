Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SQNOB-0008UF-PF
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:38:08 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M3I00IT4GLQT1A2@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 13:27:32 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D6D7120099; Fri,
	04 May 2012 14:27:26 -0400 (EDT)
Date: Fri, 04 May 2012 14:27:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-id: <20120504182726.GA15097@denix.org>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
	<E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
	<0E974700-0AC5-4D2D-8CED-9B50FFC36854@dominion.thruhere.net>
	<BEB5EFF4-B2E1-40DC-A12F-60ACB097C4E3@gmail.com>
MIME-version: 1.0
In-reply-to: <BEB5EFF4-B2E1-40DC-A12F-60ACB097C4E3@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 18:38:09 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 04, 2012 at 08:09:39PM +0200, Elvis Dowson wrote:
> Hi Koen,
> 
> I bumped the PR, but still get the warning message. How is the warning for 
> this specific package linked to its dependents. The warning looks localized 
> to the lighttpd_1.4.30.bb recipe.
> 
> If you can tell me how to fix it, I'll do it and send a patch.

You are trying to fix it in oe-core/poky layer, where it doesn't use systemd. 
There is a .bbappend in meta-oe for that. In fact, here's what I told you 
yesterday:

> WARNING: /tool/yocto/meta-openembedded/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd
> WARNING: /tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

For these 2 please report them on openembedded-devel mailing list, where
meta-oe things are being discussed. The last warning is confisuing, as it
reports the recipe is in poky/oe-core, but it actually comes from the
corresponding .bbappend in meta-oe.

-- 
Denys


