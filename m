Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0zze-0007s2-HH
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:35:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Feb 2012 10:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="70016784"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Feb 2012 10:27:22 -0800
Message-ID: <4F47D68A.60506@linux.intel.com>
Date: Fri, 24 Feb 2012 10:27:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Fri, 24 Feb 2012 18:35:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/2012 08:06 AM, Andrei Gherzan wrote:
> 1. Update to 4.2.3-P2
> 2. From 4.2.0 final release, -lcrypto check was removed and we compile static libraries
> from bind that are linked to libcrypto. This is why i added a patch in order to add
> -lcrypto to LIBS.
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch |   86 ----------------
>   .../dhcp/dhcp-4.2.0/fix-client-path.patch          |   23 -----
>   .../dhcp/dhcp-4.2.0/fix-external-bind.patch        |  103 --------------------
>   .../dhcp/dhcp-4.2.0/fixincludes.patch              |   12 ---
>   .../dhcp/dhcp-4.2.0/noattrmode.patch               |   21 ----
>   meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h   |   21 ----
>   .../dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch   |   86 ++++++++++++++++
>   .../dhcp/dhcp-4.2.3-P2/fix-client-path.patch       |   23 +++++
>   .../dhcp/dhcp-4.2.3-P2/fix-external-bind.patch     |  103 ++++++++++++++++++++
>   .../dhcp/dhcp-4.2.3-P2/fixincludes.patch           |   12 +++
>   .../dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch     |   25 +++++
>   .../dhcp/dhcp-4.2.3-P2/noattrmode.patch            |   21 ++++
>   .../recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h |   21 ++++
>   meta/recipes-connectivity/dhcp/dhcp.inc            |    9 +--
>   meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |   12 ---
>   meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb    |   12 +++
>   16 files changed, 305 insertions(+), 285 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/dhcp-3.0.3-dhclient-dbus.patch
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-client-path.patch
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fix-external-bind.patch
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/fixincludes.patch
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/noattrmode.patch
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.0/site.h
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/dhcp-3.0.3-dhclient-dbus.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-client-path.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fix-external-bind.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/fixincludes.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/link-with-lcrypto.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/noattrmode.patch
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp-4.2.3-P2/site.h
>   delete mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb
>   create mode 100644 meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
>

Merged into OE-core


Thanks
	Sau!



