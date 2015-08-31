Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C644D74197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 17:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VH3IPo003846; Mon, 31 Aug 2015 18:03:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CpzKHf1d0yuv; Mon, 31 Aug 2015 18:03:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7VH36hT003842
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 31 Aug 2015 18:03:17 +0100
Message-ID: <1441040586.26554.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 31 Aug 2015 18:03:06 +0100
In-Reply-To: <838cec7998682f102d8db694548d9eda8ddfe214.1440763946.git.alexander.kanavin@linux.intel.com>
References: <cover.1440763946.git.alexander.kanavin@linux.intel.com>
	<838cec7998682f102d8db694548d9eda8ddfe214.1440763946.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] ccache: update to 3.2.3
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
X-List-Received-Date: Mon, 31 Aug 2015 17:03:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-08-28 at 15:18 +0300, Alexander Kanavin wrote:
> The LICENSE checksum has changed because of updated copyright years.
> 
> SRC_URI has been changed to git, because upstream tarball is broken
> (includes configure.ac but not .m4 files it depends on).
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/ccache/ccache.inc       | 4 +++-
>  meta/recipes-devtools/ccache/ccache_3.1.11.bb | 7 -------
>  meta/recipes-devtools/ccache/ccache_3.2.3.bb  | 6 ++++++
>  3 files changed, 9 insertions(+), 8 deletions(-)
>  delete mode 100644 meta/recipes-devtools/ccache/ccache_3.1.11.bb
>  create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.3.bb

I suspect this resulted in:

https://autobuilder.yoctoproject.org/main/builders/nightly-rpm/builds/464/steps/BuildImages/logs/stdio

Cheers,

Richard


