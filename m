Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A5B6470331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 12:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4QC3bo2001327; Tue, 26 May 2015 13:03:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Mz8Hwzq4Xpww; Tue, 26 May 2015 13:03:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4QC3N6r001324
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 May 2015 13:03:34 +0100
Message-ID: <1432641803.404.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rongqing.li@windriver.com
Date: Tue, 26 May 2015 13:03:23 +0100
In-Reply-To: <1432530114-18270-1-git-send-email-rongqing.li@windriver.com>
References: <1432530114-18270-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] apt: upgrade to 1.0.9.9
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
X-List-Received-Date: Tue, 26 May 2015 12:03:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-25 at 13:01 +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> 1. Upgrade to fix the several CVEs: CVE-2014-0488, CVE-2014-0490
> 2. Remove apt-0.9.9.4-CVE-2014-0478.patch, which was backport.
> 3. Romve no-ko-translation.patch, apt-1.0.9.9 has ko translation
> 4. Update use-host.patch no-curl.patch db_linking_hack.patch and
> noconfigure.patch
> 5. Not build the test cases since it requires gtest
> 6. install libapt-private.so.* to libdir, otherwise this file is
> not installed into sysroot for native, and apt-get will use host's,
> and lead to fail
> 7. Revert apt commit[a2a75ff45]"always run 'dpkg --configure -a'
> at the end of our dpkg callings" for native package, otherwise
> the postscript for these installed packages will be run, and fail
> since the rootfs dir is not considered
> 8. Add lzma dependency by PACKAGECONFIG for target, and add xz
> dependency for native
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>

This appears to have issues on centos6 and apt-native, at a guess due to
the compiler flags used:

https://autobuilder.yoctoproject.org/main/builders/nightly/builds/342/steps/BuildImages_1/logs/stdio

Cheers,

Richard


