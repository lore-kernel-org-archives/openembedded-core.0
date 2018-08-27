Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5238778EFF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 21:15:48 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id l82-v6so694442oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 14:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9O1PMNtMxU9JE/ZZIMRZ0sf8FLZlr08LQdDAV3h2H68=;
	b=fATe29gHQ4KxqEAH/4jol78B5fCypQQF+D0ut1tS0KvLDL8WOhxni2oDEpa5i7/C61
	3tbIBO1i0sGt6L4BzesECzXcPpRzdl3ic7bv2Qig0Y42du9aVZhrKeargZNnPuazDZm0
	m2VBpZdHB/YqkrtA2wgODNrOYBs+VnIJ3RHA4uey+TT7raNpCBQ96EtzLJ8N+0VDpVak
	w5f+sHexd4b6wT1/DDzj2adNU5NrURNP40bPiHB1CIhsG8vlpqo9juU7uhApYaUYEmXc
	SH1sq/mBYa9ICr61wuKKiV7J+zKwJO+cByQ871bJxDl0ML8RI6H41wAjWOx0XfDtf5/6
	dzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9O1PMNtMxU9JE/ZZIMRZ0sf8FLZlr08LQdDAV3h2H68=;
	b=EEOXpksHkv7mwqysZUSCAwckZ97T3Xx5ttBFLV+BL2rG9xx3tAEAvLEldOye2W4Y/b
	rkxMw3P2+rIiQd7YGGHeg5MO25sZ9tRcR7h2q5tOZUHxGO4y1BXCYxJCqhsIn+HhR0Gx
	TUC1CeUWZyTNKWkkXDhlHo4zS+OX86TFgIQXypBZuEh9lV4J7rdx1giWpOXJ4d7vs0jm
	xq6HQTiZIHIqpcfLHLuKu3TniP2Czs5bYaZal0u+p56SoQQqEYEN1KknXTQSAiBBkIDd
	m2R9+3PSKE3EJBpLYYxtY8yN2A8uS6Qq4kRGtrQ847yh6Fk1d+ruwDo3capqCW1Izzrc
	Ww7w==
X-Gm-Message-State: APzg51DaAZ5WTTfh+Dpgoas1d8Hv4e400iPdnWsX5Z677GUN2KC91Lg6
	Ct1mUSZHdpGBXZ7RW+o/qWL3AtpjiHu1HQo71TQ=
X-Google-Smtp-Source: ANB0VdbosL4zbvNa8aQfVurRABooG+474zZCDObEZvDPOy++GZMlJEw7hvVD/o+WS4eQNlgSpbY6RDnvLVEzt4HbwKY=
X-Received: by 2002:aca:aa8d:: with SMTP id
	t135-v6mr302982oie.218.1535404549063; 
	Mon, 27 Aug 2018 14:15:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:454b:0:0:0:0:0 with HTTP; Mon, 27 Aug 2018 14:15:48
	-0700 (PDT)
In-Reply-To: <011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 27 Aug 2018 23:15:48 +0200
Message-ID: <CALbNGRRN0gjg4VTu4mPh726Q6JyCf4BCmv32mDuVaJ5BtNxpjg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 27 Aug 2018 21:15:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 8:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/cairo/cairo.inc | 3 ++-
>  meta/recipes-graphics/mesa/mesa.inc   | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
> index 20e0d2c92a..7347f223ff 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>
>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
> -           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
> +           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
> +           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 5afd0db4b7..dd626d9f00 100644
^ I think this came in accidentaly and it breaks builds when adding
packageconfig glesv2:

| configure: error: use either --enable-gl=yes or --enable-glesv2=yes.
Not both at the same time.

Please check

Andreas

