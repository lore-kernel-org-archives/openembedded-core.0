Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4F662136
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMMsh1022115; Mon, 28 Mar 2016 23:23:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NMfVaKnpGkkq; Mon, 28 Mar 2016 23:23:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMNRqY022163
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2016 23:23:28 +0100
Message-ID: <1459203807.21672.10.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 23:23:27 +0100
In-Reply-To: <1458737525-32487-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1458737525-32487-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] make, remake: make them properly exclude each other
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
X-List-Received-Date: Mon, 28 Mar 2016 22:23:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-03-23 at 14:52 +0200, Alexander Kanavin wrote:
> Remake and make can't be installed at the same time as they're both
> installing
> a header file with the same name.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/default-providers.inc     | 3 ++-
>  meta/recipes-devtools/make/make.inc                | 2 ++
>  meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb | 2 +-
>  3 files changed, 5 insertions(+), 2 deletions(-)

This change broke one of the selftests. In the interests of expedience,
I fixed it:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f81065f5b2313fc4d9
67c0144b90838f33e6ff60

Cheers,

Richard

