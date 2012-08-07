Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Syiag-0002kf-4L for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 14:08:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77Bv3Ox010398;
	Tue, 7 Aug 2012 12:57:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09711-04; Tue,  7 Aug 2012 12:56:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77BuqK7010392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 12:56:53 +0100
Message-ID: <1344340614.9756.225.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 12:56:54 +0100
In-Reply-To: <541bca3bf62c2747fcc16b3fb8bc9ad468f6d4cb.1344268492.git.dvhart@linux.intel.com>
References: <cover.1344268492.git.dvhart@linux.intel.com>
	<541bca3bf62c2747fcc16b3fb8bc9ad468f6d4cb.1344268492.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] linux-yocto-custom: Clarify usage and clear COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 07 Aug 2012 12:08:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 08:56 -0700, Darren Hart wrote:
> There has been some confusion over proper use of the linux-yocto-custom
> recipe. It is not intended to build as is from meta-skeleton. It should
> be modified via a bbappend file to provide a Linux kernel config at the
> very least.
> 
> Update the commentary to make this requirement more explicit. Add some
> additional detail about how to create a bbappend file and how and when
> to modify the various variables.
> 
> Clear COMPATIBLE_MACHINE so bitbake will not attempt to build the recipe
> unless the user explicitly adds there machine to the variable, which
> should encourage them to read the recipe comments before attempting to
> build it.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Merged to master, thanks.

Richard



