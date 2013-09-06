Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C18B61118
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 18:14:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2013 11:14:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,855,1371106800"; d="scan'208";a="374542207"
Received: from unknown (HELO [10.255.14.211]) ([10.255.14.211])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2013 11:14:57 -0700
Message-ID: <522A1BA1.9020709@linux.intel.com>
Date: Fri, 06 Sep 2013 11:14:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mihai Prica <mihai.prica@intel.com>
References: <cover.1378477619.git.mihai.prica@intel.com>
	<f8bc81b6558ad3b4e6c81403916ca1bfa42b236b.1378477619.git.mihai.prica@intel.com>
In-Reply-To: <f8bc81b6558ad3b4e6c81403916ca1bfa42b236b.1378477619.git.mihai.prica@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bluez5: Rename tests package to testtools
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
X-List-Received-Date: Fri, 06 Sep 2013 18:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2013 07:49 AM, Mihai Prica wrote:
> Bluez5 ships some tools that can be used to test its
> functionality.
>
> The installation can be tested using "make check" and
> this should be included in a ptest package.
>
> [YB #5028]
>
> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>   meta/recipes-connectivity/bluez5/bluez5.inc |    6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
> index e2b7169..e5cb9e8 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -55,7 +55,7 @@ do_install_append() {
>   }
>
>   ALLOW_EMPTY_libasound-module-bluez = "1"
> -PACKAGES =+ "libasound-module-bluez ${PN}-test ${PN}-obex"
> +PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex"
>
>   FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
>   FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
> @@ -70,7 +70,7 @@ FILES_${PN}-obex = "${libdir}/bluez5/bluetooth/obexd \
>                      "
>   SYSTEMD_SERVICE_${PN}-obex = "obex.service"
>
> -FILES_${PN}-test = "${libdir}/bluez/test/*"
> +FILES_${PN}-testtools = "${libdir}/bluez/test/*"
>
Are all the files located in test related to the testtools or are some 
of them related to ptest?

Sau!

>   FILES_${PN}-dbg += "\
>     ${libdir}/${BPN}/bluetooth/.debug \
> @@ -79,4 +79,6 @@ FILES_${PN}-dbg += "\
>     */udev/.debug \
>     "
>
> +RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
> +
>   SYSTEMD_SERVICE_${PN} = "bluetooth.service"
>

