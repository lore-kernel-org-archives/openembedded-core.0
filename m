Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UAvQY-0002sU-Sx
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 05:49:16 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Feb 2013 20:32:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,753,1355126400"; d="scan'208";a="268878687"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 27 Feb 2013 20:32:32 -0800
Message-ID: <512EDDE0.2060907@linux.intel.com>
Date: Wed, 27 Feb 2013 20:32:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: tom.zanussi@linux.intel.com
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
	<4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
In-Reply-To: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libaudit: new package
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
X-List-Received-Date: Thu, 28 Feb 2013 04:49:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2013 07:00 AM, tom.zanussi@linux.intel.com wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>
> Add libaudit, used by system call auditing applications.  From the
> sources:
>
>   "The audit package contains the user space utilities for storing and
>   searching the audit records generate by the audit subsystem in the
>   Linux 2.6 kernel."
>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>   .../libaudit/libaudit/build-lib-only.patch         |  33 ++
>   .../libaudit/libaudit/fix-host-gen.patch           | 461 +++++++++++++++++++++
>   meta/recipes-support/libaudit/libaudit_2.2.2.bb    |  25 ++
>   3 files changed, 519 insertions(+)
>   create mode 100644 meta/recipes-support/libaudit/libaudit/build-lib-only.patch
>   create mode 100644 meta/recipes-support/libaudit/libaudit/fix-host-gen.patch
>   create mode 100644 meta/recipes-support/libaudit/libaudit_2.2.2.bb

>
<SNIP>


> diff --git a/meta/recipes-support/libaudit/libaudit_2.2.2.bb b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
> new file mode 100644
> index 0000000..e28b619
> --- /dev/null
> +++ b/meta/recipes-support/libaudit/libaudit_2.2.2.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "libaudit is the dynamic library needed for applications to use the audit framework."
> +SECTION = "libs"
> +AUTHOR = "Steve Grubb <sgrubb@redhat.com>"
> +HOMEPAGE = "http://people.redhat.com/sgrubb/audit/"
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +PR = "r0"
> +
> +SRC_URI = "http://people.redhat.com/sgrubb/audit/audit-${PV}.tar.gz \
> +           file://build-lib-only.patch \
> +           file://fix-host-gen.patch \
> +          "
> +
> +SRC_URI[md5sum] = "6641fde111cf5dfda6d4282ab8410df5"
> +SRC_URI[sha256sum] = "8bc2b45a5f08f5df6cebcd5543f24b7e68e28b64da4b23f08de2c6616384302b"
> +
> +S = "${WORKDIR}/audit-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-dependency-tracking --disable-listener"
> +
> +do_configure() {
> +	       oe_runconf
> +}
>
Is this do_configure really needed?  Does the autotools default not work 
correctly?  And if not why not?

Sau!



