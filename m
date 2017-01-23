Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BAB8C760AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:38:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jan 2017 08:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="34324026"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2017 08:38:13 -0800
To: openembedded-core@lists.openembedded.org
References: <1485188445-19983-1-git-send-email-ross.burton@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <db53afb0-1592-a5fe-6f0e-6b15c9a10664@linux.intel.com>
Date: Mon, 23 Jan 2017 18:38:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1485188445-19983-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] ed: use yoctoproject mirror for SRC_URI
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
X-List-Received-Date: Mon, 23 Jan 2017 16:38:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2017 06:20 PM, Ross Burton wrote:
> We shoud upgrade to the latest release but as new releases are only compressed
> using lzip that means adding lzip-native to oe-core, so this is a suitable
> short-term fix.

> -SRC_URI = "${GNU_MIRROR}/ed/ed-${PV}.tar.gz"
> +SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz"

Add UPSTREAM_CHECK_URI please (or file a bug), as I'll surely forget 
about the update if the RRS is going to report 'Up-to-date' for this.

Alex


