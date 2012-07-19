Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrtOQ-0003Gs-Qv
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:15:59 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2012 09:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168539299"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 09:04:19 -0700
Message-ID: <50082FE9.6040105@linux.intel.com>
Date: Thu, 19 Jul 2012 09:03:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342517932-27013-1-git-send-email-Martin.Jansa@gmail.com>
	<1342518742-14636-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1342518742-14636-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCHv2] recipes: svn SRC_URI s/proto=/protocol=/g
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
X-List-Received-Date: Thu, 19 Jul 2012 16:15:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 02:52 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   .../eglibc/cross-localedef-native_2.15.bb          |    2 +-
>   .../eglibc/cross-localedef-native_2.16.bb          |    2 +-
>   meta/recipes-multimedia/tremor/tremor_20120314.bb  |    2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> index 6f311fc..493eb61 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> @@ -16,7 +16,7 @@ inherit autotools
>   PR = "r0"
>   SRCREV="15225"
>   EGLIBC_BRANCH="eglibc-2_14"
> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
> +SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
>   S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>
>   do_unpack_append() {
> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> index 88c701e..0f870be 100644
> --- a/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> +++ b/meta/recipes-core/eglibc/cross-localedef-native_2.16.bb
> @@ -16,7 +16,7 @@ inherit autotools
>   PR = "r0"
>   SRCREV="19383"
>   EGLIBC_BRANCH="eglibc-2_16"
> -SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http "
> +SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=http "
>   S = "${WORKDIR}/${EGLIBC_BRANCH}/localedef"
>
>   do_unpack_append() {
> diff --git a/meta/recipes-multimedia/tremor/tremor_20120314.bb b/meta/recipes-multimedia/tremor/tremor_20120314.bb
> index 19d03d6..cf51983 100644
> --- a/meta/recipes-multimedia/tremor/tremor_20120314.bb
> +++ b/meta/recipes-multimedia/tremor/tremor_20120314.bb
> @@ -8,7 +8,7 @@ DEPENDS = "libogg"
>   SRCDATE = "${PV}"
>   PR = "r0"
>
> -SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;proto=http"
> +SRC_URI = "svn://svn.xiph.org/trunk;module=Tremor;rev=18221;protocol=http"
>
>   S = "${WORKDIR}/Tremor"
>
>

Merged into OE-Core

Thanks
	Sau!


