Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8F0F76CFF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 23:59:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Oct 2013 17:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="427361883"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 30 Oct 2013 17:00:01 -0700
Message-ID: <52719D80.6050406@linux.intel.com>
Date: Wed, 30 Oct 2013 17:00:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1383172767-11006-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1soQ1+u_5_MieNh69LsDRf+MAonGM6rSmw6Es1SGmh6DEQ@mail.gmail.com>
In-Reply-To: <CAMKF1soQ1+u_5_MieNh69LsDRf+MAonGM6rSmw6Es1SGmh6DEQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: fix typo in local.rules
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
X-List-Received-Date: Wed, 30 Oct 2013 23:59:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/2013 04:53 PM, Khem Raj wrote:
> On Wed, Oct 30, 2013 at 3:39 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>   meta/recipes-core/udev/udev/local.rules | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/udev/udev/local.rules b/meta/recipes-core/udev/udev/local.rules
>> index f06002c..59836a4 100644
>> --- a/meta/recipes-core/udev/udev/local.rules
>> +++ b/meta/recipes-core/udev/udev/local.rules
>> @@ -19,4 +19,4 @@ ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe
>>   # Create a symlink to any touchscreen input device
>>   # Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
>>   # has an EV_ABS value (-a) which is used for touchscreen type devices.
>> -+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
>> ++SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK=="input/touchscreen0"
>
^^^^ and extra + there was my real typo!

> += is perfectly fine for SYMLINK contruct. Why is it a typo ?
>
Gah, I fixed the wrong typo

Sau!
>> --
>> 1.8.3.1
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

