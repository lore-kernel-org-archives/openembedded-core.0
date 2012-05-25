Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SXrlS-00027y-02 for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 12:28:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PAIkGw032636
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:18:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31927-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:18:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4PAIaiA032630
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 11:18:37 +0100
Message-ID: <1337941116.20169.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2012 11:18:36 +0100
In-Reply-To: <932f606a11243d307984d7b1034f0f9ce1e01683.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
	<932f606a11243d307984d7b1034f0f9ce1e01683.1337927956.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated Pull 38/45] pango: fix dependencies to avoid build issue
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
X-List-Received-Date: Fri, 25 May 2012 10:29:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 23:42 -0700, Saul Wold wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> this commit avoids this build issue:
> 
> | /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.1/ld: cannot find -lelf
> | collect2: error: ld returned 1 exit status
> ...
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
> NOTE: package pango-1.28.4-r7: task do_compile: Failed
> 
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/recipes-graphics/pango/pango.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Why does pango suddenly need libelf? This doesn't make sense...

Cheers,

Richard



