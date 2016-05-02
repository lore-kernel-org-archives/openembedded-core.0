Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4A807731C8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:20:29 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id j8so47850583lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 01:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=k8xzeOVp9oNbBbNgmDh14PUk7nYn0lB3CyYAyPcMEuM=;
	b=wZmaRjMD6WppZKytScgi7tqfr9p5FHRPReIdWhPotcuyWpoBU1sR4cSEXjdkSaKHfh
	elavFC+5EGZOm1SffVJDxO802NU8rgdbOkdfH10/xnxAFOGMcBwHmyv+oK2hkg5kc4oX
	XazX1OSoMON/zW7iKUr9SIfMc4J5FfT5BfnDXpIuEOaskG3J6pPUcs4FPeyOQWPoxAmx
	c51JZHEirsGmVEmZS8g/IuEGH95szzBF3+RmRdvhvtK/rFgZUDm79ClVNv1Fk8yHYAMe
	LN2/WtG9WOUlGSMA/BADaIlP2gW5ZaSaY4552LkrjFq7oDa3utdAjRh/A+SCehVLxeGO
	J8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:in-reply-to:organization:user-agent;
	bh=k8xzeOVp9oNbBbNgmDh14PUk7nYn0lB3CyYAyPcMEuM=;
	b=Rd/FvOXOAPMovjFMC5G2Btn/p67w3mJfNd5M8NcXcZMEfF7X3ASDMntmUbVs/MznMQ
	9lp1B4QTbpK1OVCce4hO3nbWdAgreUXXzcmnr77i0bZlLa/RAyBQTCV+mfqi4wT+nmSR
	BgB2RqEjdS04PF0onClUtKTJPOh6EX2HLogbFswanVqj8TdD/mc4s8MDPq7ERRTDMXTY
	RCZmslXGnKTAVU9V1VW8OaRtOAaIe6UUAaABQaCztWV2XANww8+Qt/Hy7my9aVN3rIXX
	PWNR/jlhgGEVV8YJRMLuES5ocX7SLXWERLYF4IroHtp2WnJ2pKObhVC4UfPWX1nwZTO/
	jv7g==
X-Gm-Message-State: AOPr4FUMxWTjrjMNStR7rLdKUtIgXS0Php7pVXLmWvvrTPyoztoKEnPgGE/tvGHWARWu5A==
X-Received: by 10.112.135.230 with SMTP id pv6mr14247486lbb.68.1462177228350; 
	Mon, 02 May 2016 01:20:28 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-218-130-no126.business.telia.com.
	[213.64.218.130]) by smtp.gmail.com with ESMTPSA id
	up3sm3961602lbb.15.2016.05.02.01.20.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 May 2016 01:20:27 -0700 (PDT)
Date: Mon, 2 May 2016 10:20:25 +0200
From: Anders Darander <anders@chargestorm.se>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160502082025.GB3522@ad.chargestorm.se>
Mail-Followup-To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1461333082.31320.121.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1461333082.31320.121.camel@linuxfoundation.org>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Mon, 02 May 2016 08:20:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,
* Richard Purdie <richard.purdie@linuxfoundation.org> [160422 15:52]:

> When enabling extra DEBUGFS image generation with opkg, errors are seen like:

> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/opkg.conf -o /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs  --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
> Collected errors:
>  * file_md5sum_alloc: Failed to open file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/syslog-startup.conf.busybox: No such file or directory.
>  * file_md5sum_alloc: Failed to open file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/fstab: No such file or directory.

> basically for all CONFFILES in the image. This is due to the file rearranging
> the rootfs generation code does. If we preserve the /etc directory,
> the avoids the problem.

> We need to tell copyfile to preserve symlinks since some are present in /etc.

Thanks for the patch. It fixes the issue on e.g. core-image-minimal.

Unfortunately, on more complex images, we'll still fail with e.g.:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/mnt/cs-builds/anders/poky-play/build/tmp-glibc/sysroots/x86_64-linux/usr/bin/opkg -f /mnt/cs-builds/anders/poky-play/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/opkg.conf -o /mnt/cs-builds/anders/poky-play/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
Collected errors:
 * file_md5sum_alloc: Failed to open file /mnt/cs-builds/anders/poky-play/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs/usr/lib/ssl/openssl.cnf: No such file or directory.

I'd guess that all packages that have CONFFILES outside of /etc will
suffer from this...

I've updated #9490 with this info.

Cheers,
Anders
-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

