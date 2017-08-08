Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BAA8E71984
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 17:23:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Aug 2017 10:23:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,344,1498546800"; d="scan'208";a="887885462"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2017 10:23:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20170807114504.28410-1-alexander.kanavin@linux.intel.com>
	<20170807114504.28410-3-alexander.kanavin@linux.intel.com>
	<CAMKF1so_29Ojxcmmm6u+HmSo3SF55DQHQEXmokdnvy_ca-5sCA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3ab5897f-4c1c-841a-9ef5-1335fe2279d0@linux.intel.com>
Date: Tue, 8 Aug 2017 20:19:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1so_29Ojxcmmm6u+HmSo3SF55DQHQEXmokdnvy_ca-5sCA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] btrfs-tools: update to 4.12
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
X-List-Received-Date: Tue, 08 Aug 2017 17:23:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/08/2017 06:48 PM, Khem Raj wrote:
> I think such a patch would be good upstream too. There are many
> packages making distinction between
> build host and target host and help cross compilation.

btrfs-tools does not support this distinction. The host compiler is 
enforced in the patch through an openembedded-specific variable.

Alex

