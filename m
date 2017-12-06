Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EEA99786D2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 17:16:08 +0000 (UTC)
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 09:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,369,1508828400"; 
   d="scan'208";a="474070"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2017 09:16:09 -0800
To: Nikolay Merinov <n.merinov@inango-systems.com>,
	openembedded-core@lists.openembedded.org
References: <20171206102815.20287-1-n.merinov@inango-systems.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4c9642c6-7d91-f1b5-a399-5f9e264fa1d6@linux.intel.com>
Date: Wed, 6 Dec 2017 19:16:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171206102815.20287-1-n.merinov@inango-systems.com>
Subject: Re: [PATCH] sudo: provide sudo paths through EXTRA_OECONF
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
X-List-Received-Date: Wed, 06 Dec 2017 17:16:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/06/2017 12:28 PM, Nikolay Merinov wrote:
]> +	     --with-vardir=/var/lib/sudo \
> +	     --with-iologdir=/var/log/sudo-io \
> +	     --with-rundir=/var/run/sudo \
> +	     --with-logpath=/var/log/sudo.log \


Don't hardcode /var here, use ${localstatedir}.

Alex


