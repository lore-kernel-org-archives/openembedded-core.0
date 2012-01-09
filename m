Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RkIiv-0006dH-Bh
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 18:09:29 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2012 09:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110320644"
Received: from unknown (HELO [10.255.13.28]) ([10.255.13.28])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jan 2012 09:01:46 -0800
Message-ID: <4F0B1D7A.8020308@linux.intel.com>
Date: Mon, 09 Jan 2012 09:01:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325895236-22987-1-git-send-email-andrea.adami@gmail.com>
	<1325895659-23153-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1325895659-23153-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH v2] kexec-tools: split packaging of kexec and kdump
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
X-List-Received-Date: Mon, 09 Jan 2012 17:09:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 04:20 PM, Andrea Adami wrote:
> * from meta-oe (originally from org.openembedded.dev)
> * There are no reasons to install kdump when only kexec is needed.
> *
> * In oe-core/meta there are no references to kexec-tools so
> * the recipes inn external layers rdepending on kexec-tools should be
> * fixed and rdepend on kexec and/or kdump.
> *
You need to fix task-core-tools.bb in oe-core/meta itself also.

Thanks
	Sau!

> * Bump PR.
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb |    7 ++++++-
>   1 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
> index caed816..8d2e606 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
> @@ -2,8 +2,13 @@ require kexec-tools.inc
>   export LDFLAGS = "-L${STAGING_LIBDIR}"
>   EXTRA_OECONF = " --with-zlib=yes"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI += " file://fix_for_compiling_with_gcc-4.6.0.patch"
>   SRC_URI[md5sum] = "bc401cf3262b25ff7c9a51fc76c8ab91"
>   SRC_URI[sha256sum] = "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
> +
> +PACKAGES =+ "kexec kdump"
> +
> +FILES_kexec = "${sbindir}/kexec"
> +FILES_kdump = "${sbindir}/kdump"


