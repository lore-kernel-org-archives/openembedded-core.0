Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmcAu-0008CB-TR
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 04:52:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Jul 2012 19:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="164147003"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2012 19:41:07 -0700
Message-ID: <4FF4FEC3.6000307@linux.intel.com>
Date: Wed, 04 Jul 2012 19:41:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341387078-25060-1-git-send-email-alexandru.damian@intel.com>
In-Reply-To: <1341387078-25060-1-git-send-email-alexandru.damian@intel.com>
Subject: Re: [PATCH 1/2] liburcu: upgrade to 0.7.3
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
X-List-Received-Date: Thu, 05 Jul 2012 02:52:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 12:31 AM, alexandru.damian@intel.com wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> The license changed with the addition of GPLv3 for one file.
>
> * GPLv3 (or later)
>
> The following build-related macro is under GPLv3 (or later):
>
> m4/ax_tls.m4
>
Does having a build-related macro file really cause the output to be 
tainted by GPLv3?

> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
>   meta/recipes-support/liburcu/liburcu_0.6.7.bb |   24 ------------------------
>   meta/recipes-support/liburcu/liburcu_0.7.3.bb |   24 ++++++++++++++++++++++++
>   2 files changed, 24 insertions(+), 24 deletions(-)
>   delete mode 100644 meta/recipes-support/liburcu/liburcu_0.6.7.bb
>   create mode 100644 meta/recipes-support/liburcu/liburcu_0.7.3.bb
>
> diff --git a/meta/recipes-support/liburcu/liburcu_0.6.7.bb b/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> deleted file mode 100644
> index be73856..0000000
> --- a/meta/recipes-support/liburcu/liburcu_0.6.7.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
> -HOMEPAGE = "http://lttng.org/urcu"
> -BUGTRACKER = "http://lttng.org/project/issues"
> -
> -LICENSE = "LGPLv2.1+ & MIT-style"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=b472dc110d38774921e1d5ccb0065fff \
> -                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> -                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
> -
> -PR = "r0"
> -
> -SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> -
> -SRC_URI[md5sum] = "2705dadd65beda8e8960472c082e44b3"
> -SRC_URI[sha256sum] = "b0b09aead6fbcb4d5efb4270e12f84ffd115b99b55b2c745e052b2d87a47e75f"
> -
> -S = "${WORKDIR}/userspace-rcu-${PV}"
> -CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> -inherit autotools
> -
> -# liburcu, which is only used by lttng-ust, may not build on other
> -# platforms, like MIPS.
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> -
> diff --git a/meta/recipes-support/liburcu/liburcu_0.7.3.bb b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> new file mode 100644
> index 0000000..45c51bc
> --- /dev/null
> +++ b/meta/recipes-support/liburcu/liburcu_0.7.3.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "The userspace read-copy update library by Mathieu Desnoyers"
> +HOMEPAGE = "http://lttng.org/urcu"
> +BUGTRACKER = "http://lttng.org/project/issues"
> +
> +LICENSE = "LGPLv2.1+ & MIT-style & GPLv3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=95dfea59eeaa41a4057faa07a58f5f89 \
> +                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
> +                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
If there is a new license in that macro file, then it should be included 
here in the LIC_FILES_CHKSUM, but I question whether having a built-time 
macro file be GPLv3 will taint the whole output.

I am not a lawyer, nor do I play one on TV.

Sau!

> +
> +PR = "r0"
> +
> +SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "c40b726f13bff80982c1ffa1bc2db31d"
> +SRC_URI[sha256sum] = "63f540a5d3c947fa3739711099fb87a66036d3c9560f26da763e500da296a1af"
> +
> +S = "${WORKDIR}/userspace-rcu-${PV}"
> +CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
> +inherit autotools
> +
> +# liburcu, which is only used by lttng-ust, may not build on other
> +# platforms, like MIPS.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
> +
>



