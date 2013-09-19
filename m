Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFE3C60EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 15:04:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8JF44r0014909
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 08:04:04 -0700 (PDT)
Received: from [128.224.146.246] (128.224.146.246) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 19 Sep 2013 08:04:02 -0700
Message-ID: <523B1261.1060709@windriver.com>
Date: Thu, 19 Sep 2013 11:04:01 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1378890742.git.rongqing.li@windriver.com>
	<dec697bffb0eebaeb34f5acd32929ba866174585.1378890742.git.rongqing.li@windriver.com>
	<CABcZANk8PQkxHUZ93-bSzgoSzc2_W3ArNT7_cD1v47oLBL7X7g@mail.gmail.com>
	<20130919114753.GA26522@sestofb10.enea.se>
In-Reply-To: <20130919114753.GA26522@sestofb10.enea.se>
X-Originating-IP: [128.224.146.246]
Subject: Re: [PATCH 1/1] ptest-runner: trivial fixes and refine
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
X-List-Received-Date: Thu, 19 Sep 2013 15:04:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 13-09-19 07:47 AM, Björn Stenberg wrote:
> Chris Larson wrote:
>> On Wed, Sep 11, 2013 at 2:17 AM, <rongqing.li@windriver.com> wrote:
>>
>>> +    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
>>> +    do
>>>
>>
>> As far as I can tell, busybox find doesn't support -L, so this adds an
>> implicit, undeclared dependency upon findutils.
>
> Rongqing, are you planning on fixing this? As committed, ptest-runner can't run on busybox systems
>

Yes, Roy will fix this. He's on holiday for a few days.

I presume he'll add a check to see which arg to use for find
rather than add a dependency on findutils.

 > (which I'd argue are the majority of embedded systems).

That's becoming less true over time, IMO.
It seems that more and more embedded linux users are on bigger
targets that use the discrete GNU tools.


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

