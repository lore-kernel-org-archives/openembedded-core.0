Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2E8977482C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2018 09:37:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 May 2018 02:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,358,1520924400"; d="scan'208";a="52852468"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2018 02:37:57 -0700
To: Hong Liu <hongl.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
References: <20180503090918.20964-1-hongl.fnst@cn.fujitsu.com>
	<20180503090918.20964-2-hongl.fnst@cn.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <928b0405-b383-cd27-571e-8fc72b41d6b7@linux.intel.com>
Date: Thu, 3 May 2018 12:32:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180503090918.20964-2-hongl.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] btrfs-tools: Update to 4.16
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
X-List-Received-Date: Thu, 03 May 2018 09:37:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 12:09 PM, Hong Liu wrote:
> -DEPENDS = "util-linux attr e2fsprogs lzo acl"
> +DEPENDS = "util-linux attr e2fsprogs lzo acl python3"
> +EXTRA_OECONF = "--disable-zstd --disable-python"
> +INSANE_SKIP_${PN} = "ldflags"

You need to explain all of these changes in the commit message. 
Particularly the combination of adding a python dependency and then 
passing --disable-python looks odd.

Alex


