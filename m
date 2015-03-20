Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3A2073BA1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 11:38:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Mar 2015 04:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,436,1422950400"; d="scan'208";a="470039165"
Received: from ebtoomey-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.148])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2015 04:38:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Fri, 20 Mar 2015 11:38:25 +0000
Message-ID: <1715446.SMLV1DZGVq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1426850570-12024-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1426850570-12024-1-git-send-email-ed.bartosh@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/lsb.py: Stop parsing /etc/SuSE-release
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
X-List-Received-Date: Fri, 20 Mar 2015 11:38:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ed,

On Friday 20 March 2015 13:22:50 Ed Bartosh wrote:
> /etc/SuSE-release should not be parsed to obtain release info
> 
> Here is the quote from /etc/SuSE-release:
> /etc/SuSE-release is deprecated and will be removed in the future,
> use /etc/os-release instead
> 
> All recent OpenSUSE versions already have /etc/os-release and
> oe.lsb/release_dict_file function already parses it.
> 
> Current implementation of release_dict_file returns different values
> when parsing /etc/SuSE-release and /etc/os-release. This is one more
> advantage of getting rid of parsing /etc/SuSE-release.

How long ago did OpenSuSE start including /etc/os-release? My concern is if 
someone did happen to run on an older OpenSuSE release and then submit a bug 
report with an attached log, we'd rather see the actual version rather than 
"Unknown". If that's a possible scenario, we might want to just swap the 
blocks around so that /etc/os-release is looked for first.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

