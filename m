Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S9fG4-00041l-0k
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 17:16:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2012 09:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="119161474"
Received: from unknown (HELO [10.255.15.160]) ([10.255.15.160])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2012 09:07:36 -0700
Message-ID: <4F6759C8.5060200@linux.intel.com>
Date: Mon, 19 Mar 2012 09:07:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332121842.git.lianhao.lu@intel.com>
	<14ba30517e7ece9590e5ea76a963ed9b6720df09.1332121842.git.lianhao.lu@intel.com>
In-Reply-To: <14ba30517e7ece9590e5ea76a963ed9b6720df09.1332121842.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 1/1] sysvinit-inittab: Fixed license warning.
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
X-List-Received-Date: Mon, 19 Mar 2012 16:16:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2012 06:52 PM, Lianhao Lu wrote:
> WARNING: .../sysvinit-inittab-2.88dsf-r6/sysvinit-2.88dsf/COPYING could
> not be copied for some reason. It may not exist. WARN for now.
>
> Signed-off-by: Lianhao Lu<lianhao.lu@intel.com>
> ---
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
>   1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index 3a716d7..85e34c8 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -11,7 +11,11 @@ S = "${WORKDIR}/sysvinit-${PV}"
>
>   INHIBIT_DEFAULT_DEPS = "1"
>
> -do_configure() {
> +do_unpack_append() {
> +	bb.build.exec_func('do_copy_lic', d)
> +}
> +
I think it would be better to do the copy in a do_configure_prepend() Or 
can we set ${S} to ${WORKDIR} and not have to copy it at all?


> +do_copy_lic () {
>   	cp ${WORKDIR}/COPYING ${S}/
>   }
>


