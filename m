Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83122605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 04:04:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB144EpC019673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Nov 2015 20:04:14 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 30 Nov 2015 20:04:13 -0800
To: Christopher Larson <clarson@kergoth.com>, Fang Jia <fang.jia@windriver.com>
References: <1448873434-34150-1-git-send-email-fang.jia@windriver.com>
	<CABcZAN=zqR_W8S=eUNAZ4R95QsCsv7eB+ym4hanSHfeBXZHgJg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <565D1C3B.8030201@windriver.com>
Date: Tue, 1 Dec 2015 12:04:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CABcZAN=zqR_W8S=eUNAZ4R95QsCsv7eB+ym4hanSHfeBXZHgJg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] toolchain-scripts.bbclass: unset command_not_found_handle
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
X-List-Received-Date: Tue, 01 Dec 2015 04:04:17 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/01/2015 11:48 AM, Christopher Larson wrote:
> On Mon, Nov 30, 2015 at 3:50 AM, Fang Jia <fang.jia@windriver.com
> <mailto:fang.jia@windriver.com>> wrote:
>
>     On Ubuntu-system, When sourcing the env.sh from an exported sdk, and
>     running a bogus linux command (for example "asd"), a core dump of
>     python is usually generated.
>
>     Unset the command_not_found_handle to fix it.
>
>     Signed-off-by: Fang Jia <fang.jia@windriver.com <mailto:fang.jia@windriver.com>>
>
>
> Will this syntax be valid for non-bash environments? What about dash and zsh?

unset is part of posix shell, I think it's fine to use it here.

// Robert

> You have to be careful to use portable constructs in a script which is sourced
> like this.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
>

