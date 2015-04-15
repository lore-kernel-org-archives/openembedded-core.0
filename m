Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F64773505
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:51:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3FDoj3P002923
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Apr 2015 06:51:15 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 15 Apr 2015 06:51:09 -0700
Message-ID: <552E6CC4.8090207@windriver.com>
Date: Wed, 15 Apr 2015 21:51:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1428915889.git.liezhi.yang@windriver.com>	
	<23b227aea2cf5a59a34099160df37b0c50077701.1428915889.git.liezhi.yang@windriver.com>	
	<552DC73E.5090002@windriver.com>
	<1429104930.6976.117.camel@linuxfoundation.org>
In-Reply-To: <1429104930.6976.117.camel@linuxfoundation.org>
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] syslinux: add syslinux-nomtools to PACKAGES
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
X-List-Received-Date: Wed, 15 Apr 2015 13:51:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/15/2015 09:35 PM, Richard Purdie wrote:
> On Wed, 2015-04-15 at 10:04 +0800, Robert Yang wrote:
>>
>> On 04/13/2015 05:05 PM, Robert Yang wrote:
>>> The default installed syslinux depends on mtools, we install
>>> syslinux-nomtools too, which has the ext2/3/4 support.
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>    meta/recipes-devtools/syslinux/syslinux_6.03.bb |    5 ++++-
>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.03.bb b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
>>> index 33dd776..ddb8744 100644
>>> --- a/meta/recipes-devtools/syslinux/syslinux_6.03.bb
>>> +++ b/meta/recipes-devtools/syslinux/syslinux_6.03.bb
>>> @@ -66,14 +66,17 @@ do_install() {
>>>    	install -d ${D}${datadir}/syslinux/
>>>    	install -m 644 ${S}/bios/core/ldlinux.sys ${D}${datadir}/syslinux/
>>>    	install -m 644 ${S}/bios/core/ldlinux.bss ${D}${datadir}/syslinux/
>>> +	install -m 644 ${S}/bios/linux/syslinux-nomtools ${D}${bindir}/
>>
>> Sorry, I updated this patch a little, it should be:
>>
>> -m 0755, not 0644.
>>
>>     git://git.openembedded.org/openembedded-core-contrib rbt/syslinux
>>
>> Thanks to Adrian.
>
> I merged master-next which contained this patch before seeing this. I've
> created a fix for master-next. With this tweak in it. This is the
> downside to tweaking branches already in master-next though :(.

Thanks, I'm sorry about this.

// Robert

>
> Cheers,
>
> Richard
>
>
>

