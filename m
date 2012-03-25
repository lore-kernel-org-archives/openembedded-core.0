Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SBkY0-0003ev-KH for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 12:19:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PAAgaE014882
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 11:10:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14767-01 for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 11:10:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2PAAUvE014875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2012 11:10:32 +0100
Message-ID: <1332670230.28414.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 25 Mar 2012 11:10:30 +0100
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/8] License Fixes.
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
X-List-Received-Date: Sun, 25 Mar 2012 10:19:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 16:51 -0700, Beth Flanagan wrote:
> This patchset covers three main topics. The first, and most important is how
> INCOMPATIBLE_LICENSE deals with LICENSE naming variations and pkg level licensing.
> 
> We now have the ability to set the recipe level license to one that is inherited by
> all packages as well as the ability to override the main license. This allows us to 
> specify that some packages may have incompatible licenses or the recipe may be 
> incompatible, but the package itself isn't. I've included an example of this in
> util-license.
> 
> Also included are fixes to the last of the license warnings.
> 
> And lastly, I've corrected some whitespace within license.bbclass according to the
> style guide. 
> 
> The following changes since commit 6c77a0f0fa0c97bfbe93f4a930a1549566a7f016:
> 
>   taglib: Refresh patch after recent accidental breakage (2012-03-23 18:36:20 +0000)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib eflanagan/incompatible_license
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/incompatible_license
> 
> Elizabeth Flanagan (8):
>   license.bbclass: Add spdx mapping to GPL-1.0
>   license.bbclass: Whitespace standardization
>   INCOMPATIBLE_LICENSE: support for spdx and pkg licenses
>   util-linux: Example of pkg level INCOMPATIBLE_LICENSE
>   license.bbclass: Style guide compliance
>   common-licenses: Adding GPL-2.0-with-OpenSSL-exception
>   common-license: Add ICU generic
>   setserial: Correct LICENSE

Merged to master, thanks.

Richard



