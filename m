Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 228517824D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 10:53:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Jan 2018 02:53:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,415,1511856000"; d="scan'208";a="22723113"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2018 02:53:09 -0800
To: openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1516957210-15531-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516957210-15531-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cb466609-f3ee-4c5a-ef48-a40566aba04e@linux.intel.com>
Date: Fri, 26 Jan 2018 12:47:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1516957210-15531-4-git-send-email-huangqy.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] man-pages: 4.11 -> 4.14
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
X-List-Received-Date: Fri, 26 Jan 2018 10:53:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/26/2018 11:00 AM, Huang Qiyu wrote:
> 1.Upgrade man-pages from 4.11 to 4.14.
> 2.Update the checksum of LIC_FILES_CHKSUM, since README has been changed.
> -LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
> +LIC_FILES_CHKSUM = "file://README;md5=794f701617cc03fe50c53257660d8ec4"

Leo, can you look into why patchtest hasn't reacted to this patch, 
asking to use the License-Update tag? (it should do that by now)


Thanks,
Alex

