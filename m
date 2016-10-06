Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33B516FF5D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:53:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u96KrZLZ015830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 6 Oct 2016 13:53:35 -0700
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Oct 2016 13:53:34 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	"Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
	<CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
Date: Thu, 6 Oct 2016 16:53:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
X-Originating-IP: [172.25.44.6]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
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
X-List-Received-Date: Thu, 06 Oct 2016 20:53:40 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-03 08:27 PM, Bruce Ashfield wrote:
>
> It's something we could drop in the future, but these are mods that have
> been done since -rc4, and could very well be undone if they start
> breaking things like this.
>
> The alternative is to try and fix the userspace applications, but I
> currently don't see a fast way to do that (and I'm now officially on
> vacation).
>

I've sent a fix to the net-tools list:

https://sourceforge.net/p/net-tools/mailman/net-tools-devel/?viewmonth=201610

Jackie will be back at work on Saturday and he'll revert
Bruce's change, test all qemu builds and boot an image
to test iptunnel before sending a patch to the list.

In oe-core-2.3, we should probably drop net-tools completely or
at least from packagegroup-core-full-cmdline.bb since iproute2
replaces it:
   http://xmodulo.com/linux-tcpip-networking-net-tools-iproute2.html

( and I'm now officially on vacation for a few days. :) )


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

