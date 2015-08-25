Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC51173DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 13:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7PD8a9P018575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Aug 2015 06:08:36 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 25 Aug 2015 06:08:36 -0700
Message-ID: <55DC68BE.8070400@windriver.com>
Date: Tue, 25 Aug 2015 09:08:14 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1440424002.git.bruce.ashfield@windriver.com>
	<136c1b0650d3273e647022a60ef3845287d11af3.1440424002.git.bruce.ashfield@windriver.com>
	<CAJTo0LYA9kHUNQif7jEyuYSjjiBjnCDLfatckoO43C3dK5KrfQ@mail.gmail.com>
In-Reply-To: <CAJTo0LYA9kHUNQif7jEyuYSjjiBjnCDLfatckoO43C3dK5KrfQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] linux-yocto/4.1: enable DRM_CIRRUS_QEMU and EXT4_USE_FOR_EXT23
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
X-List-Received-Date: Tue, 25 Aug 2015 13:08:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-08-25 05:19 AM, Burton, Ross wrote:
>
> On 24 August 2015 at 14:51, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     Updating the meta SRCREV to enable cirrus graphics emulation and wider
>     compatibility for the ext4 driver.
>
>
> This causes our friend "config value requested not present in final
> .config" for at least qemuppc and qemumips in my local testing.

Ack'd. There graphics h/w is different .. so I'm not surprised. I may
have gotten a little to liberal with adding that config to the qemu
machines.

I'll test here, and remove it if not applicable.

Bruce

>
> Ross


