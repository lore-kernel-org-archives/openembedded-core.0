Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CE8E5701F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 18:14:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6LIEbe8021727; Mon, 21 Jul 2014 19:14:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PHMfGMo49gLR; Mon, 21 Jul 2014 19:14:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6LIEWSo021723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 21 Jul 2014 19:14:34 +0100
Message-ID: <1405966466.22985.101.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ben Shelton <ben.shelton@ni.com>
Date: Mon, 21 Jul 2014 19:14:26 +0100
In-Reply-To: <1405961628-25284-4-git-send-email-ben.shelton@ni.com>
References: <1405961628-25284-1-git-send-email-ben.shelton@ni.com>
	<1405961628-25284-4-git-send-email-ben.shelton@ni.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] busybox: Allow busybox-mdev to RPROVIDES hotplug
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
X-List-Received-Date: Mon, 21 Jul 2014 18:14:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-21 at 11:53 -0500, Ben Shelton wrote:
> From: Richard Tollerton <rich.tollerton@ni.com>
> 
> This is for symmetry with udev which also RPROVIDES hotplug.
> 
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index bd66e4f..b4b9684 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -42,6 +42,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
>  
>  CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
>  CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
> +RPROVIDES_${PN}-mdev = "hotplug"
>  
>  RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"

Why add this? I'm curious what would actually use that naming?

The RPROVIDES in udev was for backwards compatibility when hotplug
actually existed iirc, its long since dead?

Cheers,

Richard



