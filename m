Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 38D0474561
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:46:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Sep 2018 04:46:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,284,1534834800"; d="scan'208";a="71813796"
Received: from fjumaah-mobl1.gar.corp.intel.com (HELO [10.249.66.211])
	([10.249.66.211])
	by fmsmga007.fm.intel.com with ESMTP; 21 Sep 2018 04:46:10 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Cal Sullivan <california.l.sullivan@intel.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <0717be0e-0c72-e3f5-dc11-8e4065585749@intel.com>
Date: Fri, 21 Sep 2018 19:46:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRQxauR4PkJ+FMXKmnJapcWO9pVSvW1cLVyrDU9-T+o65A@mail.gmail.com>
Cc: bruce.ashfield@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2018 11:46:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/21/2018 06:04 PM, Andreas Müller wrote:
> On Fri, Apr 13, 2018 at 12:12 AM, Andreas Müller
> <schnitzeltony@gmail.com> wrote:
>> On Thu, Apr 12, 2018 at 11:46 PM, Andreas Müller
>> <schnitzeltony@gmail.com> wrote:
>>> On Thu, Apr 12, 2018 at 11:38 PM, Cal Sullivan
>>> <california.l.sullivan@intel.com> wrote:
>>>> If you're using a non-linux-yocto kernel you likely need to apply this patch
>>>> to your kernel as well:
>>>>
>>>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kernel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch
>>> Correct: RaspberryPi kernel
>>>>
>>>> (This is in all linux-yocto kernels, I'm only linking to meta-intel because
>>>> I knew where it was off the top of my head)
>>>>
>>>> This was sent upstream but last I looked it didn't gain any traction. I
>>>> think Bruce resent it recently but I can't be sure.
>>>>
>>>> Thanks,
>>>> Cal
>>>>
>>> That looks very promising - will try and let you know - thanks in advance :)
>>>
>> Perfect! - Thanks Cal for quick help!
>>
> Hi,
> 
> seems upstream has introduced changes 4.17 -> 4.18 - the patch does
> not apply anymore. Is this patch available for 4.18 somewhere?
> 

Are you looking for this:

https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit?h=v4.18/standard/base&id=bd6314212686ef8156a108b6f1eec67d34402878

https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/?h=v4.18/standard/base&id=0aa800372a846d6ed2c0fc3e0fdc22656d268968

