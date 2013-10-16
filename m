Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE916D09D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:23:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Oct 2013 17:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,503,1378882800"; d="scan'208";a="393490934"
Received: from unknown (HELO [10.255.15.253]) ([10.255.15.253])
	by orsmga001.jf.intel.com with ESMTP; 15 Oct 2013 17:23:44 -0700
Message-ID: <525DDC90.4050700@linux.intel.com>
Date: Tue, 15 Oct 2013 17:23:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
References: <525C2320.8000502@mlbassoc.com> <525DDB21.4060305@linux.intel.com>
In-Reply-To: <525DDB21.4060305@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kmod packaging question
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
X-List-Received-Date: Wed, 16 Oct 2013 00:23:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/2013 05:17 PM, Saul Wold wrote:
> On 10/14/2013 10:00 AM, Gary Thomas wrote:
>> I'm having some issues with the 'kmod' package.  In particular,
>> the package claims:
>>    commit b4bc0a7f1b90a51e26d6ab74d964ff81cfe05904
>>    Author: Khem Raj <raj.khem@gmail.com>
>>    Date:   Tue Jan 31 00:34:01 2012 -0800
>>
>>      kmod: Add recipes
>>
>>      kmod is replacement for module-init-tools
>>
>>      (From OE-Core rev: 716606f5446534e48b45fcc017e8bbdfe7f15e26)
>>
>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> But is is really a "replacement"?  I know that there is a provides
>> which makes the build happy, but unless you explicitly install the
>> kmod package into your image, you don't end up with all of the module
>> tools.  The main missing piece is 'depmod' - the rest seem to come
>> from busybox, not kmod.
>>
>> I ran into this when trying to run 'opkg upgrade' which sucked in
>> some new kernel modules and found that 'depmod' was not installed.
>>
>> Did I miss something?
>>
> Nope, it was a good catch, I will investigate the size increase for
> adding depmod into busybox.
>
Seems it adds 2240 bytes to the size of the busybox binary, that's far 
better than 675K that kmod would bring in.  I will get the patch up shortly.

Sau!

> Sau!
>
>> n.b. this was tested using Poky/Yocto
>> 0fc8317c6385eb1ed69ca4522ee6424c456dbb92
>> which is a few days old.  I've not checked the very latest master (yet).
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

