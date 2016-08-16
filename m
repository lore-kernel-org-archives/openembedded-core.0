Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 665EE73CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:01:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7GG1ulu023999
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Aug 2016 09:01:56 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 09:01:55 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<CAJTo0LZC5wZ7yY=bb5EouWZEqR4ta0s4Oe07vkzQXzFGMjOp6w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b88d8df0-4e05-3e3d-5202-aa8272b81698@windriver.com>
Date: Tue, 16 Aug 2016 12:01:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZC5wZ7yY=bb5EouWZEqR4ta0s4Oe07vkzQXzFGMjOp6w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Tue, 16 Aug 2016 16:02:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-16 12:00 PM, Burton, Ross wrote:
>
> On 15 August 2016 at 19:26, Bruce Ashfield <bruce.ashfield@windriver.com
> <mailto:bruce.ashfield@windriver.com>> wrote:
>
>     Are the important part of this series, and a significant
>     contribution to the
>     fall release. I've been testing these for some time, and we've run the
>     kernel lab and yocto-bsp scripts against the tools. We haven't found a
>     regression yet, but I'm sure there are some lurking. These
>     definitely need
>     cycles on the autobuilders.
>
>
> qemux86 throws these warnings at me:

Yep, that was covered in my 0/N:

"Note: there are still warnings in the kernel meta-data, they are being 
worked
on, but I've left them in place so a few people can see the new kernel audit
information :)"

Cheers,

Bruce

>
> WARNING: linux-yocto-4.4.15+gitAUTOINC+b030d96c7b_ddab242999-r0
> do_kernel_configcheck: [kernel config]: specified values did not make it
> into the kernel's final configuration:
>
> ---------- CONFIG_BT_6LOWPAN -----------------
> Config: CONFIG_BT_6LOWPAN
> From:
> /data/poky-master/tmp-glibc/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
> Requested value:  CONFIG_BT_6LOWPAN=y
> Actual value:
>
> Config 'BT_6LOWPAN' has the following conditionals:
>   BT_LE && 6LOWPAN (value: "n")
> Dependency values are:
>   BT_LE [y] 6LOWPAN [n]
>
> ---------- CONFIG_BT_CMTP -----------------
> Config: CONFIG_BT_CMTP
> From:
> /data/poky-master/tmp-glibc/work-shared/qemux86/kernel-source/.kernel-meta/configs/standard/features/bluetooth/bluetooth.cfg
> Requested value:  CONFIG_BT_CMTP=m
> Actual value:
>
> Config 'BT_CMTP' has the following conditionals:
>   BT_BREDR && ISDN_CAPI (value: "n")
> Dependency values are:
>   BT_BREDR [y] ISDN_CAPI [n]
>
> Ross


