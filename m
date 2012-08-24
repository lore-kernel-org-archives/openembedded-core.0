Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T4yvV-00033R-1j
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 20:48:13 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2012 11:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,304,1344236400"; d="scan'208";a="210742851"
Received: from unknown (HELO [10.255.13.21]) ([10.255.13.21])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2012 11:36:02 -0700
Message-ID: <5037C991.50209@linux.intel.com>
Date: Fri, 24 Aug 2012 11:36:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1345720458-3909-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1345720458-3909-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mc: upgrade to 4.8.4
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
X-List-Received-Date: Fri, 24 Aug 2012 18:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2012 04:14 AM, Andrei Dinu wrote:
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   .../mc/{mc_4.8.3.bb => mc_4.8.4.bb}                |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/mc/{mc_4.8.3.bb => mc_4.8.4.bb} (82%)
>
> diff --git a/meta/recipes-extended/mc/mc_4.8.3.bb b/meta/recipes-extended/mc/mc_4.8.4.bb
> similarity index 82%
> rename from meta/recipes-extended/mc/mc_4.8.3.bb
> rename to meta/recipes-extended/mc/mc_4.8.4.bb
> index 3b777b5..fc551dd 100644
> --- a/meta/recipes-extended/mc/mc_4.8.3.bb
> +++ b/meta/recipes-extended/mc/mc_4.8.4.bb
> @@ -10,8 +10,8 @@ PR = "r0"
>
>   SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
>
> -SRC_URI[md5sum] = "12d38ad4969df3f8bbf66c3967a191ee"
> -SRC_URI[sha256sum] = "445f286652b85c3e8e87839bad64c28ad2dc80661778571a0b59c2b920ef60ac"
> +SRC_URI[md5sum] = "a8edb8226cb25869f925ecce043faf1e"
> +SRC_URI[sha256sum] = "917f32a6ce0b8e3ec893bb18af73e64c246d79066322041608352623a579234b"
>
>   inherit autotools gettext
>
>
Merged into OE-Core

Thanks
	Sau!



