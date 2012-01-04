Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEOj-0002FO-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:08:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="92653837"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga001.jf.intel.com with ESMTP; 03 Jan 2012 16:00:42 -0800
Message-ID: <4F0396AA.3070901@linux.intel.com>
Date: Tue, 03 Jan 2012 16:00:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325154126-3368-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1325154126-3368-1-git-send-email-andrei@gherzan.ro>
Cc: Andrei Gherzan <andrei@gherzan.ro>,
	Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build (libgnutls-extra)
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
X-List-Received-Date: Wed, 04 Jan 2012 00:08:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/2011 02:22 AM, Andrei Gherzan wrote:
> From: Andrei Gherzan<andrei.gherzan@windriver.com>
>
> Two different defconfigs are chosen, one for "with GPLv3 build" and one for "without".
> In this way, libgnutls-extra is not pulled in a non-GPLv3 build.
>
> [YOCTO #1845]
>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   .../wpa-supplicant/defconfig.inc                   |    4 +
>   .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 ++++++++++++++++++++
>   .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
>   3 files changed, 418 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/defconfig.inc
>   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
>

Merged into OE-Core as coded here, but would be willing to get a new 
patch that removes the need for gnutls and the nogplv3 workaround.

Thanks
	Sau!


