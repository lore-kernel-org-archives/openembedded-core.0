Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 588B56F7D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 17:04:14 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id k15so2575440qaq.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 10:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RxCUjc5atkIU5HAE/708h/BsRXkgOYrO/cThoFYJOWs=;
	b=O149zH8SYv7pW3pijA2KL0rR4yRc/wFAq/O7aBloZ89xbRPIglS4J/ujG4Ph427lBy
	PcnG+1R8UFBPDiKAhZxVLkCOuiGvYdERx+yZhDXPquABNJclgvBD27UhCKsovzPpoxJQ
	DFGVHcuHFzADejOL/sTOKAJLd+qZYGO+Ti9lkyjtmN2y3Y1AVUN7GvhJqOIIUM5+y6Wq
	SC7+rDO6PdtXELl21yY9vfeQxGYVRyU3P/+nhfMJOwfzoLrjyGl3PdLrfd2eAV1Xy9D1
	c69lO8LgWNhSjGo79xdtvfU/3QnpIXeM2OAZlEcsACEmZsmkVTsPaBjiMS8xf+4uTtOa
	gKqg==
X-Gm-Message-State: ALoCoQmiWCxct1f40JqaXLLCkYtYQSCjWGXoONum56Y/NX/E10KfcJYxhI82D21dqMgF8MCD0iAL
X-Received: by 10.224.160.142 with SMTP id n14mr92672012qax.17.1395853455429; 
	Wed, 26 Mar 2014 10:04:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 26 Mar 2014 10:03:55 -0700 (PDT)
In-Reply-To: <1395844085-9929-2-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1395844085-9929-1-git-send-email-lauren.post@freescale.com>
	<1395844085-9929-2-git-send-email-lauren.post@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 26 Mar 2014 17:03:55 +0000
Message-ID: <CAJTo0LaY7y=nzEJ88PxFd0xB7E8N4BSAhTsNco370U1VDQQetQ@mail.gmail.com>
To: Lauren Post <lauren.post@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] bluez4: Add virtual/bluez as provider
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
X-List-Received-Date: Wed, 26 Mar 2014 17:04:15 -0000
Content-Type: text/plain; charset=UTF-8

Surely there should also be a patch to do the same for bluez5 so the
switch can be compile-tested?

Ross

On 26 March 2014 14:27, Lauren Post <lauren.post@freescale.com> wrote:
> This will make it easier to allow bluez5 support later
> Without this change too many components depend directly on bluez4
> If these components depend on virtual/bluez then easier to upgrade.
>
> Signed-off-by: Lauren Post <lauren.post@freescale.com>
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc |    4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
> index 0827005..dce9642 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,9 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                      file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                      file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>                      file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> +
>  DEPENDS = "udev libusb dbus-glib glib-2.0 libcheck readline libsndfile1"
>  RDEPENDS_${PN}-dev = "bluez-hcidump"
>
> +PROVIDES += "virtual/bluez"
> +RPROVIDES_${PN} += "virtual/bluez"
> +
>  PACKAGECONFIG ??= "\
>      ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}\
>      ${@base_contains('DISTRO_FEATURES', 'pie', 'pie', '', d)}\
> --
> 1.7.9.5
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

