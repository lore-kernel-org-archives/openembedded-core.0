Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SEYAm-000057-Fq for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 05:43:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323Y1JA004673;
	Mon, 2 Apr 2012 04:34:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27688-07; Mon,  2 Apr 2012 04:33:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q323XnHt004663
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Apr 2012 04:33:52 +0100
Message-ID: <1333337630.647.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 02 Apr 2012 04:33:50 +0100
In-Reply-To: <d7e01efa2052c33658d84eccdd71986e6fa822d5.1333252345.git.bruce.ashfield@windriver.com>
References: <cover.1333252345.git.bruce.ashfield@windriver.com>
	<d7e01efa2052c33658d84eccdd71986e6fa822d5.1333252345.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-yocto: update tiny meta and configuration for kernel 3.2
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
X-List-Received-Date: Mon, 02 Apr 2012 03:43:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-31 at 23:54 -0400, Bruce Ashfield wrote:
> Updating the META SRCREV to pickup these commits:
> 
>   59f350e meta: Add common-pc-tiny.scc
>   0996ca9 tiny: Minimize the tiny config
>   d6b57bb meta: common-pc add dependencies to cfg
> 
> Which update the configuration for the tiny profile of the kernel
> for the 3.2 release.
> 
> cc: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
>  meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



