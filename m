Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1BE7C6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 02:04:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K24dmI015413
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 18:04:39 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 18:04:39 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1453173729.git.liezhi.yang@windriver.com>
	<dc955f7651afe19ce915cedc95bfb9ab96d52d73.1453173729.git.liezhi.yang@windriver.com>
	<20160119114018.GC2611@jama>
	<CAJTo0LY9=yvm0y5EQ50T9VoR-o2FLs=pTL2t0+cwJE8saeEwfA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569EEB35.6020607@windriver.com>
Date: Wed, 20 Jan 2016 10:04:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY9=yvm0y5EQ50T9VoR-o2FLs=pTL2t0+cwJE8saeEwfA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] e2fsprogs: fix PV
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
X-List-Received-Date: Wed, 20 Jan 2016 02:04:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/19/2016 08:04 PM, Burton, Ross wrote:
>
> On 19 January 2016 at 11:40, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>
>     If 0f26747167cc9d82df849b0aad387bf824f04544 is going to be released as
>     1.43, then it would be better to use 1.42.99+1.43+git${SRCPV} to make
>     sure, that hypothetical 1.42.14 will also sort lower than this future
>     1.43.
>
>
> Agreed - if this hash came from the 1.43 branch and won't ever be released as
> 1.42, then 1.42.99 is sensible.

Thanks, I will update it.

// Robert

>
> Ross

