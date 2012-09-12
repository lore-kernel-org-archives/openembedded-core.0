Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqJh-0002S2-Ns
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:01:33 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 09:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221130759"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:49:00 -0700
Message-ID: <5050BCFC.4080703@linux.intel.com>
Date: Wed, 12 Sep 2012 09:49:00 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1347352218-3570-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1347352218-3570-1-git-send-email-mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gettext: Make gettext 0.16.1 extend native and nativesdk.
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
X-List-Received-Date: Wed, 12 Sep 2012 17:01:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 01:30 AM, Martin Ertsaas wrote:
> gettext 0.16.1 is a GPLv2 version of gettext. Making that extend native and
> nativesdk makes sure we use the same version of gettext for compiling internally
> as well as in our toolchain.
>
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
> ---
>   meta/recipes-core/gettext/gettext_0.16.1.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
> index fa8a213..00045d5 100644
> --- a/meta/recipes-core/gettext/gettext_0.16.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
> @@ -93,3 +93,5 @@ FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
>   do_install_append() {
>   	rm -f ${D}${libdir}/preloadable_libintl.so
>   }
> +
> +BBCLASSEXTEND = "native nativesdk"
>

Merged into OE-Core

Thanks
	Sau!



