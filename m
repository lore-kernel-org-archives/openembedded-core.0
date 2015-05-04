Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E871D72C04
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 15:13:31 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 04 May 2015 08:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="720373496"
Received: from alimon-thinkpad-w540.zpn.intel.com (HELO [10.219.4.36])
	([10.219.4.36])
	by fmsmga002.fm.intel.com with ESMTP; 04 May 2015 08:13:31 -0700
Message-ID: <55478CD5.5060303@linux.intel.com>
Date: Mon, 04 May 2015 10:14:29 -0500
From: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: rongqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <1430294978-24756-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1430294978-24756-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] dpkg: upgrade to 1.17.25
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
X-List-Received-Date: Mon, 04 May 2015 15:13:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi,


On 29/04/15 03:09, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> upgrade to fix two CVE defects: CVE-2014-8625 and CVE-2015-0840
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8625
>
> Multiple format string vulnerabilities in the parse_error_msg
> function in parsehelp.c in dpkg before 1.17.22 allow remote attackers
> to cause a denial of service (crash) and possibly execute arbitrary
> code via format string specifiers in the (1) package or (2)
> architecture name.
>
> http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-0840
>
> The dpkg-source command in Debian dpkg before 1.16.16 and 1.17.x before
> 1.17.25 allows remote attackers to bypass signature verification
> via a crafted Debian source control file (.dsc).
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-devtools/dpkg/{dpkg_1.17.21.bb => dpkg_1.17.25.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/dpkg/{dpkg_1.17.21.bb => dpkg_1.17.25.bb} (81%)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
> similarity index 81%
> rename from meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
> rename to meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
> index ebb8671..74b1dd0 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.17.21.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.17.25.bb
> @@ -15,6 +15,6 @@ SRC_URI += "file://noman.patch \
>               file://add_armeb_triplet_entry.patch \
>              "
>   
> -SRC_URI[md5sum] = "765a96fd0180196613bbfa3c4aef0775"
> -SRC_URI[sha256sum] = "3ed776627181cb9c1c9ba33f94a6319084be2e9ec9c23dd61ce784c4f602cf05"
> +SRC_URI[md5sum] = "e48fcfdb2162e77d72c2a83432d537ca"
> +SRC_URI[sha256sum] = "07019d38ae98fb107c79dbb3690cfadff877f153b8c4970e3a30d2e59aa66baa"
>   

Acked-by: Aníbal Limón <anibal.limon@linux.intel.com>

Cheers,
     alimon

