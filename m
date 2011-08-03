Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qofac-00048U-VW
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 19:50:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 10:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,311,1309762800"; d="scan'208";a="34771917"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by azsmga001.ch.intel.com with ESMTP; 03 Aug 2011 10:46:19 -0700
Message-ID: <4E39896B.1000102@linux.intel.com>
Date: Wed, 03 Aug 2011 10:46:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1312385196-14664-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1312385196-14664-1-git-send-email-galak@kernel.crashing.org>
Subject: Re: [PATCH] libproxy: utilize base_libdir when configured
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
X-List-Received-Date: Wed, 03 Aug 2011 17:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 08:26 AM, Kumar Gala wrote:
> Pass $base_libdir through when we configure to support a location other
> than /lib.
>
> Signed-off-by: Kumar Gala<galak@kernel.crashing.org>
> ---
>   meta/recipes-support/libproxy/libproxy_0.4.6.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> index b24e8ba..8d9a332 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
> @@ -14,12 +14,12 @@ SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
>   SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
>   SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
>
> -PR = "r1"
> +PR = "r2"
>
>   inherit cmake pkgconfig
>
>   EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
> -	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no"
> +	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${base_libdir}"

Should this be ${base_libdir} as in /lib* or ${libdir} as in /usr/lib*? 
  I think libproxy should be installed to the ${libdir}
>
>   FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
>


