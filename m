Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BFBC67D6C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 13:02:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Sep 2019 06:02:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; d="scan'208";a="189016413"
Received: from fwan32-mobl1.gar.corp.intel.com (HELO blackadder.local)
	([10.252.38.244])
	by orsmga006.jf.intel.com with ESMTP; 09 Sep 2019 06:02:05 -0700
To: openembedded-core@lists.openembedded.org
References: <1567682360-87742-1-git-send-email-changqing.li@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <51bcec91-9d6f-aa8d-1279-3a83896709ce@intel.com>
Date: Mon, 9 Sep 2019 14:02:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1567682360-87742-1-git-send-email-changqing.li@windriver.com>
Subject: Re: [PATCH] bootchart2: switch to add patch from change source in do_install
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
X-List-Received-Date: Mon, 09 Sep 2019 13:02:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/09/2019 12:19, changqing.li@windriver.com wrote:
> +           ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-bootchart2-support-usrmerge.patch','',d)} \

Conditionally applying patches is rarely a good move. Why not always 
apply this?

Ross

