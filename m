Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E5A8A60169
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 01:10:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t161Ar4m022356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Feb 2015 17:10:53 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Feb 2015 17:10:53 -0800
Message-ID: <54D4149B.1050608@windriver.com>
Date: Fri, 6 Feb 2015 09:10:51 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
	<af9632a1314db8be121b76ca6144fa46137cc429.1422925725.git.liezhi.yang@windriver.com>
	<CAJTo0LaVfL3mN8d_EW804SSBWkMhRVikHYqpTMQR5wnmvNyOGg@mail.gmail.com>
In-Reply-To: <CAJTo0LaVfL3mN8d_EW804SSBWkMhRVikHYqpTMQR5wnmvNyOGg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/21] coreutils 6.9: fix unknown-configure-option
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
X-List-Received-Date: Fri, 06 Feb 2015 01:11:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/05/2015 11:13 PM, Burton, Ross wrote:
> Hi Robert,
>
> On 3 February 2015 at 01:12, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
>     +PACKAGECONFIG[acl] = ",,acl,"
>
>
> Introducing non-deterministic behaviour doesn't seem like a good idea.
> Presumably we can seed the autoconf checks instead of passing configure
> arguments? (see e.g. libice's arc4 option).

Good idea, thanks, let's drop this patch atm, I will update it after fix
the libtool issue:-)

// Robert

>
> Ross

