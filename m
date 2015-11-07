Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE89876104
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Nov 2015 09:28:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA79S5OC023257
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 7 Nov 2015 01:28:05 -0800 (PST)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 7 Nov 2015 01:28:03 -0800
Message-ID: <563DC421.6030207@windriver.com>
Date: Sat, 7 Nov 2015 17:28:01 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1444974811.git.wenzong.fan@windriver.com>
	<6de991e55463cce5bac0bcc3d9af46cbd044b062.1444974811.git.wenzong.fan@windriver.com>
	<CAJTo0LaeZWRHqL6r5e0qWT9oLehe+Uv5B3t2mYyzG-7TxRwvhg@mail.gmail.com>
In-Reply-To: <CAJTo0LaeZWRHqL6r5e0qWT9oLehe+Uv5B3t2mYyzG-7TxRwvhg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 v2] mdadm: fix CFLAGS and ptest issue
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
X-List-Received-Date: Sat, 07 Nov 2015 09:28:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/06/2015 06:38 PM, Burton, Ross wrote:
>
> On 16 October 2015 at 06:57, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     * Also fix ptest build error caused by global CFLAGS:
>
>        raid6check.c: In function 'check_stripes':
>        raid6check.c:315:8: error: 'stripe_buf' may be used uninitialized \
>        in this function [-Werror=maybe-uninitialized]
>
>
> We're now seeing this instead when building the ptest part on poky-lsb
> (which turns on more security flags):
>
> raid6check.c: In function 'check_stripes':
> raid6check.c:352:2: error: ignoring return value of 'posix_memalign',
> declared with attribute warn_unused_result [-Werror=unused-result]
>    posix_memalign((void**)&stripe_buf, 4096, raid_disks * chunk_size);

I'll fix the patch and send v2 out.

Thanks
Wenzong

>
>
> (http://errors.yoctoproject.org/Errors/Details/21490/)
>
> Ross

