Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBIxB-0006Kb-Ef
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 06:19:33 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 21:13:55 -0700
Received: by bke5 with SMTP id 5so1468849bke.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 21:13:53 -0700 (PDT)
Received: by 10.223.10.14 with SMTP id n14mr2909668fan.37.1317788033443;
	Tue, 04 Oct 2011 21:13:53 -0700 (PDT)
Received: from [10.6.18.233] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id u6sm474867fan.17.2011.10.04.21.13.51
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 21:13:52 -0700 (PDT)
Message-ID: <4E8BD97D.9060705@intel.com>
Date: Tue, 04 Oct 2011 21:13:49 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317390278-15364-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1317390278-15364-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] libproxy: upgrade to 0.4.7
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
X-List-Received-Date: Wed, 05 Oct 2011 04:19:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2011 06:44 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-support/libproxy/libproxy_0.4.6.bb |   29 -----------------------
>   meta/recipes-support/libproxy/libproxy_0.4.7.bb |   27 +++++++++++++++++++++
>   2 files changed, 27 insertions(+), 29 deletions(-)
>   delete mode 100644 meta/recipes-support/libproxy/libproxy_0.4.6.bb
>   create mode 100644 meta/recipes-support/libproxy/libproxy_0.4.7.bb
>
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> deleted file mode 100644
> index d907c55..0000000
> --- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -DESCRIPTION = "A library that provides automatic proxy configuration management"
> -HOMEPAGE = "http://code.google.com/p/libproxy/"
> -BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
> -SECTION = "libs"
> -LICENSE = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
> -                    file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
> -
> -
> -DEPENDS = "gconf"
> -
> -SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
> -SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
> -
> -PR = "r2"
> -
> -inherit cmake pkgconfig
> -
> -EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
> -	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
> -
> -FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
> -
> -do_configure_prepend() {
> -	export HOST_SYS=${HOST_SYS}
> -	export BUILD_SYS=${BUILD_SYS}
> -}
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> new file mode 100644
> index 0000000..2793b41
> --- /dev/null
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "A library that provides automatic proxy configuration management"
> +HOMEPAGE = "http://code.google.com/p/libproxy/"
> +BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
> +                    file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
> +
> +
> +DEPENDS = "gconf"
> +
> +SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
> +SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
> +
> +inherit cmake pkgconfig
> +
> +EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
> +	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
> +
> +FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
> +
> +do_configure_prepend() {
> +	export HOST_SYS=${HOST_SYS}
> +	export BUILD_SYS=${BUILD_SYS}
> +}

Looks like the v1 set of changes got merged by RP, both this and the 
json-glib patch

Thanks
	Sau!



