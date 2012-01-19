Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rnwto-0004OL-LN
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 19:39:48 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 10:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100501588"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 10:32:07 -0800
Message-ID: <4F1861A7.10100@linux.intel.com>
Date: Thu, 19 Jan 2012 10:32:07 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326738683-20567-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1326738683-20567-1-git-send-email-andrei@gherzan.ro>
Cc: florcirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] chkconfig: Update package from v1.3.55 to v1.3.57
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
X-List-Received-Date: Thu, 19 Jan 2012 18:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/16/2012 10:31 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../recipes-extended/chkconfig/chkconfig_1.3.55.bb |   27 --------------------
>   .../recipes-extended/chkconfig/chkconfig_1.3.57.bb |   27 ++++++++++++++++++++
>   2 files changed, 27 insertions(+), 27 deletions(-)
>   delete mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
>   create mode 100644 meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
> deleted file mode 100644
> index 0e50936..0000000
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
> -
> -DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
> -information for system services.  Chkconfig manipulates the numerous \
> -symbolic links in /etc/rc.d, to relieve system administrators of some \
> -of the drudgery of manually editing the symbolic links."
> -
> -HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> -
> -DEPENDS = "libnewt popt"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "de562d5bff5116d1acf2d3191603096b"
> -SRC_URI[sha256sum] = "ac5e8f6c5ed83f5b65a3dd9187f8c534f167193446082e6a6576a0d9f72ba968"
> -
> -inherit autotools gettext
> -
> -do_install_append() {
> -    mkdir -p ${D}/etc/chkconfig.d
> -    rm -f ${D}/usr/sbin/update-alternatives
> -}
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
> new file mode 100644
> index 0000000..b8ef2f6
> --- /dev/null
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.57.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "A system tool for maintaining the /etc/rc*.d hierarchy"
> +
> +DESCRIPTION = "Chkconfig is a basic system utility.  It updates and queries runlevel \
> +information for system services.  Chkconfig manipulates the numerous \
> +symbolic links in /etc/rc.d, to relieve system administrators of some \
> +of the drudgery of manually editing the symbolic links."
> +
> +HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
> +
> +DEPENDS = "libnewt popt"
> +
> +PR = "r0"
> +
> +SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "35a2d0630f1cb5c251e749eefde70afd"
> +SRC_URI[sha256sum] = "6a95472873984a0a8e99dca23ce9efe0ffe9db06d9990ce325575f8506babc1c"
> +
> +inherit autotools gettext
> +
> +do_install_append() {
> +    mkdir -p ${D}/etc/chkconfig.d
> +    rm -f ${D}/usr/sbin/update-alternatives
> +}

Merged into OE-Core

Thanks
	Sau!



