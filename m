Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 41C7D701D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 10:24:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6SAO1ds032132; Mon, 28 Jul 2014 11:24:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VQFOHRcKbWCX; Mon, 28 Jul 2014 11:24:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6SANtA7031804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 28 Jul 2014 11:23:56 +0100
Message-ID: <1406543035.13346.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David Vincent <freesilicon@gmail.com>
Date: Mon, 28 Jul 2014 11:23:55 +0100
In-Reply-To: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 10:24:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-28 at 11:55 +0200, David Vincent wrote:
> barebox (formerly known as u-boot-v2) is a bootloader that inherits the
> best of U-Boot and the Linux kernel. This commit adds the possibility to
> use it as a virtual/bootloader instead of U-Boot.
> 
> Signed-off-by: David Vincent <freesilicon@gmail.com>
> ---
>  meta/recipes-bsp/barebox/barebox.inc          |   73 +++++++++++++++++++++++++
>  meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>  create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb

I have to admit I don't know a lot about this. To make it into OE-Core
we need some kind of story about why its necessary and commonly used.
Are there a number of BSPs using this? Can you give some background to
why this is needed?

Cheers,

Richard


