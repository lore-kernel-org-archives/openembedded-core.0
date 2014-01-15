Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2A06BA1A;
	Wed, 15 Jan 2014 06:01:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0F61PP6001624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 22:01:25 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 14 Jan 2014 22:01:25 -0800
Message-ID: <52D62433.8020402@windriver.com>
Date: Wed, 15 Jan 2014 14:01:23 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>, Martin Jansa <martin.jansa@gmail.com>
References: <20140106112936.C3F0C50472@opal> <20140109144245.GF3709@jama>
	<1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1389763343.3092.17.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : autogen-native: upgrade to 5.18.2
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
X-List-Received-Date: Wed, 15 Jan 2014 06:01:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/15/2014 01:22 PM, Darren Hart wrote:
> On Thu, 2014-01-09 at 15:42 +0100, Martin Jansa wrote:
>> On Mon, Jan 06, 2014 at 11:29:36AM +0000, git@git.openembedded.org wrote:
>>> Module: openembedded-core.git
>>> Branch: master
>>> Commit: 6bcd2dafa379badab11bff9d7b607f7f5d72fc94
>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6bcd2dafa379badab11bff9d7b607f7f5d72fc94
>>>
>>> Author: Robert Yang <liezhi.yang@windriver.com>
>>> Date:   Fri Dec 27 01:05:14 2013 +0800
>>>
>>> autogen-native: upgrade to 5.18.2
>>>
>>> * Upgrade from 5.17.4 to 5.18.2
>>> * Rename files -> autogen
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>
>> Fails in world builds:
>
> Guessing I'm behind somewhere - seeing this as well. I thought it was an
> sstate issue, but doesn't appear to be. Is this addressed in a MUT build
> or something already?
>

Hi Darren,

I'm trying to figure out the reason, but haven't got much progress yet.

// Robert

>

