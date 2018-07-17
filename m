Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4B94B789E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:23:03 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id q11-v6so1273056oic.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 04:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rad2F9ik/xGbLoma9UkHbhKc9Lo2AZKTg8Hz12BVjsk=;
	b=j1bZrgtlJz8scoYXlDbrVPj4vWWOgqbZ1tzDP9irS9nFPl/It7vuKp5AuQKn6V2b4t
	7jmRKTBS/c396ncas+irBZkYH32dlx1A9yufHaGVcaxGDpFwTJzsXhlTwjV0AZRP8/mH
	60Avjza8h10bJpBBj7rv7VvOnFoV5fybunfQ8wY8nnN5CscD6GoKCJ4DAg0AsUN+jXes
	F1TkVP1fRdqEM/cAKvARuOJPev8Da8NX1J5qsf0pU+S9G2rbWw2hLUCIOudNoyjnobis
	vFh3gLuaLxkzs9x51phEBRVtGqSWMA8uS/521fmf96jBZ7k9rTgH7MZF/XjLO+HGeN+f
	3mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rad2F9ik/xGbLoma9UkHbhKc9Lo2AZKTg8Hz12BVjsk=;
	b=X49Q4cBhWo4HtSrs1QZ1KxhMi115ZOQjhywsz+u8gCF0eCZv+IO6BOMIkK0Mo38GTJ
	8cbmOlxLr4oWWj+C8nwJIWyoXI/grViQpZVVNes+coAIiHDppT9ege6cf7JC1jxw3e2H
	+3tPiEvfSK1xtAzRnwEhV7TfMit6kUi0d0Ms8XLBA+c8isHZrrc+LiZvFGNGuf7JFTvg
	7jR9B45SpHY6AbdZn8OTS1VU2pp7CUx4cIZ2Krg+NPnpGSj61n72fVnRugQnCi2cvss8
	brQVQLl3Ugl4P6fq3/ENFUWxeYz5mp9BmfliiYBpPlwviTabXAEvC50ZONdzKxL1KcqW
	J7IA==
X-Gm-Message-State: AOUpUlHeAlLFNIa+MPdeW7r7cO9AHECxDWHI6/8We4tdjdLKVRycjebV
	XMpqk5BC5ejn22U8lE4i3HI8Kzt+idhW7iLYxCwLqg==
X-Google-Smtp-Source: AAOMgpf2qI+ticUDpeGdZkGydKnZewXkSsFcUPpQ9gAKTIh21iv8tKjm7JyuK4D2xz25+pyXvjALha3LqWb52gV3VXA=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr1282631oih.102.1531826584375; 
	Tue, 17 Jul 2018 04:23:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 04:22:43
	-0700 (PDT)
In-Reply-To: <20180716210407.21494-1-alistair.francis@wdc.com>
References: <20180716210407.21494-1-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jul 2018 12:22:43 +0100
Message-ID: <CAJTo0LZ-mLb2xHgP1-3tbPP-Q=Sjk_as8i-tpXTWrhHHbbQs=w@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dbus: Enable user-session package config when x11 is set
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
X-List-Received-Date: Tue, 17 Jul 2018 11:23:03 -0000
Content-Type: text/plain; charset="UTF-8"

Unless you're building a pure Wayland system when you'd also want a
user session.  Maybe we should just turn it on always?

Ross

On 16 July 2018 at 22:04, Alistair Francis <alistair.francis@wdc.com> wrote:
> When x11 is set in DISTRO_FEATURES enable user-session in dbus as the
> user is probably targeting a user session.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/recipes-core/dbus/dbus_1.12.8.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.12.8.bb b/meta/recipes-core/dbus/dbus_1.12.8.bb
> index b3ddaafab5..7499b93244 100644
> --- a/meta/recipes-core/dbus/dbus_1.12.8.bb
> +++ b/meta/recipes-core/dbus/dbus_1.12.8.bb
> @@ -102,7 +102,9 @@ EXTRA_OECONF = "--disable-tests \
>  EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
>  EXTRA_OECONF_append_class-native = " --disable-selinux"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 user-session', '', d)} \
> +                   ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +                  "
>  PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

