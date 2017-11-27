Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 971B571C70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:15:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 11:15:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; d="scan'208";a="10220507"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2017 11:15:38 -0800
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171127183538.68275-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b5ec6830-3185-054f-7354-d9caa66e692b@linux.intel.com>
Date: Mon, 27 Nov 2017 21:16:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171127183538.68275-1-danismostlikely@gmail.com>
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: Re: [PATCH] bind: fix python3 dependencies
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
X-List-Received-Date: Mon, 27 Nov 2017 19:15:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/2017 08:35 PM, Dan McGregor wrote:
> Add missing python3 dependency, and use python3 from the build
> system.
> -DEPENDS = "openssl libcap"
> +DEPENDS = "openssl libcap python3"
> -inherit autotools update-rc.d systemd useradd pkgconfig python3-dir
> +inherit autotools update-rc.d systemd useradd pkgconfig python3-dir python3native

This should have a more specific explanation. Namely:

1) why is target python3 needed at build time (if not, it should be in 
RDEPENDS of a specific package)

2) why is native python3 needed, and host python3 is not enough.


Alex

