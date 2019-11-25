Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF71A7FBF9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:07:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Nov 2019 04:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,241,1571727600"; d="scan'208";a="408289133"
Received: from xsanroma-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.34.24])
	by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2019 04:07:26 -0800
To: Phil Blundell <pb@pbcl.net>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
	<fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
	<20191121135942.h776ktsg6jwow4sj@pbcl.net>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <32d99e6a-b196-6d1d-dac2-a0e1ccfa2c75@intel.com>
Date: Mon, 25 Nov 2019 12:07:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191121135942.h776ktsg6jwow4sj@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Mon, 25 Nov 2019 12:07:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/11/2019 13:59, Phil Blundell wrote:
> I also have at least a passing fondness for lrzsz and if a small amount
> of maintenance now will suffice to keep it working for another 21 years
> then I think I would consider that a good outcome.  I will have a quick
> look at the code and see if I can fix whatever is apparently problematic
> about it.

If you can send a patch sooner rather than later for lrzsz to fix the 
build with modern gettext then that would be *awesome*, as this recipe 
is the sole blocker.

Ross

