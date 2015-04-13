Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 513BE6AC24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 01:53:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3D1rFgU029604
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 18:53:15 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Sun, 12 Apr 2015 18:53:18 -0700
Message-ID: <552B218C.7020208@windriver.com>
Date: Mon, 13 Apr 2015 09:53:16 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1428889561.git.Qi.Chen@windriver.com>
In-Reply-To: <cover.1428889561.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.236]
Subject: Re: [PATCH V2 0/6] Package upgrades
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
X-List-Received-Date: Mon, 13 Apr 2015 01:53:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Please ignore this one.
I just noticed five of the patches have been merged.
I'll send out the patch for kmod.

Regards,
Chen Qi

On 04/13/2015 09:48 AM, Chen Qi wrote:
> Changes in V2:
> Remove the ptest part of kmod.
>
> The following changes since commit 6333186e9764b2c269a2b3869956860fa8fde2b1:
>
>    binutils: Fix packaging now gold is always built (2015-04-08 23:10:57 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib ChenQi/package-upgrades-20140413
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/package-upgrades-20140413
>
> Chen Qi (6):
>    curl: upgrade to 7.41.0
>    busybox: upgrade to 1.23.2
>    kmod: upgrade to 20
>    sudo: upgrade to 1.8.13
>    sysstat: upgrade to 11.1.3
>    xz: upgrade to 5.2.1
>
>   .../{busybox_1.23.1.bb => busybox_1.23.2.bb}       |  4 +--
>   meta/recipes-core/busybox/busybox_git.bb           |  4 +--
>   meta/recipes-extended/sudo/sudo.inc                | 12 +++------
>   .../sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb}      |  4 +--
>   .../{sysstat_11.0.2.bb => sysstat_11.1.3.bb}       |  4 +--
>   .../xz/{xz_5.2.0.bb => xz_5.2.1.bb}                |  4 +--
>   meta/recipes-kernel/kmod/kmod.inc                  |  8 +++---
>   ...01-Makefile.am-fix-parallel-build-problem.patch | 29 +++++++++++++++++++++
>   ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 15 +++++------
>   .../kmod/kmod/avoid_parallel_tests.patch           | 30 ++++++++++++++--------
>   meta/recipes-kernel/kmod/kmod_git.bb               | 15 -----------
>   .../curl/{curl_7.40.0.bb => curl_7.41.0.bb}        |  4 +--
>   12 files changed, 72 insertions(+), 61 deletions(-)
>   rename meta/recipes-core/busybox/{busybox_1.23.1.bb => busybox_1.23.2.bb} (90%)
>   rename meta/recipes-extended/sudo/{sudo_1.8.11p2.bb => sudo_1.8.13.bb} (87%)
>   rename meta/recipes-extended/sysstat/{sysstat_11.0.2.bb => sysstat_11.1.3.bb} (40%)
>   rename meta/recipes-extended/xz/{xz_5.2.0.bb => xz_5.2.1.bb} (92%)
>   create mode 100644 meta/recipes-kernel/kmod/kmod/0001-Makefile.am-fix-parallel-build-problem.patch
>   rename meta/recipes-support/curl/{curl_7.40.0.bb => curl_7.41.0.bb} (93%)
>


