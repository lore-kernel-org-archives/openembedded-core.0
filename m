Return-Path: <Qiang.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43AE76D544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 02:16:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAI2GrxT000431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 17 Nov 2013 18:16:53 -0800 (PST)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 17 Nov 2013 18:16:52 -0800
Message-ID: <52897892.2050400@windriver.com>
Date: Mon, 18 Nov 2013 10:16:50 +0800
From: Qiang Chen <qiang.chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1384414827-5485-1-git-send-email-qiang.chen@windriver.com>
	<528507F0.9000902@linux.intel.com>
In-Reply-To: <528507F0.9000902@linux.intel.com>
X-Originating-IP: [128.224.162.198]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: collect symbol link libxx.so for related libxx-dev package
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
X-List-Received-Date: Mon, 18 Nov 2013 02:16:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2013 01:27 AM, Saul Wold wrote:

> On 11/13/2013 11:40 PM, qiang.chen@windriver.com wrote:
>> From: Qiang Chen <qiang.chen@windriver.com>
>> Commit 91c0f9e3 moves library files to base_libdir for safe while
>> symbol link libuuid.so and libblkid.so are placed in libdir, not
>> base_libdir. Thus they are missed by related develop package and
>> collected by util-linux's develop package at last. Fix it.
>> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
>> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
>> ---
>>    meta/recipes-core/util-linux/util-linux.inc |    6 +++---
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
>> index 15b6770..e25fbd6 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -74,11 +74,11 @@ FILES_util-linux-reset = "${base_bindir}/reset"
>>    FILES_util-linux-partx = "${sbindir}/partx"
>>    FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
>> -FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
>> +FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
>>    FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
>> -FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>> +FILES_util-linux-libmount-dev = "${libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
>>    FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
>> -FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>> +FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
>>    FILES_util-linux-lscpu = "${bindir}/lscpu"
> Don't the .la files need to be with the .so files.

Yes, I missed these .la files.

The .la files also located at libdir not base_libdir, so I will send V2 patch.

Thanks Sau !

Qiang

> Sau!
>>    FILES_util-linux-fsck = "${base_sbindir}/fsck*"
>

