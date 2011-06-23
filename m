Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZqI6-0006gt-Gl for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 22:14:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NKAgE7022643
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 21:10:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22095-10 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 21:10:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5NKAaJS022637
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 21:10:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308857981.git.mark.hatle@windriver.com>
References: <cover.1308857981.git.mark.hatle@windriver.com>
Date: Thu, 23 Jun 2011 21:10:34 +0100
Message-ID: <1308859834.20015.142.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/9] Revised patch set for fixing owners/groups (V2)
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
X-List-Received-Date: Thu, 23 Jun 2011 20:14:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-23 at 14:41 -0500, Mark Hatle wrote:
> Misunderstood nativesdk.  I thought it was not running under fakeroot
> control.  No reason to intercept chown for nativesdk, revert that hunt.
> 
> Also removed an errant debug statement.

Thanks for the tweaks, this is much neater now :)

> This is a revised patch set for fixing the owners/groups.  It adds a
> local intercrepter routine for "chown" that runs only with native and
> nativesdk packages.
> 
> Also update the rejected python patch to fix only the gobject item.
> 
> 
> The following changes since commit ad098e40e8c57727892819e131bf18308bf244d2:
> 
>   packagedata.py: Fix read_subpkgdata_dict() (2011-06-23 16:01:20 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/recipe-fixup
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/recipe-fixup
> 
> Mark Hatle (9):
>   native.bbclass: Add a simple chown intercept command
>   resolveconf: Fix file owners
>   base-passwd: Fix owners/groups
>   ghostscript: Fix owner/group of /etc/cups
>   libtirpc: Fix owner/group of /etc/netconfig
>   tzdata: Ensure all files are owned by root:root
>   gnome-doc-utils: Fix the owner/group on select files
>   db: Fix file ownership
>   python: Add python to the dependency to pygobject

Merged to master, thanks.

Richard



