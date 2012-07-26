Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTaO-00085C-PY
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:19:00 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 12:07:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171875984"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:07:28 -0700
Message-ID: <50119570.1020704@linux.intel.com>
Date: Thu, 26 Jul 2012 12:07:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343203659-23756-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1343203659-23756-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] findutils: fix sort dir on updatedb
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
X-List-Received-Date: Thu, 26 Jul 2012 19:19:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/25/2012 01:07 AM, rongqing.li@windriver.com wrote:
> From: Roy.Li <rongqing.li@windriver.com>
>
> [YOCTO #2826]
>
> m4/nullsort.m4 tries to find sort dir, and write it to updatedb,
> but nullsort.m4 is checking the host dir. Once the sort dirs on
> target and host are different, updatedb will fail due to wrong
> sort dir.
>
> Since we always have sort under ${bindir}, so we can assign it
> directly.
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
> index 127eb4b..218bf83 100644
> --- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
> +++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
> @@ -1,6 +1,6 @@
>   require findutils.inc
>
> -PR = "r4"
> +PR = "r5"
>
>   SRC_URI += "file://01-27017.patch \
>               file://02-28824.patch \
> @@ -15,4 +15,6 @@ SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd7
>   # http://savannah.gnu.org/bugs/?27299
>   CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
>
> +EXTRA_OECONF += "ac_cv_path_SORT=${bindir}/sort"
> +
>   BBCLASSEXTEND = "native"
>

Merged into OE-Core

Thanks
	Sau!


