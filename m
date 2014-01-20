Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 774D76CCF4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:06:24 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so2469071eek.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 00:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:date:message-id:in-reply-to:references:user-agent:subject
	:mime-version:content-type:content-transfer-encoding;
	bh=4aCNrT0HAeRp731GYDYCVgq+Te24eqHZtd4jjyWrzhg=;
	b=A7UHYfU4NJS44YMKeMReCTFnWL43OpvhrizVw2PfxtAT4y29U2sANvvUYaIfe5qOzC
	d/CCURT4vLijdE6dLYV13BATAHMHOYYHrcoLc4UajQuP7lKTeQbEQXW/Sj4jG+L5vUpi
	/cRLp89oJgPmcyx62VNXegcwLd0nVfXfmHhHlAa+jmrphWvnZiXFeRLITHjG/RMlLE1v
	KYO5Zuh3ZigJyoO9Zx4EmQl43gMcCxpLRqyIpr0PbFcO7CpPhazNMrXsLbg7AfbkxN52
	dg4TRkEsc+NW6vzthr4s9tfJc8NF1q4BD59QVA5WlBD11kTAKVSt+ZClwdtLN/CSYvN8
	4ePA==
X-Received: by 10.14.109.137 with SMTP id s9mr13359544eeg.6.1390205184559;
	Mon, 20 Jan 2014 00:06:24 -0800 (PST)
Received: from [46.206.172.200] (046206172200.atmpu0022.highway.a1.net.
	[46.206.172.200])
	by mx.google.com with ESMTPSA id b41sm758040eef.16.2014.01.20.00.06.23
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 00:06:23 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 09:06:28 +0100
Message-ID: <143aeafa800.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
References: <cover.1390184362.git.Qi.Chen@windriver.com>
	<a023434c6cc916907f190acd62af34ea5a6eaca0.1390184362.git.Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Subject: Re: [PATCH V3 1/5] systemd: add 'less' to its RRECOMMENDS
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
X-List-Received-Date: Mon, 20 Jan 2014 08:06:24 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 20 January 2014 03:23:02 Chen Qi <Qi.Chen@windriver.com> wrote:

> The less command provided by busybox cannot interpret the control
> character, resulting in obscure output of the journalctl command
> in a systemd based image.

Can you send me the input containing this control character, please?

Perhaps we can do something sensible about it..
TIA,
>
> Add the 'less' package to systemd's RRECOMMENDS so that the output
> of 'journalctl' looks clear to users.
>
> [YOCTO #5723]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/systemd/systemd_208.bb |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_208.bb 
> b/meta/recipes-core/systemd/systemd_208.bb
> index 6590235..3c44dec 100644
> --- a/meta/recipes-core/systemd/systemd_208.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -219,10 +219,12 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la 
> ${datadir}/dbus-1/interfaces/ $
>
>  RDEPENDS_${PN} += "kmod dbus util-linux-mount"
>
> +# Recommend the less package to correctly display the contents of 'journalctl'
>  RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
>                        util-linux-agetty \
>                        util-linux-fsck e2fsprogs-e2fsck \
>                        kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
> +                      less \
>  "
>
>  PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



Sent with AquaMail for Android
http://www.aqua-mail.com



