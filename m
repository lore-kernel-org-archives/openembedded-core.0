Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEC2A7F296
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 07:52:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8B7pu2F008247
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Sep 2019 00:52:06 -0700
Received: from [0.0.0.0] (147.11.103.217) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 11 Sep 2019 00:51:45 -0700
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1568181773-91288-1-git-send-email-li.zhou@windriver.com>
	<8d42e3a265dcb8c3dc5398d0f6056df9f0d7940e.camel@intel.com>
From: zhou li <li.zhou@windriver.com>
Message-ID: <a69a4699-d89a-098e-98fb-2c41f8cefbb3@windriver.com>
Date: Wed, 11 Sep 2019 15:51:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <8d42e3a265dcb8c3dc5398d0f6056df9f0d7940e.camel@intel.com>
Subject: Re: [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
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
X-List-Received-Date: Wed, 11 Sep 2019 07:52:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2019/09/11 15:38, Mittal, Anuj wrote:
> On Wed, 2019-09-11 at 14:02 +0800, Li Zhou wrote:
>> Backporting patch from
>> https://gitlab.freedesktop.org/slirp/libslirp/commit/c5927943
>> to solve CVE-2019-15890.
>>
>> Signed-off-by: Li Zhou <li.zhou@windriver.com>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc                |  1 +
>>   .../qemu/qemu/CVE-2019-15890.patch                 | 48
>> ++++++++++++++++++++++
>>   2 files changed, 49 insertions(+)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-
>> 15890.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
>> devtools/qemu/qemu.inc
>> index 241f9db..de21d30 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -23,6 +23,7 @@ SRC_URI = "
>> https://download.qemu.org/${BPN}-${PV}.tar.xz \
>>              file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-
>> target.patch \
>>              file://0009-Fix-webkitgtk-builds.patch \
>>              file://0010-configure-Add-pkg-config-handling-for-
>> libgcrypt.patch \
>> +           file://CVE-2019-15890.patch \
>>              "
>>   UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>   
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> new file mode 100644
>> index 0000000..1d89431
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
>> @@ -0,0 +1,48 @@
>> +From 4fc0d23e8f6d795c679623d2ed2cbe6a7a17b9c7 Mon Sep 17 00:00:00
>> 2001
>> +From: Li Zhou <li.zhou@windriver.com>
> Can you please fix the author name here?


Do you mean it should be the original author?

Here is my name because I have adapted sth (the file path) in the patch.

Should I change it back by hand here?

Thanks.


>
> Thanks,
>
> Anuj

-- 
Best Regards!
Zhou Li
Phone number: 86-10-84778511


