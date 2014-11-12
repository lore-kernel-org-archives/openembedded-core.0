Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C4DF71FC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:05:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAC25LoQ001735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Nov 2014 18:05:22 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 11 Nov 2014 18:05:21 -0800
Message-ID: <5462C05E.7000003@windriver.com>
Date: Wed, 12 Nov 2014 10:05:18 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1412068156.git.Chong.Lu@windriver.com>
	<e5de510ded9ca2d3d09f9c1e4f8ab46fb4603ab0.1412068157.git.Chong.Lu@windriver.com>
	<CAJTo0LYgKr+dRTuHNh19vo8-V4vRDRzZhaGRBmJFMMi0ZrqFrA@mail.gmail.com>
In-Reply-To: <CAJTo0LYgKr+dRTuHNh19vo8-V4vRDRzZhaGRBmJFMMi0ZrqFrA@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] strace: Upgrade to 4.9
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
X-List-Received-Date: Wed, 12 Nov 2014 02:05:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11/12/2014 07:57 AM, Burton, Ross wrote:
>
> On 30 September 2014 10:33, Chong Lu <Chong.Lu@windriver.com 
> <mailto:Chong.Lu@windriver.com>> wrote:
>
>     Remove two backported patches:
>     0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
>     strace-fix-64-bit-process-detection.patch
>
>     Update two patches to fit new version:
>     Makefile-ptest.patch
>     strace-add-configure-options.patch
>
>     Add coreutils, grep and gawk to RDEPENDS_${PN}-ptest for making
>     ptest pass.
>
>
> This is failing on the minnow autobuilder:
>
> | 
> /home/pokybuild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/work/core2-32-poky-linux/strace/4.9-r0/strace-4.9/unwind.c:29:30: 
> fatal error: libunwind-ptrace.h: No such file or directory
>
> Maybe there's an optional dependency on unwind which was being rebuilt 
> as strace was being built?
>
> Ross

OK, I will fix it.

Best Regards
Chong

