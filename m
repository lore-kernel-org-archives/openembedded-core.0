Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D8A48719A5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 18:05:14 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 09 May 2017 11:05:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,315,1491289200"; d="scan'208";a="85414389"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 09 May 2017 11:05:14 -0700
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1494346762-7270-1-git-send-email-maxin.john@intel.com>
	<1494346762-7270-2-git-send-email-maxin.john@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3bcd82f1-0989-d9ad-1369-b09f7b89be2a@linux.intel.com>
Date: Tue, 9 May 2017 21:05:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494346762-7270-2-git-send-email-maxin.john@intel.com>
Subject: Re: [PATCH 2/3] DEBIAN_MIRROR: switch from ftp to http
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
X-List-Received-Date: Tue, 09 May 2017 18:05:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2017 07:19 PM, Maxin B. John wrote:
> All public-facing debian.org FTP services will be shut down on November 1, 2017
> The mirrors should just be accessed using HTTP instead.

Let's discourage the use of ftp in recipes in general; it's a 1970s relic.


Alex

