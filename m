Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2Toz-0000EI-PU
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 23:11:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Aug 2012 13:59:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,785,1336374000"; d="scan'208";a="135534772"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Aug 2012 13:59:08 -0700
Message-ID: <502EB09C.8080709@linux.intel.com>
Date: Fri, 17 Aug 2012 13:59:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1344887071-10378-1-git-send-email-msm@freescale.com>
In-Reply-To: <1344887071-10378-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH] distutils.bbclass: fix libdir for 64-bit python modules built with distutils
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
X-List-Received-Date: Fri, 17 Aug 2012 21:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 12:44 PM, Matthew McClintock wrote:
> Without this some modules will be intalled in /usr/lib/python2.6/
> instead of /usr/${libdir}/python2.6
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>   meta/classes/distutils.bbclass |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
> index 690df73..7588b81 100644
> --- a/meta/classes/distutils.bbclass
> +++ b/meta/classes/distutils.bbclass
> @@ -39,6 +39,7 @@ distutils_do_install() {
>           PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
>           BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
>           ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} || \
> +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install ${DISTUTILS_INSTALL_ARGS} --install-lib=${D}${libdir}/${PYTHON_DIR} || \
>           bbfatal "python setup.py install execution failed."
>
>           for i in `find ${D} -name "*.py"` ; do \
>
Merged into OE-Core

Thanks
	Sau!



