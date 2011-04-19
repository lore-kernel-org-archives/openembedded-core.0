Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCJZE-0005RW-1z for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 00:38:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JMaLuG009077;
	Tue, 19 Apr 2011 23:36:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08479-10; Tue, 19 Apr 2011 23:36:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3JMaFU8009071
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 19 Apr 2011 23:36:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1303170477.git.dvhart@linux.intel.com>
References: <cover.1303170477.git.dvhart@linux.intel.com>
Date: Tue, 19 Apr 2011 23:36:03 +0100
Message-ID: <1303252563.5518.291.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 0/2] kernel.bbclass fix and cleanup
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
X-List-Received-Date: Tue, 19 Apr 2011 22:38:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-04-19 at 08:11 -0700, Darren Hart wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> The following commit introduced a build bug and left some debug lying around.
> 
> commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58
> Author: Darren Hart <dvhart@linux.intel.com>
> Date:   Tue Mar 8 17:09:10 2011 -0800
> kernel/bbclass: rework kernel and module classes to allow for building
> out-of-tree modules
> 
> The following 2 patches address that.
> 
> Thanks,
>     Darren Hart <dvhart@linux.intel.com>
> ---
> 
> 
> Darren Hart (2):
>   kernel: Copy over bzImage to sysroots during install
>   kernel: Remove debug statements

Merged to master, thanks.

Richard



