Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id B49CD7C5DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 15:43:49 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id z19so2468868otm.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 07:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oS8YU4jAutX8/8d1EXZLUxNJI55IUjTs5qT7Y6vjAVI=;
	b=g9wVfhhWwsvfKhs93T4lqLFufJiWyy7dOMj3pl65YWTTyQ3FNmCNnnChQhrC0R1YYg
	4ExwXGE8/gyi1u57w8yKtnR7V1CnTZKLP4goo5YjJ1Rl0kjDjiI+/mXTgbMqKJfEhDYb
	5uay0pue1po/XxyVV20ZE29QTaN0k7BEzNPGHc0hh30aG235mWXxdZ4C6yK4q6BTS89v
	2HYKiIabsK9kDxX5vJeH3h5Z77RzUuAZvtj+tJxhoOEZeNGLNpcbJL2AJ63CwO3VO+Fo
	2TTqmCbverS/WxoHb6yUZJlxlLnmGGlAU3jyX7A7pi8SDmTJg7VxLhaNFvlaBQh6FhKr
	FXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oS8YU4jAutX8/8d1EXZLUxNJI55IUjTs5qT7Y6vjAVI=;
	b=Cad1Hzuj6dSh/jihw365L+pQpKzmPc4e4iYFspnBQr1Cfn0q8h5qhHTWT/0l5x3HxL
	2ykj6NutzTsiIXGEKRruZHVzs9Of2f5h0T0M3xGOzak7sbSPiQYcIbw+XF7UQqjYWvNn
	2FnpnV5KrZf3bD64Bh2dV+7SJ2c9RZwK3pV2R1WksOmsijapa2kgq6/sxsS4IkvGnFke
	z38k6SEbBI4hzXh91fPDePVodDEwwEbikd90QT4dtLOZT2cc3pKWq9uznd5HYbeOmCrz
	rMRi0Ef4jKOTySDZh8Mi6o4cjwxsADRQOSX7J9xCqy7bJYJhTITMtVbu22lnS1VUMv3V
	8NjA==
X-Gm-Message-State: AHQUAuZ0CkIKYoGlkVOCuFyPjllx/KHFWfLxyRRhoeM8lCTZz/thvWVf
	tZpqZimYMMx/LW4UDISYB6v8R8Z/laeqgsmK2OMgUF0s
X-Google-Smtp-Source: AHgI3IYP8RyYF8FYb0QOaAp5d/XgZRrMNiC1y2dh3h7vsuIbuvkh0LubBpohQsyFcc6eA4GCgBtGxzYqWwPWRDvbvF0=
X-Received: by 2002:a9d:4c88:: with SMTP id m8mr13894006otf.360.1549640630707; 
	Fri, 08 Feb 2019 07:43:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1549637121.git.alex.kanavin@gmail.com>
	<a85aa0f19d694bd828ddde75c92d96bd7bbf4778.1549637121.git.alex.kanavin@gmail.com>
	<c7c7fd8c-6e73-ab1e-44bb-7df106c20c62@windriver.com>
In-Reply-To: <c7c7fd8c-6e73-ab1e-44bb-7df106c20c62@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Feb 2019 16:43:35 +0100
Message-ID: <CANNYZj9_cnyn92RBOQC+cs4iWitwvTGgKWFOF9DjgpW7zkbrSg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/12] qemu: build target variant with gtk+, and nativesdk variant without sdl
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
X-List-Received-Date: Fri, 08 Feb 2019 15:43:49 -0000
Content-Type: text/plain; charset="UTF-8"

Patch 3 changes things in meta-poky/, and patch 4 changes things in
meta/, so they cannot be combined unfortunately. I can however swap
their order, so that there is less confusion.

Alex

On Fri, 8 Feb 2019 at 16:31, Mark Hatle <mark.hatle@windriver.com> wrote:
>
> I may be nitpicking slightly, but this patch 4 and 3 should probably be
> combined.. I looked at '3' and went "this looks wrong, I have no idea why"..
> then saw '4' and it became clear.  Since they're both tied together (same
> purpose) it may make sense to combine them...
>
> On 2/8/19 8:45 AM, Alexander Kanavin wrote:
> > As sdl is deprecated in favor of gtk+, it should not be the default.
>
> At a minimum the commit message above should be included in 3/12.
>
> --Mark
>
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 95e9e0ede77..07f78058e7b 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -71,11 +71,11 @@ do_install_append() {
> >  # END of qemu-mips workaround
> >
> >  PACKAGECONFIG ??= " \
> > -    fdt sdl kvm \
> > +    fdt gtk+ kvm \
> >      ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
> >  "
> >  PACKAGECONFIG_class-native ??= "fdt alsa kvm virglrenderer glx"
> > -PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm virglrenderer glx"
> > +PACKAGECONFIG_class-nativesdk ??= "fdt kvm virglrenderer glx"
> >
> >  # Handle distros such as CentOS 5 32-bit that do not have kvm support
> >  PACKAGECONFIG_class-native_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
> >
>

