Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZXgf-0001Av-5f
	for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 01:54:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Dec 2011 16:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="84397370"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by azsmga001.ch.intel.com with ESMTP; 10 Dec 2011 16:47:47 -0800
Message-ID: <4EE3FDB2.5060107@linux.intel.com>
Date: Sat, 10 Dec 2011 16:47:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Wolfgang Denk <wd@denx.de>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<cover.1323554268.git.sgw@linux.intel.com>
	<71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
	<20111210232420.9B0B61F4E08@gemini.denx.de>
In-Reply-To: <20111210232420.9B0B61F4E08@gemini.denx.de>
Cc: openembedded-core@openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] self-hosted: Add ext2 utilites and perl-pod for building
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
X-List-Received-Date: Sun, 11 Dec 2011 00:54:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2011 03:24 PM, Wolfgang Denk wrote:
> Dear Saul Wold,
>
> In message<71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>  you wrote:
>> Add self-hosted-host-tools for non-build related tools
> ...
>> +    e2fsprogs \
> ...
>> +    genext2fs \
>
> It's certainly nice to have the ext2 tools then, but would it not also
> make a lot of sense to include mtd-utils (so we can erase flash and
> create UBI volumes / UBIFS file system images) and eventually even
> dosfstools?
>
> Most embedded systems come with NAND these days, and a lot of them use
> UBI/UBIFS...
>
Great point Wolfgang, this is an evolving item, please feel free to 
submit the appropriate patches!

Sau!

> Best regards,
>
> Wolfgang Denk
>


