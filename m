Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 743DB60053
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 00:32:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8E0WjUZ009476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Sep 2015 17:32:45 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 13 Sep 2015 17:32:44 -0700
Message-ID: <55F615AB.5090305@windriver.com>
Date: Mon, 14 Sep 2015 08:32:43 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1440568528-26012-1-git-send-email-rongqing.li@windriver.com>
	<55EBCCF7.3080204@windriver.com>
In-Reply-To: <55EBCCF7.3080204@windriver.com>
Subject: Re: [PATCH][v2] xmlto: xsltproc is required by both native and target
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
X-List-Received-Date: Mon, 14 Sep 2015 00:32:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

ping

-Roy

On 2015年09月06日 13:19, Rongqing Li wrote:
> ping
>
> -Roy
>
> On 2015年08月26日 13:55, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> xsltproc is used to perform the XSL-T transformation by xmlto by default,
>> so it is required by both native and target, and target has the
>> dependence
>> on libxslt-bin, so add libxslt to native RDEPENDS
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   meta/recipes-devtools/xmlto/xmlto_0.0.26.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
>> b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
>> index a7a0183..688be74 100644
>> --- a/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
>> +++ b/meta/recipes-devtools/xmlto/xmlto_0.0.26.bb
>> @@ -24,6 +24,9 @@ RDEPENDS_${PN} = "docbook-xml-dtd4 \
>>   RDEPENDS_${PN}_append_class-target = " \
>>                     libxslt-bin \
>>   "
>> +RDEPENDS_${PN}_append_class-native = " \
>> +                  libxslt \
>> +"
>>
>>   BBCLASSEXTEND = "native"
>>
>>
>

-- 
Best Reagrds,
Roy | RongQing Li

