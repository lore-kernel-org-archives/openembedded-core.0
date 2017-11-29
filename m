Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id E72D97807C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 13:14:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 05:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,473,1505804400"; d="scan'208";a="10978705"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 05:14:10 -0800
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20171129131304.17511-1-alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3253c0f5-1868-a5c2-c637-655357fefe2b@linux.intel.com>
Date: Wed, 29 Nov 2017 15:14:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171129131304.17511-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCHv2] devtool: add license checksum change handling to 'devtool upgrade'
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
X-List-Received-Date: Wed, 29 Nov 2017 13:14:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/29/2017 03:13 PM, Alexander Kanavin wrote:
> 3) and the cool part: devtool will create a diff of the old and new licenses,
> and write the diff into the workspace recipe as a comment, like this:

v2 adds a small tweak here: add an empty line at the end of the comment 
which separates it better from the rest of the recipe.

Alex

