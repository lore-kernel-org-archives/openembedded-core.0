Return-Path: <ross.burton@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id D28597D5C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 16:19:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 09:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="353292151"
Received: from pruecklm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.36.159])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2019 09:19:55 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190814222921.34551-1-raj.khem@gmail.com>
	<b3f880cd-422a-a0ef-db42-6e44364ab06e@gmail.com>
	<CAMKF1sqQLs_Rey6XCoH5AGMx5=-n-XrspEgrh=zrmF-eDtB2Eg@mail.gmail.com>
	<3bf454c4-0ab2-8020-76cf-74e77f4a0ab6@intel.com>
	<CAMKF1spqt7YX6o=C+shdQyyrkGx0WcwSCqG4F91X9_6mkgc4_g@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <dca2b8bf-32df-3cad-14f2-624aa5eb7d3d@intel.com>
Date: Mon, 19 Aug 2019 17:19:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spqt7YX6o=C+shdQyyrkGx0WcwSCqG4F91X9_6mkgc4_g@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libffi: Upgrade to 3.3-rc0
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
X-List-Received-Date: Mon, 19 Aug 2019 16:19:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 19/08/2019 16:09, Khem Raj wrote:
>     Set the PV to 3.3~rc0 and 3.3 will sort after it.
> 
> 
> I thinking using + terminology is familiar in OE world let’s stick to it

I worked on adding ~ explicitly for this exact problem (as used by 
Fedora, Debian, etc), so please let's use ~ instead of messing around 
with fake PV numbers.

~ is basically - but it sorts before alphanumerics, so 3.2 < 3.3~beta < 3.3.

Ross

