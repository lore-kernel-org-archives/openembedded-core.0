Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id C5B276BBE6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 14:50:44 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id s24so6199587otk.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 07:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8jV9ZQNV7NjKewqD4WMFxdGfiDRc/TqvJ6V13YUmF3s=;
	b=EUeJ3jC/SEqBU58ujf7fEvFcBS2AEf/EbwQfksCg4WIk/Qfdot8F3wVBmhTq1rjCSa
	30ZztsNjI8thfx1NCQ83egeDZjXPhzD/+uNJ/f/QK1JbT+SU5iYwRMxIuP9m8KfVUq2R
	TDMwB+IUIklbmD4c1pOG95Uo3IzmdBLJCPC+yxfHZQlaul1kLpysyImHyVI8QHh19wYD
	X2ovS9pJROJU+synBQogMrxQFu5TFEUk/6FdabAAfPWu4AiHW4IZnvqRHhpWRwPPeYno
	5vJ5d/q0dL4/TH7PyDLXrcbm6tx+L3/jSrX1O8CD4QJUUP+qlHfb1oDb3I2GKCvqjDHY
	aK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8jV9ZQNV7NjKewqD4WMFxdGfiDRc/TqvJ6V13YUmF3s=;
	b=hX4unHfB8s0yJCSrC5E0gz0wMOU1g8M0SRuyjcAFnFIM7hIxzqEH+eKFMWKKRkTbG9
	m++wizs9vPLb9LMu30vxemuxryaKuLUr6Nc+BbSjzSfjDKc53ffyxoR/M1NsH3IBL7CA
	kfU52Hf/uDBWTj5U8VkKVJ/afMLLYATHYs2NDxa51iLbd+1fzrS+0+mi7ho0akPBtuRi
	HtHIaxN3dO5M2kAJ1lrBNw2o7tycoymaLKkGuV6RjVOf34RbOnK6mr7dBjD914vZhWxm
	ov+6YVIS8dR+EVYyd2w8TrlQHJNp7XfNr2aJARVr0Z2qNE4fksjBV1erHuxDTUeXG0iR
	X7QQ==
X-Gm-Message-State: APjAAAUcNxipkOEIyPzynMv+/5AnZmc88h3YwoBucThsSVlgFgxK04qo
	ydbn/Y5XaN3raPI1Bgk9asDrGzwlyLkUbSQLonco+U9H
X-Google-Smtp-Source: APXvYqxD0mh7wcWVS7QaVc6c7qxAUXl8LxNK0+k0LOmxIgOMDpe68khW9kONtkVNuOTG1hgcZ9ci0xeShA5Flsz1Mnk=
X-Received: by 2002:a05:6830:1c5:: with SMTP id
	r5mr31026584ota.360.1554043845733; 
	Sun, 31 Mar 2019 07:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190331004115.16429-1-open.source@oleksandr-kravchuk.com>
	<CANNYZj8hm5szOHGPijdQ3HMnwKM8qpOfH6ZQQ+sDA1SQMzK5Cg@mail.gmail.com>
	<1a8906b2-47e0-bd3b-30c4-0e82f3877e60@oleksandr-kravchuk.com>
In-Reply-To: <1a8906b2-47e0-bd3b-30c4-0e82f3877e60@oleksandr-kravchuk.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Mar 2019 16:50:34 +0200
Message-ID: <CANNYZj_rWDt_Oeq_am0HMJHTMLQ8HzgAo0Be5T3_CG4mUKCDUA@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: update to 1.43.0
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
X-List-Received-Date: Sun, 31 Mar 2019 14:50:45 -0000
Content-Type: text/plain; charset="UTF-8"

You can see the list of packages in need of update here:

https://layers.openembedded.org/rrs/recipes/OE-Core/2.7/M4/?upstream_status=Not%20updated#

Particularly anything maintained by Derek Straka (python* recipes) -
we know for a fact he has left the project.

Also, anything maintained by Ross or Armin - they are very much
present, but could do with less things to take care of.

Obviously it's better to pick items you are interested in personally,
or which are relevant to Pelux :)

Do give 'devtool upgrade' a try - it automates pretty much everything
in the upgrade process that can be automated (it will determine the
latest version, adjust the recipe (incl. tarball checksums), diff the
LICENSE if it has changed, and attempt to rebase the patches).

Alex


On Sun, 31 Mar 2019 at 16:26, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> > 1.43.0 is a development release.
> > You can use 'devtool latest-version pango' to find out what the latest
> > stable release is (facilitated by 'inherit upstream-version-is-even').
>
> Aha, nice. Thanks for the tip.
>
> > BTW, would you want to be the maintainer for some of these items?
> > You'll get patches from Automated Upgrade Helper whenever there is a
> > new version. YP is struggling to find people for this activity; many
> > existing maintainers have become unresponsive.
>
> Hm... I would love to help the project more, but it's better be
> something I am familiar with; also I would prefer to start "low", so I
> don't get overburden and join the army of "unresponsive" maintainers.
>
> Do you have any specific suggestions? Is there a list of poorly
> maintained packages I could scroll through or something?
>
> > On Sun, 31 Mar 2019 at 01:41, Oleksandr Kravchuk
> > <open.source@oleksandr-kravchuk.com> wrote:
> >> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> >> ---
> >>  .../pango/{pango_1.42.4.bb => pango_1.43.0.bb}                | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta/recipes-graphics/pango/{pango_1.42.4.bb => pango_1.43.0.bb} (93%)
> >>
> >> diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.43.0.bb
> >> similarity index 93%
> >> rename from meta/recipes-graphics/pango/pango_1.42.4.bb
> >> rename to meta/recipes-graphics/pango/pango_1.43.0.bb
> >> index d3357f82de..e91e02a837 100644
> >> --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
> >> +++ b/meta/recipes-graphics/pango/pango_1.43.0.bb
> >> @@ -18,8 +18,8 @@ inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspec
> >>  SRC_URI += "file://run-ptest \
> >>              file://insensitive-diff.patch"
> >>
> >> -SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
> >> -SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
> >> +SRC_URI[archive.md5sum] = "2df040d3f6a4ed9bc316a70b35adcd8b"
> >> +SRC_URI[archive.sha256sum] = "d2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2"
> >>
> >>  DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

