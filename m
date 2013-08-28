Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D333A6BCC6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 18:54:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7SIsGkt013189
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 11:54:16 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 28 Aug 2013 11:54:15 -0700
Message-ID: <521E4757.4080202@windriver.com>
Date: Wed, 28 Aug 2013 13:54:15 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: jhuang0 <jackie.huang@windriver.com>
References: <cover.1375436283.git.jackie.huang@windriver.com>
	<521C5608.3080508@windriver.com>
In-Reply-To: <521C5608.3080508@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] multilib.bbclass: Expand the WHITELISTs with multilib prefix
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
X-List-Received-Date: Wed, 28 Aug 2013 18:54:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/27/13 2:32 AM, jhuang0 wrote:
> Could anyone look at this? It's been a long time here, but no comments
> and is not merged yet.

This is definitely still needed in oe-core.  Without this the license 
whitelist/blacklist doesn't work as expected when multilibs are enabled.

The only alternative would be to change where the whitelist/blacklist is 
evaluated to look for the version w/o the multilib name.  But I don't believe 
that can be done easily (or perhaps at all.)

--Mark

> Thanks,
> Jackie
>
> On 8/2/2013 5:46 PM, jackie.huang@windriver.com wrote:
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Tested with:
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>> INCOMPATIBLE_LICENSE = "GPLv3"
>>
>> --
>> The following changes since commit f192c444c2d88c49738bea4ff4c3af0cc72916de:
>>
>>     texinfo: Update to 5.1 (2013-07-31 06:56:28 +0100)
>>
>> are available in the git repository at:
>>     git://git.pokylinux.org/poky-contrib jhuang0/d_gplv3_0801_2
>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_gplv3_0801_2
>>
>> Jackie Huang (1):
>>     multilib.bbclass: Expand the WHITELISTs with multilib prefix
>>
>>    meta/classes/multilib.bbclass |    7 +++++++
>>    1 files changed, 7 insertions(+), 0 deletions(-)
>>
>


