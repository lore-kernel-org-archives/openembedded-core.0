Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 615A76FD1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 May 2014 02:11:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4U2BFKE003745
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 May 2014 19:11:15 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 29 May 2014 19:11:15 -0700
Message-ID: <5387E8C0.3090300@windriver.com>
Date: Fri, 30 May 2014 10:11:12 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1401354584.git.Chong.Lu@windriver.com>
	<e6a039546ac6da09a55950978189b3bc3b75fb8d.1401354584.git.Chong.Lu@windriver.com>
	<CAJTo0LZWqFB89AhgZtGOLmHGaZ-N=SVxLORsq-gK_Qhnfpib5w@mail.gmail.com>
In-Reply-To: <CAJTo0LZWqFB89AhgZtGOLmHGaZ-N=SVxLORsq-gK_Qhnfpib5w@mail.gmail.com>
X-Originating-IP: [128.224.162.204]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] nfs-utils: use cross toolchain to compile testlk
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
X-List-Received-Date: Fri, 30 May 2014 02:11:18 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 05/29/2014 06:15 PM, Burton, Ross wrote:
> On 29 May 2014 10:10, Chong Lu <Chong.Lu@windriver.com> wrote:
>> testlk is built with host gcc at do_compile stage, which leads to unrecognized
>> some flags for special architecture. Using cross toolchain instead.
> The makefile explicitly uses the host compiler, so presumably there's
> a good reason for this.  If the problem is that the host compiler is
> being passed target CFLAGS, then you should set AM_CFLAGS to
> CFLAGS_FOR_BUILD and so on.
>
> Ross
>
>
Hi Ross,

I remove "CC=$(CC_FOR_BUILD)" in order to inherit compiler.
Do you mean that I should reset CFLAGS in makefile rather than inherit 
compiler?
If I reset CFLAGS, this makefile will use host compiler.
Moreover, testlk can't execute in target.

Best Regards
Chong

