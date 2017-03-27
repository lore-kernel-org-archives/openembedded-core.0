Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CDD0E60107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2RDciVG009452; 
	Mon, 27 Mar 2017 14:38:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id viMTf2TEcD3I; Mon, 27 Mar 2017 14:38:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2RDceaE009448
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Mar 2017 14:38:42 +0100
Message-ID: <1490621920.13980.265.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mariano.lopez@linux.intel.com, openembedded-core@lists.openembedded.org,
	juro.bystricky@intel.com
Date: Mon, 27 Mar 2017 14:38:40 +0100
In-Reply-To: <cover.1490392540.git.mariano.lopez@linux.intel.com>
References: <cover.1490392540.git.mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/3] oeqa/runtime: Import custom targets
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
X-List-Received-Date: Mon, 27 Mar 2017 13:38:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-24 at 15:06 -0700, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> This series allows to import custom targets to be used with runtime
> testing.
> Now is possible to have a target in <layer>/lib/oeqa/core/target and
> testimage and testexport can use such target using TEST_TARGET
> variable.
> 
> To register a custom target you just need use decorate a target class
> with
> registerTarget, and set "targetName" attribute to the name that will
> be used
> by TEST_TARGET variable.

Unfortunately something about this series break oe-selftest:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/229/st
eps/Running%20oe-selftest/logs/stdio

It doesn't do it in isolation, that test run by itself is fine. When
run as part of oe-selftest it breaks though. I did bisect it down to
this series and things have all built fine after I dropped these 3
patches.

So we'll have to figure out what is happening here...

Cheers,

Richard

