Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S5jr2-0006x3-8D for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 21:22:29 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KDjJd030271;
	Thu, 8 Mar 2012 20:13:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29888-06; Thu,  8 Mar 2012 20:13:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q28KDXjl030265
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 8 Mar 2012 20:13:36 GMT
Message-ID: <1331237606.3006.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 08 Mar 2012 12:13:26 -0800
In-Reply-To: <83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
References: <cover.1331107546.git.dvhart@linux.intel.com>
	<83eeb4ed11a6a63abda1f3978c849a46516b92a1.1331107546.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] kernel.bbclass: Remove warnings for modutils and modprobe.d
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
X-List-Received-Date: Thu, 08 Mar 2012 20:22:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-07 at 00:06 -0800, Darren Hart wrote:
> Fixes [Yocto #2036]
> 
> The source and build directories are unused, remove them.
> 
> The modutils and modprobe.d directories may be used if modules are built that
> are either autoloaded or have modprobe.d entries. This isn't known at install
> time, so check after the package split if these directories are empty and
> remove them if they are.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)

Merged to master, thanks.

Richard



