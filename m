Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QULw5-0007CM-SH
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 18:48:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2011 09:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,339,1304319600"; d="scan'208";a="13584934"
Received: from unknown (HELO [10.255.13.55]) ([10.255.13.55])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2011 09:45:33 -0700
Message-ID: <4DEFA72D.6090904@linux.intel.com>
Date: Wed, 08 Jun 2011 09:45:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1307097655.2529.250.camel@phil-desktop>
In-Reply-To: <1307097655.2529.250.camel@phil-desktop>
Subject: Re: [PATCH] sqlite: remove dependency on tcl-native
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
X-List-Received-Date: Wed, 08 Jun 2011 16:48:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2011 03:40 AM, Phil Blundell wrote:
> Older versions of sqlite required tclsh at compile time but this is no longer
> the case with recent 3.7.x.
>
> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-June/003653.html
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-support/sqlite/sqlite3.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index d8ef8dc..939df14 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -2,8 +2,8 @@ DESCRIPTION = "An Embeddable SQL Database Engine"
>   HOMEPAGE = "http://www.sqlite.org"
>   SECTION = "libs"
>   PRIORITY = "optional"
> -DEPENDS = "readline ncurses tcl-native"
> -DEPENDS_virtclass-native = "tcl-native"
> +DEPENDS = "readline ncurses"
> +DEPENDS_virtclass-native = ""
>   LICENSE = "PD"
>
>   inherit autotools pkgconfig
Merged into oe-core

Thanks
	Sau!


