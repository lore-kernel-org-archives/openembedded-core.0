Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id CF0FD7CFF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 13:55:39 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id n187so11330314oih.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g6voOMssGJuu6WGWFmAfUFfkLKX4oa+pkRQsRiZNVjs=;
	b=EHi/Rxw5OaSGtLV9dGP4rz3wS4ca6Y2WJfxrecOlmrVeQn5LceC+UWE401QAAf96fO
	+HOqAn66QPCUV/EKH/hOUAxRQwgtVyF0SNYur6HjXsR+Whd89/CooVLFjYqHnTAfqcv4
	RrwCNmnPxPxaniubTjaD0YQQzPK37PmcAH3FyFzwQIvHfPWGcmTR5V/T0r8ouqy8AaSK
	aIPwzfQ4s7D9eonMZPbYo9c8JwNqLTqf+Q6kG/HYeOBQwfemIZGmaGk6YE3w7VHi5vvD
	S8Y6Oxx5UWD+W7TLnSDGVYO29/H1g0C0ppaYaCrx+kyxJ1DpsI1oYveD3c6ODkkgcnm6
	wBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g6voOMssGJuu6WGWFmAfUFfkLKX4oa+pkRQsRiZNVjs=;
	b=VK6zNkN9A4BCWOv2VzA7z/rjS0xiVtBvRIT0ptiR8o9xXtBatIpeThwwfnAqu8+pxE
	2FQwu7ETCNKrM4ThrnBXcG00O1VqsT5uOthM+xHqS8IW7FBwBfLFoxqIUDy84RdjqxNI
	4D2JGeIjVJEEJYpccPW6vQ6i5AknZRl3gQyTKZQl0ph3aoPHd6pc8a+6jQoh7zKUNekS
	jgV/I0OlJ5XG8dNS10sD0NOhTw7HAHrV0tybQVRILT28ptXOujfNmq8XYJ+NV+vuYtrt
	Ap6BcaAj76NMWpTqtiP+mLX1cWaV+ca5kUAjalePhUZQ1yw7WCIUrilMKgOJnD0KCZb6
	3/GA==
X-Gm-Message-State: APjAAAWMj118xYlYlZCr2gbXoWZw7pJeOJdEA/dQBZM+ZsoW2/M+qx1A
	7JvyaUa+yJLJAHd71dhL7BOG5iX8cIXYtBQ8JhI=
X-Google-Smtp-Source: APXvYqw5Ei7mLVW1kJXHu1HjpfZioWtXXq5WkAg16J0C6RCpw3RNwTFt+TMtsEmExeNpZcghjqin1LAGtsu7swfCn2Y=
X-Received: by 2002:aca:ed88:: with SMTP id l130mr1762465oih.70.1556027740508; 
	Tue, 23 Apr 2019 06:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190422223648.30507-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LYefGWi6Y8qo68oi=7RnLLVyYFYewdvrxUNnb0HZ6Y7jg@mail.gmail.com>
	<b2f825a1-b567-8f15-752c-347e6d83b2c5@oleksandr-kravchuk.com>
	<CAJTo0LZ6B3cRwnxskoLap6gRmyPKCcjhf9HxiLKKYU9KxiJFSw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ6B3cRwnxskoLap6gRmyPKCcjhf9HxiLKKYU9KxiJFSw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 23 Apr 2019 15:55:28 +0200
Message-ID: <CANNYZj9s4bvY8zQCdL9ionVNeed99w204XUat2G_TVVsoM73_w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH][meta-oe] libnotify: update to 0.7.8
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
X-List-Received-Date: Tue, 23 Apr 2019 13:55:40 -0000
Content-Type: text/plain; charset="UTF-8"

I would need to see the patch-in-progress to make a meaningful comment.

Alex

On Tue, 23 Apr 2019 at 15:54, Burton, Ross <ross.burton@intel.com> wrote:
>
> CCing Alex who has been working on the gtk-doc/meson stuff a lot.
>
> Ross
>
> On Tue, 23 Apr 2019 at 14:50, Oleksandr Kravchuk
> <open.source@oleksandr-kravchuk.com> wrote:
> >
> > On 23/04/2019 13:59, Burton, Ross wrote:
> > > Fancy following this up with a Meson port?
> > >
> > > Ross
> > >
> > > On Mon, 22 Apr 2019 at 23:37, Oleksandr Kravchuk
> > > <open.source@oleksandr-kravchuk.com> wrote:
> > >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> > >> ---
> > >>  .../libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb}      | 4 ++--
> > >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > >>  rename meta/recipes-gnome/libnotify/{libnotify_0.7.7.bb => libnotify_0.7.8.bb} (80%)
> > >>
> > >> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > >> similarity index 80%
> > >> rename from meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> > >> rename to meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > >> index 6c299bc175..82c137ca33 100644
> > >> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.7.bb
> > >> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> > >> @@ -10,8 +10,8 @@ inherit gnomebase gtk-doc distro_features_check gobject-introspection
> > >>  # depends on gtk+3
> > >>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> > >>
> > >> -SRC_URI[archive.md5sum] = "e9d911f6a22435e0b922f2fe71212b59"
> > >> -SRC_URI[archive.sha256sum] = "9cb4ce315b2655860c524d46b56010874214ec27e854086c1a1d0260137efc04"
> > >> +SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
> > >> +SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
> > >>
> > >>  # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
> > >>  # meta-gnome libnotify3: 0.7.x)
> > >> --
> > >> 2.17.1
> > >>
> > >> --
> > >> _______________________________________________
> > >> Openembedded-core mailing list
> > >> Openembedded-core@lists.openembedded.org
> > >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > 2019-04-23 13:41:30,546:scangobj.py:execute_command:1200:WARNING:Running
> > scanner failed: [Errno 2] No such file or directory:
> > '/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper':
> > '/home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper',
> > command:
> > /home/sashko/projects/yocto/open-embedded/build/tmp/work/i586-poky-linux/libnotify/0.7.8-r0/build/gtkdoc-qemuwrapper
> > ./libnotify-scan
> >
> > Is it worth fixing?
> >

