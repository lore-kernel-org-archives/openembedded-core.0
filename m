Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4E7771DEF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v35DX2dn004475; 
	Wed, 5 Apr 2017 14:33:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8CmQsEgkbgib; Wed,  5 Apr 2017 14:33:24 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v35DLEGZ003541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 14:21:15 +0100
Message-ID: <1491398474.17200.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 05 Apr 2017 14:21:14 +0100
In-Reply-To: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
References: <1491395972-25386-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu arm/x86: drop linux-yocto preferred version
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
X-List-Received-Date: Wed, 05 Apr 2017 13:33:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 08:39 -0400, Bruce Ashfield wrote:
> We don't make a linux-yocto version available unless it boots
> on all qemu targets, hence there is no reason to specify a
> specific version .. the latest is always fine.
> 
> Also, the other qemu machines don't have this specification, so
> this makes x86 and ARM consistent.
> 
> 
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
> index f9d6dd7e364e..b9b640f974f3 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -16,5 +16,4 @@ QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
>  # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
>  QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
> -PREFERRED_VERSION_linux-yocto ??= "4.8%"
>  QB_DTB = "${@base_version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"

Note the line below the line you're removing here. This is why we need
this one...

Cheers,

Richard

