Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxlI-0004qy-Er
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:53:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 09:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171344492"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2012 09:41:58 -0700
Message-ID: <4FBFB656.7030102@linux.intel.com>
Date: Fri, 25 May 2012 09:41:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337875572-17969-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1337875572-17969-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH v2] opkg-nogpg: add file path
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
X-List-Received-Date: Fri, 25 May 2012 16:53:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 09:06 AM, Paul Eggleton wrote:
> There was no explicit path in FILESPATH for this recipe to allow it to
> find files referred to in SRC_URI (files shared with the standard opkg
> recipe). This problem may have been masked by the fetcher behaviour of
> looking for files last in DL_DIR, thus if opkg has been fetched
> beforehand there would have been no error.
>
> Signed-off-by: Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
> index 259a60e..da2a39c 100644
> --- a/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
> +++ b/meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
> @@ -3,6 +3,8 @@ require opkg_${PV}.bb
>   DEPENDS = "curl"
>   PROVIDES += "opkg"
>
> +FILESEXTRAPATHS_prepend := "${THISDIR}/opkg-${PV}:"
> +
>   EXTRA_OECONF += "--disable-gpg"
>
>   DEFAULT_PREFERENCE = "-1"

Merged into OE-Core

Thanks
	Sau!


