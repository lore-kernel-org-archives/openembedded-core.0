Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 997736B5B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 04:41:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2014 21:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,659,1389772800"; d="scan'208";a="472937998"
Received: from gavaldez-mobl3.amr.corp.intel.com (HELO [10.255.86.217])
	([10.255.86.217])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2014 21:41:31 -0700
User-Agent: Microsoft-MacOutlook/14.3.9.131030
Date: Fri, 14 Mar 2014 21:42:10 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <CF4927A2.786EB%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] linux-yocto-custom: Use SRCREV_machine
References: <0b46d38b8e08d22c308a49d3ccb96ae9c8f14121.1394831720.git.dvhart@linux.intel.com>
	<CADkTA4NkEu6-4tgea7zj9k2n1rQQMMBDvMCiDDJuRqo-LwocqQ@mail.gmail.com>
In-Reply-To: <CADkTA4NkEu6-4tgea7zj9k2n1rQQMMBDvMCiDDJuRqo-LwocqQ@mail.gmail.com>
Mime-version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto-custom: Use SRCREV_machine
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
X-List-Received-Date: Sat, 15 Mar 2014 04:41:37 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 3/14/14, 20:51, "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:

>On Fri, Mar 14, 2014 at 5:15 PM, Darren Hart <dvhart@linux.intel.com>
>wrote:
>> The Yocto kernel tools look for SRCREV_machine in do_validate_branches,
>> if it's empty, it just returns and silently continues. This likely needs
>> at least a warning. However, this recipe should be using SRCREV_machine,
>> and not just SRCREV.

Saul had a recipe using Linus' git tree and an old rev in master. It
worked in 1.3, but not in 1.5. He found that without setting
SRCREV_machine specifically, the wrong SRCREV would be checked out, and
the subsequent patches would fail to apply. Saul can provide specifics.
Happy to have this wait until we've spelled it out correctly.

--
Darren

>
>I can't think of anything that breaks with this .. but my spidey
>senses are tingling.
>
>This log should tell us what actually broke in the end ? What failed
>to build / work
>or otherwise explode ?
>
>Bruce
>
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Reported-by: Saul Wold <sgw@linux.intel.com>
>> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  .../recipes-kernel/linux/linux-yocto-custom.bb     |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>>b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> index 4115d2f..42162f3 100644
>> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>> @@ -54,7 +54,7 @@ LINUX_VERSION_EXTENSION ?= "-custom"
>>  # Override SRCREV to point to a different commit in a bbappend file to
>>  # build a different release of the Linux kernel.
>>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
>> -SRCREV="76e10d158efb6d4516018846f60c2ab5501900bc"
>> +SRCREV_machine="76e10d158efb6d4516018846f60c2ab5501900bc"
>>
>>  PR = "r1"
>>  PV = "${LINUX_VERSION}+git${SRCPV}"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>-- 
>"Thou shalt not follow the NULL pointer, for chaos and madness await
>thee at its end"
>




