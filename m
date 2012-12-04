Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Tfuv0-00078V-FZ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 17:00:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 04 Dec 2012 07:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,215,1355126400"; d="scan'208";a="258853586"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 04 Dec 2012 07:45:57 -0800
Message-ID: <50BE1AB5.1020701@linux.intel.com>
Date: Tue, 04 Dec 2012 07:45:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1354584580.git.Martin.Jansa@gmail.com>
	<a2b1d1a87fa1a13ce1433972ef65b23a001eb7d3.1354584580.git.Martin.Jansa@gmail.com>
In-Reply-To: <a2b1d1a87fa1a13ce1433972ef65b23a001eb7d3.1354584580.git.Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] at: drop initscript dependency
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
X-List-Received-Date: Tue, 04 Dec 2012 16:00:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/03/2012 05:31 PM, Martin Jansa wrote:
> * doesn't look like build dependency
> * and for runtime dependency if needed we should use VIRTUAL-RUNTIME_initscripts
>
Agreed on the VIRTUAL-RUNTIME, which I think is needed for the 
populate-volatiles script for the /var and /run directories.

Sau!

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-extended/at/at_3.1.13.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.13.bb
> index 3580e09..96cc34a 100644
> --- a/meta/recipes-extended/at/at_3.1.13.bb
> +++ b/meta/recipes-extended/at/at_3.1.13.bb
> @@ -4,7 +4,7 @@ the system load levels drop to a particular level."
>   SECTION = "base"
>   LICENSE="GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
> -DEPENDS = "flex flex-native initscripts \
> +DEPENDS = "flex flex-native \
>   	${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
>   PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
>


