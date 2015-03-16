Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D5C2B6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 06:21:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2G6LwRq000461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 15 Mar 2015 23:21:58 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 15 Mar 2015 23:21:57 -0700
Message-ID: <55067684.7080409@windriver.com>
Date: Mon, 16 Mar 2015 14:21:56 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1425491208-7670-1-git-send-email-sgw@linux.intel.com>
	<55012FB3.2030404@windriver.com> <5501E65D.3010107@linux.intel.com>
In-Reply-To: <5501E65D.3010107@linux.intel.com>
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
X-List-Received-Date: Mon, 16 Mar 2015 06:22:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2015 03:17 AM, Saul Wold wrote:
> On 03/11/2015 11:18 PM, Robert Yang wrote:
>>
>> I met this error when building openflow in meta-networking, I guess it
>> maybe
>> related to the upgraded:
>>
>> x86_64-wrs-linux-gcc  -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse
>> --sysroot=/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64
>> -Wstrict-prototypes  -O2 -pipe -g -feliminate-unused-debug-types -Wall
>> -Wno-sign-compare -Wpointer-arith -Wdeclaration-after-statement
>> -Wformat-security -Wswitch-enum -Wunused-parameter -Wstrict-aliasing
>> -Wbad-function-cast -Wcast-align -Wstrict-prototypes
>> -Wold-style-definition -Wmissing-prototypes -Wmissing-field-initializers
>> -Wno-override-init -export-dynamic -Wl,-O1 -Wl,--hash-style=gnu
>> -Wl,--as-needed -o secchan/ofprotocol secchan/discovery.o
>> secchan/emerg-flow.o secchan/fail-open.o secchan/failover.o
>> secchan/in-band.o secchan/port-watcher.o secchan/protocol-stat.o
>> secchan/ratelimit.o secchan/secchan.o secchan/status.o
>> secchan/stp-secchan.o lib/libopenflow.a -ldl
>> -L/buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64/usr/lib64
>>
>> -lssl
>> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.2/ld:
>>
>> lib/libopenflow.a(vconn-ssl.o): undefined reference to symbol
>> 'ERR_error_string@@OPENSSL_1.0.0'
>> /buildarea/lyang1/test_qemux86-64/bitbake_build/tmp/sysroots/qemux86-64/lib64/libcrypto.so.1.0.0:
>>
>> error adding symbols: DSO missing from command line
>> collect2: error: ld returned 1 exit status
>>
> Robert, I am not sure about this, I just verified that ERR_error_string is a
> valid symbol in libcrypto.so, maybe you nbeed to have -lcrypto in addition to
> the -lssl on the command line for building openflow? I don't see it explicitly
> and maybe that's needed.

Yes, add -lcrypto works.

// Robert

>
> Sau!
>
>
>

