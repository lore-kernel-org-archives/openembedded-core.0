Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC3B560203
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 14:33:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so6479588wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 06:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tNKQb6G1y2vmMUGZKIzVWHf5ciDPIqzTtceGCvw/OMc=;
	b=uPafnH9kjcmtZQT7prwGlaDUlv4POS+KnPihrRNZCz624n2hCkpku820fG+vijLdqY
	RDsrS5umIGDO4tNgHCjh31kiX432QI32qlrlttS+/TxrhzR2Sd8FHJp4xKZz7BanoRnR
	SWrKIj84x+FRS2tCzII2aCQucsTCatolICr//MRUZCue2J5vJTTz3xZwfv9ymT0rqvIx
	ripDq6qFHdIPO0eYFiSNgfbBi+L1PA/9/Cvf8FoMxre5l451xLcH0oppW04MiGqdvqZi
	A0Yt2PuKscvQwr+rbp43S9fE4Srz8mA9XrpZWxBywsqSw9MEs32NAhkeqTVt35SGIQlY
	7PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tNKQb6G1y2vmMUGZKIzVWHf5ciDPIqzTtceGCvw/OMc=;
	b=bcW6ggyp0e5vlTlAlz2ufdIQMtLO9Ox1wliuKOs5s340b83fy0Fnh89+h5lgZbjTL+
	s/cQ+wL0AkeTjLDcNF+rSMOBowshP2wxjAKaeLpQ11TXmfzJmYHASycRrrxPydedk6/g
	B+gcsTGnSUaFa3vgZxNT1vrVe9QyETH2cZbWhlcAeiebHsvYVtSerwW/LhEep1TReMe8
	97H/N5PEbnezzq2584VUEX+SvtW8UPza7II0yAezsThkB2EXYD87Ffy2VHrp3oW4wcNs
	yZGhKw4QWwx7ySsDuUT4IXDac877NY5BcnqqGe07Pz0vjn9alK53XXB5EPd4/i9nWPo5
	Uq+w==
X-Gm-Message-State: APjAAAWZAcV9IBLJeVRAO+ZZgWZep6N7bEG7+EdGWnRS9C9cB+UlPclG
	cqE0iVgrxYcrVmfFXXzO7AHiXRlRpoWwHFJC4Wo=
X-Google-Smtp-Source: APXvYqw9yN0OwUX0esMqDavhMbxnjsC0qdXykTbQeSo1iDkUZUF1XIz8HB+BdAiaFUHq4GWXJw9Hib+FJmOVl3dEuAs=
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr16181422wme.78.1582468440003;
	Sun, 23 Feb 2020 06:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-8-alex.kanavin@gmail.com>
	<CAMKF1sq9i1=fzsAFiCm+kWPudORLp7gXxpWKZHYF7rRYMN2i0A@mail.gmail.com>
	<CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
In-Reply-To: <CANNYZj_7fu6SHkginQ38BC8QXnP=9MPu3f8NQBTwBgeaAbHvWQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 23 Feb 2020 08:33:49 -0600
Message-ID: <CAJdd5GafHh1WZsqZ9tGsVNoHw=k9Dxv-taym++3NtVNmnrMqwA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: webkit-wpe@lists.webkit.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/10] webkitgtk: unbreak wayland build
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
X-List-Received-Date: Sun, 23 Feb 2020 14:34:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 2:52 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 16 Feb 2020 at 21:15, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Feb 16, 2020 at 7:52 AM Alexander Kanavin
>> <alex.kanavin@gmail.com> wrote:
>> >
>> > webkit nowadays requires a couple of supplementary libraries for this,
>> > so bring them in (courtesy of meta-browser, which will hopefully
>> > adjust without a lot of trouble).
>>
>> its not meta-browser, I guess you should credit meta-wpe here [1]
>> and perhaps Cc the meta-wpe maintainer as a courtesy.
>
>
> Actually, it's copied from meta-webkit
> https://github.com/Igalia/meta-webkit/
> which does not say in the readme who the maintainer is, so I am not sure whom to CC.
> I can adjust the commit msg though.

I've CC'd the WPE mailing list.

OE-core now has libwpe and wpebackend-fdo recipes. They should
possibly be removed from meta-webkit to prevent duplication.

