Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 60CE460720
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 10:21:30 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0SALUB2022879
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 28 Jan 2018 10:21:31 GMT
Message-ID: <1517134890.3090.0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Schultz <d.schultz@phytec.de>,
	Openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 10:21:30 +0000
In-Reply-To: <1516984865-2976-1-git-send-email-d.schultz@phytec.de>
References: <1516984865-2976-1-git-send-email-d.schultz@phytec.de>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] cryptodev: Fix build errors with v4.11
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
X-List-Received-Date: Sun, 28 Jan 2018 10:21:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-01-26 at 17:41 +0100, Daniel Schultz wrote:
> Commit message from the included patch:
> "Linux kernel has added -Werror=designated-init around 4.11
> (c834f0e8a8b)
> triggering build errors with gcc 5 and 6 (but not with gcc 4)"
> 
> Backport from https://github.com/cryptodev-linux/cryptodev-linux
> Based on commit f0d69774afb27ffc62bf353465fba145e70cb85a
> 
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> Acked-by: California Sullivan <california.l.sullivan@intel.com>
> ---
>  .../cryptodev/cryptodev-module_1.9.bb              |  1 +
>  .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49
> ++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-
> Fix-build-with-linux-4.13.patch

This merged 10 days ago:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=1e5e38f1e7f09dd12a24e62142da747c760ce0c3

?

Cheers,

Richrd

