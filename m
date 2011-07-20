Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qja0t-00057K-9M
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 18:52:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2011 09:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,236,1309762800"; d="scan'208";a="32589502"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2011 09:48:39 -0700
Message-ID: <4E2706E7.4040406@linux.intel.com>
Date: Wed, 20 Jul 2011 09:48:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
In-Reply-To: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: Re: [PATCH 0/7] Fixes to some gcc 4.5.1 bugs
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
X-List-Received-Date: Wed, 20 Jul 2011 16:52:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/18/2011 06:00 PM, Ilya Yanok wrote:
> Hi everybody,
>
> It seems like everybody are using GCC 4.6 already but as support for
> GCC 4.5.1 is still here I'd like to publish the changes we've done to
> GCC 4.5.1 recipe some time ago.
>
> We've incorporated the patches for some know GCC 4.5.1 problems:
>   PR44392: Already fixed by arm_bswapsi2 patch but the patch differs
> slightly from the one in the gcc tree.
>   PR43810: linking with optspace on PowerPC results in undefined
> references to _savegpr_* _restgpr_*_x. Added the patch from bugzilla
> but the issue is still here.
>   PR44290: __naked attribute is broken on ARM.
>   PR44606: Wrong SPE floating point during computation (PowerPC).
>   PR45094: [arm] wrong instructions for dword move in some cases.
>   PR45052: volatile ignored
>   PR45886: [ARM] support for __ARM_PCS_VFP predefined symbol
>
> Hope this will be useful for someone.
>
> Regards, Ilya.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


