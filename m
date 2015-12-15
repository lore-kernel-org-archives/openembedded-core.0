Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 89BD1601F6;
	Tue, 15 Dec 2015 16:04:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2015 08:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,433,1444719600"; d="scan'208";a="13608796"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.24.58])
	([10.219.24.58])
	by fmsmga004.fm.intel.com with ESMTP; 15 Dec 2015 08:03:40 -0800
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <567039E1.5000205@linux.intel.com>
Date: Tue, 15 Dec 2015 10:03:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
Subject: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 16:04:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

There is an initiative to track vulnerable software being built (see 
bugs 8119 and 7515). The idea is to have a testing tool that would check 
the recipe versions against CVEs. In order to accomplish such task there 
is need to reliable mark the patches from upstream that solve CVEs.

There have been two options to mark the patches that solve CVEs:

1. Have  "CVE" and the CVE number as the patch filename.
   Pros:
     Doesn't require a new tag.
   Cons:
     It is not flexible to add more information, for example two CVEs in 
the same patch

2. Add a new tag in the patch that have the CVE information.
   Pros:
     It is flexible and can add more information.
   Cons:
     Require a change in the patch metadata.

What I would recommend is to add a new tag in the patch, it must contain 
the CVE ID. With this it would be possible to look for the CVE 
information easily in the testing tool or in NIST, MITRE, or another web 
page. For example, this would be part of the patch for CVE-2013-6435, 
currently in OE-Core:

-- snip --

Upstream-Status: Backport
CVE: CVE-2013-6435

Reference:
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2013-6435

-- snip --

The expected output of this discussion is a standard format for CVE 
patches that most, if not all, of community members agree on.

Please let me know your comments.

Cheers,

Mariano Lopez

