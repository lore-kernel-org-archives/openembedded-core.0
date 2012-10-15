Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TNpVs-0004zD-3M
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 20:35:40 +0200
Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Oct 2012 11:22:22 -0700
Received: by mail-pb0-f47.google.com with SMTP id ro12so4533949pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2012 11:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=y9OrtVwAAXFmeOqgaW/80/XRlP9iv+nF3Z7HXtUttOY=;
	b=iUUIZyzzMtzaR/hoVyfdBDi6WZuXNGO1b7VBcklFS2VEHH/5PV2RvdsWC9m7OTpcMN
	5/QYn6ba9Pk/pHvSbbZwPy29pz9/1ytY8eZAwcBZFZkTAkPu3HUBEwGNRCLFF5liFX9m
	yBx+i/OwaKRXD5WVV9Gr3qNCSs01p4qPOIjjvr5ldsfIQB/p0NLhwVTKOnzZKBIn9SMd
	wqQKjSIxChl979a2aq7aOKha4JduKjSwJADChCKRBEWI1f+ftRDLjQONb9zOTqRNi7lk
	GrE8mBie9wNjTD+p9uh6QZgOu29VVgIKZwdkHTS3bK3vZ+rFMkTj0euDvnqzUzy1dDLy
	Q8SQ==
Received: by 10.66.78.231 with SMTP id e7mr35023577pax.44.1350325338013;
	Mon, 15 Oct 2012 11:22:18 -0700 (PDT)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id rw5sm9402245pbc.54.2012.10.15.11.22.15
	(version=SSLv3 cipher=OTHER); Mon, 15 Oct 2012 11:22:16 -0700 (PDT)
Message-ID: <507C544C.2060201@intel.com>
Date: Mon, 15 Oct 2012 11:22:04 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1349318721-17882-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1349318721-17882-1-git-send-email-fcooper@ti.com>
X-Gm-Message-State: ALoCoQkxoCZau14biokE4n6NKAHxKCsktscrQjARZDMXHLvR64ughIu+CUEXGLAYgvEO8z8pZmhN
Subject: Re: [for-denzil][PATCH] gst-plugins-good: disable (uninstalled) examples
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
X-List-Received-Date: Mon, 15 Oct 2012 18:35:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 07:45 PM, Franklin S. Cooper Jr wrote:
> From: Ross Burton <ross.burton@intel.com>
>
> The examples pull in a GTK+ build dependency, so remove that too.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks for your patience, I have pulled this into my sgarman/denzil-next 
testing branches.

Scott

> ---
>   .../gstreamer/gst-plugins-good_0.10.31.bb          |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index e0eaf7b..e4c54bf 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                       file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
>                       file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>
> -DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
> +DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
>   	    speex libsoup-2.4 pulseaudio"
> -PR = "r1"
> +PR = "r2"
>
>   inherit gettext gconf
>
>   EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
> -                 --disable-orc"
> +                 --disable-orc --disable-examples"
>
>   do_configure_prepend() {
>   	# This m4 file contains nastiness which conflicts with libtool 2.2.2
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


