Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3A92B7890E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jan 2018 12:15:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jan 2018 04:15:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,325,1511856000"; 
   d="scan'208";a="8768794"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 07 Jan 2018 04:15:21 -0800
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1515227501-18514-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9358dd7a-6b62-40e4-23d2-cf0c7d11110a@linux.intel.com>
Date: Sun, 7 Jan 2018 14:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1515227501-18514-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] blktrace: 1.1.0+gitX -> 1.2.0+gitX
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
X-List-Received-Date: Sun, 07 Jan 2018 12:15:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/06/2018 10:31 AM, Huang Qiyu wrote:
>   SRCREV = "43fc870ce04e963def45dfc0d1ed4ea21ef10d4b"
>   
> -PV = "1.1.0+git${SRCPV}"
> +PV = "1.2.0+git${SRCPV}"

PV is updated but SRCCREV is not, so this still fetches the 1.1.0 version.

Please do pay more attention to the quality of your patches, submissions 
from Fujitsu are already viewed with more suspicion than would otherwise 
be necessary.

Alex

