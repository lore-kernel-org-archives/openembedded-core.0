Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHfK-0005WF-HT
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:27:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Oct 2012 18:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="212008521"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2012 18:14:17 -0700
Message-ID: <508C86E9.5030907@linux.intel.com>
Date: Sat, 27 Oct 2012 18:14:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1351235029-31096-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1351235029-31096-1-git-send-email-raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Change systemd_unitdir definition
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
X-List-Received-Date: Sun, 28 Oct 2012 01:27:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 12:03 AM, Khem Raj wrote:
> systemd_unitdir indicates the arch independent
> files which are basically scripts and unit files
> and systemd wants then to be in /lib always even
> when base_libdir is  /lib64, hence we have to reflect
> that and not use base_libdir to define it. Otherwise
> on architectures where base_libdir is lib64 e.g. ppc64
> or multilibbed x86_64 this wont work
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/bitbake.conf |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5cb5b13..e7fa731 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -31,6 +31,7 @@ export localstatedir = "${base_prefix}/var"
>   export infodir = "${datadir}/info"
>   export mandir = "${datadir}/man"
>   export docdir = "${datadir}/doc"
> +export systemd_unitdir = "/lib/systemd"
>
>   # Architecture dependent paths
>   export bindir = "${exec_prefix}/bin"
> @@ -39,7 +40,6 @@ export libexecdir = "${exec_prefix}/libexec"
>   export libdir = "${exec_prefix}/${baselib}"
>   export includedir = "${exec_prefix}/include"
>   export oldincludedir = "${exec_prefix}/include"
> -export systemd_unitdir = "${base_libdir}/systemd"
>   localedir = "${libdir}/locale"
>
>   # Linkage between native/cross/nativesdk layouts
>
Merged into OE-Core

Thanks
	Sau!



