Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B42C060268
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 15:34:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so8297619pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 07:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=qG7bpwJHpwhPg7icrWE2G0PRkrQ5rX3GYcPyqJ6ODsA=;
	b=lHBJgrMb3HSlSM/DrqBE1WJZEXKA82RnpwzLY4VIe+dL88KbTpJLG+7o9JHUSwxPkk
	W5GiJlCh/OCdyESQGIsA1A0lU2g82MkoCKmSVNaUJ6DWMuHkVYzTR5BUO/lUxgxO1+kW
	cnGy2T4FHJOrNqzNUr4iEbLZb8iCtGzg3RFDMEHgsNgakM7LbtlOdvDrbSmcBThEyBeP
	5SUTzVqTnmnC5PRJXs3l9G/yNNGBUzdJpluU4AuGqhW5P3iKjtcP7ScHK8Sn4KA28AoL
	nHjypQ/y2Wh8y59gyzhivxlNENKXyVv2/hfnQHX2Hn4ZYmWmdBgc8+4xZoAdHuuWYy2z
	9fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=qG7bpwJHpwhPg7icrWE2G0PRkrQ5rX3GYcPyqJ6ODsA=;
	b=LAsluEbrKckTdXpZ36G3NZYuLgAtieMG3ZjcRRRz72le4TmJQ6mu8Padlnc2cpGGBf
	MAkYyG4ptXNSCkIBWRG2ExXD08lE5fDHUmor55RbvMJFJrLCEz24YPC5xH0JNBKsAtKu
	GtPcdNitjls6s+tiTMCnMMN87kGwkaYuI3NpbqWek9FlxpYJ4lNYioxIYZvzYkcQOCw0
	2ZgJh4BZSCXPV3cLZVjO9TMyB6g2KcRsPKwqNh7bau9DJaYzVODrMPTw7VQ9ajlb6z7p
	qrStEw887r3W6zKu0EvsVXtOn6PjY0+PcfFpzSk4SAeprEToCdbFnToGT7RaSvjefsQx
	ZqWQ==
X-Gm-Message-State: AKaTC02GgaRo/9g59N2XV6eRDZUVSmhqcTwBb9cap0GHPVdz0wsxEp8Lm3sBbeyZKOzAHA==
X-Received: by 10.99.230.83 with SMTP id p19mr23774917pgj.138.1480174453403;
	Sat, 26 Nov 2016 07:34:13 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:bcc3:6b30:3fc9:245b?
	([2601:202:4001:9ea0:bcc3:6b30:3fc9:245b])
	by smtp.googlemail.com with ESMTPSA id
	a30sm57832980pgd.45.2016.11.26.07.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Nov 2016 07:34:12 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <5cf8bfe3-06a4-26cd-ac70-3e4c20455587@gmail.com>
Date: Sat, 26 Nov 2016 07:34:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH][morty 1/2] Revert "libwnck3: remove the recipe"
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
X-List-Received-Date: Sat, 26 Nov 2016 15:34:12 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 11/22/2016 09:55 AM, Ross Burton wrote:
> The epiphany in morty still needs libwnck3, so bring it back.
> 
> This reverts commit 129281e8557ec8d29ecf863675884713a3050f4b.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
Merged to staging

- armin
> ---
>  meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
> 
> diff --git a/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
> new file mode 100644
> index 0000000..fd4ef69
> --- /dev/null
> +++ b/meta/recipes-gnome/libwnck/libwnck3_3.20.1.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "Window navigation construction toolkit"
> +LICENSE = "LGPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
> +
> +BPN = "libwnck"
> +
> +SECTION = "x11/libs"
> +DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
> +
> +PACKAGECONFIG ??= "startup-notification"
> +PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
> +
> +inherit gnomebase gobject-introspection gtk-doc
> +SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
> +SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
> +
> +inherit distro_features_check
> +# libxres means x11 only
> +REQUIRED_DISTRO_FEATURES = "x11"
> 

