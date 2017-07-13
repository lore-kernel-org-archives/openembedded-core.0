Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5ECB70018
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 11:10:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6DBAOa4004331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 13 Jul 2017 04:10:24 -0700 (PDT)
Received: from [128.224.162.246] (128.224.162.246) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Jul 2017 04:10:23 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1499854502.git.liezhi.yang@windriver.com>
	<96d138921edb8356aa7b683803e4facc4e0ade4e.1499854502.git.liezhi.yang@windriver.com>
	<CAJTo0LZ75z8kjoBKLGKhF6dOpSDQFmRx=pepc_uPZ87QCVSwoQ@mail.gmail.com>
	<CAJTo0LZJ89-Zdp6=YkRXwtvFvNx25MbGxBHir-GcdTnWHx5EaQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d0951f29-90f0-e982-0c94-2045af7211c3@windriver.com>
Date: Thu, 13 Jul 2017 19:10:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZJ89-Zdp6=YkRXwtvFvNx25MbGxBHir-GcdTnWHx5EaQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libbsd: 0.8.3 -> 0.8.5
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
X-List-Received-Date: Thu, 13 Jul 2017 11:10:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/13/2017 05:45 PM, Burton, Ross wrote:
>
> On 13 July 2017 at 10:40, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     Determining if any of those can be applied always would be good.
>
>
> FWIW it looks like the __BEGIN_DECLS patch still isn't upstream, but the other
> two may have been resolved.

Sorry, fixed it in the repo, I update 0002-Remove-funopen.patch, and drop
0003-Fix-build-breaks-due-to-missing-a.out.h.patch since the a.out code is
gone in the source, so I think that the patch is not needed any more. Add
Khem who is the author in the CC list.

Tested build on qemux86-64 and qemuarm.


Repo:

   git://git.openembedded.org/openembedded-core-contrib rbt/PU
   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (6):
   automake: 1.15 -> 1.15.1
   cryptodev: 1.8 -> 1.9
   debianutils: 4.8.1 -> 4.8.1.1
   git: 2.11.1 -> 2.13.2
   gnu-efi: 3.0.5 -> 3.0.6
   libbsd: 0.8.3 -> 0.8.5

// Robert

>
> Ross
>

