Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F64A6F242
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 19:33:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2VJXXAE018054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Mar 2014 12:33:34 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 31 Mar 2014 12:33:33 -0700
Message-ID: <5339C30B.1060005@windriver.com>
Date: Mon, 31 Mar 2014 15:33:31 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1396288310.git.bruce.ashfield@windriver.com>
	<e6015802086cbf8199d112a3e75a7391a417ede6.1396288310.git.bruce.ashfield@windriver.com>
	<CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
In-Reply-To: <CAMKF1srOv27-6SwSfYxFLL0-BvHk7hxWBmn6twtY+hpQ9rTYww@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] libc-headers: set TC default to 3.14
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
X-List-Received-Date: Mon, 31 Mar 2014 19:33:42 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-03-31 03:29 PM, Khem Raj wrote:
> On Mon, Mar 31, 2014 at 10:56 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>>
>> -LINUXLIBCVERSION ?= "3.10"
>> +LINUXLIBCVERSION ?= "3.14"
>
> Does this  buy us much ? Infact its too late to change usespace APIs

This was always the plan. I've been building with all the 3.14 -rc
headers for ages .. and as we've talked about in the past, we always
will update them to the newest kernel in any release.

They are compatible with 3.10, and I've tested the combinations of
old kernels, new libc and new kernels with the new libc interfaces.

> at this point. 3.10 being LTS
> I would assume its a better option to keep at 3.10

I disagree, this is consistent with other releases and the documented
plan of action. I'd rather not have a massive version jump in the fall.

Sure 3.14 slipping out by a few weeks upstream was a problem, but its
not like we haven't been testing with it.

Bruce

>


