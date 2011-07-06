Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qeaad-0008LZ-Mx
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 00:29:03 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jul 2011 15:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,489,1304319600"; d="scan'208";a="24177105"
Received: from unknown (HELO [10.255.13.240]) ([10.255.13.240])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2011 15:25:11 -0700
Message-ID: <4E14E0C7.6040604@linux.intel.com>
Date: Wed, 06 Jul 2011 15:25:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1309432228.7987.14.camel@desktop.home>	<4E0D0333.8080706@linux.intel.com>	<1309511209.7987.42.camel@desktop.home>
	<1309512008.2633.14.camel@phil-desktop>
In-Reply-To: <1309512008.2633.14.camel@phil-desktop>
Subject: Re: [PATCH] Add support for BAD_RECOMMENDATIONS to rootfs_ipk
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
X-List-Received-Date: Wed, 06 Jul 2011 22:29:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2011 02:20 AM, Phil Blundell wrote:
> On Fri, 2011-07-01 at 10:06 +0100, Chris Elston wrote:
>> +	STATUS=${IMAGE_ROOTFS}/var/lib/opkg/status
>
> Please make that use ${opkglibdir} like the rest of the class does.
> Otherwise this patch looks pretty good to me.
>
> p.
>
>
Chris,

Are you going to republish with this change?

Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


