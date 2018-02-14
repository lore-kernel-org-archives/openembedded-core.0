Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7FC2177D81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Feb 2018 14:47:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1EEl0V4006550
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Feb 2018 06:47:00 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.24.103) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Wed, 14 Feb 2018 06:46:47 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>, <bruce.ashfield@windriver.com>
Date: Wed, 14 Feb 2018 09:46:58 -0500
Message-ID: <2591507.FzfLpsFnPY@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <9e88817b-57e5-adb6-0176-9c1aa9609dce@windriver.com>
References: <20180208202228.20850-1-alexander.kanavin@linux.intel.com>
	<9e88817b-57e5-adb6-0176-9c1aa9609dce@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] latencytop: remove recipe
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
X-List-Received-Date: Wed, 14 Feb 2018 14:47:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, February 13, 2018 2:27:49 PM EST Randy MacLeod wrote:
> On 2018-02-08 03:22 PM, Alexander Kanavin wrote:
> > Last commit and release were in 2009; website is down; it's a dead
> > project.
> 
> Add MarkA who might care/know more about latencytop than I do.

I believe Bruce had already identified LatencyTop as a dead end by the time we 
even did our first release of OVP (I have no recollection of ever including it 
and there are 0 user stories in Rally which would validate my memories on this 
subject). Just in case I have added Bruce to the list. We already had LTTng 
and FTrace, including a mostly dead Intel project was not a priority if I 
recall correctly.

MarkA

> 
> 
> Is there another package that makes use of the kernel feature?
> The kernel Kconfig has been tweaked in 2017:
> 
>     commit a34a766ff96d9e88572e35a45066279e40a85d84
>     Author: Josh Poimboeuf <jpoimboe@redhat.com>
>     Date:   Mon Jul 24 18:36:58 2017 -0500
> 
>       x86/kconfig: Make it easier to switch to the new ORC unwinder
> 
> and there are people updating latencytop on github last year:
>     https://github.com/namhyung/latencytop/commits/master
> commits on some random github page. That's shocking I know but it
> does indicate that there's still interest in the tool even if the
> original authors haven't been maintaining it.
> 
> ../Randy
> 
> 
> <snip>



