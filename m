Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F40E460721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 07:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T78HYF008300; Fri, 29 Jul 2016 08:08:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AxZ91JwrpyUJ; Fri, 29 Jul 2016 08:08:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6T78FjH008297
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 Jul 2016 08:08:16 +0100
Message-ID: <1469776095.9142.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 08:08:15 +0100
In-Reply-To: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
References: <1469659242-12350-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/5] Fixes for busybox-syslog with systemd
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
X-List-Received-Date: Fri, 29 Jul 2016 07:08:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-07-27 at 17:40 -0500, Aníbal Limón wrote:
> Changes can be reviewed at,
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=alimon/simple_patches
> 
> Aníbal Limón (5):
>   oeqa/runtime/syslog.py: Improve test_syslog_logger
>   busybox-syslog.default: When systemd is enabled don't use circular
>     buffer
>   classes/testimage: When image is systemd, enable debug log level
>   oeqa/runtime/syslog: test_syslog_logger Don't try to use logread when
>     systemd is enabled
>   oeqa/utils/commands.py: Command class improve validations/decoding in
>     output
> 
>  meta/classes/testimage.bbclass                         | 5 ++++-
>  meta/lib/oeqa/runtime/syslog.py                        | 9 +++++++--
>  meta/lib/oeqa/utils/commands.py                        | 5 ++++-
>  meta/recipes-core/busybox/files/busybox-syslog.default | 2 +-
>  4 files changed, 16 insertions(+), 5 deletions(-)

We did see:

https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/b
uilds/867/steps/Running%20Sanity%20Tests/logs/stdio

which means we're probably still missing a tweak in this series?

Cheers,

Richard


