Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zqz-0007fE-4D
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:26:49 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Feb 2012 10:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="110466498"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by azsmga001.ch.intel.com with ESMTP; 24 Feb 2012 10:18:24 -0800
Message-ID: <4F47D470.8080909@linux.intel.com>
Date: Fri, 24 Feb 2012 10:18:24 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329680734-10777-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1329680734-10777-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] e2fsprogs: e2initrd_helper was moved in libdir but not packaged correctly in FILES_libext2fs
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
X-List-Received-Date: Fri, 24 Feb 2012 18:26:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2012 11:45 AM, Andrei Gherzan wrote:
> The new install path of e2initrd_helper is %{libdir}. FILES_libext2fs modified accordigly to
> avoid QA warnings.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> index 2289211..793393e 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> @@ -1,6 +1,6 @@
>   require e2fsprogs.inc
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI += "file://fallocate.patch \
>               file://acinclude.m4"
> @@ -54,7 +54,7 @@ FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
>   FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
>   FILES_libss = "${base_libdir}/libss.so.*"
>   FILES_libe2p = "${base_libdir}/libe2p.so.*"
> -FILES_libext2fs = "${base_libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
> +FILES_libext2fs = "${libdir}/e2initrd_helper ${libdir}/libext2fs.so.*"
>   FILES_${PN}-dev += "${datadir}/*/*.awk ${datadir}/*/*.sed ${base_libdir}/*.so"
>
>   BBCLASSEXTEND = "native"

Merged into OE-core

Thanks
	Sau!


