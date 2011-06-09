Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUgVK-0001DC-22 for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 16:46:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59EhIFr013857
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 15:43:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13378-07 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 15:43:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59EhAWB013851
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 15:43:10 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307620723.2529.4861.camel@phil-desktop>
References: <1307620723.2529.4861.camel@phil-desktop>
Date: Thu, 09 Jun 2011 15:43:01 +0100
Message-ID: <1307630581.15712.162.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] kexec-tools: don't depend on virtual/kernel
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
X-List-Received-Date: Thu, 09 Jun 2011 14:46:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 12:58 +0100, Phil Blundell wrote:
> There doesn't appear to be any terribly good reason for kexec-tools to
> depend on the kernel.  (I verified that kexec-tools is buildable in a
> clean TMPDIR without having previously built virtual/kernel.)  
> 
> Having this dependency in place is a nuisance because it makes it
> awkward to put kexec into an initramfs.  So, it seems like we would be
> better off without.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-kernel/kexec/kexec-tools.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



