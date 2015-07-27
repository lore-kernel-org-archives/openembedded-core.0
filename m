Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96B4D73D13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 01:47:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6R1lI0k013737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 Jul 2015 18:47:18 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 26 Jul 2015 18:47:03 -0700
Message-ID: <55B58DA4.4020906@windriver.com>
Date: Mon, 27 Jul 2015 09:47:16 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1437100265.git.liezhi.yang@windriver.com>
	<a6959c48d7cb4873c2cf9523a287a7651f3aba3e.1437100265.git.liezhi.yang@windriver.com>
	<CAJTo0LaoFyzhgV6xh-p4muzY7JQxRzmyd5Yx7WZKdRrH-oOamA@mail.gmail.com>
In-Reply-To: <CAJTo0LaoFyzhgV6xh-p4muzY7JQxRzmyd5Yx7WZKdRrH-oOamA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] git: 2.4.4 -> 2.4.5
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
X-List-Received-Date: Mon, 27 Jul 2015 01:47:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/17/2015 07:34 PM, Burton, Ross wrote:
>
> On 17 July 2015 at 03:31, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     * Use git repo rathar then tarball.
>
>
> For this and the file upgrade, why?
>
> Tarballs are easily cached, and can be checksummed.  What's the reason to switch
> to a git clone?

Hi Ross,

I just came back from vacation, I thought that git repo is preferred than
tarball, but seems not, so let's drop the 2 upgrades.

// Robert

>
> Ross

