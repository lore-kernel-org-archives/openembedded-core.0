Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E95861085
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 00:02:23 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id s1so5477066wrv.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 17:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=oAOs+HhpCvepFm2kKibsH+Tj+9AazI6+ToH/0GeYyc8=;
	b=ADxoJEeGfJk5i5lJvMqI7Wq8lf320SzyUY3sG/0INEjtI3HomchMC6go8KlV2H1jIe
	ybCDOyJysDDMQn59cwz0SVyQSMPQvvIuYS8TYnNUPJ7v5x7korA9AayeAEZt1hAjHUQ6
	xWfkTlCTztdT14sB59hBGFDDcHkvDlYFbUMEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oAOs+HhpCvepFm2kKibsH+Tj+9AazI6+ToH/0GeYyc8=;
	b=H05FuBZUM2NF9ansK13PZYzgNe5KfrUOOl8JG8vZEmuuinu4ycf7Hd8oRPC03fYQMF
	5amyFTSMvCmuhZl3dug0k0/oaz1vPvNlge7NPid3Gck/E1zIAA92PRr+Aq8ul+piap3q
	kyjUL0vcnxVQ/+L/FeLgKSx7AbprywAa3IZ3loq/ljqXRTS42p7eBIVb3SDCb54LX5Ok
	LWsqTK9vGhVZ1C+uR4VOtsVo2JiPho4moMKoWWBXRthaPdynG5KtD03o4tORdMSXGRxd
	ALIdkpQzdjDPnc1lMelLzgBrSc8JRp5vt6OLGXLKicrIZ5hDC4TvjHp2bSO1M+XP+vi5
	L8cw==
X-Gm-Message-State: ANhLgQ2LFy+FlYjnCkaTqI92rsWWcPcyVW+vkp5U17C1HX/t39W624gE
	ji9Wzh3MBVDFPdg0LIMt5WyUs83odyI=
X-Google-Smtp-Source: ADFU+vuGhRe52EB9bRGb/5eNjF6QxSH9nwojGTsXHj7Uy7O0PuhBrocZ8foda81DU+42YkhEzwkWQA==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr7100037wru.325.1584662544275; 
	Thu, 19 Mar 2020 17:02:24 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j11sm5592030wrt.14.2020.03.19.17.02.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Mar 2020 17:02:23 -0700 (PDT)
Message-ID: <4cf821be03065accd90e14237708eaf7f343b572.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 00:02:22 +0000
In-Reply-To: <20200319224450.4798-1-jpuhlman@mvista.com>
References: <20200319224450.4798-1-jpuhlman@mvista.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Subject: Re: [PATCH] qemu-system-native: disable options not included in extended tarball
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
X-List-Received-Date: Fri, 20 Mar 2020 00:02:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-03-19 at 15:44 -0700, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
> 
> * Add PACKAGECONFIG option for xkbcommon
> qemu-keymap.c:16:10: fatal error: xkbcommon/xkbcommon.h: No such file or directory
> 
> * Add PACKAGECONFIG option and patch for libudev
> commands-posix.c:53:10: fatal error: libudev.h: No such file or directory
> 
> * Add PACKAGECONFIG option for libxml2
> util/osdep.c:136: undefined reference to `fcntl64'
> 
> - Without specifying libxml2, configure searches the system and pulls in the system
>   libxml2 if it is present. In the process it adds -L/usr/lib64 which causes the
>   system libc to be linked instead of the one from the extended tarball.
> 
> * Specifically remove xkbcommon and libudev from qemu-system-native PACKAGECONFIG
> 
> None of the above libraries appear to be included in the depends for any of the qemu
> builds, so if they are getting linked in, its probably not intentionally.
> 
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  .../qemu/qemu-system-native_4.2.0.bb               |  3 +++
>  meta/recipes-devtools/qemu/qemu.inc                |  4 +++
>  .../qemu/qemu/0001-Add-enable-disable-udev.patch   | 29 ++++++++++++++++++++++
>  3 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Add-enable-disable-udev.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
> index d83ee59375..f3ceaa1003 100644
> --- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
> @@ -10,6 +10,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
>  EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
>  
>  PACKAGECONFIG ??= "fdt alsa kvm"
> +# Do not exist in buildtools-extended-tarball"
> +PACKAGECONFIG_remove = "xkbcommon"
> +PACKAGECONFIG_remove = "libudev"

I don't like this piece of the patch. Remove is generally a bad idea as
its very hard to counteract. If you did add this to PACKAGECONFIG, it
would add the appropriate -native pieces to DEPENDS so I'm not sure
what we're trying to achieve here anyway, it should work without this
remove code either way?

At the very least the comment is very misleading and will be hard to
understand in a few months time without looking back at this commit.

Cheers,

Richard


