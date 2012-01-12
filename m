Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlSuP-0005A6-4z
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:14:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2012 14:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="95884831"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by orsmga001.jf.intel.com with ESMTP; 12 Jan 2012 14:06:36 -0800
Message-ID: <4F0F596C.8080806@linux.intel.com>
Date: Thu, 12 Jan 2012 14:06:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326337436.git.zumeng.chen@windriver.com>
	<7e296b4784e2043a1be8b47cd935bb3e06db1b12.1326337436.git.zumeng.chen@windriver.com>
In-Reply-To: <7e296b4784e2043a1be8b47cd935bb3e06db1b12.1326337436.git.zumeng.chen@windriver.com>
Subject: Re: [PATCH 4/4] babeltrace: Integrated from version 0.8
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
X-List-Received-Date: Thu, 12 Jan 2012 22:14:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 07:11 PM, Zumeng Chen wrote:
> It provides trace read and write libraries, as well as a trace converter.
>
> Signed-off-by: Zumeng Chen<zumeng.chen@windriver.com>
> ---
>   meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb |   28 +++++++++++++++++++++++
>   1 files changed, 28 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
>
> diff --git a/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
> new file mode 100644
> index 0000000..76a76c3
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng-2.0/babeltrace_0.8.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Babeltrace - Trace Format Babel Tower"
> +DESCRIPTION = "Babeltrace provides trace read and write libraries in host side, as well as a trace converter, which used to convert LTTng 2.0 traces into human-readable log."
> +HOMEPAGE = "http://www.efficios.com/babeltrace/"
> +BUGTRACKER = "n/a"
> +
> +LICENSE = "MIT&  GPLV2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=8d1a03b3c17bdd158b3cbb34813b1423"
> +
LICENSE vs LIC_FILES_CHKSUM, does the LICENSE file contain both?

also GPLv2 not V2

Sau!

> +inherit autotools
> +
> +DEPENDS = "gtk+ util-linux"
> +
> +SRCREV = "31e670293588d7882a232bc14b93d5e956fa43f4"
> +PV = "0.8+git${SRCPV}"
> +PR = "r0"
> +
> +SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend () {
> +	${S}/bootstrap
> +}
> +
> +# Due to liburcu not building for MIPS currently this recipe needs to
> +# be limited also.
> +# So here let us first suppport x86/arm/powerpc platforms now.
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'


