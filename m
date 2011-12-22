Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rdp8z-0001vg-0B
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 21:21:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2011 12:14:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89511153"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 22 Dec 2011 12:14:29 -0800
Message-ID: <4EF38FA5.8000806@linux.intel.com>
Date: Thu, 22 Dec 2011 12:14:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1324584443-7882-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1324584443-7882-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] coreutils: ensure --color works so DEPEND on libcap
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
X-List-Received-Date: Thu, 22 Dec 2011 20:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 12:07 PM, Saul Wold wrote:
> [YOCTO #1860]
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
> index cc05d88..251dabe 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.14.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
> @@ -8,7 +8,7 @@ LICENSE = "GPLv3+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
>                       file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
>   PR = "r2"
> -DEPENDS = "gmp"
> +DEPENDS = "gmp libcap"
>   DEPENDS_virtclass-native = ""
>
>   inherit autotools gettext

Drop this one forgot the PR bump!

Sau!


