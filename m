Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CBE4757B5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 05:32:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t535WAij009113
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jun 2015 22:32:10 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 22:32:09 -0700
Message-ID: <556E9158.5070809@windriver.com>
Date: Wed, 3 Jun 2015 13:32:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
	<84a0731e7204cfb400610c3abc871894b7a03a39.1431324180.git.liezhi.yang@windriver.com>
	<CAJTo0LZNd142tRVh36yatiRxhwHdVwDYC4pVv_V1xNbebtmmSQ@mail.gmail.com>
	<CAJTo0LbvnOannviRAbfJbVnYcqS=h14kjX5VGAYWX5x0qPi3Fg@mail.gmail.com>
In-Reply-To: <CAJTo0LbvnOannviRAbfJbVnYcqS=h14kjX5VGAYWX5x0qPi3Fg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/12] libsdl: depends on libglu when x11
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
X-List-Received-Date: Wed, 03 Jun 2015 05:32:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/16/2015 04:00 AM, Burton, Ross wrote:
>
> On 15 May 2015 at 20:59, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     I've just sent a revert for this, but was there a problem this was
>     attempting to fix?
>
>
> Just realised - opengl enabled and x11 disabled in DISTRO_FEATURES.  I guess you
> need to make the GL support depend on opengl *and* x11.  Tested patches for all
> combinations of those features welcome :)

Hi Ross,

Yes, you are right, the libsdl can be built when only x11 or opengl
in DISTRO_FEATURES, but libglu requires both of them, I will send a
patch to fix the problem.

// Robert

>
> Ross

