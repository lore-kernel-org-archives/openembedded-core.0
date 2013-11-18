Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE7906D89C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 12:46:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAICkPoQ004289
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Nov 2013 04:46:25 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 18 Nov 2013 04:46:24 -0800
Message-ID: <528A0C0A.2090008@windriver.com>
Date: Mon, 18 Nov 2013 20:46:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1384773018.6460.202.camel@ted>
	<CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
In-Reply-To: <CAJTo0LZWNbMFA1ogn2W7dvxtXh31LovO9QbYKcQsGpTR7C6KCg@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: DORA RFC: FILESOVERIDES in dora
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
X-List-Received-Date: Mon, 18 Nov 2013 12:46:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/18/2013 07:15 PM, Burton, Ross wrote:
> On 18 November 2013 11:10, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> a) Revert the change in the branch. Anyone who adapted to the correct
>> behaviour on the branch would need to revert those changes
>
> As there hasn't been a .1 of Dora yet this only impacts people who
> have been tracking git, so I think it's probably best to apologise for
> this merge and revert it, on the grounds that it's a serious behaviour
> change.
>

I'm afraid that the problem is it doesn't work well after revert the patch,
either, as the patch says:

Currently the overrides are being applied backwards. This means something
which is platform specific is overriding something which is machine specific
which is clearly not intended.

I don't know how many layers are affected, I've tested the current dora branch
in the local autobuilder, didin't find any errors.

// Robert

> Ross
>
>

