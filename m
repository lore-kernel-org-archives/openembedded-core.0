Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 454676080F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 21:09:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 09 Mar 2016 13:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,312,1455004800"; d="scan'208";a="933314629"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.18.251])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 13:09:29 -0800
Message-ID: <1457557766.3642.11.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 09 Mar 2016 21:09:26 +0000
In-Reply-To: <1457432801-8798-1-git-send-email-mariano.lopez@linux.intel.com>
References: <1457432801-8798-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Subject: Re: [PATCH] dhcp: CVE-2015-8605
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
X-List-Received-Date: Wed, 09 Mar 2016 21:09:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Mariano,

Thanks for the patch.

On Tue, 2016-03-08 at 10:26 +0000, mariano.lopez@linux.intel.com wrote:
> From: Mariano Lopez <mariano.lopez@linux.intel.com>
> 
> ISC DHCP allows remote attackers to cause a denial of
> service (application crash) via an invalid length field
> in a UDP IPv4 packet.
> 
> Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> ---
>  .../dhcp/dhcp/CVE-2015-8605.patch                  |  99
> ++++++++++++++++
>  .../dhcp/dhcp/CVE-2015-8605_1.patch                | 131
> +++++++++++++++++++++
>  meta/recipes-connectivity/dhcp/dhcp_4.3.1.bb       |   2 +
>  3 files changed, 232 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605.patch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-
> 8605_1.patch
> 
> diff --git a/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> new file mode 100644
> index 0000000..923d5d5
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.patch
> @@ -0,0 +1,99 @@
> +Solves CVE-2015-8605 that caused DoS when an invalid lenght field in

lenght -> length

> IPv4 UDP
> +was recived by the server.
> +
> +Upstream-Status: Backport

Can you include some more information about the backport, i.e. the
version the patch was backported from, in the Upstream-Status: field so
that it's easier to determine why this patch isn't required in jethro
and master?

> +CVE: CVE-2015-8605
> +
> +Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
> +
> +====================================================================
> ===
> +diff --git a/common/packet.c b/common/packet.c

<snip>

> new file mode 100644
> index 0000000..37a3d72
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605_1.patch
> @@ -0,0 +1,131 @@
> +This patch is needed for the CVE-2015-8605 that caused DoS when an
> invalid lenght field in IPv4 UDP

lenght -> length

> +was recived by the server.

recived -> received

> +
> +Upstream-Status: Backport

Same again, what version was this backported from?

Thanks,

Joshua

