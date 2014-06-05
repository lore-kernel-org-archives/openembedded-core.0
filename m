Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f49.google.com (mail-yh0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id F13526B7F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jun 2014 15:17:20 +0000 (UTC)
Received: by mail-yh0-f49.google.com with SMTP id c41so952395yho.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jun 2014 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=oPUDiseX6C6pBY4dI5OevmIK757tko0EAzrChi0U5fg=;
	b=gBz0lGXLdVSYpx+gFmHQWWC2n8scpNnFnz4G67YJRCGu3XsQBhH12ES/olaywHgiF9
	BIVMXJY2lDuK55QMwHXjLbtvhxmnF+/iZe0Kn5b3FgE00VqeOsGgP/nqM+1rt4/aJXHi
	zg2qfeR5kTLS1zVJmzozjbGp9fE+lgGTGlZ1jRWw5wk1SEwIjVZYpwj88X+OU9X8kSQ7
	BE0ugQFtqsN3phAxUDmcFgj6VG8v4jiFWGyg7w8WFKJYK9bDQuYtP4INs+uaj/bcQm2L
	Vi/DtchgETiBLjzondOKtS4Gh1RGRNcnf6XACDoAdD39FAI6HOp1E60Kusk8JXZLEn+C
	VT/w==
MIME-Version: 1.0
X-Received: by 10.236.230.6 with SMTP id i6mr85438802yhq.14.1401981441458;
	Thu, 05 Jun 2014 08:17:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.166.213 with HTTP; Thu, 5 Jun 2014 08:17:21 -0700 (PDT)
In-Reply-To: <14f9de6c3225fa8a8ae8faab4c65a1253ce34ed0.1401918455.git.ajlennon@dynamicdevices.co.uk>
References: <cover.1401918455.git.ajlennon@dynamicdevices.co.uk>
	<14f9de6c3225fa8a8ae8faab4c65a1253ce34ed0.1401918455.git.ajlennon@dynamicdevices.co.uk>
Date: Thu, 5 Jun 2014 12:17:21 -0300
X-Google-Sender-Auth: a83jo_1tmi3PHLCHmrMDNvELipM
Message-ID: <CAP9ODKoNJ+_j5R+SS1qtSugnuUTORBd_3ahcfe6O2CDog1cq8Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gstreamer1.0-rtsp-server: Add recipe to support gst-rtsp-server
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
X-List-Received-Date: Thu, 05 Jun 2014 15:17:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 4, 2014 at 6:53 PM, Alex J Lennon
<ajlennon@dynamicdevices.co.uk> wrote:
> A Gstreamer library which provides an API to create an RTSP server (e.g. to stream RTP to VLC clients and similar).
>
> Tested, works with GStreamer 1.2.3 + videotestsrc based pipeline on RPi.
>
> Signed-off-by: Alex J Lennon <ajlennon@dynamicdevices.co.uk>
> ---
>  .../gstreamer/gstreamer1.0-rtsp-server.inc                 | 14 ++++++++++++++
>  .../gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb            |  9 +++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> new file mode 100644
> index 0000000..6917d41
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
> @@ -0,0 +1,14 @@
> +SUMMARY = "A library on top of GStreamer for building an RTSP server"
> +SECTION = "multimedia"
> +LICENSE = "LGPLv2"
> +HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
> +DEPENDS = "gstreamer1.0"
> +
> +PNREAL = "gst-rtsp-server"
> +
> +SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
> +
> +S = "${WORKDIR}/${PNREAL}-${PV}"
> +
> +inherit autotools pkgconfig
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
> new file mode 100644
> index 0000000..78d35f3
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.2.3.bb
> @@ -0,0 +1,9 @@
> +include gstreamer1.0-rtsp-server.inc
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d"
> +
> +SRC_URI[md5sum] = "239f805e755deb388162e957fcffff1d"
> +SRC_URI[sha256sum] = "c12befa5ec63818842c150725d3e9e38bf9948366317b67dc2536dfd00765da1"
> +
> +
> +

Useless newlines.

> --
> 2.0.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

