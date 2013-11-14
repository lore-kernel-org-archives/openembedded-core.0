Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AE2606D6EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:45:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Nov 2013 10:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435370973"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 10:45:33 -0800
Message-ID: <52851A4D.7090107@linux.intel.com>
Date: Thu, 14 Nov 2013 10:45:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>, 
	openembedded-core@lists.openembedded.org
References: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
	<1384432474-20764-2-git-send-email-paul_woegerer@mentor.com>
	<5285165C.9030908@linux.intel.com> <52851768.9010602@mentor.com>
In-Reply-To: <52851768.9010602@mentor.com>
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 1/3] liburcu: Update to version 0.7.9
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
X-List-Received-Date: Thu, 14 Nov 2013 18:45:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 10:33 AM, Woegerer, Paul wrote:
> On 11/14/2013 07:28 PM, Saul Wold wrote:
>> On 11/14/2013 04:34 AM, Paul Woegerer wrote:
>>> Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
>>> ---
>>>    meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb}
>>> | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>    rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb =>
>>> liburcu_0.7.9.bb} (81%)
>>>
>>> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
>>> b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
>>> similarity index 81%
>>> rename from meta/recipes-support/liburcu/liburcu_0.7.7.bb
>>> rename to meta/recipes-support/liburcu/liburcu_0.7.9.bb
>>> index a75e92e..c8c4802 100644
>>> --- a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
>>> +++ b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
>>> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
>>>
>>>    SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
>>>
>>> -SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
>>> -SRC_URI[sha256sum] =
>>> "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
>>> +SRC_URI[md5sum] = "a625266e17437f91111ab4e736c5056f"
>>> +SRC_URI[sha256sum] =
>>> "a7e1f781773c953d5cc456aa92a3c6d2385c5f984d8d576dccfaf93dd14f1405"
>>>
>>>    S = "${WORKDIR}/userspace-rcu-${PV}"
>>>    CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>>>
>> We appear to have updated this to 0.8.0 already, will that be a problem?
>
> No problem. lttng-ust 2.3 works fine with urcu 0.8.x.
>
> I will send an update to 0.8.1 (see
> http://lists.lttng.org/pipermail/lttng-dev/2013-November/021744.html).
>
Ok, when you do so, can you do a small cleanup of moving the files 
directory to liburcu, we are trying to clean that up incrementally.

Thanks
	Sau!

> Thanks,
> Paul
>
>>
>> Sau!
>>
>
>

