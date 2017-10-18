Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 48CF56FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 10:43:28 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 18 Oct 2017 03:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,396,1503385200"; d="scan'208";a="161831986"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 03:43:28 -0700
To: leonardo.sandoval.gonzalez@linux.intel.com,
	openembedded-core@lists.openembedded.org
References: <20171017191130.41996-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <f4ca7416-d8df-c30e-a950-582294613953@linux.intel.com>
Date: Wed, 18 Oct 2017 13:38:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017191130.41996-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: Re: [PATCH v3 1/5] perl-native: upgrade from 5.24.1 to 5.26.1
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
X-List-Received-Date: Wed, 18 Oct 2017 10:43:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/17/2017 10:11 PM, leonardo.sandoval.gonzalez@linux.intel.com wrote:
>   ...perl-native_5.24.1.bb => perl-native_5.26.1.bb} | 10 +++---

Have you done any measurements about how fast the recipe builds compated 
to 5.24? Is it faster, slower, or same-ish? Maybe there are some low 
hanging fruits to speed things up.

Alex

