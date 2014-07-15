Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 52529705E6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:10:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2014 08:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573474887"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:06:23 -0700
Message-ID: <53C5436F.1070506@linux.intel.com>
Date: Tue, 15 Jul 2014 08:06:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1405430888-12456-1-git-send-email-akuster@mvista.com>
In-Reply-To: <1405430888-12456-1-git-send-email-akuster@mvista.com>
Subject: Re: [meta-oe][PATCH] [v3] lz4: update to latest version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jul 2014 15:10:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 06:28 AM, Armin Kuster wrote:
> update to version r119
> Use github instead of svn
> LICENSE md5sum changed since it was updated in r117

What exactly changed in r117?  Same License different working or ??

Sau!

> FIxes CVE-2014-4611
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
>   rename meta/recipes-support/lz4/{lz4_svn.bb => lz4_git.bb} (68%)
>
> diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_git.bb
> similarity index 68%
> rename from meta/recipes-support/lz4/lz4_svn.bb
> rename to meta/recipes-support/lz4/lz4_git.bb
> index 38e36d8..3978d76 100644
> --- a/meta/recipes-support/lz4/lz4_svn.bb
> +++ b/meta/recipes-support/lz4/lz4_git.bb
> @@ -2,15 +2,12 @@ SUMMARY = "Extremely Fast Compression algorithm"
>   DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
>
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2008d2325e11691e17fcaa3a6046f850"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd"
>
> -# Upstream names releases after SVN revs
> -SRCREV = "112"
> -PV = "r${SRCREV}"
> +SRCREV = "28fd251bc7b42e5cde15f9a2d78fc53b3b575558"
> +SRC_URI= "git://github.com/Cyan4973/lz4.git;branch=master"
>
> -SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
> -
> -S = "${WORKDIR}/trunk"
> +S = "${WORKDIR}/git"
>
>   EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir}"
>
>

