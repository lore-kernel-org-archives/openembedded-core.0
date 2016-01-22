Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB9465CB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 09:20:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0M9KKBT023675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 22 Jan 2016 01:20:20 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 22 Jan 2016 01:20:20 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Koen Kooi <koen.kooi@linaro.org>
References: <1453360859-16992-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LY4=LYYMoeyH=iX0kgT8viTWjsxWeV5Geh7_0+XOSx-YA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56A1F452.80705@windriver.com>
Date: Fri, 22 Jan 2016 17:20:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY4=LYYMoeyH=iX0kgT8viTWjsxWeV5Geh7_0+XOSx-YA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: disable libblkid again
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
X-List-Received-Date: Fri, 22 Jan 2016 09:20:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/22/2016 04:32 AM, Burton, Ross wrote:
>
> On 21 January 2016 at 07:20, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
>
>     We use the util-linux one and do_install deletes it anyway.
>
>     See OE-core commit fb8e776ea91c39d586b46400ad30aeea8dead1c4 for more info.
>
>
> Not sure this is complete:

I remembered why I added --enable-libblkid, it is because of this warning,
The /lib/libblkid* had been removed but mannuals were installed before I
updated the recipe, so we got no warning. But after ugprade, none of them
were installed, so we got the warnings.

// Robert

>
> WARNING: e2fsprogs: alternative target (/usr/share/man/man3/libblkid.3 or
> /usr/share/man/man3/libblkid.3.e2fsprogs) does not exist, skipping...
> WARNING: e2fsprogs: alternative target (/usr/share/man/man8/blkid.8 or
> /usr/share/man/man8/blkid.8.e2fsprogs) does not exist, skipping...
> WARNING: e2fsprogs: alternative target (/usr/share/man/man8/findfs.8 or
> /usr/share/man/man8/findfs.8.e2fsprogs) does not exist, skipping...
> WARNING: e2fsprogs: NOT adding alternative provide
> /usr/share/man/man3/libblkid.3: /usr/share/man/man3/libblkid.3.e2fsprogs does
> not exist
> WARNING: e2fsprogs: NOT adding alternative provide /usr/share/man/man8/blkid.8:
> /usr/share/man/man8/blkid.8.e2fsprogs does not exist
> WARNING: e2fsprogs: NOT adding alternative provide /usr/share/man/man8/findfs.8:
> /usr/share/man/man8/findfs.8.e2fsprogs does not exist
> WARNING: alt_link == alt_target: /usr/share/man/man3/libblkid.3 ==
> /usr/share/man/man3/libblkid.3
> WARNING: alt_link == alt_target: /usr/share/man/man8/blkid.8 ==
> /usr/share/man/man8/blkid.8
> WARNING: alt_link == alt_target: /usr/share/man/man8/findfs.8 ==
> /usr/share/man/man8/findfs.8
>
> Ross
>
>

