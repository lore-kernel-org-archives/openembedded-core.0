Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA34578EA3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:29:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5A8TEe6014349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 10 Jun 2018 09:29:15 +0100
Message-ID: <56788cd154d9af0b6c9ea2ef78de23b1909fd7ee.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 10 Jun 2018 09:29:14 +0100
In-Reply-To: <1528545558-5533-1-git-send-email-devarsht@xilinx.com>
References: <1528545558-5533-1-git-send-email-devarsht@xilinx.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: maulikd@xilinx.com, varunkum@xilinx.com, JAEWON@xilinx.com,
	Devarsh Thakkar <devarsht@xilinx.com>
Subject: Re: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Sun, 10 Jun 2018 08:29:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-06-09 at 04:59 -0700, Devarsh Thakkar wrote:
> Pull in change which adds support for command line
> options (-e and --command) which can be used for
> launching programs or running commands in matchbox-terminal
> via command line.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> ---
>  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-
> terminal_0.1.bb b/meta/recipes-sato/matchbox-terminal/matchbox-
> terminal_0.1.bb
> index 4488191..b7fbee7 100644
> --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> @@ -10,7 +10,7 @@ DEPENDS = "gtk+3 vte"
>  SECTION = "x11/utils"
> 
>  #SRCREV tagged 0.1

I'm guessing the above comment is no longer valid, nor is the value of
PV?

> -SRCREV = "3ad357db2302760b8a8817b5f4478dd87479442f"
> +SRCREV = "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
>  SRC_URI = "git://git.yoctoproject.org/${BPN}"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
> 

Cheers,

Richard

