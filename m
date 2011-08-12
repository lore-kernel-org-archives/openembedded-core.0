Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrhBo-0000SZ-8N
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 04:09:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 19:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,360,1309762800"; d="scan'208";a="38545178"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 19:05:03 -0700
Message-ID: <4E448A4F.6000707@linux.intel.com>
Date: Thu, 11 Aug 2011 19:05:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1313072334.git.lianhao.lu@intel.com>	<a536443a01f8059b9a11418ea7b812e3286b7576.1313072334.git.lianhao.lu@intel.com>	<1313073561.6733.135.camel@phil-desktop>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA7675AE3@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <C10D3FB0CD45994C8A51FEC1227CE22F2FA7675AE3@shsmsx502.ccr.corp.intel.com>
Subject: Re: [PATCH 1/2] image: populate site config files into roootfs.
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
X-List-Received-Date: Fri, 12 Aug 2011 02:09:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/11/2011 06:09 PM, Lu, Lianhao wrote:
> Phil Blundell wrote on 2011-08-11:
>> On Thu, 2011-08-11 at 22:31 +0800, Lianhao Lu wrote:
>>> [YOCTO #892] populate the site config files content into the file in
>>> {target}/cross_site_config in rootfs, which can be used by the cross
>>> toolchain in meta-toolchain when the rootfs is used as sysroot.
>>
>> Is that going to cause ${datadir}/cross_site_config to get created in
>> all rootfs images?  That would be undesirable, but I couldn't
>> obviously see a flag to turn it on and off.
>>
>
> We can add flag to turn it on and off. But the problem is that in that case, the user need to build 2 image rootfs, one for running and one for cross compiling.
>
Lianhao,

This is only required for toolchain, is there a way to create the 
externally from the rootfs and package it with the ADT?  The problem 
here is that you will add space to the image (not sure how big), maybe 
this only make set to be and IMAGE_FEATURE for -dev or -sdk images, just 
as we add the -dev and -dbg packages to only those images?

SaU!

> Best Regards,
> Lianhao
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


