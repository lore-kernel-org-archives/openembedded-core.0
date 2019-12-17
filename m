Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AC82B7FD3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 15:57:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 07:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="221787577"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2019 07:57:11 -0800
To: Daisuke Yamane <yamane07ynct@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1575988313-2868-1-git-send-email-yamane07ynct@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6f603eda-0c10-5cc1-ddeb-c1f23da9596a@intel.com>
Date: Tue, 17 Dec 2019 15:57:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575988313-2868-1-git-send-email-yamane07ynct@gmail.com>
Subject: Re: [PATCH] u-boot: Move B from u-boot.inc to u-boot-common.inc
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
X-List-Received-Date: Tue, 17 Dec 2019 15:57:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/12/2019 14:31, Daisuke Yamane wrote:
> Use the same value of B between u-boot and u-boot-fw-utils.
> This patch also enable the out-of-tree builds of u-boot-fw-utils actually.

Breaks the build here:

u-boot-fw-utils:

   cp 
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/qemux86_64-poky-linux/u-boot-fw-utils/1_2020.01~rc3-r0/git/include/version.h 
tools/version.h
cp: cannot create regular file 'tools/version.h': No such file or directory


u-boot-tools:

  DEBUG: Executing shell function do_compile
| NOTE: make -j 16 [...] sandbox_defconfig
| make: *** No rule to make target 'sandbox_defconfig'.  Stop.

Ross

