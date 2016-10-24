Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 963D371AA2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 11:29:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 24 Oct 2016 04:29:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,541,1473145200"; d="scan'208";a="776840515"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Oct 2016 04:29:22 -0700
To: openembedded-core@lists.openembedded.org
References: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
	<1477175949-6903-2-git-send-email-schnitzeltony@googlemail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ed413596-29e1-1fd6-018b-648f541e4b2f@linux.intel.com>
Date: Mon, 24 Oct 2016 14:27:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1477175949-6903-2-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 2/2] taglib: update to 1.11
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
X-List-Received-Date: Mon, 24 Oct 2016 11:29:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/23/2016 01:39 AM, Andreas Müller wrote:
> without relocation option -fPIC depending packages failed with many error like:
>
> | <..>/arm-angstrom-linux-gnueabi/6.2.0/ld: error: <..>/usr/lib/libtag.a(modfilebase.cpp.o): requires unsupported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC

This comment should be placed in a recipe next to the actual change.

Alex


