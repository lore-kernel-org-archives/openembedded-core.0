Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06E8276F8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 01:39:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u221dnlL021004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Mar 2016 17:39:49 -0800 (PST)
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Mar 2016 17:39:47 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
	<56D3DD08.5080206@windriver.com>
	<CAJTo0LYUn-d-9S8U277QFAoYPp45yF3iRvffsFxTAT1RzB=C0Q@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56D64462.7050102@windriver.com>
Date: Wed, 2 Mar 2016 09:39:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYUn-d-9S8U277QFAoYPp45yF3iRvffsFxTAT1RzB=C0Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] make vm + live images can build together
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
X-List-Received-Date: Wed, 02 Mar 2016 01:39:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/02/2016 12:36 AM, Burton, Ross wrote:
>
> On 29 February 2016 at 05:54, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>             syslinux.bbclass: make vm and live can be built together
>             sanity.bbclass: remove conflict checking for image vm and live
>
>
> If I build a core-image-sato for intel-corei7-32 I get this warning:
>
> WARNING: core-image-sato-base-1.0-r0 do_bootimg: Found potential conflicted var
> INITRD, please use INITRD_LIVE rather than INITRD

I added this checking, we need fix from from meta-intel, I will send a patch to
meta-yocto yocto@yoctoproject.org to fix it.

// Robert

>
> Ross

