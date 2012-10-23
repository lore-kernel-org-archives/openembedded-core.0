Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQkJe-00078R-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:39:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2012 12:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="231276339"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2012 12:25:36 -0700
Message-ID: <5086EF30.4090405@linux.intel.com>
Date: Tue, 23 Oct 2012 12:25:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <1349265768-17088-1-git-send-email-radu.moisan@intel.com>
In-Reply-To: <1349265768-17088-1-git-send-email-radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nativesdk-ncurses: skip installed_vs_shipped test
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
X-List-Received-Date: Tue, 23 Oct 2012 19:39:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/03/2012 05:02 AM, Radu Moisan wrote:
> Fixes [Yocto #3174]
>
> In FILE_*, the conditional append to clear and reset files is
> evaluating ${PN} against "ncurses". When building nativesdk
> package, ${PN} = "nativesdk-ncurses" and thus the condition
> evaluates to False and thus we get an empty string appended
> instead of .${BPN}. This causes a warning in installed_vs_shipped
> test.
>
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index ed7f001..86be6bc 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -250,6 +250,8 @@ FILES_${PN}-tools = "\
>     ${bindir}/tabs \
>   "
>
> +INSANE_SKIP_nativesdk-${BPN} = "installed_vs_shipped"
> +
>   # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
>   RDEPENDS_${PN}-tools = "${PN}"
>
>
A better fix has been applied,

Sau!



