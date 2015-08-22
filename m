Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10D8673DF0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 04:20:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7M4KFXi018197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:20:15 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 21:20:15 -0700
Message-ID: <55D7F87E.3050803@windriver.com>
Date: Sat, 22 Aug 2015 00:20:14 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1440193082-508-1-git-send-email-otavio@ossystems.com.br>	<2ADD7CA4-0184-4D54-9E0B-8A58ACB51DC1@gmail.com>
	<CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrEBfBH-+Z2VYg3qG5Bpi7aDozn6F1Z9r7MP3qC8Zs+RQ@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH] Rename 'BRANCH' variable to 'SRC_BRANCH' for clearness
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
X-List-Received-Date: Sat, 22 Aug 2015 04:20:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015-08-21 05:58 PM, Otavio Salvador wrote:
> On Fri, Aug 21, 2015 at 6:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Aug 21, 2015, at 2:38 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>>
>>> The 'BRANCH' variable name has no explicit relation with the
>>> SRC_URI. Using 'SRC_BRANCH' makes it more obvious and easier to
>>> identify.
>>
>> Look good to me, just may be avoid ‘_’ and call it SRCBRANCH
>
> I did this initially but looking at how it looks in the source code,
> it seems SRC_BRANCH makes easier to spot the relation with SRC_URI. So
> I took the second.

+1


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

