Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 43B4F70675
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 13:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6VDtOF6001386
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 06:55:24 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 31 Jul 2014 06:55:24 -0700
Message-ID: <53DA4ACB.2070902@windriver.com>
Date: Thu, 31 Jul 2014 08:55:23 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1406794207.git.liezhi.yang@windriver.com>	<989bf32313d1405858f7839e5474fe9be93fd182.1406794207.git.liezhi.yang@windriver.com>	<53D9FBF1.3050900@windriver.com>
	<1406814326.13346.179.camel@ted>
In-Reply-To: <1406814326.13346.179.camel@ted>
Subject: Re: [PATCH 2/2] local.conf.sample.extended: update for preferred ABI
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
X-List-Received-Date: Thu, 31 Jul 2014 13:55:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/14, 8:45 AM, Richard Purdie wrote:
> On Thu, 2014-07-31 at 16:18 +0800, Robert Yang wrote:
>>
>> On 07/31/2014 04:15 PM, Robert Yang wrote:
>>> [YOCTO #4073]
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>    meta/conf/local.conf.sample.extended |   15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
>>> index 89b80a6..8ad7b6f 100644
>>> --- a/meta/conf/local.conf.sample.extended
>>> +++ b/meta/conf/local.conf.sample.extended
>>> @@ -145,6 +145,13 @@
>>>    #MULTILIBS = "multilib:lib32"
>>>    #DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>>
>>> +# Set RPM_PREFER_COLOR to configure preferred ABI when using rpm packaging
>>> +# backend to generate a rootfs, choices are:
>>> +# 1: ELF32 wins
>>> +# 2: ELF64 wins
>>> +# 3: ELF64 N32 wins (for mips64 or mips64el only)
>>> +#RPM_PREFER_COLOR ?= "2"
>>> +
>
> Is x86 x32 also color 3?

x32 support was never implemented.  RPM has no unique identification for x32 
binaries at this time.  They're treated as ELF64 if I remember correctly.

If implemented, I would expect it to piggy back on '3' as well.

--Mark

> Cheers,
>
> Richard
>


