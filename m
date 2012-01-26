Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqWMo-0004Rp-Q9 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 21:56:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKmZ7U028357
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:48:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27844-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:48:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QKmPva028351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 20:48:26 GMT
Message-ID: <1327610907.19643.403.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 20:48:27 +0000
In-Reply-To: <cover.1327532550.git.josh@linux.intel.com>
References: <cover.1327532550.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Don't add binutils to images when GPLv3 in INCOMPATIBLE_LICENSE v2
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
X-List-Received-Date: Thu, 26 Jan 2012 20:56:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-01-25 at 15:05 -0800, Joshua Lock wrote:
> This second version has slightly tidier code per Richard's suggestions.
> 
> Cheers,
> Joshua
> 
> The following changes since commit 746e8ffa66850bf9050cd6baf94eb76c492eb535:
> 
>   uclibc-git: Update to latest RC (2012-01-25 14:33:52 +0000)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib josh/stuff
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/stuff
> 
> Joshua Lock (1):
>   linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
> 
>  meta/recipes-kernel/linux/linux-tools.inc       |   27 +++++++++++++++-------
>  meta/recipes-kernel/linux/linux-yocto_2.6.37.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
>  3 files changed, 20 insertions(+), 11 deletions(-)
 
Updated version merged to master, thanks.

Richard



