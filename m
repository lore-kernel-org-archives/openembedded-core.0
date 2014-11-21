Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7CADE6B7CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 10:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sALAEXS6007718
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Fri, 21 Nov 2014 02:14:33 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Fri, 21 Nov 2014 02:14:32 -0800
Message-ID: <546F108C.7000304@windriver.com>
Date: Fri, 21 Nov 2014 18:14:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1416559751.git.Qi.Chen@windriver.com>
	<9961c270f19bef3da7ca624737d7526bebbc7f0d.1416559751.git.Qi.Chen@windriver.com>
	<CANyK_8c8Wo3iaKtKe0tFMcQsA-+gz2M96eMbcyBw==FVo80nzw@mail.gmail.com>
In-Reply-To: <CANyK_8c8Wo3iaKtKe0tFMcQsA-+gz2M96eMbcyBw==FVo80nzw@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg-utils: fix double slash problem in update-alternatives
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
X-List-Received-Date: Fri, 21 Nov 2014 10:14:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2014 05:59 PM, Paul Barker wrote:
> On 21 November 2014 08:50, Chen Qi <Qi.Chen@windriver.com> wrote:
>> When using update-alternatives, we would get output like the following:
>> update-alternatives: Linking //usr/bin/sh to /usr/bin/bash
>>
>> What we really want is:
>> update-alternatives: Linking /usr/bin/sh to /usr/bin/bash
>>
>> This patch fixes the above problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> opkg-utils is part of Yocto Project. Could you submit this as a change
> to opkg-utils itself and then send a SRCREV update for oe-core?
> Submission guidelines are under "Submitting patches for review" in
> the CONTRIBUTING file in opkg-utils
> (http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/CONTRIBUTING).
>
> The patch looks pretty straightforward so I should be able to give it
> a quick test and merge it to opkg-utils early next week.
>
> Cheers,
>

Hi Paul,

I've followed the link and sent out the patch.
Thanks a lot.

Best Regards,
Chen Qi

