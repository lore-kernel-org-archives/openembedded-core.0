Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuywJ-0005TG-Ft
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:15:27 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Feb 2012 20:07:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64289741"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 20:07:23 -0800
Message-ID: <4F31F4FB.50300@linux.intel.com>
Date: Tue, 07 Feb 2012 20:07:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328380901-11856-1-git-send-email-tworaz666@gmail.com>
In-Reply-To: <1328380901-11856-1-git-send-email-tworaz666@gmail.com>
Subject: Re: [PATCH 1/2 v2] webkit-gtk: Fix error.html resource path.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Feb 2012 04:15:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/04/2012 10:41 AM, Peter Tworek wrote:
> Signed-off-by: Peter Tworek<tworaz666@gmail.com>
> Reviewed-by: Paul Menzel<paulepanter@users.sourceforge.net>
> ---
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> index 9652953..d754a39 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -14,7 +14,7 @@ SRCREV_FORMAT = "source"
>
>   SRCREV = "101488"
>   PV = "1.7.2+svnr${SRCPV}"
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI = "\
>     svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
> @@ -81,7 +81,7 @@ FILES_${PN}launcher = "${bindir}/GtkLauncher"
>   FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
>   FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
>   FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
> -FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
> +FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
>                   ${datadir}/webkitgtk-*/images \
>                   ${datadir}/glib-2.0/schemas"
>

Merged both of these patches into OE-core

Thanks
	Sau!


