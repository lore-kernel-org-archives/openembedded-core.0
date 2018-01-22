Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC5577629
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 10:18:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0MAGmM8024130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 22 Jan 2018 10:16:49 GMT
Message-ID: <1516616208.24502.100.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: anelliot <amber.n.elliot@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 10:16:48 +0000
In-Reply-To: <cfe77fab44ccf8ac32f4df117b729d65376e9da2.1516289668.git.amber.n.elliot@intel.com>
References: <cover.1516289668.git.amber.n.elliot@intel.com>
	<cfe77fab44ccf8ac32f4df117b729d65376e9da2.1516289668.git.amber.n.elliot@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 1/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Mon, 22 Jan 2018 10:18:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-18 at 07:42 -0800, anelliot wrote:
> The wic help output formally consisted of manually created strings
> mixed with argparse,
> which wasunformatted and unusable. This fix cleans up the help
> messages, rewrites help
> functionality to use argparse, and adds functionality to show
> information for
> plugins (similar to canned images).
> 
> Fixes [YOCTO #12205]
> 
> Signed-off-by: anelliot <amber.n.elliot@intel.com>
> ---
>  meta/lib/oeqa/selftest/cases/wic.py |   58 +-
>  scripts/lib/wic/engine.py           |   87 ++-
>  scripts/lib/wic/help.py             | 1080 ++++---------------------
> ----------
>  scripts/wic                         |  168 ++----
>  4 files changed, 269 insertions(+), 1124 deletions(-)


Unfortunately this is causing a selftest regression:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/771

You should be able to reproduce with:

"oe-selftest -r wic.Wic.test_qemu"

Cheers,

Richard

