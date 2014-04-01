Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC31F6F572
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:48:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s31Dm4w0028894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 06:48:04 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 06:48:04 -0700
Message-ID: <533AC392.1000604@windriver.com>
Date: Tue, 1 Apr 2014 21:48:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, Phil Blundell <pb@pbcl.net>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
	<CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
	<1396355498.5879.31.camel@phil-desktop.brightsign>
	<CANyK_8dUrG9BQMCSwhB3v5dzF9PWmOWndyrsrMs+-zkiWo2sug@mail.gmail.com>
In-Reply-To: <CANyK_8dUrG9BQMCSwhB3v5dzF9PWmOWndyrsrMs+-zkiWo2sug@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Tue, 01 Apr 2014 13:48:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/01/2014 08:34 PM, Paul Barker wrote:
> On 1 April 2014 13:31, Phil Blundell <pb@pbcl.net> wrote:
>> On Tue, 2014-04-01 at 12:41 +0100, Paul Barker wrote:
>>> The more I look at it the more I don't like this patch. It's probably
>>> a very rarely used code path but it could blow up if it's called. C
>>> provides no guarantees that calling a 3-argument function with only 2
>>> arguments will work. Depending on calling convention it could easily
>>> result in stack corruption on some platforms.
>>>
>>> I'd suggest we try reverting the relevant bits of the upstream change
>>> from qsort to
>>> qsort_r: http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
>>>
>>> I think it should just be the first 3 patch hunks in that commit.
>>
>> It seems vanishingly unlikely that anybody is seriously going to try to
>> use fdisk from util-linux-native to manipulate Sun partition tables and,
>> that being the case, it's presumably going to be quite hard to test any
>> such change.  Maybe we should just turn off support for these fringe
>> partition table types altogether.
>>
>
> That may be a much, much easier fix.

Thank you very much, I will send a patch later:-)

// Robert

>
> I've reported this to the upstream mailing list anyway as there really
> should be an autoconf check for qsort_r.
>
> Thanks,
>

