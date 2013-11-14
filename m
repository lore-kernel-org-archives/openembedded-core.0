Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A222D6D571
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 15:49:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2013 07:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="435269057"
Received: from unknown (HELO [10.255.15.61]) ([10.255.15.61])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2013 07:49:22 -0800
Message-ID: <5284F102.7070401@linux.intel.com>
Date: Thu, 14 Nov 2013 07:49:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Dominik Holland <dominik.holland@pelagicore.com>, 
	openembedded-core@lists.openembedded.org
References: <1384427348-13508-1-git-send-email-dominik.holland@pelagicore.com>
In-Reply-To: <1384427348-13508-1-git-send-email-dominik.holland@pelagicore.com>
Subject: Re: [PATCH] dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package
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
X-List-Received-Date: Thu, 14 Nov 2013 15:49:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2013 03:09 AM, Dominik Holland wrote:
> ---
>   meta/recipes-core/dbus/dbus.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> index 5864643..0609d23 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -11,6 +11,7 @@ DEPENDS_class-native = "expat-native virtual/libintl-native"
>   DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
>   RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
>   RDEPENDS_class-native = ""
> +RDEPENDS_dbus_class-nativesdk = ""
>
I realize your adding this line, but it looks like we need to fix the 
preceeding line also, it should be RDEPENDS_dbus_class-native = ""
>   INC_PR = "r6"
>
>

