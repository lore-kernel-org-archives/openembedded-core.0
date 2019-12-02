Return-Path: <ross.burton@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5E772EB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 14:55:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Dec 2019 06:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,268,1571727600"; d="scan'208";a="213070272"
Received: from aguttman-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.249.33.85])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2019 06:55:07 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
	<20191129131152.128311-2-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <33182b29-de6e-f918-2915-df016b854e81@intel.com>
Date: Mon, 2 Dec 2019 14:55:06 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129131152.128311-2-alex.kanavin@gmail.com>
Subject: Re: [PATCH 02/15] libdnf: upgrade 0.28.1 -> 0.38.1
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
X-List-Received-Date: Mon, 02 Dec 2019 14:55:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

FAILED: libdnf/CMakeFiles/libdnf.dir/dnf-context.cpp.o
/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2618:8: 
error: ‘atomic_flag’ in namespace ‘std’ does not name a type
  static std::atomic_flag cfgMainLoaded = ATOMIC_FLAG_INIT;
         ^
/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp: 
In function ‘libdnf::ConfigMain& libdnf::getGlobalMainConfig()’:
/home/pokybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-linux/libdnf-native/0.38.1-r0/git/libdnf/dnf-context.cpp:2622:10: 
error: ‘cfgMainLoaded’ was not declared in this scope
      if (!cfgMainLoaded.test_and_set()) {
           ^
This was on a Centos 7 worker...

Ross

