Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CAA0D73759
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 21:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1QLjPeF027481; Thu, 26 Feb 2015 21:45:58 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 06F4Es1O3gLx; Thu, 26 Feb 2015 21:45:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1QLjgwZ027511
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 Feb 2015 21:45:54 GMT
Message-ID: <1424987142.26813.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Date: Thu, 26 Feb 2015 21:45:42 +0000
In-Reply-To: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
References: <1424973442-24727-1-git-send-email-openembedded-devel@urbanec.net>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer1.0*git: Update to build current AUTOREV from master branch.
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
X-List-Received-Date: Thu, 26 Feb 2015 21:45:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-27 at 04:57 +1100, Peter Urbanec wrote:
> Now builds current git source from master branch. This is probably what
> most people would expect, instead of SRCREV snapshots from circa 2013.
> 
> The recipes have been modified to prevent infinite recursion when the
> python implementation of SRC_URI in gstreamer1.0-plugins.inc references
> package version information which depends on SRC_URI when AUTOREV is used.
> 
> Any revision from master branch can be built by specifying the desired
> SRCREV in the appropriate .conf file or using .bbappend. Patches can also
> be applied on top in a similar manner.
> 
> Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
> ---
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb    |  9 +++++++--
>  .../gstreamer/gstreamer1.0-plugins-bad_git.bb                  |  9 ++++++++-
>  .../gstreamer/gstreamer1.0-plugins-base_git.bb                 | 10 ++++++++--
>  .../recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc |  2 +-
>  .../gstreamer/gstreamer1.0-plugins-good_git.bb                 | 10 ++++++++--
>  .../gstreamer/gstreamer1.0-plugins-ugly_git.bb                 |  9 ++++++++-
>  meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb          | 10 ++++++++--
>  7 files changed, 48 insertions(+), 11 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> index bf1b87e..97d7a9e 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
> @@ -5,16 +5,21 @@ include gstreamer1.0-libav.inc
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
>                      file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
> -                    file://gst-libs/ext/libav/LICENSE;md5=23a54f59b82572c203a559346e89ed57 \
> +                    file://gst-libs/ext/libav/LICENSE;md5=c6d98fb56909e4c624e16fbb717a456d \
>                      file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                      file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
>                      file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>  
> +inherit gitpkgv
> +

The gitpkgv class isn't in OE-Core, nor is it going to be (this has been
discussed on the mailing list before). As such if we merge this, OE-Core
won't parse, let alone build.

Cheers,

Richard


