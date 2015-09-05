Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 404C477055
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Sep 2015 05:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t855OTEw003557; Sat, 5 Sep 2015 06:24:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RZq1gUU0c2pY; Sat,  5 Sep 2015 06:24:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t855OEYO003553
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 5 Sep 2015 06:24:26 +0100
Message-ID: <1441430654.24871.202.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sat, 05 Sep 2015 06:24:14 +0100
In-Reply-To: <4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
References: <cover.1441299182.git.raj.khem@gmail.com>
	<4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: Use UTMPX instead of legacy UTMP
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
X-List-Received-Date: Sat, 05 Sep 2015 05:24:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 16:54 +0000, Khem Raj wrote:
> This makes busybox honor UTMPX feature if available in a libc
> 
> [YOCTO #8243]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 +++++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
>  2 files changed, 389 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch

This breaks poky-tiny.

https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/490/steps/BuildImages/logs/stdio

Cheers,

Richard


