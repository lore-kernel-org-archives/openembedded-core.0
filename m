Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5ADB65C91
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 17:05:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA8H5bfY015228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 8 Nov 2014 09:05:37 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Sat, 8 Nov 2014 09:05:36 -0800
Message-ID: <545E4D5F.20807@windriver.com>
Date: Sat, 8 Nov 2014 11:05:35 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Kai Kang <kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
	<CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
In-Reply-To: <CAJTo0LbUiPaj5aE0Eb0W9zGthfqx5ct4+6-obv0pJEwPMseuiw@mail.gmail.com>
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
X-List-Received-Date: Sat, 08 Nov 2014 17:05:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/14, 2:53 AM, Burton, Ross wrote:
>
> On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com
> <mailto:kai.kang@windriver.com>> wrote:
>
>     It has been tested for core-image-minimal core-image-sato core-image-sato-sdk
>     meta-toolchain and world.
>
>
> When I boot core-image-sato, X can't start.  Does the virtual machine that qemu
> runs not have video support at the moment?

Only basic system booting is currently working.  I doubt video is.  Networking 
works once booted, but for some reason NFS boot is not working.

--Mark


