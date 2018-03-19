Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 356F378950
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 16:39:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 09:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,331,1517904000"; d="scan'208";a="36283067"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 09:39:57 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180317111539.42108-1-alexander.kanavin@linux.intel.com>
	<CAMKF1speHQU8vNbdiXSrbE2zy-keJX1e9evsEBiYcbPq5Jw3vg@mail.gmail.com>
	<64bf3224-8d92-a547-44ba-c7a2f4f0c8dd@linux.intel.com>
	<CAMKF1sryc1yJU=A3vwsrabiPk2dDhSdv34c1+ptiux_0XnkvrQ@mail.gmail.com>
	<c3970d0c-15a4-bb25-3d7c-06f6e4faf780@linux.intel.com>
	<CAMKF1spJmNH9UDVZ74m8x-L6NMjS6qTDB4_wGMu4JUB4PxcM=Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <71da1abf-2bc2-f571-0a74-46636d7aa46f@linux.intel.com>
Date: Mon, 19 Mar 2018 18:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spJmNH9UDVZ74m8x-L6NMjS6qTDB4_wGMu4JUB4PxcM=Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: fix upstream version check
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
X-List-Received-Date: Mon, 19 Mar 2018 16:39:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 06:36 PM, Khem Raj wrote:
> that works too I guess if we have good enough filters to detect it. It
> seems there is more noise in tags than in branches,

That's what UPSTREAM_CHECK_GITTAGREGEX is for. You can set it to filter 
precisely the tags you want.

Alex

