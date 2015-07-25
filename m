Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 986EA75BD3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 16:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PG9PkJ015370; Sat, 25 Jul 2015 17:09:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 89xYRqdOuSSA; Sat, 25 Jul 2015 17:09:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PG99BS015354
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 25 Jul 2015 17:09:20 +0100
Message-ID: <1437840549.821.171.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Sat, 25 Jul 2015 17:09:09 +0100
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Sat, 25 Jul 2015 16:09:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-23 at 12:57 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Ensures that recipetool and devtool pull plugins from layers, and
> oe-selftest will pull tests from layers.
> 
> Unrelated to that, also prevents a traceback on parsing failure, and adds
> a tiny feature to appendsrc to facilitate reuse by other sub-commands.
> 
> [v3 Update] Fixed the commit message for `devtool: also load plugins from
> BBPATH` to match the implementation. Split up `recipetool: also load plugins
> from BBPATH` into two commits with clear commit messages.
> 
> [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it no longer
> breaks the devtool selftests.

I know there are some issues with oe-selftest on the autobuilder at the
moment, specifically master results in things like:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/93

however when I apply this and your other series, the autobuilder
oe-selftest does this:

https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/builds/92/steps/Running%20oe-selftest/logs/stdio

which is substantially worse. I can't immediately see what the issue is
but the two runs above pretty much bisect this down to the patch series.
I'm therefore reluctant to merge these until we can figure out what is
going on...

Cheers,

Richard


