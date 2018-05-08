Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id D99AF74D44
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 11:35:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2018 04:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,378,1520924400"; d="scan'208";a="54128632"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2018 04:35:49 -0700
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-7-alexander.kanavin@linux.intel.com>
	<1525765669.3857.107.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6e9ce344-1a0f-e8c2-b718-414ba6bcd850@linux.intel.com>
Date: Tue, 8 May 2018 14:30:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1525765669.3857.107.camel@linuxfoundation.org>
Subject: Re: [PATCH 07/14] ca-certificates: update to 20180409
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
X-List-Received-Date: Tue, 08 May 2018 11:35:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/08/2018 10:47 AM, richard.purdie@linuxfoundation.org wrote:
> Something in this series, I think likely this patch causes rootfs
> generation to fail with:
> 
> ERROR: core-image-sato-1.0-r0 do_rootfs: [log_check] core-image-sato: found 1 error message in the logfile:
> [log_check] openssl:Error: 'rehash' is an invalid command.
> 
> ERROR: core-image-sato-1.0-r0 do_rootfs: Function failed: do_rootfs
> ERROR: Logfile of failure stored in: /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0-r0/temp/log.do_rootfs.23183
> 
> https://autobuilder.yocto.io/builders/nightly-arm/builds/1053/steps/BuildImages/logs/stdio

The new version of ca-certificates is using 'openssl rehash' instead of 
'c_rehash', the former is new in openssl 1.1. I moved the ca-certs 
update to openssl-1.1 branch, which is all green on the AB, and only 
needs final openssl 1.1.1 release and an upstream commitment to its LTS.


Alex

