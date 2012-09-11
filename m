Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1TBSmf-00017w-3m
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:53:53 +0200
Received: from mail-pb0-f69.google.com ([209.85.160.69])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 08:41:18 -0700
Received: by pbbrp2 with SMTP id rp2so1471436pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=U1VS/wE41RML5Yx+FMI+Hu1pQ3V0/GkPnyZStPiw9bU=;
	b=bguBuGxWZ+kGLbFPoyyNDt6HdSrwtKB5nhQ/mJVnkYhXeC97jXgQmDJvua5txVJ21J
	4PWglznjfMRWCP3oW44EnZ5Pvcs6bogCcEI7NmGg6Crw36Jx56UEkdpW4QJyKEqk3JWI
	2SBkC2/kYFwakVEPYN/GzDPBhdneHa1j186AKiL3sYG2nihAcVbu/BpzFFviarMIHOFt
	Z+I52cAv+kN+borb3c/M/K618rlsy3DGIoiRZfNXL3Ettn5Bed6l+5pH5SYkqbMeiK6f
	hTr+39HOlj4hcD61ulnnon1wAmLdkTN164cNtJ34Uo2pvd32SHwfGUpFVb1a5UIlUk9b
	C5hQ==
Received: by 10.68.229.6 with SMTP id sm6mr11665221pbc.120.1347378077781;
	Tue, 11 Sep 2012 08:41:17 -0700 (PDT)
Received: by 10.68.229.6 with SMTP id sm6mr11665217pbc.120.1347378077683;
	Tue, 11 Sep 2012 08:41:17 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id nt7sm3754459pbb.33.2012.09.11.08.41.14
	(version=SSLv3 cipher=OTHER); Tue, 11 Sep 2012 08:41:16 -0700 (PDT)
Message-ID: <504F5B9A.7070501@intel.com>
Date: Tue, 11 Sep 2012 08:41:14 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
	<ea700a4897d82d27177a0583f01b6432ac7ec379.1347376358.git.bruce.ashfield@windriver.com>
	<504F59B1.60308@intel.com> <504F5B17.5070500@windriver.com>
In-Reply-To: <504F5B17.5070500@windriver.com>
X-Gm-Message-State: ALoCoQkT1NwZ6tK+IVtFVWwQNNoOgOLd+dqP0s1wBku9n84VxmRETuH66W0CoxSjx3Doi1pIxEeQ3vWYDIuYkBd4+IGcYRqkbB+8Zd729Q+tVJiNkhBwmcARPS3VG1DlDCoVj5cq5fiWRMZ0hmH42ki0xhMwmNAm0Czm/zwU+iEtApdxVD3CKJ01MeqcmA4Bq0Az9oHC5l3Z
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] linux-yocto/3.4: add x32 configuration fragment and tuning hook
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:39 AM, Bruce Ashfield wrote:
> On 12-09-11 11:33 AM, Saul Wold wrote:
>> On 09/11/2012 08:17 AM, Bruce Ashfield wrote:
>>> When x32 is the tuning for a x86 MACHINE, the kernel should also have
>>> CONFIG_X86_X32=y.
>>>
>>> This can be accomplished by adding the x32 configuraion fragment to the
>>> KERNEL_FEATURES when x32 is the tuning for a given machine.
>>>
>>> cc: Saul Wold <sgw@linux.intel.com>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>>> ---
>>> meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb | 3 ++-
>>> meta/recipes-kernel/linux/linux-yocto_3.4.bb | 3 ++-
>>> 2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>> b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>> index 4fd3845..156fb93 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
>>> @@ -10,7 +10,7 @@ KMETA = "meta"
>>>
>>> SRCREV_machine ?= "a35693b1287c0e50cdca33a1b95af0ff48b43cd0"
>>> SRCREV_machine_qemuppc ?= "85a1190530cb5749f5f831670976b163438dc301"
>>> -SRCREV_meta ?= "d9d5fc63d8b38705036e946ea77d971d95de11ad"
>>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>>>
>>> PR = "${INC_PR}.0"
>>> PV = "${LINUX_VERSION}+git${SRCPV}"
>>> @@ -27,3 +27,4 @@ KERNEL_FEATURES_append = " features/netfilter"
>>> KERNEL_FEATURES_append = " features/taskstats"
>>> KERNEL_FEATURES_append_qemux86 = " cfg/sound"
>>> KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
>>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>>
>> Scratch this bit and below, as I think I will use the other mechanism
>> you talked about to go from a .conf file.
>
> Works for me. The meta change is staged and pushed out, I'll update this
> patch to not have the KERNEL_FEATURES portion.
>
Thanks, see my other email to RP, since x32 is a feature that any x86-64 
machine might want to enable based on the DEFAULTTUNE it makes more 
sense to be in the machine config includes.

Sau!


> Bruce
>
>>
>> Sau!
>>
>>> \ No newline at end of file
>>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>>> b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>>> index 59ad4b2..bcd1292 100644
>>> --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
>>> @@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?=
>>> "b9a720ca38d298ed457f37d099c85771f9164b19"
>>> SRCREV_machine_qemux86 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>>> SRCREV_machine_qemux86-64 ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>>> SRCREV_machine ?= "46d8c757b3be1953f30d6745505d24436e2d6844"
>>> -SRCREV_meta ?= "a82db2f0fc3ceebf3cb47e9dd05e4856ff9966ab"
>>> +SRCREV_meta ?= "e0374ce012e7e6fc8e5bb8b957addb0478950898"
>>>
>>> SRC_URI =
>>> "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>>
>>>
>>>
>>> @@ -27,3 +27,4 @@ KERNEL_REVISION_CHECKING=""
>>> KERNEL_FEATURES_append = " features/netfilter"
>>> KERNEL_FEATURES_append_qemux86=" cfg/sound"
>>> KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
>>> +KERNEL_FEATURES_append_x32 = " cfg/x32"
>>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>



