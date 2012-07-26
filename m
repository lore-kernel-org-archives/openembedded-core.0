Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTu4-0000Nl-BH
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:39:21 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2012 12:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171882108"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:27:44 -0700
Message-ID: <50119A30.7080006@linux.intel.com>
Date: Thu, 26 Jul 2012 12:27:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343032726-6310-1-git-send-email-paul.eggleton@linux.intel.com>
In-Reply-To: <1343032726-6310-1-git-send-email-paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] dhcp: remove dependency of dev/staticdev packages on main package
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
X-List-Received-Date: Thu, 26 Jul 2012 19:39:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 01:38 AM, Paul Eggleton wrote:
> The main package is empty and is not produced, which leaves the dev
> and staticdev packages broken. Remove the dependencies (added in
> bitbake.conf by default) to fix this.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>   meta/recipes-connectivity/dhcp/dhcp.inc         |    2 ++
>   meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
> index 8ead016..3159f93 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -56,6 +56,8 @@ do_install_append () {
>   PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
>
>   FILES_${PN} = ""
> +RDEPENDS_${PN}-dev = ""
> +RDEPENDS_${PN}-staticdev = ""
>
>   FILES_dhcp-server = "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
>   RRECOMMENDS_dhcp-server = "dhcp-server-config"
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> index 24b50ba..67af3e2 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> @@ -1,6 +1,6 @@
>   require dhcp.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI += "file://fixincludes.patch \
>               file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
>

Merged into OE-Core

Thanks
	Sau!


