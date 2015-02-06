Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 900246AC12
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 10:41:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 06 Feb 2015 02:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,529,1418112000"; d="scan'208";a="662489979"
Received: from kamaher-mobl6.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.37])
	by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2015 02:41:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 06 Feb 2015 10:41:20 +0000
Message-ID: <4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 10:41:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 04 February 2015 21:33:36 Ross Burton wrote:
> It turns out that changing WARN_QA and ERROR_QA results in do_configure's QA
> postfunc re-executing, so changing a QA test results in a complete rebuild.

Hmm, shouldn't we be fixing this? (e.g. with vardepsexclude).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

