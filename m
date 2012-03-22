Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAmOi-0005yA-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 19:06:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Mar 2012 10:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80512034"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2012 10:57:08 -0700
Message-ID: <4F6B67F4.6010000@linux.intel.com>
Date: Thu, 22 Mar 2012 10:57:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 1/7] bitbake.conf: add systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 18:06:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/22/2012 04:05 AM, Andreas Müller wrote:
> Some of oe-core's recipes need to know where systemd units are. Since the
> directory might change in the future [1], we set the location once globally to
> reduce maintenance efforts
>
> [1] http://www.gossamer-threads.com/lists/gentoo/dev/245758
>
> Signed-off-by: Andreas Müller<schnitzeltony@googlemail.com>
> ---
>   meta/conf/bitbake.conf |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 07982d7..52802f6 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -39,6 +39,7 @@ export libexecdir = "${exec_prefix}/libexec"
>   export libdir = "${exec_prefix}/${baselib}"
>   export includedir = "${exec_prefix}/include"
>   export oldincludedir = "${exec_prefix}/include"
> +export systemd_unitdir = "${base_libdir}/systemd"
>
>   # Linkage between native/cross/nativesdk layouts
>   base_bindir_native = "/bin"

Merged into OE-Core

Thanks
	Sau!


