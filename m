Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0eql-0002D2-3K for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:28:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JNshT000961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:23:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00906-02 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2011 20:23:50 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JNkjx000955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Sep 2011 20:23:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <396b96c9583f7a072b27d914a5cef2a7788aa74e.1315090054.git.scott.a.garman@intel.com>
References: <cover.1315090054.git.scott.a.garman@intel.com>
	<396b96c9583f7a072b27d914a5cef2a7788aa74e.1315090054.git.scott.a.garman@intel.com>
Date: Mon, 05 Sep 2011 20:23:46 +0100
Message-ID: <1315250626.1243.8.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] runqemu: standardize ability to specify custom qemu/kenel boot options
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
X-List-Received-Date: Mon, 05 Sep 2011 19:28:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 15:50 -0700, Scott Garman wrote:
> The old manner of specifying custom options to QEMU in this script
> using angle brackets was a frequent source of confusion. Meanwhile,
> Otavio Salvador added a decent method of specifying custom kernel
> boot options to this script. This patch documents the bootparams
> option and adds a similar way of specifying custom QEMU options
> using qemuparams="".
> 
> This fixes [YOCTO #1019]
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  scripts/runqemu |   32 ++++++++++++++++++--------------
>  1 files changed, 18 insertions(+), 14 deletions(-)

Merged to master, thanks.

Richard



