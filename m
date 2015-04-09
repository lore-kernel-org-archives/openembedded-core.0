Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD79606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 11:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39BkJio005406; Thu, 9 Apr 2015 12:46:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VxlF0H_nBHKI; Thu,  9 Apr 2015 12:46:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39Bk2Dt005391
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Apr 2015 12:46:13 +0100
Message-ID: <1428579962.6976.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>
Date: Thu, 09 Apr 2015 12:46:02 +0100
In-Reply-To: <f59ab3d057c5535b83735ed997f9bcc39fa0b661.1428488582.git.Qi.Chen@windriver.com>
References: <cover.1428488582.git.Qi.Chen@windriver.com>
	<f59ab3d057c5535b83735ed997f9bcc39fa0b661.1428488582.git.Qi.Chen@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] kmod: upgrade to 20
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
X-List-Received-Date: Thu, 09 Apr 2015 11:46:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-08 at 18:24 +0800, Chen Qi wrote:
> The following patches are rebased.
> -- Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
> -- avoid_parallel_tests.patch
> 
> The following patch is added to solve a parallel build bug.
> -- 0001-Makefile.am-fix-parallel-build-problem.patch
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-kernel/kmod/kmod.inc                  |  5 ++--
>  ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
>  ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
>  .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
>  4 files changed, 57 insertions(+), 22 deletions(-)
>  create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch

Doesn't seem to build:

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/250/steps/BuildImages_1/logs/stdio

Cheers,

Richard


