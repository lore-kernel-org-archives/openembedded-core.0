Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EE8207199A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 10:40:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 04 Apr 2017 03:40:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,275,1486454400"; d="scan'208";a="68937382"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 Apr 2017 03:40:52 -0700
To: openembedded-core@lists.openembedded.org,
	"Choong, Yin Thong" <yin.thong.choong@intel.com>
References: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
	<1491298154-68270-5-git-send-email-yin.thong.choong@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a178ed58-d530-6097-d341-f9203504f06d@linux.intel.com>
Date: Tue, 4 Apr 2017 13:40:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491298154-68270-5-git-send-email-yin.thong.choong@intel.com>
Subject: Re: [PATCH v2 4/8] logrotate: replace fedorahosted.org SRC_URI with github.com source
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
X-List-Received-Date: Tue, 04 Apr 2017 10:40:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/04/2017 12:29 PM, yin.thong.choong@intel.com wrote:
> -SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.gz \
> +S = "${WORKDIR}/${PN}-r3-9-1"
> +
> +UPSTREAM_CHECK_URI = "https://github.com/${PN}/${PN}/releases"
> +
> +SRC_URI = "https://github.com/${PN}/${PN}/archive/r3-9-1.tar.gz \

Why are we taking a github snapshot tarball (which is not standard 
parctice in oe-core)? Put a comment here that when updating logrotate to 
latest upstream, SRC_URI should point to a proper release tarball from 
https://github.com/logrotate/logrotate/releases and we have to take the 
snapshot for now because there is no such tarball available for 3.9.1.

Generally, don't be afraid to put comments next to your changes, the 
more the better! And especially when you are doing something unusual 
that is not self-explanatory like above.

Otherwise, I am happy with the patchset!

Alex


