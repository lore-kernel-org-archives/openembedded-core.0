Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B17777F2E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 07:35:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2019 00:35:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,388,1559545200"; d="scan'208";a="194717230"
Received: from optimus-prime.png.intel.com (HELO [172.30.199.130])
	([172.30.199.130])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 00:35:22 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
	<CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
From: "Saini, Naveen Kumar" <naveen.kumar.saini@intel.com>
Message-ID: <3fd5cffc-0bef-6275-a436-c1741afea7ef@intel.com>
Date: Thu, 15 Aug 2019 15:37:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Thu, 15 Aug 2019 07:35:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/15/19 3:23 PM, Martin Jansa wrote:
> NAK
> 
> Yes, the first part was merged in warrior and is correct.
> 
> But this second part isn't good (you don't want git-lfs to sometimes 
> work and sometimes fail) and that's why it was rejected for master and 
> _shouldn't_ be merged to warrior. If you have recipes which need 
> git-lfs, then add it to normal HOSTTOOLS in your builds to make sure 
> it's always present when needed.

Noted. Thanks.

