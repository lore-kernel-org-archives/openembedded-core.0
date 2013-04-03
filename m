Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNQKm-00067E-NY
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 18:15:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2013 08:57:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,402,1363158000"; d="scan'208";a="288836363"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2013 08:57:35 -0700
Message-ID: <515C516E.4060502@linux.intel.com>
Date: Wed, 03 Apr 2013 08:57:34 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: maxin.john@enea.com
References: <1365002457-22392-1-git-send-email-maxin.john@enea.com>
In-Reply-To: <1365002457-22392-1-git-send-email-maxin.john@enea.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng: updated lttng-ust to 2.1.2
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
X-List-Received-Date: Wed, 03 Apr 2013 16:15:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2013 08:20 AM, maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
>
> lttng-ust: upgrade to the latest version 2.1.2
> Also updated HOMEPAGE and BUGTRACKER.
>

We appreciate the update, as we are now in the stabilization period for 
the 1.4 release we are going to hold package updated unless there is a 
strong case to be made that it provides some stabilization or bugfix.

I will put this into the queue for 1.5 once it opens up.

Thanks
	Sau!

> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>   meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb |   33 --------------------------
>   meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb |   33 ++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 33 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
>   create mode 100644 meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
>
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
> deleted file mode 100644
> index 782e9db..0000000
> --- a/meta/recipes-kernel/lttng/lttng-ust_2.1.1.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> -DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
> -HOMEPAGE = "http://lttng.org/lttng2.0"
> -BUGTRACKER = "n/a"
> -
> -LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> -                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
> -                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
> -
> -inherit autotools
> -
> -DEPENDS = "liburcu util-linux"
> -
> -# For backwards compatibility after rename
> -RPROVIDES_${PN} = "lttng2-ust"
> -RREPLACES_${PN} = "lttng2-ust"
> -RCONFLICTS_${PN} = "lttng2-ust"
> -
> -SRCREV = "05356aa2a4dca0bc9bfd716d2d6723e3941851dc"
> -PV = "2.1.1"
> -PR = "r0"
> -PE = "2"
> -
> -SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
> -	   file://depends-liblttng-ust-tracepoin.patch \
> -	   "
> -
> -S = "${WORKDIR}/git"
> -
> -do_configure_prepend () {
> -	( cd ${S}; ${S}/bootstrap )
> -}
> diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb b/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
> new file mode 100644
> index 0000000..93852b0
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-ust_2.1.2.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Linux Trace Toolkit Userspace Tracer 2.0"
> +DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library to trace userspace codes."
> +HOMEPAGE = "http://lttng.org/ust"
> +BUGTRACKER = "https://bugs.lttng.org/projects/lttng-ust"
> +
> +LICENSE = "LGPLv2.1+ & BSD & GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
> +                    file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
> +                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
> +
> +inherit autotools
> +
> +DEPENDS = "liburcu util-linux"
> +
> +# For backwards compatibility after rename
> +RPROVIDES_${PN} = "lttng2-ust"
> +RREPLACES_${PN} = "lttng2-ust"
> +RCONFLICTS_${PN} = "lttng2-ust"
> +
> +SRCREV = "3f7a0876566a432ad2cc2b27a2725641e36da92d"
> +PV = "2.1.2"
> +PR = "r0"
> +PE = "2"
> +
> +SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git \
> +	   file://depends-liblttng-ust-tracepoin.patch \
> +	   "
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure_prepend () {
> +	( cd ${S}; ${S}/bootstrap )
> +}
>


