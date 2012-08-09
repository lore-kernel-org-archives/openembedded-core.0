Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzTSN-0000ht-3q
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Aug 2012 16:11:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Aug 2012 06:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,739,1336374000"; d="scan'208";a="177992415"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2012 06:58:22 -0700
Message-ID: <5023C1FD.5040506@linux.intel.com>
Date: Thu, 09 Aug 2012 16:58:21 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
References: <20120808150633.GB32611@giant>
	<ED067880-C84B-42D9-B3C8-92F5E5B1250F@dominion.thruhere.net>
	<20120809071713.GA26150@giant>
In-Reply-To: <20120809071713.GA26150@giant>
Subject: Re: [PATCH] pigz: Update to upstream version 2.2.5
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
X-List-Received-Date: Thu, 09 Aug 2012 14:11:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 08/09/2012 10:17 AM, Björn Stenberg wrote:
> ---
>   meta/recipes-extended/pigz/pigz_2.2.4.bb |   11 -----------
>   meta/recipes-extended/pigz/pigz_2.2.5.bb |   11 +++++++++++
>   2 files changed, 11 insertions(+), 11 deletions(-)
>   delete mode 100644 meta/recipes-extended/pigz/pigz_2.2.4.bb
>   create mode 100644 meta/recipes-extended/pigz/pigz_2.2.5.bb
>
> diff --git a/meta/recipes-extended/pigz/pigz_2.2.4.bb b/meta/recipes-extended/pigz/pigz_2.2.4.bb
> deleted file mode 100644
> index e76c49c..0000000
> --- a/meta/recipes-extended/pigz/pigz_2.2.4.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require pigz.inc
> -
> -PR = "r2"
> -
> -NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
> -
> -BBCLASSEXTEND = "native"
> -
> -SRC_URI[md5sum] = "9df2a3c742524446fa4e797c17e8fd85"
> -SRC_URI[sha256sum] = "7e7967c47f66c07be97cbfa25c8816b72f9d35258466ea31eddc7666c914160e"
> -LIC_FILES_CHKSUM = "file://pigz.c;md5=53f47c097bbf11b937a421b1816a8dc5"
> diff --git a/meta/recipes-extended/pigz/pigz_2.2.5.bb b/meta/recipes-extended/pigz/pigz_2.2.5.bb
> new file mode 100644
> index 0000000..36669c2
> --- /dev/null
> +++ b/meta/recipes-extended/pigz/pigz_2.2.5.bb
> @@ -0,0 +1,11 @@
> +require pigz.inc
> +
> +NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
> +
> +BBCLASSEXTEND = "native"
> +
> +SRC_URI[md5sum] = "188f769ccedc403893d03049ad31e969"
> +SRC_URI[sha256sum] = "e37498cbf3a475d7ebe2519751188c29564bf8dd27ba68bd3c7fe1ac08792759"
> +LIC_FILES_CHKSUM = "file://pigz.c;md5=ee5481b3699dcac1f63cec8d038ada8a"
>
I did not catch this the first time, the md5 has changed for 
LIC_FILES_CHKSUM, why?  Please include a commit message as to what 
changed?  Even if it's just the year, we would like to track License 
changes.

Also, I guess that we should really have beginline/endline for pigz.c 
since we don't want to track the whole file.

Thanks
	Sau!



