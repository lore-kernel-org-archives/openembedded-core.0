Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 001C6781C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 18:54:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2018 10:54:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,508,1511856000"; d="scan'208";a="174697132"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 13 Feb 2018 10:54:52 -0800
Received: from hmhajya-mobl.amr.corp.intel.com (unknown [10.252.129.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 86D9C5801AE;
	Tue, 13 Feb 2018 10:54:52 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <cover.1517336283.git.amber.n.elliot@intel.com>
From: Stephano Cetola <stephano.cetola@linux.intel.com>
Message-ID: <bf8a9825-0964-14f7-5dd1-ff464f3c7d50@linux.intel.com>
Date: Tue, 13 Feb 2018 10:54:52 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1517336283.git.amber.n.elliot@intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Subject: Re: [PATCHv2 0/1] wic: argparse now used for help functionality.
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
X-List-Received-Date: Tue, 13 Feb 2018 18:54:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/30/18 10:24 AM, anelliot wrote:
> The wic help output formally consisted of manually created strings mixed with argparse,
> which was unformatted and unusable. This fix cleans up the help messages, rewrites help
> functionality to use argparse, and adds functionality to show information for
> plugins (similar to canned images).
> 
> The following changes since commit e5e89cfb7bc2231ac4fcc16f4cb4f74d806136c4:
> 
>   pulseaudio: improve glibc 2.27 patch (2018-01-30 12:53:16 +0000)
> 
> are available in the git repository at:
> 
>   git://push.yoctoproject.org/poky-contrib anelliot/bug12205
> 
> anelliot (1):
>   wic: argparse now used for help functionality.
> 
>  meta/lib/oeqa/selftest/cases/wic.py |   50 +-
>  scripts/lib/wic/engine.py           |   87 ++-
>  scripts/lib/wic/help.py             | 1080 ++++-------------------------------
>  scripts/wic                         |  168 ++----
>  4 files changed, 267 insertions(+), 1118 deletions(-)
> 

Ack'd and tested.

--S

