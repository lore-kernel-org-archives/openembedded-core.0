Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOvWK-0003Vj-Nk
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 21:12:41 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so14232518ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2012 11:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ei9opLUvm2XHO2dMj6fiN9JIWXN0l+OTvDuR4j6rrmM=;
	b=kPbVOYjD9hMKBJy5HZ+ri+VIwO2hWe5eDZ/doKroIzbAVlItrQVYsIyzdAzplhTjaK
	zWqobdDYskOJLynQd6GGNaJQ24WZ5jjSwf/03fW5IOV9sufTYm22mRqjXYzIK+uZNHOD
	5Tmujyx5Qi5a6Q0KmYnrBgumujLrdJIWKENHbutHcNWwhG/l/ad9rF1ap3gXvO7zQWby
	bbG2k8/CJ8dc+M1Ck3NB01VUqzod1WJKgfT3htN+yyOeyMFC0y4hUqqMbwN6nGuMlA9R
	CI61aHK9ZqXZyTZAQ3Oqq1S40yOF/8y/SHSW9iHB6/Z2sOxH4eN3RR/I+pQhiK0/vLMm
	T6Jg==
MIME-Version: 1.0
Received: by 10.50.173.37 with SMTP id bh5mr6076705igc.45.1350586759923; Thu,
	18 Oct 2012 11:59:19 -0700 (PDT)
Received: by 10.64.49.71 with HTTP; Thu, 18 Oct 2012 11:59:19 -0700 (PDT)
In-Reply-To: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
Date: Thu, 18 Oct 2012 20:59:19 +0200
Message-ID: <CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 19:12:41 -0000
Content-Type: text/plain; charset=UTF-8

I know you've sent
http://patchwork.openembedded.org/patch/37763/
to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
and only older gypsy_git.bb was added back.

Please fix that.

On Thu, Oct 4, 2012 at 12:14 PM, Andrei Dinu
<andrei.adrianx.dinu@intel.com> wrote:
> removed also entry from meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
>
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  meta/recipes-connectivity/gypsy/files/fixups.patch |   21 -----------------
>  meta/recipes-connectivity/gypsy/gypsy.inc          |   15 ------------
>  meta/recipes-connectivity/gypsy/gypsy_0.9.bb       |   24 --------------------
>  meta/recipes-connectivity/gypsy/gypsy_git.bb       |   18 ---------------
>  .../packagegroups/packagegroup-sdk-gmae.inc        |    1 -
>  5 files changed, 79 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/gypsy/files/fixups.patch
>  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy.inc
>  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_0.9.bb
>  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_git.bb
>
> diff --git a/meta/recipes-connectivity/gypsy/files/fixups.patch b/meta/recipes-connectivity/gypsy/files/fixups.patch
> deleted file mode 100644
> index de4d92e..0000000
> --- a/meta/recipes-connectivity/gypsy/files/fixups.patch
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> ----
> - docs/reference/Makefile.am |    2 ++
> - 1 file changed, 2 insertions(+)
> -
> ---- gypsy.orig/docs/reference/Makefile.am
> -+++ gypsy/docs/reference/Makefile.am
> -@@ -81,10 +81,12 @@ expand_content_files=
> - # e.g. GTKDOC_LIBS=$(top_builddir)/gtk/$(gtktargetlib)
> -
> - INCLUDES=-I$(top_srcdir) $(GYPSY_CFLAGS)
> - GTKDOC_LIBS=$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> -
> -+EXTRA_DIST =
> -+CLEANFILES =
> - # This includes the standard gtk-doc make rules, copied by gtkdocize.
> - include $(top_srcdir)/gtk-doc.make
> -
> - # Other files to distribute
> - # e.g. EXTRA_DIST += version.xml.in
> diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-connectivity/gypsy/gypsy.inc
> deleted file mode 100644
> index 0c1735e..0000000
> --- a/meta/recipes-connectivity/gypsy/gypsy.inc
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -SUMMARY = "GPS Multiplexing Daemon"
> -DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
> -multiple clients to access GPS data from multiple GPS sources \
> -concurrently.  Gypsy also hides the details of parsing NMEA from the \
> -client applications, passing the data as simple values for the clients \
> -to use."
> -LICENSE = "GPLv2.0 & LGPLv2.1"
> -SECTION = "x11"
> -DEPENDS = "glib-2.0 dbus bluez4 dbus-glib"
> -
> -inherit autotools pkgconfig gtk-doc
> -
> -EXTRA_OECONF += "--with-distro=debian"
> -
> -FILES_${PN} += "/usr/share/dbus-1/services/"
> diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
> deleted file mode 100644
> index 51207c9..0000000
> --- a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY = "GPS Multiplexing Daemon"
> -DESCRIPTION = "Gypsy is a GPS multiplexing daemon which allows \
> -multiple clients to access GPS data from multiple GPS sources \
> -concurrently.  Gypsy also hides the details of parsing NMEA from the \
> -client applications, passing the data as simple values for the clients \
> -to use."
> -LICENSE = "GPLv2+ & LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
> -                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
> -                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
> -
> -SECTION = "x11"
> -DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt"
> -
> -SRC_URI = "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
> -PR = "r1"
> -
> -inherit autotools pkgconfig
> -
> -FILES_${PN} += "/usr/share/dbus-1/system-services/"
> -
> -SRC_URI[md5sum] = "e2d186df9c2cc3b70a027043e22acf1a"
> -SRC_URI[sha256sum] = "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e236ddfb271904f154d6"
> diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipes-connectivity/gypsy/gypsy_git.bb
> deleted file mode 100644
> index 867582d..0000000
> --- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require gypsy.inc
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -SRCREV = "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
> -PV = "0.8+git${SRCPV}"
> -PR = "r2"
> -
> -S = "${WORKDIR}/git"
> -
> -LICENSE = "GPLv2+ & LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> -                    file://COPYING.lib;md5=7fbc338309ac38fefcd64b04bb903e34 \
> -                    file://src/main.c;beginline=1;endline=25;md5=3fe64e27e61b289b77383a54a982cbdd \
> -                    file://gypsy/gypsy-time.h;beginline=1;endline=24;md5=06432ea19a7b6607428d04d9dadc37fd"
> -
> -SRC_URI = "git://anongit.freedesktop.org/gypsy;protocol=git \
> -           file://fixups.patch"
> diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> index 2289572..a6403fc 100644
> --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> @@ -17,7 +17,6 @@ SDK-GMAE = " \
>      gupnp \
>      gupnp-av \
>      gupnp-tools \
> -    gypsy \
>      libart-lgpl \
>      libtelepathy \
>      pulseaudio \
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


