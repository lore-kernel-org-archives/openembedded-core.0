Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C73D565D59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 00:24:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8N0OjU5014906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Sep 2014 17:24:46 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 22 Sep 2014 17:24:45 -0700
Message-ID: <5420BDCC.8090704@windriver.com>
Date: Tue, 23 Sep 2014 08:24:44 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYdghqD+V_0QDCV-dgsEtrU4vSPZjG60Da+BCogkwZ+gQ@mail.gmail.com>
	<541F6BE5.9000002@windriver.com> <20140922120004.GD32340@gmail.com>
In-Reply-To: <20140922120004.GD32340@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnupg: add pinentry RDEPENDS
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
X-List-Received-Date: Tue, 23 Sep 2014 00:24:45 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/22/2014 08:00 PM, Paul Barker wrote:
> On Mon, Sep 22, 2014 at 08:23:01AM +0800, Rongqing Li wrote:
>>
>>
>> On 09/19/2014 11:08 PM, Burton, Ross wrote:
>>> On 19 September 2014 07:49,  <rongqing.li@windriver.com> wrote:
>>>> gnupg needs pinentry to run
>>>
>>> Isn't this only needed if the agent is enabled?
>>>
>>> Ross
>>>
>>>
>>
>>
>> No, gnupg 2.x.x always need it;
>>
>> 1. the below is from README of gnupg
>>
>> You also need the Pinentry package for most function of GnuPG; however
>> it is not a build requirement.  Pinentry is available at
>> ftp://ftp.gnupg.org/gcrypt/pinentry/ .
>>
>
> There are some uses of gnupg which never need pinentry. For example, managing
> the set of trusted keys for verifying package and feed signatures with opkg. I'd
> prefer pinentry to be in RRECOMMENDS so that I can add it to
> BAD_RECOMMENDATIONS and thereby disable it when I know it isn't needed.
>
> Thanks,
>

I am ok, but I still hope the oe-core can accept the pinentry, since
"You also need the Pinentry package for most function of GnuPG" as in
gnupg README

-Roy

-- 
Best Reagrds,
Roy | RongQing Li

