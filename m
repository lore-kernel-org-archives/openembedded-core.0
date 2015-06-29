Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 19715607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 03:06:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5T36egt000239
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 28 Jun 2015 20:06:40 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 28 Jun 2015 20:06:39 -0700
Message-ID: <5590B63E.70009@windriver.com>
Date: Mon, 29 Jun 2015 11:06:38 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1435299778.git.liezhi.yang@windriver.com>
	<7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
	<CAJTo0LbVU3u8dustr-dv6ySQmAyU6nR2c6r7=cPP-9GdRFeZsg@mail.gmail.com>
In-Reply-To: <CAJTo0LbVU3u8dustr-dv6ySQmAyU6nR2c6r7=cPP-9GdRFeZsg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Mon, 29 Jun 2015 03:06:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/26/2015 09:10 PM, Burton, Ross wrote:
>
> On 26 June 2015 at 07:23, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The build would fail when /bin/sh links to ksh or csh, we only test dash
>     and bash AFAIK.
>
>
> csh definitely isn't a suitable candidate for /bin/sh, and I doubt ksh is too.
> Are people really doing this? They're just wrong...  I seriously doubt Linux
> would boot with /bin/sh->csh and ksh would be asking for trouble.

Hi Ross,

Yes, Ubuntu would not boot well when /bin/sh -> ksh or csh, I just took
them as an example, I think that we only test on bash or dash, so I
think that this checking can reduce the potential errors, and I think
that we also need check SHELL, I will test and send another patch.

// Robert

>
> Was this a real world problem, or a hypothetical problem?
>
> Ross

