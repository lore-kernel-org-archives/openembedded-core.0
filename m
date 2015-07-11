Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C96A9737F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jul 2015 22:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6BMgIoe006399; Sat, 11 Jul 2015 23:42:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id u10Wg3QBh_3T; Sat, 11 Jul 2015 23:42:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6BMg2KV006396
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Jul 2015 23:42:13 +0100
Message-ID: <1436654522.3310.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Date: Sat, 11 Jul 2015 23:42:02 +0100
In-Reply-To: <1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <cover.1436195315.git.tanu.kaskinen@linux.intel.com>
	<1436428717.9778.33.camel@linuxfoundation.org>
	<1436429491.23019.21.camel@tkkaskin-mobl3.ger.corp.intel.com>
	<1436438943.23019.26.camel@tkkaskin-mobl3.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] speex, speexdsp: 1.2rc1 -> 1.2rc2/1.2rc3
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
X-List-Received-Date: Sat, 11 Jul 2015 22:42:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-09 at 13:49 +0300, Tanu Kaskinen wrote:
> I sent now v2 of the patches, which should fix the alsa-plugins build
> failures.

Thanks, those do indeed seem resolved.

> The libspeexdsp-dev problem is more difficult, and I don't really know
> how to debug it further. The error message was:
> 
> error: Can't install pulseaudio-dev-6.0-r0@core2_32: no package provides libspeexdsp-dev
> 
> However, "bitbake speexdsp" seems to generate the libspeexdsp-dev
> package just fine (libspeexdsp-dev_1.2rc3-r0_core2-64.ipk appears in the
> deploy directory).

Oddly enough, it happened again with the new patches:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/389/steps/BuildImages_1/logs/stdio

It only seems to happen on x86-lsb, not any other architecture. Why? No
idea as yet :/.

Cheers,

Richard


