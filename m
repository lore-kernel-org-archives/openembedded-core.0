Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CC37860D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 17:54:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Dec 2013 09:54:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,561,1384329600"; d="scan'208";a="456569197"
Received: from unknown (HELO [10.255.15.249]) ([10.255.15.249])
	by fmsmga002.fm.intel.com with ESMTP; 27 Dec 2013 09:54:00 -0800
Message-ID: <52BDBEB8.804@linux.intel.com>
Date: Fri, 27 Dec 2013 09:54:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: krzysztof.m.sywula@intel.com, 
 openembedded-core@lists.openembedded.org
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
In-Reply-To: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 27 Dec 2013 17:54:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2013 09:30 AM, krzysztof.m.sywula@intel.com wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>
This should really go to meta-openembedded and the 
openembedded-devel@list.openembedded.org mailing list.

You should also include a "Signed-off-by:" tag in your commit message

Sau!

> ---
>   meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
>
> diff --git a/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
> new file mode 100644
> index 0000000..478db18
> --- /dev/null
> +++ b/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "Irssi is ncurses IRC client"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
> +
> +SRC_URI = "http://irssi.org/files/irssi-0.8.16-rc1.tar.gz"
> +
> +SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
> +SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
> +
> +DEPENDS = "glib-2.0 ncurses"
> +inherit autotools
>

