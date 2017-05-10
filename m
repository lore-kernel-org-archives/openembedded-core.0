Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A278560107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 20:01:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 10 May 2017 13:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1167340081"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 13:01:53 -0700
To: "Davis, Michael" <michael.davis@essvote.com>,
	Gary Thomas <gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C96C@ESS-EX01.essvote.corp.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <af13cada-23b5-4358-c3ce-0bd57c883f62@linux.intel.com>
Date: Wed, 10 May 2017 23:02:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <655290B7709079438B7932553958E60D16D2C96C@ESS-EX01.essvote.corp.local>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 20:01:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2017 10:53 PM, Davis, Michael wrote:
> Could we offload the 1.0.2 supported recipes to something similar to meta-gplv2?
> Then the rest of the Yocto world can move on and those that need 1.0.x can seek it out.

Maybe in 2019, when 1.0.2 will be reaching EOL, but definitely not now. 
I don't think anyone will be happy if openssh (1.0 only for now) is 
removed from oe-core, and everyone has to seek an additional layer to 
keep that and other things running.

1.0.2 is fully supported by upstream, and they will provide bugfixes for 
another 2.5 years. There is nothing wrong with keeping it in oe-core, 
unlike the gplv2 recipes which were both badly out of date and not 
really getting tested.

Alex


