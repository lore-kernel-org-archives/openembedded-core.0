Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJNWA-0006gy-1N for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:53:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BeTMb026950;
	Wed, 3 Oct 2012 12:40:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25642-08; Wed,  3 Oct 2012 12:40:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93BeL0k026944
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 12:40:22 +0100
Message-ID: <1349264424.18301.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Wed, 03 Oct 2012 12:40:24 +0100
In-Reply-To: <1349263406-23095-2-git-send-email-laurentiu.palcu@intel.com>
References: <1349263406-23095-1-git-send-email-laurentiu.palcu@intel.com>
	<1349263406-23095-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/1] qemu: add wrapper for qemu-mips binary
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
X-List-Received-Date: Wed, 03 Oct 2012 11:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 14:23 +0300, Laurentiu Palcu wrote:
> qemu-mips user emulation binary segfaults when running any kind of
> binary. This is due to a MMU access fault in the virtual CPU. This
> problem has been introduced in qemu when 4GB of vmem were reserved for
> 32-on-64 bit.
> 
> This workaround will need to be reverted once the proper fix is found.
> 
> [YOCTO #3143]
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/recipes-devtools/qemu/qemu_1.2.0.bb |   15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

Merged to master, thanks.

Richard



