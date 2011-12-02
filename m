Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWWJw-000723-Eq
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 17:50:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Dec 2011 08:44:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,284,1320652800"; d="scan'208";a="91607402"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2011 08:43:59 -0800
Message-ID: <4ED9004F.8040409@linux.intel.com>
Date: Fri, 02 Dec 2011 08:43:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1322578833-9741-1-git-send-email-stefan@datenfreihafen.org>
In-Reply-To: <1322578833-9741-1-git-send-email-stefan@datenfreihafen.org>
Subject: Re: [PATCH] logrotate: Add dependency on popt lib.
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
X-List-Received-Date: Fri, 02 Dec 2011 16:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 07:00 AM, Stefan Schmidt wrote:
> Without this logrotate may fail like this:
>   compilation terminated.
> | config.c:9:18: fatal error: popt.h: No such file or directory
>
> Signed-off-by: Stefan Schmidt<stefan@datenfreihafen.org>
> ---
>   meta/recipes-extended/logrotate/logrotate_3.7.9.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
> index b736593..8dc0504 100644
> --- a/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
> +++ b/meta/recipes-extended/logrotate/logrotate_3.7.9.bb
> @@ -2,9 +2,9 @@ DESCRIPTION = "Rotates, compresses, removes and mails system log files"
>   SECTION = "console/utils"
>   HOMEPAGE = "https://fedorahosted.org/releases/l/o/logrotate"
>   LICENSE = "GPLv2"
> -PR = "r0"
> +PR = "r1"
>
> -DEPENDS="coreutils"
> +DEPENDS="coreutils popt"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>
Merged into OE-Core

Thanks

	Sau!


