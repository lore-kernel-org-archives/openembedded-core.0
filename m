Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 388EF65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 07:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7H7RoLH023159; Mon, 17 Aug 2015 08:29:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id crDoNFgqDJbU; Mon, 17 Aug 2015 08:29:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7H7TMI4023168
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2015 08:29:33 +0100
Message-ID: <1439796562.1218.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 17 Aug 2015 08:29:22 +0100
In-Reply-To: <6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
	<6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] nfs-utils: Upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Mon, 17 Aug 2015 07:29:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-11 at 22:13 +0300, Jussi Kukkonen wrote:
> Let "--enable-tirpc" be selected in configure by default: it is
> a requirement for ipv6 support. This should not grow a typical
> image size as libtirpc is a rpcbind dependency already.
> 
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb}           | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb} (95%)

It appears this is the patch which has been causing boot issues in the
runtime sanity tests on the autobuilder, e.g.:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-logrotate/builds/434/steps/Running%20Sanity%20Tests/logs/stdio

Since backing this patch out, these failures stopped so there seems to
be some kind of relation...

Cheers,

Richard


