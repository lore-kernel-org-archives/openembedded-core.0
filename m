Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30AAA607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Dec 2016 02:34:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBQ2Y42i022459
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Dec 2016 18:34:04 -0800 (PST)
Received: from bruce-ashfields-macbook.local (128.224.20.100) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sun, 25 Dec 2016 18:34:03 -0800
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1482415485.git.bruce.ashfield@windriver.com>
	<81c86de3aa3411f52e74b41b324c0713b347f245.1482415485.git.bruce.ashfield@windriver.com>
	<CAHiDW_E+G1JAEODj3w6Xda4CJkjHGOnBB0h035p093ZGP7WTqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5860819A.4010109@windriver.com>
Date: Sun, 25 Dec 2016 21:34:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_E+G1JAEODj3w6Xda4CJkjHGOnBB0h035p093ZGP7WTqA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-libc-headers: introduce 4.9 headers
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
X-List-Received-Date: Mon, 26 Dec 2016 02:34:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 16-12-23 5:23 AM, Jussi Kukkonen wrote:
> On 22 December 2016 at 16:49, Bruce Ashfield
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
>  >
>  > Bumping the linux-libc-headers to the 4.9 kernel variant. Since 4.9
>  > will be a LTSI kernel, and there will be an associated linux-yocto
>  > it is worth moving to these headers sooner rather than later.
>  >
>  > This commit also drops the 4.8 headers and sets 4.9 to be the default.
>
> The autobuilder run (ross/mut 1dc1894e05) with this had a couple of issues:
>
> *** ppp fails to build on musl:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10853
>
> *** ncurses fails in several builds, all gnu/stubs.h related:
> ncurses was also upgraded in this AB run (CCing Huang Qiyu) but the
> failures seem more like libc related...
>
> x32:
> |
> nightly-x32/build/build/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h:10:27:
> fatal error: gnu/stubs-64.h: No such file or directory
> |  # include <gnu/stubs-64.h>
>
> arm:
> |
> nightly-arm/build/build/tmp/sysroots/beaglebone/usr/include/gnu/stubs.h:7:29:
> fatal error: gnu/stubs-soft.h: No such file or directory
> |  # include <gnu/stubs-soft.h>


FYI: I was just able to build all variants on ncurses on the branches
I have available.

I'm going to need a bit more direction on what branch/config to build
to see this breakage.

Bruce

>
> multilib:
> |
> nightly-multilib/build/build/tmp/sysroots/qemumips64/usr/include/gnu/stubs.h:35:33:
> fatal error: gnu/stubs-n64_hard.h: No such file or directory
> |  # include <gnu/stubs-n64_hard.h>
>
> The full build log links can be found in "nightly 1121" section here:
> https://wiki.yoctoproject.org/wiki/BuildLog#nightly_1121_-_ross.2Fmut_1dc1894e05ef0f3aeeefa61ed89613f17bba2e83
>
>
> Cheers,
>    Jussi


