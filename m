Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7F4BD7CE5E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 11:02:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2019 03:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="228574901"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2019 03:02:18 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-20-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ca5b077a-b7a5-f443-fdee-0951eb29b35b@intel.com>
Date: Fri, 20 Dec 2019 11:02:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218143758.129308-20-alex.kanavin@gmail.com>
Subject: Re: [PATCH 20/25] ltp: update to 20190930
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
X-List-Received-Date: Fri, 20 Dec 2019 11:02:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

http://errors.yoctoproject.org/Errors/Details/299060/:

TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: 
/tmp/ccGG6bI5.o: in function `main':
/usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfaces/pthread_mutexattr_getprioceiling/1-2.c:57: 
undefined reference to `pthread_mutexattr_getprioceiling'
TOPDIR/tmp/work/core2-64-poky-linux-musl/ltp/20190930-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: 
/usr/src/debug/ltp/20190930-r0/git/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling/../../../conformance/interfaces/pthread_mutexattr_getprioceiling/1-2.c:51: 
undefined reference to `pthread_mutexattr_setprioceiling'
collect2: error: ld returned 1 exit status

Ross

