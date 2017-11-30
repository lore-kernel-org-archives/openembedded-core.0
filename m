Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7F01D6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 11:32:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2017 03:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,341,1508828400"; d="scan'208";a="11407782"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 30 Nov 2017 03:32:51 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1512006081.git.liezhi.yang@windriver.com>
	<12c2694b20a9198d2d4f02100ced3dbdc1351f75.1512006081.git.liezhi.yang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3d8f8bf0-84a6-d9bf-6540-3cc09196fb1a@linux.intel.com>
Date: Thu, 30 Nov 2017 13:33:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <12c2694b20a9198d2d4f02100ced3dbdc1351f75.1512006081.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/5] go-native: fix PATH issue when len(TMPDIR) == 410
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
X-List-Received-Date: Thu, 30 Nov 2017 11:32:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/30/2017 03:45 AM, Robert Yang wrote:
> +-	char buf[4096];
> ++	char buf[8192];

I understand it would take more time, but the proper way to fix this 
(and similar issues in patches 2, 3, 5) is to use dynamic allocation. 
Swapping one arbitrary value for another arbitrary value may still not 
be enough for everyone.

Alex

