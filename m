Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnCd2-0007M1-Pa
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 18:15:24 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 09:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="99612545"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 17 Jan 2012 09:06:51 -0800
Message-ID: <4F15AAAB.1090403@linux.intel.com>
Date: Tue, 17 Jan 2012 09:06:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325864076-24080-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1325864076-24080-1-git-send-email-andrei@gherzan.ro>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] wpa-supplicant: Compile without	CONFIG_GNUTLS_EXTRA (PR BUMP)
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
X-List-Received-Date: Tue, 17 Jan 2012 17:15:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 07:34 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> CONFIG_GNUTLS_EXTRA is needed as support for TLS/IA which was designed to be used
> in the EAP-TTLSv1. As we don't see any requirement for that protocol today we decided
> to remove it from wpa-supplicant .config file.
> This change includes PR bump.
>
> [YOCTO #1845]
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../wpa-supplicant/defconfig.inc                   |    4 -
>   .../wpa-supplicant-0.7.3/defconfig-gnutls          |    2 +-
>   .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 --------------------
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
>   .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
>   5 files changed, 4 insertions(+), 420 deletions(-)
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>   delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
>
Merged into OE-Core

Thanks
	Sau!



