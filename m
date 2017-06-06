Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 10B3E71ADE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 15:42:36 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 06 Jun 2017 08:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,306,1493708400"; d="scan'208";a="95231656"
Received: from mstanilx-mobl1.ger.corp.intel.com (HELO [10.252.12.64])
	([10.252.12.64])
	by orsmga004.jf.intel.com with ESMTP; 06 Jun 2017 08:42:36 -0700
To: openembedded-core@lists.openembedded.org
References: <1496761395-4499-1-git-send-email-ross.burton@intel.com>
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
Message-ID: <821c29ed-09a2-8cb9-e0bf-26977f67dcca@linux.intel.com>
Date: Tue, 6 Jun 2017 18:42:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496761395-4499-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] archiver: preserve sysroot paths in configured mode
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
X-List-Received-Date: Tue, 06 Jun 2017 15:42:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/17 18:03, Ross Burton wrote:
> do_ar_configured alters WORKDIR but also expects to be able to run do_configure,
> so forcibly expand the paths to the sysroots as otherwise they'll point to a
> non-existant directory in the temporary WORKDIR.
>
> [ YOCTO #11584 ]
>

This patch is not enough because the problem is in do_unpack_and_patch which
is shared by most archiver modes. This patch fails, e.g., with "original 
+ diff"

https://patchwork.openembedded.org/series/7068/

-- Mikko




