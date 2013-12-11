Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB4B6A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2013 03:33:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBB3XbMO017111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Dec 2013 19:33:38 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 10 Dec 2013 19:33:37 -0800
Message-ID: <52A7DD0F.2050308@windriver.com>
Date: Wed, 11 Dec 2013 11:33:35 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, Paul Eggleton
	<paul.eggleton@linux.intel.com>
References: <cover.1386687474.git.liezhi.yang@windriver.com>
	<5616775.7LhWvOXBE4@helios>
	<CAMKF1spMpasnjJ9z41rt57cfnbze_xHVuK1KoQNcoG+d16aL3w@mail.gmail.com>
In-Reply-To: <CAMKF1spMpasnjJ9z41rt57cfnbze_xHVuK1KoQNcoG+d16aL3w@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 000/124] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Wed, 11 Dec 2013 03:33:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2013 08:52 AM, Khem Raj wrote:
> On Tue, Dec 10, 2013 at 10:03 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>
>>> Bruce Ashfield (10):
>>>    kernel: restore scripts in the sysroot
>>
>> Wasn't there a problem with this patch? I can't recall if it was rectified
>> before or after it was merged to master.
>>
>
> Problem is elsewhere, there was more of documentation issue with
> Richard fixed in module.bbclass.
> this is ok.
>

Yes, we need the patch, otherwise, perf will fail to build if the kernel
is mirrored from the sstate IIRC.

// Robert

>

