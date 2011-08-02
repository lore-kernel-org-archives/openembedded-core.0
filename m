Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QoIoU-0008Bq-Bi
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 19:31:30 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2011 10:27:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,307,1309762800"; 
   d="scan'208";a="3459534"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2011 10:27:07 -0700
Message-ID: <4E38336B.8010604@linux.intel.com>
Date: Tue, 02 Aug 2011 10:27:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311923851-6341-1-git-send-email-Martin.Jansa@gmail.com>
	<20110729073415.GM15286@jama.jama.net>
In-Reply-To: <20110729073415.GM15286@jama.jama.net>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] eglibc: unify eglibc-utils/${PN}-utils and remove PACKAGES from eglibc.inc
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
X-List-Received-Date: Tue, 02 Aug 2011 17:31:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2011 12:34 AM, Martin Jansa wrote:
> On Fri, Jul 29, 2011 at 09:17:31AM +0200, Martin Jansa wrote:
>> * PACKAGES were defined in eglibc.inc as well as eglibc-package.inc, definition
>>    from eglibc.inc was overriden from recipes including eglibc.inc only
>> * 37ff0fea8f7180b1a9d91d24dfe1735730427497 changed RPROVIDES_eglibc-utils,
>>    but ie FILES_ were still using eglibc-utils instead of ${PN}-utils, unify
>>    all eglibc-utils
>
> BTW: there is still problem with ie
> RPROVIDES_${PN}-utils = "glibc-utils"
> leading to
> ERROR: Trying to resolve runtime dependency glibc-utils resulted in conflicting PREFERRED_PROVIDER entries being found.
> The providers found were: ['virtual:nativesdk:/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.13.bb', '/OE/shr-core/openembedded-core/meta/recipes-core/eglibc/eglibc_2.13.bb']
> The PREFERRED_PROVIDER entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc-nativesdk = eglibc-nativesdk', 'PREFERRED_PROVIDER_virtual/libc = eglibc']
> NOTE: multiple providers are available for runtime glibc-utils (eglibc, eglibc-nativesdk, external-csl-toolchain, external-poky-toolchain)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match glibc-utils
>
> now with glibc recipes removed, do we need to RPROVIDE this or can we fix recipes
> RDEPENDing on glibc-utils to use eglibc-utils directly?
>
> otherwise we should fix right side to use ${PN/eglibc/glibc} to keep
> eglibc-nativesdk from providing glibc-utils (glibc-nativesdk-utils only).
>
Martin,

Richard pushed a fix to this and possibly addressed most of your changes 
in the above patch also, please rebase you patch against the 
oe-core/master and resend if you have any additional fixes to make in 
this area.

Thanks
	Sau!

> Regards,
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


