Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2CBA47826F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jun 2017 15:02:41 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2017 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,333,1493708400"; d="scan'208";a="97126423"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 12 Jun 2017 08:02:11 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c1bdfae3-8ee8-a281-413b-e56083480097@linux.intel.com>
Date: Mon, 12 Jun 2017 18:02:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170612145805.11599-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] rpm: run binary package generation via thread pools
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
X-List-Received-Date: Mon, 12 Jun 2017 15:02:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2017 05:58 PM, Alexander Kanavin wrote:
> This greatly reduces build times when there is a large amount of small
> rpm packages to produce. The patches are rather invasive,
> and so will be submitted upstream.

The changes in this version of the patch:

- fixed (hopefully) the segfaults seen on autobuilder with older 
versions of gcc

- made sure that build host and build time are set only once, and are 
the same in all output files.

Alex


