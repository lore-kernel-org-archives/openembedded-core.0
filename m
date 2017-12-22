Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1055F7888C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 01:43:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBM1hX0c022461
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Dec 2017 17:43:33 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 17:43:20 -0800
To: "Burton, Ross" <ross.burton@intel.com>, ChenQi <Qi.Chen@windriver.com>
References: <cover.1513831180.git.liezhi.yang@windriver.com>
	<65382db74f44d0296de2ccc3e5f67bef740e8422.1513831180.git.liezhi.yang@windriver.com>
	<2c33a5f2-26ae-3050-86f8-62a41d5ec593@windriver.com>
	<CAJTo0LY0Vtu7phJ_pxZc-cOH8ozbkerRuVWG_TW3KQse_gUVWg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <6a21b2e1-050a-f9f8-4da8-6ff371dedda4@windriver.com>
Date: Fri, 22 Dec 2017 09:43:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY0Vtu7phJ_pxZc-cOH8ozbkerRuVWG_TW3KQse_gUVWg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix PACKAGECONFIG for lz4
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
X-List-Received-Date: Fri, 22 Dec 2017 01:43:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 12/21/2017 10:17 PM, Burton, Ross wrote:
> On 21 December 2017 at 05:55, ChenQi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
> 
>     The problem seems to be that the lz4 packaging problem.
>     lz4-ptest is packages as liblz4 and is installed instead of the lz4 package.
> 
> 
> So that's because lz4-ptest ships a copy of the build tree (so has a 
> liblz5.so.*) and is before lz4 in PACKAGES.
> 
> I've got a patch here to remove the ptest bits from lz4 as shipping an entire 
> build tree isn't a good idea, and will look at fixing debian.bbclass so it 
> doesn't consider libraries outside of $libdir et al.

Thank you very much.

// Robert

> 
> Ross

