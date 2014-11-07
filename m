Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 499D060557
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 01:35:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA71ZCDL026650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 17:35:13 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Thu, 6 Nov 2014 17:35:12 -0800
Message-ID: <545C21CC.5050001@windriver.com>
Date: Fri, 7 Nov 2014 09:35:08 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LZMcgP8KK12YTCX5nZhxZyCrqFJw-qfqERvirUMVNQBoQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZMcgP8KK12YTCX5nZhxZyCrqFJw-qfqERvirUMVNQBoQ@mail.gmail.com>
X-Originating-IP: [128.224.162.231]
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Fri, 07 Nov 2014 01:35:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年11月06日 23:59, Burton, Ross wrote:
> On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com> wrote:
>
>> The original configuration files and tune fils for arm arch64 are from
>> linaro.
>> And we rename it to qemuarm64 for consistency.
>>
> Awesome.  The bad news is that this doesn't apply to master anymore, can
> you rebase it?

Sorry about that, I'll rebase it and send another revision. I notice 
that qemu upgrade is
merged already, so I'll drop mime.

--Kai

>
> Note that poky-contrib:ross/mut has a qemu upgrade in that should be merged
> into master shortly, so rebasing onto that (or waiting for that to be
> merged first) would be appreciated to avoid having to rebase again.
>
> Cheers,
> Ross
>


-- 
Regards,
Neil | Kai Kang


