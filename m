Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 93E5278679
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 19:28:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2017 11:28:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,343,1508828400"; d="scan'208";a="11580484"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2017 11:28:35 -0800
To: Dan McGregor <danismostlikely@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20171130162857.24082-1-danismostlikely@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c0bf2792-4c65-991a-3cb8-a4960515d784@linux.intel.com>
Date: Thu, 30 Nov 2017 21:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171130162857.24082-1-danismostlikely@gmail.com>
Subject: Re: [PATCH] python3: fix multilib in distutils
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
X-List-Received-Date: Thu, 30 Nov 2017 19:28:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/30/2017 06:28 PM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
> 
> Update the multilib patch to also use sys.lib in distutils.
> 
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>

This patch makes two different recipe patches modify the same line 
twice. Can you squash that into a single change so that it's clear what 
is being changed, and what is the final state. Also, please do provide 
an explanation in the commit message: why the original code is 
incorrect, and why the new one is correct.

Alex

