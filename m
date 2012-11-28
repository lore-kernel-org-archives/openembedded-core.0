Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TdcVp-0001JD-5V for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 08:56:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS7gZRm011104;
	Wed, 28 Nov 2012 07:42:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09001-10; Wed, 28 Nov 2012 07:42:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAS7gOVF011097
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 28 Nov 2012 07:42:26 GMT
Message-ID: <1354088544.21863.134.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jackie.huang@windriver.com
Date: Wed, 28 Nov 2012 07:42:24 +0000
In-Reply-To: <cover.1354081123.git.jackie.huang@windriver.com>
References: <cover.1354081123.git.jackie.huang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] eglibc: move the fix code for optimization isssue to .inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 07:56:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-11-28 at 14:11 +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> I made a patch against the eglibc_2.16.bb for the optimization issue two weeks ago,
> but it's not a version specific issue and we still keep the versions 2.13 and 2.15
> (and not having the 2.16 yet), so it would be more appropriate to move the code to
> the .inc file. 
> And we also want to cherry-pick this commit to our oe-core branch so I revert the
> previous one and make a new commit against the .inc file but I'm not sure if it is
> proper to do that. Please correct me if it is not, thanks!
> 
> * Test info:
> 1) MACHINE=qemux86-64/qemuppc/qemumips
> $ bitbake core-image-sato 
> $ bitbake eglibc
> 
> 2) MACHINE=qemux86-64/qemuppc/qemumips
>    DEBUG_OPTIMIZATION = "-O0 -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>    DEBUG_BUILD = "1" or SELECTED_OPTIMIZATION = "${DEBUG_OPTIMIZATION}"
> $ bitbake core-image-sato
> $ bitbake eglibc
> 
> The following changes since commit 764cc1eb3043c84121f597d2271108b91052095e:
> 
>   bitbake.conf: Change build output message to list BUILD_SYS, TARGET_SYS and NATIVELSBSTRING (2012-11-27 08:57:39 +0000)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib jhuang0/d_eglibc_1128_1
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_eglibc_1128_1
> 
> Jackie Huang (2):
>   Revert "eglibc: always compile with optimization."
>   eglibc: always compile with optimization.

I've queued this on master-next. I changed it from two commits to one
commit which just moves the code for the reason you describe.

Cheers,

Richard



