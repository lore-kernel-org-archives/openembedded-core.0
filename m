Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74FAD7CFC4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2019 01:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2M1hjuL021187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Mar 2019 18:43:45 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 21 Mar 2019 18:43:44 -0700
Message-ID: <5C943E0A.5050501@windriver.com>
Date: Fri, 22 Mar 2019 09:44:42 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, oe-core
	<openembedded-core@lists.openembedded.org>
References: <1553138356-85237-1-git-send-email-liwei.song@windriver.com>	
	<1553138356-85237-9-git-send-email-liwei.song@windriver.com>
	<5b0bba9dde47bff3dec243a7a3d39e12c6efc2a8.camel@linuxfoundation.org>
In-Reply-To: <5b0bba9dde47bff3dec243a7a3d39e12c6efc2a8.camel@linuxfoundation.org>
Subject: Re: [PATCH 8/8] oe-core: add ledmon to support Intel VROC
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
X-List-Received-Date: Fri, 22 Mar 2019 01:43:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 03/22/2019 07:32 AM, Richard Purdie wrote:
> On Wed, 2019-03-20 at 23:19 -0400, Liwei Song wrote:
>> This add ledmon demon to control Intel VROC's SSD disk led.
>>
>> Signed-off-by: Liwei Song <liwei.song@windriver.com>
>> ---
>>  meta/recipes-extended/ledmon/ledmon_git.bb | 32 ++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 meta/recipes-extended/ledmon/ledmon_git.bb
>>
>> diff --git a/meta/recipes-extended/ledmon/ledmon_git.bb b/meta/recipes-extended/ledmon/ledmon_git.bb
>> new file mode 100644
>> index 000000000000..77a620860cab
>> --- /dev/null
>> +++ b/meta/recipes-extended/ledmon/ledmon_git.bb
>> @@ -0,0 +1,32 @@
>> +SUMMARY = "Intel(R) Enclosure LED Utilities"
>> +
>> +DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
>> + utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
>> +"
>> +HOMEPAGE = "https://github.com/intel/ledmon"
>>
> 
> I'm not sure many of our systems have this. Would this not be more
> appropriate in meta-intel or in some other layer? it does seem a bit of
> a specialist use case?

OK, will try to send it to meta-intel, Thanks for your suggestion.

Liwei.


> 
> Cheers,
> 
> Richard
> 
> 
> 

