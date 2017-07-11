Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id E02FA77EA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:29:22 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id v202so56537883itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NUhVIWvPTcuuL1le0Vn1wkCBBlDXdTiBlUppdPc+kbQ=;
	b=ykl8Hu4d47DkGt7omd8bJ4H9UxsMPNJqcn9wYLLy9y8R02J73rH2vo5huoSiWTJB3W
	tZ+eZgwAO5wocHVrTpRjyt8PRJNXvthAkobfkeuCP1LyCRZilTuaH3oBEESfOKi2AuCj
	pxNlUNfra7NZKvX8968ri0lFHlKFyGblOFIK0LwhFtEN7jt5TcYO6OgCUZMn+XnjHjOi
	AUJJmZELpLx4/1uQbqXcHOPYsa2dIegR6y3i7S3Zt20WR9rXsWxpNytu172Naqwi+xkU
	8VOs5kbaABqZ1WOBgc8LSE/ll99XODZlWXt9sK6kmPlWVfcPY2ZrHowxJgCFBlQiTkr4
	oEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NUhVIWvPTcuuL1le0Vn1wkCBBlDXdTiBlUppdPc+kbQ=;
	b=FcKRrB9PtKM51OSU+o5Dyqfyf0eeTAKvy0PYm/jkKnFKKXqbbm6lWalfmjCkmouemv
	JQbw115KPX5hIcLfM1Ww9d5G9Dfu2DxeYsHxlP3Ih2liTZtV8S0QKo+5kZaVFioYNGXe
	m5PAYJYsSHjjEB+L+OeHoHVLdS+cAtusFphe5e0YxRE4ytNKgWThrboKC4YgiGlQeHhm
	kXq2UdZaxnWNj4ayD3fxyQwTw7YXcHpBGZyZBB7HOWA6rFO0ZJ/qy3qn6uVmwcXLApH+
	ZNKo+8qDBjriCkcmEE5YjqcEJVKwnwReZFMAf23KHI7TCfXgi9BDFwppB5OYIXzeAnlD
	7BrQ==
X-Gm-Message-State: AIVw110fXSZAEaEfJHiFzRhVoPHl1wCcTYzT8AMQ/HjO9NImZz9Gn2fn
	og8nDNKBFe4bo9qf
X-Received: by 10.36.248.132 with SMTP id a126mr2459833ith.0.1499761763722;
	Tue, 11 Jul 2017 01:29:23 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8ECE7.dip0.t-ipconnect.de. [93.232.236.231])
	by smtp.gmail.com with ESMTPSA id m77sm514558itg.31.2017.07.11.01.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 01:29:22 -0700 (PDT)
Message-ID: <1499761760.20211.97.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Tue, 11 Jul 2017 10:29:20 +0200
In-Reply-To: <c1ab5f6f84e705b6d17e1aa7b03a2cc0aa0cdcf4.1499326977.git.ed.bartosh@linux.intel.com>
References: <cover.1499326977.git.ed.bartosh@linux.intel.com>
	<c1ab5f6f84e705b6d17e1aa7b03a2cc0aa0cdcf4.1499326977.git.ed.bartosh@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] image_types_wic: set default WKS_FILE_DEPENDS
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
X-List-Received-Date: Tue, 11 Jul 2017 08:29:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-07-06 at 10:56 +0300, Ed Bartosh wrote:
> diff --git a/meta/classes/image_types_wic.bbclass
> b/meta/classes/image_types_wic.bbclass
> index 05ee68d..e9750b5 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -40,7 +40,10 @@ USING_WIC =
> "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s
>  WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
>  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
>  do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot'
> % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
> -WKS_FILE_DEPENDS ??= ''
> +WKS_FILE_DEPENDS ??= 'syslinux-native bmap-tools-native
> cdrtools-native btrfs-tools-native squashfs-tools-native'
> +WKS_FILE_DEPENDS_append_x86 = " syslinux grub-efi systemd-boot"
> +WKS_FILE_DEPENDS_append_x86-64 = " syslinux grub-efi systemd-boot"
> +

Using _append here adds these additional dependencies even when
WKS_FILE_DEPENDS has been set explicitly. How about this:

WKS_FILE_DEPENDS_DEFAULT = "syslinux-native bmap-tools-native
cdrtools-native btrfs-tools-native squashfs-tools-native"
WKS_FILE_DEPENDS_BOOTLOADERS = ""
WKS_FILE_DEPENDS_BOOTLOADERS_x86 = "syslinux grub-efi systemd-boot"
WKS_FILE_DEPENDS_BOOTLOADERS_x86-64 = "syslinux grub-efi systemd-boot"

WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS}"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




