Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4892D77B8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 04:24:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2017 21:24:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,391,1500966000"; d="scan'208";a="148995747"
Received: from babarret-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.243])
	by orsmga005.jf.intel.com with ESMTP; 13 Sep 2017 21:24:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 16:24:30 +1200
Message-ID: <9777756.UdYKLuYSlu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <43aa2701a929f7d821c5403b2999446a97166754.1505361895.git.paul.eggleton@linux.intel.com>
References: <cover.1505361895.git.paul.eggleton@linux.intel.com>
	<43aa2701a929f7d821c5403b2999446a97166754.1505361895.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] devtool: rework source extraction so that dependencies are handled
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
X-List-Received-Date: Thu, 14 Sep 2017 04:24:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 14 September 2017 4:15:11 PM NZST Paul Eggleton wrote:
> * Since we are creating (or modifying) a bbappend on the fly after the
>   initial cache load has taken place, we need to ensure that this gets
>   noticed otherwise it won't have any effect. In order to do this
>   properly with the way cooker currently works, we have to be able to
>   set its parsecache_valid flag to False. A new invalidateParseCache
>   command on the bitbake side makes this possible.

Whoops, this should have been dropped from the commit message in v2. I've 
fixed it in the branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

