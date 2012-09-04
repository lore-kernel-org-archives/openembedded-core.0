Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8ub8-0003Na-UR
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 16:59:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 07:47:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="217616362"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by fmsmga002.fm.intel.com with ESMTP; 04 Sep 2012 07:47:04 -0700
Message-ID: <50461468.8000108@linux.intel.com>
Date: Tue, 04 Sep 2012 07:47:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1346407525-8135-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1346407525-8135-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gettext: bump PR to avoid RPATH QA failure
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
X-List-Received-Date: Tue, 04 Sep 2012 14:59:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2012 03:05 AM, Paul Eggleton wrote:
> Erroneous paths being added to gettext by libtool were fixed, but the
> fix in libtool did not trigger a recompile of gettext, so if you are
> already in the situation where you are receiving the QA error, you are
> stuck. Bump PR to force a recompile.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> index ae3e28b..a159405 100644
> --- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> +++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "GPLv3+ & LGPL-2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -PR = "r16"
> +PR = "r17"
>   DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
>   DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
>   PROVIDES = "virtual/libintl virtual/gettext"
>

Merged into OE-Core

Thanks
	Sau!



