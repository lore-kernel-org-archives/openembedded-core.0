Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0D7C615E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 01:31:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBO1V5As029567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Dec 2013 17:31:05 -0800 (PST)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 23 Dec 2013 17:31:04 -0800
Message-ID: <52B8E3D5.4000602@windriver.com>
Date: Tue, 24 Dec 2013 09:31:01 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1387787578.git.Qi.Chen@windriver.com>
	<2e053dfde8c5b774d5f20be0f1afd3b41200fb9e.1387787578.git.Qi.Chen@windriver.com>
	<52B89023.80209@linux.intel.com>
In-Reply-To: <52B89023.80209@linux.intel.com>
X-Originating-IP: [128.224.162.164]
Subject: Re: [PATCH 1/2] busybox: enable SEAMLESS_XZ by default
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
X-List-Received-Date: Tue, 24 Dec 2013 01:31:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2013 03:33 AM, Saul Wold wrote:
> On 12/23/2013 12:36 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We have enabled SEAMLESS_GZ and SEAMLESS_BZ2 in defconfig, it's
>> reasonable for us to enable SEAMLESS_XZ as well. Otherwise, we
>> couldn't extract tar.xz file while we could extract tar.gz file.
>> Such situation would be somewhat confusing.
>>
> It's also important to note how much bigger the busybox image grows 
> when adding a new config options, so what's the increase in # of bytes?
>

Hi Saul,

The total size increase is (511116 + 47184 - 499980 - 47184 = 11136) bytes.

Here's more data.
*) Before the change:
-rwxr-xr-x 2 chenqi chenqi 511116 Dec 23 02:44 
tmp/work/i586-poky-linux/busybox/1.21.1-r0/packages-split/busybox/bin/busybox.nosuid
-rwsr-xr-x 2 chenqi chenqi 47184 Dec 23 02:44 
tmp/work/i586-poky-linux/busybox/1.21.1-r0/packages-split/busybox/bin/busybox.suid
*) After the change:
-rwxr-xr-x 2 chenqi chenqi 499980 Dec 23 20:25 
tmp/work/i586-poky-linux/busybox/1.21.1-r0/packages-split/busybox/bin/busybox.nosuid
-rwsr-xr-x 2 chenqi chenqi 47184 Dec 23 20:25 
tmp/work/i586-poky-linux/busybox/1.21.1-r0/packages-split/busybox/bin/busybox.suid

Best Regards,
Chen Qi


> Thanks
>     Sau!
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/busybox/busybox/defconfig |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/busybox/busybox/defconfig 
>> b/meta/recipes-core/busybox/busybox/defconfig
>> index f0e63c2..20cd147 100644
>> --- a/meta/recipes-core/busybox/busybox/defconfig
>> +++ b/meta/recipes-core/busybox/busybox/defconfig
>> @@ -125,7 +125,7 @@ CONFIG_FEATURE_HWIB=y
>>   #
>>   # Archival Utilities
>>   #
>> -# CONFIG_FEATURE_SEAMLESS_XZ is not set
>> +CONFIG_FEATURE_SEAMLESS_XZ=y
>>   CONFIG_FEATURE_SEAMLESS_LZMA=y
>>   CONFIG_FEATURE_SEAMLESS_BZ2=y
>>   CONFIG_FEATURE_SEAMLESS_GZ=y
>>
>


