Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 75CE26C109
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 23:54:49 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l7-v6so591167ljg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 15:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IUHE9EQWiZpoUnEOTCVkc1DboF5dzd3OCO7MoDsRlfM=;
	b=fLTZHPcYh7tuGtUONSkM1WK9/hbWnD79AFVqkkqHZ7gZ8a4WwYDZDtweqAGYIjAEUI
	F6i2QuRxHrChZTVoUs4npEcuJpkPgHWBAfCRYcEAToiZzub8urP0XXF2s0EbYJ4AaYYK
	bhR2NG9s96QRtD7yWoOcDiImZC+ao81fUkZlvsK4iZ0S4q7NTirPkKeRB7tkSb8M71Dx
	wS76KMb+Z9ypaZZ1IAhEAh2Lx08OZ7Q6Zy9pNYQwKC/y2IXwE5IxLms9sIMt/eGwOf0m
	H+j2ZqMkJsCeWwGT1OL4IItbmqQpk//kN5FvJFoq7SPzlULYICAPd350uXkpNvo/DVtH
	I7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IUHE9EQWiZpoUnEOTCVkc1DboF5dzd3OCO7MoDsRlfM=;
	b=TZZB5XzvzQoc2zyMqafGftcQ2mBc3V7JDfWcsUj/zhH6P1K5J1+uTKWdD9z2VNmBzf
	8e4sTVAAOMQdP/TPOpOCymco4QmgEXjia54LBx7+lW6ddkjvxyenhpItRfTi3Jac865C
	b09/z+kXzQHfEU4GYyt6kmHVLY67s3E4qs2vRpbZp6am6yWiMVY63A/hzY+IjxdVhPFL
	G02mrkSbIl1sokIT619ZCU+DK1ZuQXZiX0ZIHoc/uw2rcEDFHKcSAQcbbZ/5VA+qQcHc
	RDTa49BqUPb1ozgBX3SyTEpg6ksP7TrNKTqddvVYXjiJMrSD1SyuraqZIP4W1ZL1CZD+
	QF6w==
X-Gm-Message-State: AHQUAuYmrKcx/6vJrB++C602bVJuzQHB0JRPwLJk7y7BWnzQAQnRj8X1
	rlPwr+/a4tSgTXbBKgu3aCt+TMUDghm43EPZPrk=
X-Google-Smtp-Source: AHgI3IYFKJtWsoAgRnIj0gF7V/Bb0sDfqVtkDgeLwXFak0AZFEZ9GAId9BwFxt4fgoWNRkYmzPETLndpeiZ1pgPYzcM=
X-Received: by 2002:a2e:145a:: with SMTP id 26-v6mr455085lju.116.1549929289735;
	Mon, 11 Feb 2019 15:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20190208060733.5096-1-alistair@alistair23.me>
	<CANNYZj-y1ntqO20edE9CMEDfeSqUwfnZ=mUdTEvPztoTHm+j-A@mail.gmail.com>
In-Reply-To: <CANNYZj-y1ntqO20edE9CMEDfeSqUwfnZ=mUdTEvPztoTHm+j-A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 11 Feb 2019 15:54:09 -0800
Message-ID: <CAKmqyKPOq1FfaT6xFPEPT_6JHd3GGLQ6UiJ8421WknQwMs+QoQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa-lima: Add support for mesa for Mail-4xx GPUs
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
X-List-Received-Date: Mon, 11 Feb 2019 23:54:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 8, 2019 at 1:28 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The status of the driver is described here:
> https://www.phoronix.com/scan.php?page=news_item&px=Lima-DRM-Driver-Mainline-V2
>
> Considering the kernel DRM driver is not yet mainlined, and mesa
> driver is also developed separately, and the developer says:
> "Qiang continues to work on the out-of-tree Lima Mesa driver, which he
> says isn't yet ready for daily usage but can run simple tests like the
> KMS cube and glmark2."
> I think this shouldn't  go to oe-core yet. Once this is in mainline
> mesa and kernel, it will be available 'automatically' through version
> updates, until then the pieces belong in a suitable BSP layer, I
> think.

Fair enough, I just wanted to check if it would be accepted. I
actually didn't realise that there was an effort to merge it back into
mesa when I sent the patch.

Alistair

>
> Alex
>
> On Fri, 8 Feb 2019 at 07:07, Alistair Francis <alistair23@gmail.com> wrote:
> >
> > Add support for the open source reverse engineered drivers for the
> > Mali-4xx GPUs.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > ---
> >  .../recipes-graphics/mesa/mesa-lima_18.3.0.bb | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
> > new file mode 100644
> > index 0000000000..0f26ede2c4
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/mesa-lima_18.3.0.bb
> > @@ -0,0 +1,23 @@
> > +require ${BPN}.inc
> > +
> > +BRANCH = "lima-18.3"
> > +SRCREV = "8e713e4781982c700bfc7b09279146189d525a86"
> > +SRC_URI = "git://gitlab.freedesktop.org/lima/mesa.git;branch=${BRANCH} \
> > +"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +DEPENDS += "python3-native python3-mako python3-mako-native gettext-native libdrm"
> > +DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'xrandr', '', d)}"
> > +
> > +PACKAGECONFIG[sun4i] = ""
> > +GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'sun4i', ',lima,sun4i', '', d)}"
> > +
> > +#because we cannot rely on the fact that all apps will use pkgconfig,
> > +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > +do_install_append() {
> > +    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> > +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> > +    fi
> > +}
> > +
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

