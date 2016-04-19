Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5060F6012C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:24:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3J1Nub9031658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Apr 2016 18:23:56 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 18:23:55 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
	<1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
	<CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <571588AA.1060307@windriver.com>
Date: Tue, 19 Apr 2016 09:23:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] meta.bbclass: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Tue, 19 Apr 2016 01:24:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/19/2016 04:27 AM, Burton, Ross wrote:
>
> On 18 April 2016 at 03:57, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The recipe which inherits meta.bbclass doesn't require any default deps.
>
>
> meta is only inherited by one class (populate_sdk_base.bbclass) and three
> recipes (two of which indirectly inherit populate_sdk_base) so do we really need

The INHIBIT_DEFAULT_DEPS = "1" was for buildtools-tarball, I will move it into
buildtools-tarball since meta.bbclass may go. And I noticed that another patch
has been merged so I will send a new PULL for it.

// Robert

> this class?  Maybe we should drop it in the 2.2 cycle.
>
> Ross

