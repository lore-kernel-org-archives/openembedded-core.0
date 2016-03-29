Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEF1601A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 22:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TMcBGg027140; Tue, 29 Mar 2016 23:38:11 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kwo_2sr6bXrp; Tue, 29 Mar 2016 23:38:11 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2TMc6gA027137
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 29 Mar 2016 23:38:08 +0100
Message-ID: <1459291086.21672.43.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>, ross.burton@intel.com,
	mark.hatle@windriver.com
Date: Tue, 29 Mar 2016 23:38:06 +0100
In-Reply-To: <ff32532a209902db6637c34b408e77abf7a1fda6.1459147231.git.hongxu.jia@windriver.com>
References: <cover.1459147231.git.hongxu.jia@windriver.com>
	<ff32532a209902db6637c34b408e77abf7a1fda6.1459147231.git.hongxu.jia@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 03/17] conf/bitbake.conf package.bbclass: improve dbg package sources generation from work-shared
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
X-List-Received-Date: Tue, 29 Mar 2016 22:38:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 04:18 -0400, Hongxu Jia wrote:
> Previously, the dbg package could not generate sources if they
> are in work-shared dir (toolchain, kernel).
> 
> The fix add a new fdebug-prefix-map to remap work-shared dir
> and collect sources to dbg package.
> 
> [YOCTO #9305]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

I wasn't really thrilled to be reading whole files into memory with the
original patch. To start doing this twice in succession for shared work
means we really need to rethink how this is being done :(.

Its possible software may mix from shared-work and from some local
kernel module build too, not sure if/how well the code copes with that
case.

Cheers,

Richard

