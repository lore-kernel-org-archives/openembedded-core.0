Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE65A71951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 12:19:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 05:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,333,1505804400"; d="scan'208";a="145117491"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 02 Nov 2017 05:19:28 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20171102053922.33426-1-raj.khem@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
Date: Thu, 2 Nov 2017 14:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171102053922.33426-1-raj.khem@gmail.com>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 12:19:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/02/2017 07:39 AM, Khem Raj wrote:

> Changes since v2: Move to 1.1.18 release
> -PV = "1.1.16+git${SRCPV}"
> +PV = "1.1.18+git${SRCPV}"

Can you drop this, and simply rename the recipe to musl_1.1.18.bb please?

Alex


