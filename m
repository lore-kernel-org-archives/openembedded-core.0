Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1StXgR-0007Jo-HQ
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 07:29:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6O5HqFN025367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jul 2012 22:17:52 -0700 (PDT)
Received: from [128.224.162.173] (128.224.162.173) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 23 Jul 2012 22:17:52 -0700
Message-ID: <500E2FFF.2050202@windriver.com>
Date: Tue, 24 Jul 2012 13:17:51 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <cover.1343032359.git.jackie.huang@windriver.com>
	<5e873b2c99606b089ed82777f64049837a30beb0.1343032359.git.jackie.huang@windriver.com>
	<1343037628.21788.83.camel@ted>
In-Reply-To: <1343037628.21788.83.camel@ted>
Subject: Re: [PATCH 1/1] quota 4.00: add DEPENDS gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jul 2012 05:29:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/23/2012 6:00 PM, Richard Purdie wrote:
> On Mon, 2012-07-23 at 16:38 +0800, jackie.huang@windriver.com wrote:
>> From: Jackie Huang<jackie.huang@windriver.com>
>>
>> do_install needs command 'msgfmt', it would fail if the command
>> doesn't exist on the host, add DEPENDS gettext-native to fix this.
>>
>> [YOCTO #2811]
>>
>> Signed-off-by: Jackie Huang<jackie.huang@windriver.com>
>> ---
>>   meta/recipes-extended/quota/quota_4.00.bb |    2 ++
>>   1 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/recipes-extended/quota/quota_4.00.bb b/meta/recipes-extended/quota/quota_4.00.bb
>> index 5fef9cb..25f6381 100644
>> --- a/meta/recipes-extended/quota/quota_4.00.bb
>> +++ b/meta/recipes-extended/quota/quota_4.00.bb
>> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "eb2b045f58b98299edc568b8607b95b10735b4a131fa5196f41c89b51f
>>
>>   S = "${WORKDIR}/quota-tools"
>>
>> +DEPENDS = "gettext-native"
>> +
>>   inherit autotools
>>
>>   EXTRA_OEMAKE += 'STRIP=""'
>
> Shouldn't this be "inherit gettext" ?

No, quota doesn't depend on gettext at runtime, so I don't think we need 
'inherit gettext'.

Thanks,
Jackie

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


