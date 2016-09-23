Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21202600E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 13:35:17 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 23 Sep 2016 06:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="12973076"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga004.jf.intel.com with ESMTP; 23 Sep 2016 06:35:18 -0700
To: openembedded-core@lists.openembedded.org
References: <1474637000-22802-1-git-send-email-patrick.ohly@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cfff83f1-d63e-236f-3adf-f9703160db1c@linux.intel.com>
Date: Fri, 23 Sep 2016 16:33:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474637000-22802-1-git-send-email-patrick.ohly@intel.com>
Subject: Re: [PATCH 1/2] openssl.inc: avoid random ptest failures
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
X-List-Received-Date: Fri, 23 Sep 2016 13:35:18 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 04:23 PM, Patrick Ohly wrote:
> "make alltests" is sensitive to the timestamps of the installed
> files. Depending on the order in which cp copies files, .o and/or
> executables may end up with time stamps older than the source files.
> Running tests then triggers recompilation attempts, which typically
> will fail because dev tools and files are not installed.

Patch 2/2 hasn't arrived.

Alex


