Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 02D9A73A60
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 19:17:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 12 Mar 2015 12:17:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,390,1422950400"; d="scan'208";a="466471726"
Received: from urpatil-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.75.29])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Mar 2015 12:10:57 -0700
Message-ID: <5501E65D.3010107@linux.intel.com>
Date: Thu, 12 Mar 2015 12:17:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <1425491208-7670-1-git-send-email-sgw@linux.intel.com>
	<55012FB3.2030404@windriver.com>
In-Reply-To: <55012FB3.2030404@windriver.com>
Subject: Re: [PATCH] openssl: Upgrade to 1.0.2
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
X-List-Received-Date: Thu, 12 Mar 2015 19:17:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2015 11:18 PM, Robert Yang wrote:
>
> I met this error when building openflow in meta-networking, I guess it
> maybe
> related to the upgraded:
>
> x86_64-wrs-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
> --sysroot=/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64
> -Wstrict-prototypes  -O2 -pipe -g -feliminate-unused-debug-types -Wall
> -Wno-sign-compare -Wpointer-arith -Wdeclaration-after-statement
> -Wformat-security -Wswitch-enum -Wunused-parameter -Wstrict-aliasing
> -Wbad-function-cast -Wcast-align -Wstrict-prototypes
> -Wold-style-definition -Wmissing-prototypes -Wmissing-field-initializers
> -Wno-override-init -export-dynamic -Wl,-O1 -Wl,--hash-style=gnu
> -Wl,--as-needed -o secchan/ofprotocol secchan/discovery.o
> secchan/emerg-flow.o secchan/fail-open.o secchan/failover.o
> secchan/in-band.o secchan/port-watcher.o secchan/protocol-stat.o
> secchan/ratelimit.o secchan/secchan.o secchan/status.o
> secchan/stp-secchan.o lib/libopenflow.a -ldl
> -L/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64/usr/lib64
> -lssl
> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.2/ld:
> lib/libopenflow.a(vconn-ssl.o): undefined reference to symbol
> 'ERR_error_string@@OPENSSL_1.0.0'
> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64/lib64/libcrypto.so.1.0.0:
> error adding symbols: DSO missing from command line
> collect2: error: ld returned 1 exit status
>
Robert, I am not sure about this, I just verified that ERR_error_string 
is a valid symbol in libcrypto.so, maybe you nbeed to have -lcrypto in 
addition to the -lssl on the command line for building openflow? I don't 
see it explicitly and maybe that's needed.

Sau!


