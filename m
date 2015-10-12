Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0087E75A52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Oct 2015 12:44:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Oct 2015 05:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,672,1437462000"; d="scan'208";a="662604665"
Received: from skhizaka-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.208])
	by orsmga003.jf.intel.com with ESMTP; 12 Oct 2015 05:44:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 12 Oct 2015 13:44:17 +0100
Message-ID: <5071305.1deNSCeptA@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1444651405-11188-2-git-send-email-ross.burton@intel.com>
References: <1444651405-11188-1-git-send-email-ross.burton@intel.com>
	<1444651405-11188-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] oeqa/selftest: verify that devtool can use plugins in other layers
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
X-List-Received-Date: Mon, 12 Oct 2015 12:44:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ross,

On Monday 12 October 2015 13:03:25 Ross Burton wrote:
> Verify that devtool can use plugins in other layers by invoking the
> "selftest-reverse" command provided by meta-selftest.

I would squash these two patches together; additionally the no-op 
plugin_init() is no longer required these days. Otherwise looks OK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

