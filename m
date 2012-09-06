Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9hRl-0003i1-M8
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:09:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2012 11:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="189759276"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2012 11:56:35 -0700
Message-ID: <5048F1E3.4050800@linux.intel.com>
Date: Thu, 06 Sep 2012 11:56:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346945375-5770-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346945375-5770-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gst-plugins-good: disable (uninstalled) examples
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
X-List-Received-Date: Thu, 06 Sep 2012 19:09:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 08:29 AM, Ross Burton wrote:
> The examples pull in a GTK+ build dependency, so remove that too.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index ac63f94..0fc34df 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -5,14 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                       file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
>                       file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
>
> -DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
> +DEPENDS += "gst-plugins-base gconf cairo jpeg libpng zlib libid3tag flac \
>   	    speex libsoup-2.4 pulseaudio"

You seem to be changing DEPENDS here also with no reason why.

Sau!

> -PR = "r2"
> +PR = "r3"
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


