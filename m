Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0A3186FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 10:39:37 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Oct 2017 03:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,422,1503385200"; d="scan'208";a="163740319"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 23 Oct 2017 03:39:38 -0700
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <1508748359-20879-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4dbdca14-c94e-0637-2f2f-9fdae55f0e95@linux.intel.com>
Date: Mon, 23 Oct 2017 13:35:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1508748359-20879-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH v2] libnl: 3.2.29 -> 3.4.0
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
X-List-Received-Date: Mon, 23 Oct 2017 10:39:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/23/2017 11:45 AM, Huang Qiyu wrote:
> 1) Upgrade libnl from 3.2.29 to 3.4.0.
> 2) Delete one patch "fix-pktloc_syntax_h-race.patch", for it is inappropriate.

Inappropriate how? Has the problem been solved upstream? Please explain 
(in the v3 commit message).

> 2) Add one patch "0001-PATCH-fix-libnl-3.4.0-musl-compile-problem.patch", for musl compile.

Thanks for looking into this one :)

Alex

