Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8262B7196D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 01:26:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5U1QsSk017343
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Jun 2015 18:26:54 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Jun 2015 18:26:53 -0700
Message-ID: <5591F05C.3000403@windriver.com>
Date: Tue, 30 Jun 2015 09:26:52 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435126503.git.liezhi.yang@windriver.com>
	<bb310561fc74eda7e03e10ccd7b3c29e7ad50992.1435126503.git.liezhi.yang@windriver.com>
	<558A610C.2060600@windriver.com>
	<CAJTo0LaE__10br7LoZit8OTaZ=-oqC4KegoGJeKuG45LCLN07A@mail.gmail.com>
In-Reply-To: <CAJTo0LaE__10br7LoZit8OTaZ=-oqC4KegoGJeKuG45LCLN07A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 8/8] perl-ptest: fix RDEPENDS
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
X-List-Received-Date: Tue, 30 Jun 2015 01:26:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/30/2015 12:41 AM, Burton, Ross wrote:
>
> On 24 June 2015 at 08:49, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Sorry, please drop the last patch [PATCH 8/8] , I copy it from
>     IMAGE_INSTALL, but it isn't correct, other patches are fine.
>
>
> Will there be a follow-up patch to fix the rdepends so they're complete?  Or is
> the current set good as it is?

I'm trying to figure it out, maybe we need modify the package_qa for ptest
checking.

// Robert

>
> Ross

