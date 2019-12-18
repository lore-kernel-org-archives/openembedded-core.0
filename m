Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 389B66011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:31:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 12:31:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="205959678"
Received: from aeinmue1-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.35.131])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2019 12:31:08 -0800
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	openembedded-core@lists.openembedded.org
References: <20191203220624.26500-1-anibal.limon@linaro.org>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <38e38eff-b81c-5e51-5397-213d970cca2d@intel.com>
Date: Wed, 18 Dec 2019 20:31:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191203220624.26500-1-anibal.limon@linaro.org>
Subject: Re: [PATCH] meta/classes/meson.bbclass: Add inherit setuptools3
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
X-List-Received-Date: Wed, 18 Dec 2019 20:31:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 03/12/2019 22:06, Aníbal Limón wrote:
> Fixes,
> 
> ...
> | Program python3 found: YES (/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
> |
> | meson.build:36:0: ERROR: <ExternalProgram 'python3' -> ['/home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
> |
> | A full log can be found at /home/anibal.limon/linaro/oe-rpb-master/build-410c/tmp-rpb-glibc/work/aarch64-linaro-linux/waffle/1.6.0-r0/build/meson-logs/meson-log.txt
> | WARNING: exit code 1 from a shell command.

Going back to this...

Without this patch I get a different result:

Program python3 found: YES 
(/data/poky-tmp/master/work/corei7-64-poky-linux/waffle/1.6.0-r0/recipe-sysroot-native/usr/bin/python3-native/python3)
Run-time dependency threads found: YES
[ continues fine ]

So what is the meson-log.txt saying?

Ross

