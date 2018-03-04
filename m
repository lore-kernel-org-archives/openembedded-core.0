Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5F97478883
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 17:26:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w24HPP9T022935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Mar 2018 17:25:27 GMT
Message-ID: <1520184325.3436.74.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Sun, 04 Mar 2018 17:25:25 +0000
In-Reply-To: <1520041611-39622-1-git-send-email-denis@denix.org>
References: <1520041611-39622-1-git-send-email-denis@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 1/2] busybox: separate inittab into own package, due to SERIAL_CONSOLES being machine-specific
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
X-List-Received-Date: Sun, 04 Mar 2018 17:26:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2018-03-02 at 20:46 -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> * Create busybox-inittab recipe to produce machine-specific package
> with /etc/inittab
>   and necessary getty calls for a machine, based on SERIAL_CONSOLES,
> similar to how
>   sysvinit-inittab was done
> 
> * Since CONFIG_FEATURE_USE_INITTAB is controlled by VIRTUAL-
> RUNTIME_init_manager, make
>   main busybox package RDEPENDS on busybox-inittab when init_manager
> is set to busybox
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/busybox/busybox-inittab_1.27.2.bb | 32
> ++++++++++++++++++++++
>  meta/recipes-core/busybox/busybox.inc              | 12 ++------
>  2 files changed, 34 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox-
> inittab_1.27.2.bb


Can you send a patch to fix:

https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds/878/steps/Running%20oe-selftest/logs/stdio

i.e. 

oe-selftest -r distrodata.Distrodata.test_maintainers

please? (missing maintainers entry for busybox-inittab)

Cheers,

Richard

