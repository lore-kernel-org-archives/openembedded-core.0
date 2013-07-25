Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1633A6AF67
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2013 16:44:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 25 Jul 2013 09:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,744,1367996400"; d="scan'208";a="370945685"
Received: from unknown (HELO [10.255.14.43]) ([10.255.14.43])
	by fmsmga001.fm.intel.com with ESMTP; 25 Jul 2013 09:43:43 -0700
Message-ID: <51F155BF.8040301@linux.intel.com>
Date: Thu, 25 Jul 2013 09:43:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
References: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
In-Reply-To: <1374746524-18179-1-git-send-email-muhammad_shakeel@mentor.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: Remove unnecessary runtime dependency on sysvinit-pidof
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
X-List-Received-Date: Thu, 25 Jul 2013 16:44:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2013 03:02 AM, Shakeel, Muhammad wrote:
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> 'pidof' is alternatively coming from busybox so no need for avahi to explicitly
> rdepend on sysvinit-pidof. This unnecessarily includes sysvinit in systemd only
> build.
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   meta/recipes-connectivity/avahi/avahi.inc |    2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
> index c302f87..7bb5381 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -96,8 +96,6 @@ FILES_libavahi-glib = "${libdir}/libavahi-glib.so.*"
>   FILES_libavahi-gobject = "${libdir}/libavahi-gobject.so.*"
>   FILES_avahi-utils = "${bindir}/avahi-*"
>
> -RDEPENDS_avahi-daemon = "sysvinit-pidof"
> -
I am sure there was a reason that the sysvinit version of pidof was 
required over the busybox, did you test that the busybox version works 
correctly in both systemd and sysvinit usages?

It maybe that the busybox version now work correctly.

Also as Paul pointed out, this is an RDEPENDS on a single package not 
all the sysvinit packages.

Sau!

>   # uclibc has no nss
>   RRECOMMENDS_avahi-daemon_append_libc-glibc = "libnss-mdns"
>   RRECOMMENDS_${PN}_append_libc-glibc = "libnss-mdns"
>

