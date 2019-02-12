Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 795E96C1CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 19:00:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id n32so4204434qte.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 11:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UczkQxSNnTScGBnsYDUROYqy8FCWZW+jjs612kJztaA=;
	b=pcdi1JphWEKeXjKvd4JZpt2BH+gRkXlmy+nIecn5hx8Fr9MiDTRQD4t3qjjV8yylRr
	NBIJe74ucp31UegbVJRe4eExIitGTQ7OoNNX+R+Rnpn05cxArjd+Oe/U2zywhgOEKQkd
	TzqXvwJZU51WwoknYqobP79IOdUXMFZ9IR0lHjm/xcjzjk4XFU7ajv5J367zzAjb7jjK
	LWpEOoluFzR1EHKrqqb83wg0OfHOFtR+wXuNOx2eTDgUbeUEfYXfBGGoNcWRcHQENp0k
	b6ZzSWERFLyMZ7DZ7ufGmUd/GD4+vqBId7lV3RqQNFRZAEZ4GmIozgAmBnaBTzOnB/sK
	6CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UczkQxSNnTScGBnsYDUROYqy8FCWZW+jjs612kJztaA=;
	b=M7lVX222wxvEXabiT5ZcnU2Cwi7/jmyqsDA7m5OkRAq84zk9pah3Kep0ixdLU8aH4R
	QQ8gEDH1IULezggyIdy50nxPobU4tEjajN5sIH/KZiZFCl+ZaP8odjSdO3qGJFDyHZnP
	ELYuyvsp8NDaF4etzHwvgSA9QQuaTsdz0NHqIUwszOqbnfg3G+1YI5EZ4nw8AIBPaLjJ
	oYzIcUfkinzD5W/A7ftiK7MjBzZkkjtyzaCSeBKV7yV5Ui0bAEXgtQ2DUSDfNYyQwekf
	sF4geKDbZdgQI3FCStvCW3VkJ+nStL8/GYAH6nbCwVCk7DCdht1XDg7cl79LIUm08ERS
	q4QQ==
X-Gm-Message-State: AHQUAuY6KrZykj4N9D1HEz4AZPpabKlrrMUBYmLSnYgDy4/ez4HIHt6F
	LJGgU6WWkmShtQdQOv/l81W/mZPzmv6XHpgJn0g=
X-Google-Smtp-Source: AHgI3IbNu6U+54gPaltbt6hdK9zBF07aKiTSWd8hTk8ltYux7wzgBykWOsLzV5k4OvL+MHnOsN91o5RHSK2Py6VsqpY=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr4094448qte.29.1549998011830; 
	Tue, 12 Feb 2019 11:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<9f11043869417ac0303aac69acbf46fd2d9b4803.camel@linuxfoundation.org>
In-Reply-To: <9f11043869417ac0303aac69acbf46fd2d9b4803.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Feb 2019 10:59:45 -0800
Message-ID: <CAMKF1sp6YV3ft4j_ZJX2T=_b0LrUdXRivAVJ-_v+KEwEU9JoBw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: Remove PN from rdeps of PN-dev
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
X-List-Received-Date: Tue, 12 Feb 2019 19:00:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 12, 2019 at 9:26 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-02-11 at 21:47 -0800, Khem Raj wrote:
> > PN-dev is empty and causes dependency loops during SDK build
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/busybox.inc | 1 +
> >  1 file changed, 1 insertion(+)
>
> I commented on this elsewhere but for completeness, this is a
> workaround, not a fix. The problem is that the PROVIDES in target-sdk-
> provides-dummy.bb are clearly missing something.
>
> This means that the SDK tries to exclude "/bin/sh" and similar target
> dependencies from the SDK rootfs which leads to excluding busybox and
> then fails to do so. If busybox is installed, busybox-dev gets pulled
> in and the problems start.
>
> The real fix is to figure out the missing target-sdk-provides-dummy
> provides.
>
> If someone could share a way to reproduce the failure that would be a
> good start.
>

Use oe-core+bitbake ( nodisro ) settings and then
bitbake -cpopulate_sdk core-image-minimal

and you see

WARNING: core-image-minimal-1.0-r0 do_populate_sdk: Unable to install
packages. Command
'/mnt/a/yoe/build/tmp/work/sama5d27_som1_ek_sd-yoe-linux-musleabi/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/opkg
--volatile-cache -f
/mnt/a/yoe/build/tmp/work/sama5d27_som1_ek_sd-yoe-linux-musleabi/core-image-minimal/1.0-r0/opkg.conf
-t /mnt/a/yoe/build/tmp/work/sama5d27_som1_ek_sd-yoe-linux-musleabi/core-image-minimal/1.0-r0/temp/ipktemp/
-o /mnt/a/yoe/build/tmp/work/sama5d27_som1_ek_sd-yoe-linux-musleabi/core-image-minimal/1.0-r0/sdk/image/opt/yoe-musl-sysvinit-wayland/2.6/sysroots/cortexa5t2hf-neon-vfpv4-yoe-linux-musleabi
 --force_postinstall --prefer-arch-to-version   install libgcc-s-src
eudev-dbg update-rc.d-dev libcxx-dbg base-passwd-dev
sysvinit-inittab-dbg libz-dev modutils-initscripts-dbg initscripts-dev
opkg-utils-dbg musl-utils-dev libgcc-s-dbg init-ifupdown-dbg
packagegroup-core-standalone-sdk-target-dbg sysvinit-inittab-dev
busybox-dev gcc-runtime-dbg netbase-dbg kmod-dbg base-passwd-src
base-passwd-dbg initscripts-dbg eudev-dev sysvinit-dbg
run-postinsts-dbg target-sdk-provides-dummy-dbg base-files-dbg
musl-utils-dbg libz-dbg base-files-dev
packagegroup-core-standalone-sdk-target-dev musl-utils-src
compiler-rt-dbg dt-overlay-at91-dev busybox-dbg util-linux-dbg
kmod-dev util-linux-dev dt-overlay-at91-dbg packagegroup-core-boot-dev
sysvinit-src target-sdk-provides-dummy-dev sysvinit-dev
init-ifupdown-dev packagegroup-core-boot-dbg update-rc.d-dbg musl-src
modutils-initscripts-dev netbase-dev run-postinsts-dev' returned 1:
Collected errors:
 * Solver encountered 1 problem(s):
 * Problem 1/1:
 *   - package busybox-dev-1.29.3-r0.4.cortexa5t2hf-neon-vfpv4
requires busybox = 1.29.3-r0.4, but none of the providers can be
installed
 *
 * Solution 1:
 *   - allow deinstallation of
target-sdk-provides-dummy-1.0-r0.3.sdk-provides-dummy-target

 *   - do not ask to install a package providing target-sdk-provides-dummy-dev

 * Solution 2:
 *   - do not ask to install a package providing busybox-dev


> Cheers,
>
> Richard
>

