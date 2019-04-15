Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id D68916C14C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 01:06:35 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id t30so11670316lfd.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HTO73l7C1sSGk8N97D6diosjSHLldYB7cWzDHe/k8gY=;
	b=p85rv27iRtNHhXS92szaWuKV/04Ah1rS9+1hTBNDp7/Rm2Q5aDwtIoZI//m4AqI2x4
	TOJuG3hA/PwT6hr7WM3SvA4aurvATJ122DiRVrDdzvypFdyrDWTLccT5YQke6EUh5/7M
	QKUXBHXf7LfASRR9g/7M3GAv/5Zi0MPW0b9kVbXcnREGCiyNv7et7A/EuaSeuiz0hJJW
	gFC1xOAr6DQlgu5CGlBh1M/bWxTWVrVq4xIliLwVVP4KUlFqkZy9LkiafxCOjFz+NDnT
	EtohKrZkkn/BYSnAa38ZeCc83hudUS3dYBB6fs79IsR4fYfi/dEV2+R83AacczMC+pq4
	Y0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HTO73l7C1sSGk8N97D6diosjSHLldYB7cWzDHe/k8gY=;
	b=hko+M70Bdm9o1rsuVZvc2BXEMmavUwIISmjFn3xhLe1OdMIkiBKQuK5D0ojZJu3iAr
	YHgpqMuc1iujBJPjlfIdTtBv4qE2qnh/dVk1UwNOcbyCF7VeCYzm7raLOY9zRLdAyj8F
	iQbMMrVQ0kOQcvpcal2Zfc9ytb5+bkSmEWJqimUyti0Ux5UzOxpCUFAzRqFN+kpsv0Ck
	kaoi12ujzTqC5vl+s2hPdvM5r/tDWSp/ywvM27WXndqPX+Bg4fvWrH7XXhzFPJ7NccbN
	OcKxEiRC1Jd9y66RkQ7/5x1LlQ4HrNhi/zWViMH0W1PQ9wGZ9r4gWH3MAyahIislQ6eO
	IghA==
X-Gm-Message-State: APjAAAV45Bq9CkI7jzMQHlE7voBDlVzmYjU3aSF7F1QelS9Fd6CkzJ63
	0SbIyJhlNWY7PrlRVJOU9DaDmOfxj21e+1JcoAE=
X-Google-Smtp-Source: APXvYqyho3vv5rGEnHDkBsYZ1D5NlZ6vZirHFXUqNZPDZVstFTaADLE+woM+BlNcuUiz24yRcFIbrFMJfvIMOuYiIGI=
X-Received: by 2002:ac2:5326:: with SMTP id f6mr16661853lfh.100.1555290396249; 
	Sun, 14 Apr 2019 18:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <PSXP216MB02779B5E1647679FD48732E4DD2A0@PSXP216MB0277.KORP216.PROD.OUTLOOK.COM>
	<CANNYZj_a9LMBxngjFE8QU69UKwnWMUREjQPkpd-eQaC=CMswfg@mail.gmail.com>
In-Reply-To: <CANNYZj_a9LMBxngjFE8QU69UKwnWMUREjQPkpd-eQaC=CMswfg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 14 Apr 2019 18:06:08 -0700
Message-ID: <CAKmqyKOxYzv4UKYAPTsgEc7iT4VUvUCmcxvf3CjCxRc91QkidQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup: Upgrade from 2.64.2 to 2.66.1
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
X-List-Received-Date: Mon, 15 Apr 2019 01:06:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 14, 2019 at 1:50 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Why is a patch removed? That needs to be explained in the commit
> message (unless it is an obvious backport which this isn't).

Argh, when it didn't apply I assumed it was merged upstream. I'll send
a v2 with the patch still there.

Alistair

>
> Alex
>
> On Sun, 14 Apr 2019 at 22:10, Alistair Francis <alistair@alistair23.me> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  ...no-introspection-when-cross-building.patch | 24 -------------------
> >  ...up-2.4_2.64.2.bb => libsoup-2.4_2.66.1.bb} |  5 ++--
> >  2 files changed, 2 insertions(+), 27 deletions(-)
> >  delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
> >  rename meta/recipes-support/libsoup/{libsoup-2.4_2.64.2.bb => libsoup-2.4_2.66.1.bb} (87%)
> >
> > diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
> > deleted file mode 100644
> > index 72b029a80b..0000000000
> > --- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Do-not-enforce-no-introspection-when-cross-building.patch
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -From 921888affe66953c92a08ae440e911b016b124be Mon Sep 17 00:00:00 2001
> > -From: Alexander Kanavin <alex.kanavin@gmail.com>
> > -Date: Fri, 15 Feb 2019 14:21:06 +0100
> > -Subject: [PATCH] Do not enforce no-introspection when cross-building
> > -
> > -Upstream-Status: Pending
> > -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ----
> > - meson.build | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/meson.build b/meson.build
> > -index 5a92cda..cfb3520 100644
> > ---- a/meson.build
> > -+++ b/meson.build
> > -@@ -262,7 +262,7 @@ enable_gnome = get_option('gnome') and host_machine.system() != 'windows'
> > - #########################
> > - # GObject introspection #
> > - #########################
> > --enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found() and not meson.is_cross_build()
> > -+enable_introspection = get_option('introspection') and find_program('g-ir-scanner', required: false).found()
> > -
> > - ############
> > - # Vala API #
> > diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> > similarity index 87%
> > rename from meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
> > rename to meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> > index b095397ec2..49f078a5de 100644
> > --- a/meta/recipes-support/libsoup/libsoup-2.4_2.64.2.bb
> > +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.1.bb
> > @@ -10,10 +10,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 intltool-native libpsl"
> >  SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> >
> >  SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
> > -           file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
> >             "
> > -SRC_URI[md5sum] = "cac755dc6c6acd6e0c70007f547548f5"
> > -SRC_URI[sha256sum] = "75ddc194a5b1d6f25033bb9d355f04bfe5c03e0e1c71ed0774104457b3a786c6"
> > +SRC_URI[md5sum] = "5f04c09a06f6dbe4c4d3f003992145ce"
> > +SRC_URI[sha256sum] = "4a2cb6c1174540af13661636035992c2b179dfcb39f4d3fa7bee3c7e355c43ff"
> >
> >  S = "${WORKDIR}/libsoup-${PV}"
> >
> > --
> > 2.20.1
> >

