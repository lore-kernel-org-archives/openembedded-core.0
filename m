Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CC7EC71DB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 12:21:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Apr 2017 05:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,244,1488873600"; d="scan'208";a="80287062"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 24 Apr 2017 05:21:08 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1492777818.git.alexander.kanavin@linux.intel.com>
	<41eab4c3d1f37b4dc2614de0a5654590dd7bc4b8.1492777818.git.alexander.kanavin@linux.intel.com>
	<CAJTo0Lax=yRbSPo4pdp1we2RjVWSQNXXB65gdniLYz4Y1aJNQQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ca35e89d-68c7-78e5-3c22-7da2496c18ed@linux.intel.com>
Date: Mon, 24 Apr 2017 15:20:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lax=yRbSPo4pdp1we2RjVWSQNXXB65gdniLYz4Y1aJNQQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/11] oe-selftest: add a test for upstream version check regressions
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
X-List-Received-Date: Mon, 24 Apr 2017 12:21:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/23/2017 10:57 PM, Burton, Ross wrote:
>     The test runs an upstream version check, and then compares the
>     list of recipes that failed the check (i.e. those where latest
>     upstream version could not be established) against the list of
>     known-broken upstreams. Mismatches either way (upstream check failed,
>     recipe not in the exception list, or upstream check worked,
>     recipe in exception list) fail the test.
>
>
> This fails on the autobuilder:
> The following packages failed upstream version checks. Please fix them
> using UPSTREAM_CHECK_URI/UPSTREAM_CHECK_REGEX
> (when using tarballs) or UPSTREAM_CHECK_GITTAGREGEX (when using git). If
> an upstream version check cannot be performed
> (for example, if upstream does not use git tags), you can add the
> package to list of exceptions in
> meta-selftest/files/distrodata/checkpkg_exceptions.
> kmscube

New recipe that is not yet in master, does not have version tags.

> bmap-tools
> libcap-ng

These two work ok on my local machine :-/ Let's see if this was a 
one-off glitch.

> boost

Upstream check got broken with update to 1.64.0, will fix.

> The following packages have been checked successfully for upstream
> versions (or they no longer exist in oe-core),
> but are in the exceptions list in
> meta-selftest/files/distrodata/checkpkg_exceptions. Please remove them
> from that list.
> x264

Needs 'commercial' whitelisting in configuration, will fix.

I'll send an updated patch.

Alex



