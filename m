Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED56608BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 02:33:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5L2XMtb019969
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jun 2013 19:33:22 -0700 (PDT)
Received: from [128.224.176.88] (128.224.176.88) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 20 Jun 2013 19:33:21 -0700
Message-ID: <51C3BB70.10700@windriver.com>
Date: Fri, 21 Jun 2013 10:33:20 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1371726597-22194-1-git-send-email-jackie.huang@windriver.com>
	<1371730296.20823.231.camel@ted>
In-Reply-To: <1371730296.20823.231.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libxml2 CVE-2012-2807
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
X-List-Received-Date: Fri, 21 Jun 2013 02:33:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/20/2013 8:11 PM, Richard Purdie wrote:
> On Thu, 2013-06-20 at 19:09 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Multiple integer overflows in libxml2, as used in Google Chrome
>> before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to
>> cause a denial of service or possibly have unspecified other impact via unknown vectors.
>> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../libxml/libxml2/libxml2-fix-CVE-2012-2807.patch |   78 ++++++++++++++++++++
>>   meta/recipes-core/libxml/libxml2_2.9.1.bb          |    1 +
>>   2 files changed, 79 insertions(+), 0 deletions(-)
>>   create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
>>
>> diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
>> new file mode 100644
>> index 0000000..f796ab7
>> --- /dev/null
>> +++ b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
>> @@ -0,0 +1,78 @@
>> +Attempt to address libxml crash.
>> +
>> +BUG=129930
>> +Review URL: https://chromiumcodereview.appspot.com/10458051
>> +
>> +https://src.chromium.org/viewvc/chrome?view=rev&revision=142822
>> +
>> +2012-2807
>> +Multiple integer overflows in libxml2, as used in Google Chrome
>> +before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to cause \
>> +a denial of service or possibly have unspecified other impact via unknown vectors.
>> +http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807
>> +
>> +Signed-off-by: Li Wang <li.wang@windriver.com>
>
> No Upstream-Status field.

Added and sent v2 for it.

Thanks,
jackie

>
> Cheers,
>
> Richard
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

