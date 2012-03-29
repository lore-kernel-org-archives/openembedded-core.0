Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDNeS-00023W-Rj for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 00:17:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TM7oPm006087;
	Thu, 29 Mar 2012 23:07:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05108-08; Thu, 29 Mar 2012 23:07:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2TM7eaq006080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Mar 2012 23:07:42 +0100
Message-ID: <1333058859.18082.44.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 29 Mar 2012 23:07:39 +0100
In-Reply-To: <cover.1332952962.git.dexuan.cui@intel.com>
References: <cover.1332952962.git.dexuan.cui@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Hart, Darren" <darren.hart@intel.com>
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
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
X-List-Received-Date: Thu, 29 Mar 2012 22:17:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please comment.
> 
> Let's figure out if this big patch is accepatable or not...
> 
> With this patch, I can successfully create a 8.5GB .ext3 file with genext2fs.
> The speed is slow -- I spent about 1.5 hours.

If these patches solved all the problems and made things work
wonderfully I'd probably say we'd take them. Unfortunately I don't
consider taking 1.5 hours to build am 8GB filesystem "wonderful", its
rather worrying and I don't think its performing any where need fast
enough for our needs :(.

Patching genext2fs at this point in the cycle is a rather risky
undertaking too and I'm getting very concerned about this. 

We might have to look at alternative ways to solve this problem. I think
Darren said he might help look at this and has some other ideas. Darren?

Cheers,

Richard



