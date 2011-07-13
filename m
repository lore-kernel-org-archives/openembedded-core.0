Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qh0GR-000876-GF
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:18:11 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Qh0Cc-0002oX-BV from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 07:14:14 -0700
Received: from SVR-ORW-FEM-03.mgc.mentorg.com ([147.34.97.39]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 13 Jul 2011 07:14:14 -0700
Received: from [172.30.80.17] (147.34.91.1) by svr-orw-fem-03.mgc.mentorg.com
	(147.34.97.39) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 13 Jul 2011 07:14:13 -0700
Message-ID: <4E1DA832.5030600@mentor.com>
Date: Wed, 13 Jul 2011 07:14:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<1310556033.20015.1104.camel@rex>
In-Reply-To: <1310556033.20015.1104.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 13 Jul 2011 14:14:14.0144 (UTC)
	FILETIME=[24C83800:01CC4167]
Subject: Re: [PATCH 0/5] commits for yocto.git tree for x32 work
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
X-List-Received-Date: Wed, 13 Jul 2011 14:18:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/13/2011 04:20 AM, Richard Purdie wrote:
> On Tue, 2011-07-12 at 12:02 -0700, nitin.a.kamble@intel.com wrote:
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>
>> These are commits for yocto tree. I came up with as part of the x32 work. 
>> I think these commits does not belong in the x32 layer and should go
>> in the yocto/oecore tree.
>>
>> The siteinfo.bbclass commit is a hacky way to get the the right siteinfo for 
>> x32 now. In the future a better solution will be implemented for that purpose.
>>
>> The following changes since commit 7354fc9213f27aa1b643dbe88070437f1ee4c063:
>>
>>   insane.bbclass: skip rdepends QA checks for kernel / modules (2011-07-12 15:22:09 +0100)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib nitin/x32
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/x32
>>
>> Nitin A Kamble (5):
>>   siteinfo.bbclass: hack for x32
>>   udev-172: add a newer version for newer kernel
>>   runqemu: support qemux32 machine
> 
> These first three need a little more thought. They're fine to as proof
> of concept work but we need to find better ways to integrate them.
> 
> Specifically:
> 
> The siteinfo change is a hack and can't be merged as is. We need to find
> a way to change the target_arch or target_os in such a way we can signal
> to siteinfo to do something different. I also wonder if using i686-linux
> is actually correct for x32 in all cases since x32 does support 64 bit
> data types.

Hopefully this will be easier with the siteinfo dictionary bits we've
got in oe.dev that I'm working on moving to oe-core (world finished
overnight so time to diff the config.log's and kick off some of the
automated tests).

-- 
Tom Rini
Mentor Graphics Corporation


