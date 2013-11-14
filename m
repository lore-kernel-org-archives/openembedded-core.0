Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA186D732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 18:33:15 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Vh1j9-0001tn-7C from Paul_Woegerer@mentor.com ;
	Thu, 14 Nov 2013 10:33:15 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 14 Nov 2013 10:33:14 -0800
Received: from atv-pwoegere-l3.atv.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 14 Nov 2013 18:33:13 +0000
Message-ID: <52851768.9010602@mentor.com>
Date: Thu, 14 Nov 2013 19:33:12 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1384432474-20764-1-git-send-email-paul_woegerer@mentor.com>
	<1384432474-20764-2-git-send-email-paul_woegerer@mentor.com>
	<5285165C.9030908@linux.intel.com>
In-Reply-To: <5285165C.9030908@linux.intel.com>
X-OriginalArrivalTime: 14 Nov 2013 18:33:14.0928 (UTC)
	FILETIME=[FAFFEB00:01CEE167]
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
X-List-Received-Date: Thu, 14 Nov 2013 18:33:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 11/14/2013 07:28 PM, Saul Wold wrote:
> On 11/14/2013 04:34 AM, Paul Woegerer wrote:
>> Signed-off-by: Paul Woegerer <paul_woegerer@mentor.com>
>> ---
>>   meta/recipes-support/liburcu/{liburcu_0.7.7.bb => liburcu_0.7.9.bb}
>> | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta/recipes-support/liburcu/{liburcu_0.7.7.bb =>
>> liburcu_0.7.9.bb} (81%)
>>
>> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
>> b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
>> similarity index 81%
>> rename from meta/recipes-support/liburcu/liburcu_0.7.7.bb
>> rename to meta/recipes-support/liburcu/liburcu_0.7.9.bb
>> index a75e92e..c8c4802 100644
>> --- a/meta/recipes-support/liburcu/liburcu_0.7.7.bb
>> +++ b/meta/recipes-support/liburcu/liburcu_0.7.9.bb
>> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
>>
>>   SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
>>
>> -SRC_URI[md5sum] = "d14de3ff32eb1ab9424b258599c8a6f3"
>> -SRC_URI[sha256sum] =
>> "8ab8a7d8fea47c09ceac24c9277f00da626bbd9426c973eb325b1baf33b4bdfb"
>> +SRC_URI[md5sum] = "a625266e17437f91111ab4e736c5056f"
>> +SRC_URI[sha256sum] =
>> "a7e1f781773c953d5cc456aa92a3c6d2385c5f984d8d576dccfaf93dd14f1405"
>>
>>   S = "${WORKDIR}/userspace-rcu-${PV}"
>>   CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
>>
> We appear to have updated this to 0.8.0 already, will that be a problem?

No problem. lttng-ust 2.3 works fine with urcu 0.8.x.

I will send an update to 0.8.1 (see
http://lists.lttng.org/pipermail/lttng-dev/2013-November/021744.html).

Thanks,
Paul

>
> Sau!
>


-- 
Paul Woegerer, SW Development Engineer
Sourcery Analyzer <http://go.mentor.com/sourceryanalyzer>
Mentor Graphics, Embedded Software Division


