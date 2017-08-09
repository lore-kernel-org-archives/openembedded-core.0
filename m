Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D023F77D11
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 11:08:35 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 09 Aug 2017 04:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,347,1498546800"; d="scan'208";a="888166036"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2017 04:08:36 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
	<4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
	<c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
	<46243f22-8359-490d-d7fa-aa2ce3280fa8@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6628fe6d-b0f0-666c-5ece-d51b3697bb9a@linux.intel.com>
Date: Wed, 9 Aug 2017 14:05:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <46243f22-8359-490d-d7fa-aa2ce3280fa8@windriver.com>
Subject: Re: [PATCH 4/4] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Wed, 09 Aug 2017 11:08:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/08/2017 09:55 PM, Mark Hatle wrote:
> For now I'm fine with 1.0 support.  So something like:
> 
> # ensure OpenSSL is used for HLS AES description instead of nettle
> # (OpenSSL is a shared dependency with dtls)
> PACKAGECONFIG[hls_openssl10]             = "--enable-hls
> --with-hls-crypto=openssl,--disable-hls,openssl10"
> 
> PACKAGECONFIG[hls]             = "--enable-hls
> --with-hls-crypto=nettle,--disable-hls,nettle"

Sure, I can amend the patch.

> But my concern is changing the choice of encryption engine could break various
> existing uses.  (Like I said, -I- don't have that use, but I expect others do..
> perhaps not with gstreamer-plugins-bad though?)

You can say the same thing about almost anything that goes into master. 
In this case it doesn't matter, as there is a trivial way to revert the 
choice, but if the change was more involved, I would appreciate more 
specific evidence that this indeed causes real problems.

Alex

