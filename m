Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F11C7061F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 12:39:25 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6HCdDLo020286; Thu, 17 Jul 2014 13:39:14 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yCBNlxU_QCI8; Thu, 17 Jul 2014 13:39:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6HCdABB020258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 17 Jul 2014 13:39:11 +0100
Message-ID: <1405600745.3668.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Thu, 17 Jul 2014 13:39:05 +0100
In-Reply-To: <53C7B7B1.8010301@communistcode.co.uk>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
	<53B66F26.5000800@communistcode.co.uk>
	<53C7AE4F.5060809@communistcode.co.uk>	<1405596838.3668.14.camel@ted>
	<53C7B5F1.1030302@communistcode.co.uk>
	<53C7B7B1.8010301@communistcode.co.uk>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Thu, 17 Jul 2014 12:39:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-17 at 12:46 +0100, Jack Mitchell wrote:
> Failed with gnutls config.log: http://ix.io/dr4

That is helpful:

configure:35748: checking for libgnutls
configure:35772: i586-oe-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse --sysroot=/home/jack/Work/oe-core.git/test-build/tmp-eglibc/sysroots/cbnlcomexpress -o conftest  -O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c /usr/lib/libgnutls.so -lz  >&5
/usr/lib/libgnutls.so: error adding symbols: File in wrong format
collect2: error: ld returned 1 exit status
configure:35772: $? = 1

So why on earth is it looking at /usr/lib/libgnutls.so?

Cheers,

Richard




