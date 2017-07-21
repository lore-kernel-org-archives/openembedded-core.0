Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 51F9D783BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 08:13:16 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6L8B49C009028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 21 Jul 2017 09:11:05 +0100
Message-ID: <1500624664.22282.97.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 09:11:04 +0100
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 21 Jul 2017 09:11:06 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: joshua.g.lock@intel.com
Subject: Re: [PATCHv3 00/30] oeqa core and oe-selftest threaded enablement
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
X-List-Received-Date: Fri, 21 Jul 2017 08:13:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-17 at 16:45 -0500, Aníbal Limón wrote:
> This v3 makes changes on tinfoil busy status patch and adds an
> environment variable to oe-seltest script to specify number of
> threads. 
> There are patches for bitbake [3] and meta-yocto-bsp [4] that was
> send
> to their specific ML.
> 
> The first 6 patches previous enable support of threads in oeqa core
> are independent and can be merged first.
> 
> The v2 address comments did by Patrick about add better explanation
> on the commit messages and some typos.
> 
> Other interesting information to add is that with this series we will
> able to execute oe-selftest in around half [1] of the original time
> [2], (9406.782s vs 17303.014s).

I tested this, admittedly on top of the server rework changes and see
some odd failures on the autobuilder. Things aren't looking very
deterministic and I'm a little worried about merging them.

(e.g. https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/
397)

The second issue I'd like to ask questions about is whether the tinfoil
changes and server rework we've just done remove the need for some of
this patchset?

I ask since now I'm hoping the "main thread" issues might be resolved
and we truly can have independent tinfoil connections. There were
issues there but I believe Paul has resolved those.

For that reason I'm going to defer this patchset from M2 (I did take
some of the initial patches) and ask that we review the patchset in
light of the server rework and tinfoil changes that just merged.

I do know that for example, "oeqa/selftest/case: Support bitbake memres
mode in per build director" is no obsolete as we removed the memres
init script and the -t option to bitbake.

Cheers,

Richard

