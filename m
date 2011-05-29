Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQbbw-0004fW-Jr for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 10:44:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4T8fULw021605
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:41:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21189-08 for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:41:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4T8fLl2021599
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2011 09:41:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4DE192AF.2040103@intel.com>
References: <4DE192AF.2040103@intel.com>
Date: Sun, 29 May 2011 09:41:12 +0100
Message-ID: <1306658472.27470.325.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] license.bbclass: Fix for infinite recursion and bad license_type
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
X-List-Received-Date: Sun, 29 May 2011 08:44:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-28 at 17:26 -0700, Elizabeth Flanagan wrote:
> - Fixing LicenseVisitor so it forks at a BitOr instead of infinitely checking the node.
> - Fixing the bad license_type syntax by lstriping it so it's valid python.
> - Moved the bb.warn that we're using a SPDXLICENSEMAP to a note.
> 
> The following changes since commit 1169f1b066d0028bd2ef7915440450bd42ef165e:
> 
>    license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)
> 
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib eflanagan/common-licenses
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/common-licenses
> 
> Beth Flanagan (1):
>    license.bbclass: Infinite recursion of or nodes

Merged to master, thanks.

Richard



