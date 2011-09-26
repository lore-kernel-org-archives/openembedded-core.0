Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8KXs-0001Lj-AO
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:25:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Sep 2011 16:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,447,1312182000"; d="scan'208";a="70959444"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2011 16:19:42 -0700
Message-ID: <4E81088E.8080606@linux.intel.com>
Date: Mon, 26 Sep 2011 16:19:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316673733-24576-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1316673733-24576-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v2] bluez4: split gstreamer plugin into a seperate recipe
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
X-List-Received-Date: Mon, 26 Sep 2011 23:25:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/21/2011 11:42 PM, Koen Kooi wrote:
> This eliminates a good chunk of buildtime when building console-only image.
>
> The bluez4 and this recipe share a .inc file since the source is the same.
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-connectivity/bluez/bluez4.inc         |   37 +++++++++++++++
>   meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   49 +++-----------------
>   .../bluez/gst-plugin-bluetooth_4.96.bb             |   28 +++++++++++
>   3 files changed, 72 insertions(+), 42 deletions(-)
>   create mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
>   create mode 100644 meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
>

Merged into OE-Core

Thanks
	Sau!



