Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QpNN1-0005mb-FC for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:35:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GVB8j014149
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:31:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13839-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2011 17:31:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p75GV45Q014143
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 17:31:04 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312540193.git.lianhao.lu@intel.com>
References: <cover.1312540193.git.lianhao.lu@intel.com>
Date: Fri, 05 Aug 2011 17:30:41 +0100
Message-ID: <1312561841.14274.138.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] Variable fixes for multilib
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
X-List-Received-Date: Fri, 05 Aug 2011 16:35:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 18:37 +0800, Lianhao Lu wrote:
> This series of patch fixed variable multilib issues, from bug #1333 to #1338.
> 
> The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:
>   Richard Purdie (1):
>         eglibc: Fix patch merge breakage
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib llu/ml2
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/ml2
> 
> Lianhao Lu (6):
>   SRC_URI: Using BPN instaed of PN.
>   tcp-wrappers: Using ${PN} in PACKAGES.
>   qt4x11.bbclass: Using BPN instead of PN.
>   Misc: Corrected the dependency on non-native for -native package.
>   ghostscript: Fixed the incorrect DEPENDS.
>   eglibc-locale: Added ${MLPREFIX} for task dependency.

Merged to master, there are some good fixes in there, thanks.

Richard



