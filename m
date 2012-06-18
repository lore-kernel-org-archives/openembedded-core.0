Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgUn8-0001xA-3O
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 07:46:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Jun 2012 22:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181374388"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2012 22:35:36 -0700
Message-ID: <4FDEBE28.6080507@linux.intel.com>
Date: Sun, 17 Jun 2012 22:35:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339911478.git.sgw@linux.intel.com>
	<b7bfb9b693cc592f081a3f42ef3f874a937d305d.1339911478.git.sgw@linux.intel.com>
	<1339923541.8481.0.camel@ted>
In-Reply-To: <1339923541.8481.0.camel@ted>
Subject: Re: [Consolidated Pull 23/23] mdadm: add binutils to DEPENDS
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
X-List-Received-Date: Mon, 18 Jun 2012 05:46:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/17/2012 01:59 AM, Richard Purdie wrote:
> On Sat, 2012-06-16 at 22:40 -0700, Saul Wold wrote:
>> mdadm requires ansidecl.h and therefore binutils needs to be completely
>> installed before this compile can complete, so add the DEPENDS.
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/recipes-extended/mdadm/mdadm_3.2.5.bb |    1 +
>>   1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
>> index 2d7e1d0..244777b 100644
>> --- a/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
>> +++ b/meta/recipes-extended/mdadm/mdadm_3.2.5.bb
>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
>>
>>   PR = "r0"
>> +DEPENDS = "binutils"
>>
>>   SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
>>   	    file://mdadm-3.2.2_fix_for_x32.patch \
>
> I think we can likely just remove the use of the header:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=37cf162998b13d7d594c7ed68c47d440a3033ed5
>
Fixed in the branch oe-contrib/sgw/stage branch as suggested.

Sau!
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


