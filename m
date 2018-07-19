Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 25F64789EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:00:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6J90Y4A010989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 19 Jul 2018 10:00:35 +0100
Message-ID: <bca74cf23cb2d839b4de925f211587e1dab76f32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 10:00:34 +0100
In-Reply-To: <20180719085353.4499-1-andrej.valek@siemens.com>
References: <20180719085353.4499-1-andrej.valek@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] busybox: update to 1.29.1
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
X-List-Received-Date: Thu, 19 Jul 2018 09:00:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-19 at 10:53 +0200, Andrej Valek wrote:
>  - refresh busybox-udhcpc-no_deconfig.patch
>  - remove obsolete patches which are included in this update
>  - update defconfig
>   - squashed .cfg(s) into defconfig

I'm a little concerned about the .cfg changes.

> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...inittab_1.27.2.bb => busybox-inittab_1.29.1.bb} |   0
>  .../busybox/busybox/CVE-2011-5325.patch            | 481 ---------
> ------------
>  .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
>  .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
>  .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  50 ++-
>  meta/recipes-core/busybox/busybox/defconfig        | 292 +++++++--
> ----
>  meta/recipes-core/busybox/busybox/getopts.cfg      |   3 -
>  .../busybox/busybox/login-utilities.cfg            |  13 -
>  .../busybox/busybox/mount-via-label.cfg            |   9 -
>  meta/recipes-core/busybox/busybox/resize.cfg       |   2 -
>  meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 -
>  meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 -
>  meta/recipes-core/busybox/busybox/syslog.cfg       |  11 -
>  .../busybox/busybox/umount-ignore-c.patch          |  40 --
>  .../{busybox_1.27.2.bb => busybox_1.29.1.bb}       |  16 +-

Some of the .cfg merges are probably ok but I would like the see syslog
and login-utilities maintained as they allow people to disable groups
of config which can be interchanged with other recipes for varying
setups, just by changing SRC_URI. I'd imagine most of these were added
for some reason but those two stand out in particular. The mount-via-
label may have been for size concerns?

Cheers,

Richard


