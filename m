Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADE86C737
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 17:57:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB4Hv9r2027761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Dec 2013 09:57:09 -0800 (PST)
Received: from [128.224.146.203] (128.224.146.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 4 Dec 2013 09:57:09 -0800
Message-ID: <529F6CF4.9080909@windriver.com>
Date: Wed, 4 Dec 2013 12:57:08 -0500
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <jackie.huang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1385461228-9326-1-git-send-email-jackie.huang@windriver.com>
	<529CF232.5060707@linux.intel.com>
In-Reply-To: <529CF232.5060707@linux.intel.com>
X-Originating-IP: [128.224.146.203]
Cc: Yue.Tao@windriver.com
Subject: Re: [PATCH] tzcode-native: Replace fixed version with PV
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
X-List-Received-Date: Wed, 04 Dec 2013 17:57:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 13-12-02 03:48 PM, Saul Wold wrote:
> On 11/26/2013 02:20 AM, jackie.huang@windriver.com wrote:
>> From: Yue Tao <Yue.Tao@windriver.com>
>>
>> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
>> ---
>>   meta/recipes-extended/tzcode/tzcode-native_2013h.bb | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
>> b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
>> index 5cdc7ef..b51e303 100644
>> --- a/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
>> +++ b/meta/recipes-extended/tzcode/tzcode-native_2013h.bb
>> @@ -6,7 +6,8 @@ LIC_FILES_CHKSUM =
>> "file://${WORKDIR}/README;md5=0b7570113550eb5d30aa4bd220964b8
>>   # note that we allow for us to use data later than our code version
>>   #
>>   SRC_URI ="
>> ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
>> -
>> ftp://ftp.iana.org/tz/releases/tzdata2013h.tar.gz;name=tzdata"
>> +
>> ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata \
>> +"
>>
> I am not sure it's correct to do this, I think there are times that the
> tzcode and tzdata are not updated at the same time.

Yes, it's fairly common to have a stable tzcode pkg and frequent
releases of tzdata as the world's governments make, ummm interesting
decisions. :)

../Randy
>
> Sau!
>
>>   SRC_URI[tzdata.md5sum] = "d310abe42cbe87e76ceb69e2c7003c92"
>>   SRC_URI[tzdata.sha256sum] =
>> "6b9e17e823eec0e09e12f74b452a70be4face1ef14c2fb1917b7c7e60564de27"
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