>
> Alex
>
>
>>
>>
>> [1] https://github.com/WebPlatformForEmbedded/meta-wpe/tree/master/recipes-wpe/libwpe
>> >
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  meta/recipes-sato/webkit/libwpe_1.4.0.1.bb    | 19 +++++++++++++++++++
>> >  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb  |  2 +-
>> >  .../webkit/wpebackend-fdo_1.4.1.bb            | 19 +++++++++++++++++++
>> >  3 files changed, 39 insertions(+), 1 deletion(-)
>> >  create mode 100644 meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> >  create mode 100644 meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> >
>> > diff --git a/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> > new file mode 100644
>> > index 0000000000..b9c71f9dc5
>> > --- /dev/null
>> > +++ b/meta/recipes-sato/webkit/libwpe_1.4.0.1.bb
>> > @@ -0,0 +1,19 @@
>> > +SUMMARY = "General-purpose library specifically developed for the WPE-flavored port of WebKit."
>> > +HOMEPAGE = "https://github.com/WebPlatformForEmbedded/libwpe"
>> > +BUGTRACKER = "https://github.com/WebPlatformForEmbedded/libwpe/issues"
>> > +
>> > +LICENSE = "BSD"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=371a616eb4903c6cb79e9893a5f615cc"
>> > +DEPENDS = "virtual/egl libxkbcommon"
>> > +
>> > +# Workaround build issue with RPi userland EGL libraries.
>> > +CFLAGS_append_rpi = " ${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '', '-D_GNU_SOURCE', d)}"
>> > +
>> > +inherit cmake
>> > +
>> > +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>> > +SRC_URI[md5sum] = "1d4d38413ee0d0043f74d0445cab906f"
>> > +SRC_URI[sha256sum] = "09849dfb34877354f34f318e138971cf22e677b2179e1f0a8ea00ab0b7bd8e9b"
>> > +SRC_URI[sha1sum] = "a41480a0a85cfa11b3f87f801b7c37bc3410e060"
>> > +SRC_URI[sha384sum] = "30488e375d956809a84b0d8af7b386a332541c77dcbd53496a896f894dbf39ac34534e935d6bc7a75c1b536f04f7f0a0"
>> > +SRC_URI[sha512sum] = "cbbe6b8e9bbb864d7f96bbdb56db262bbd341c86bc7bedfcc51be8077c0ea58a4e88c61b7b7bec937d5476e6cb81c093229bf80e3ee99452829287bd26175670"
>> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> > index 4aa8533b42..8d87ad49a3 100644
>> > --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> > @@ -44,7 +44,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
>> >                     libsecret \
>> >                    "
>> >
>> > -PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland"
>> > +PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
>> >  PACKAGECONFIG[x11] = "-DENABLE_X11_TARGET=ON,-DENABLE_X11_TARGET=OFF,virtual/libx11"
>> >  PACKAGECONFIG[geoclue] = "-DENABLE_GEOLOCATION=ON,-DENABLE_GEOLOCATION=OFF,geoclue"
>> >  PACKAGECONFIG[enchant] = "-DENABLE_SPELLCHECK=ON,-DENABLE_SPELLCHECK=OFF,enchant2"
>> > diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> > new file mode 100644
>> > index 0000000000..84df0c2535
>> > --- /dev/null
>> > +++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.4.1.bb
>> > @@ -0,0 +1,19 @@
>> > +SUMMARY = "WPE's backend based on a freedesktop.org stack."
>> > +HOMEPAGE = "https://github.com/Igalia/WPEBackend-fdo"
>> > +BUGTRACKER = "https://github.com/Igalia/WPEBackend-fdo/issues"
>> > +
>> > +LICENSE = "BSD"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=1f62cef2e3645e3e74eb05fd389d7a66"
>> > +DEPENDS = "glib-2.0 libxkbcommon wayland virtual/egl libwpe"
>> > +
>> > +DEPENDS_append_class-target = " wayland-native"
>> > +
>> > +inherit cmake
>> > +
>> > +SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
>> > +SRC_URI[md5sum] = "c6362491a4a38ddac42b66f140e1cff2"
>> > +SRC_URI[sha256sum] = "6249a0b7cbfa662206a8d2fa24e2c574e75c681ad0e93468091f1dc68ddb299d"
>> > +SRC_URI[sha1sum] = "9217c8a5511bc53544b42cb23390256580ac4b0c"
>> > +SRC_URI[sha384sum] = "79f3a28bc8e0a8240dc9962a6a245276d39dd8112a753d5ada39e98332d857eb9fc9c2879a702060807a10ea60be796d"
>> > +SRC_URI[sha512sum] = "8fdd13843c77b95b96b3feffea463bce565620997680e209a0cdcc09314a1469f2f1cb4744dceb2cf6c8d6ce5cb2bbdb4c7fbaf0451a687640c3f63bbdbfc4d4"
>> > +
>> > --
>> > 2.25.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

