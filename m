Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 6E392601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Mar 2019 23:26:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2019 16:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,254,1549958400"; d="scan'208";a="330830915"
Received: from pyeoh1-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.177.212])
	by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2019 16:26:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Taras Kondratiuk <takondra@cisco.com>
Date: Fri, 22 Mar 2019 12:25:57 +1300
Message-ID: <7654089.vcRqMmA28I@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <1553209705-12220-1-git-send-email-takondra@cisco.com>
References: <1553209705-12220-1-git-send-email-takondra@cisco.com>
MIME-Version: 1.0
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] devtool: prevent starting git gc in background
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
X-List-Received-Date: Thu, 21 Mar 2019 23:26:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Taras

On Friday, 22 March 2019 12:08:25 PM NZDT Taras Kondratiuk wrote:
> Devtool creates a git repository for extracted sources in a temporary
> directory and then moves it to a final destination after patching is
> done. Unfortunately devtool is not aware that some of its git operations
> may have caused git garbage collector to start in background. If timing
> is just right a repository move fails because GC is removing git objects
> while they are being moved.
> 
> The issue was hit on Krogoth release, but the code that moves created
> git repository is still the same.
> 
> Disable gc.autodetach to make GC run synchronously and block git until
> it is done.

The fix is OK, but I'd like it to be explicit and say "git config --local"
rather than just "git config" just in case of any future behavioral
changes in git config. Could you please send a v2 with this change?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



