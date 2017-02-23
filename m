Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B366472FE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:56:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:56:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="51716557"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2017 01:56:08 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<73bd00392c81ac3cfaf9e013052071b1ee6b66ff.1487774787.git.alexander.kanavin@linux.intel.com>
	<1487841686.32665.1.camel@andred.net>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <26b84b1a-96bd-9551-914b-81b8ea713610@linux.intel.com>
Date: Thu, 23 Feb 2017 11:55:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1487841686.32665.1.camel@andred.net>
Subject: Re: [PATCH 09/24] boost: update to 1.63.0
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
X-List-Received-Date: Thu, 23 Feb 2017 09:56:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/23/2017 11:21 AM, André Draszik wrote:
>> Drop backported 0002-boost-test-execution_monitor.hpp-fix-mips-soft-
>> float.patch
>> Rebase consider-hardfp.patch to 0001-When-using-soft-float-on-ARM-we-
>> should-not-expect-th.patch
>
> I would think that the arm specific soft-float hack 0001-When-using-soft-
> float-on-ARM-we-should-not-expect-th.patch is not needed anymore, given that
> boost should be able to handle all soft float environments now, but am not
> in a position to test this.

Neither am I. If the patch would've been more difficult to rebase, I 
would simply drop it for that reason + inability to test what it does.
That's why sending patches upstream is important (especially non-trivial 
ones); it guarantees that they won't be removed down the road.

Alex


