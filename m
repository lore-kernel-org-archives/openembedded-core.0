Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 704DE60110
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Oct 2018 15:03:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9EF3B2g008739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 14 Oct 2018 16:03:13 +0100
Message-ID: <2d902e2e7fad998fdd1c22eea5c64ade52955e6a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <Randy.MacLeod@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Oct 2018 16:03:11 +0100
In-Reply-To: <20181013044051.4298-1-Randy.MacLeod@windriver.com>
References: <20181013044051.4298-1-Randy.MacLeod@windriver.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] util-linux: fix alternatives setting for switch-root
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
X-List-Received-Date: Sun, 14 Oct 2018 15:03:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-10-13 at 00:40 -0400, Randy MacLeod wrote:
> The alternative setting for switch_root belongs to the util-linux-
> switch_root
> package instead of the util-linux package. Fix this problem to avoid
> a dangling symlink:
>    /usr/bin/switch_root-> /usr/bin/switch_root.util-linux
> on target and in the sdk.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Sorry, but:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/50374/raw
https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/50423/raw

Seems to trigger on deb builds for some reason, probably package
installation order related?

Cheers,

Richard


