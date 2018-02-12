Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 39AD66067D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 14:26:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Feb 2018 06:26:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,501,1511856000"; d="scan'208";a="17822927"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 12 Feb 2018 06:26:58 -0800
To: openembedded-core@lists.openembedded.org,
	"John, Maxin" <maxin.john@intel.com>
References: <1518444986-25886-1-git-send-email-maxin.john@intel.com>
	<1518444986-25886-4-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <59810cd1-9541-243d-f9e1-f0c14c47ee73@linux.intel.com>
Date: Mon, 12 Feb 2018 16:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518444986-25886-4-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 4/4] libinput: fix upstream version check
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
X-List-Received-Date: Mon, 12 Feb 2018 14:26:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/12/2018 04:16 PM, Maxin B. John wrote:
> Skip RC releases for libinput which follow the pattern: x.x.9xx
> +UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.[^9]\d*).tar.xz"

Same issue as previous patch.

Alex

