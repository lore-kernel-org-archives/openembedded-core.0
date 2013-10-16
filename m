Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id C0C356CBA4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 03:44:03 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 73704F811FE; Tue, 15 Oct 2013 21:44:05 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 773D4F811E0;
	Tue, 15 Oct 2013 21:44:03 -0600 (MDT)
Message-ID: <525E0B8D.8070008@mlbassoc.com>
Date: Tue, 15 Oct 2013 21:44:13 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <525C2320.8000502@mlbassoc.com> <525DDB21.4060305@linux.intel.com>
	<525DDC90.4050700@linux.intel.com>
In-Reply-To: <525DDC90.4050700@linux.intel.com>
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
X-List-Received-Date: Wed, 16 Oct 2013 03:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-10-15 18:23, Saul Wold wrote:
> On 10/15/2013 05:17 PM, Saul Wold wrote:
>> On 10/14/2013 10:00 AM, Gary Thomas wrote:
>>> I'm having some issues with the 'kmod' package.  In particular,
>>> the package claims:
>>>    commit b4bc0a7f1b90a51e26d6ab74d964ff81cfe05904
>>>    Author: Khem Raj <raj.khem@gmail.com>
>>>    Date:   Tue Jan 31 00:34:01 2012 -0800
>>>
>>>      kmod: Add recipes
>>>
>>>      kmod is replacement for module-init-tools
>>>
>>>      (From OE-Core rev: 716606f5446534e48b45fcc017e8bbdfe7f15e26)
>>>
>>>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>
>>> But is is really a "replacement"?  I know that there is a provides
>>> which makes the build happy, but unless you explicitly install the
>>> kmod package into your image, you don't end up with all of the module
>>> tools.  The main missing piece is 'depmod' - the rest seem to come
>>> from busybox, not kmod.
>>>
>>> I ran into this when trying to run 'opkg upgrade' which sucked in
>>> some new kernel modules and found that 'depmod' was not installed.
>>>
>>> Did I miss something?
>>>
>> Nope, it was a good catch, I will investigate the size increase for
>> adding depmod into busybox.
>>
> Seems it adds 2240 bytes to the size of the busybox binary, that's far better than 675K that kmod would bring in.  I will get the patch up shortly.

Cool, thanks!!

>>> n.b. this was tested using Poky/Yocto
>>> 0fc8317c6385eb1ed69ca4522ee6424c456dbb92
>>> which is a few days old.  I've not checked the very latest master (yet).
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

