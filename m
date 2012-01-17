Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFUK-0003kT-AB
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:18:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 12:10:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57382919"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 12:10:57 -0800
Message-ID: <4F15D5D1.8010501@linux.intel.com>
Date: Tue, 17 Jan 2012 12:10:57 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <48CE4DDF-8D48-43D4-A294-0E69A6D64608@dominion.thruhere.net>
	<1326378001-11488-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1326378001-11488-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] dbus-1.4.16: use INC_PR from dbus.inc to fix PR bump after dbus-launch-helper permission change
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
X-List-Received-Date: Tue, 17 Jan 2012 20:18:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2012 06:20 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-core/dbus/dbus_1.4.16.bb |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/dbus/dbus_1.4.16.bb b/meta/recipes-core/dbus/dbus_1.4.16.bb
> index f87f266..3cf8bb8 100644
> --- a/meta/recipes-core/dbus/dbus_1.4.16.bb
> +++ b/meta/recipes-core/dbus/dbus_1.4.16.bb
> @@ -1,5 +1,7 @@
>   include dbus.inc
>
> +PR = "${INC_PR}.0"
> +
>   SRC_URI[md5sum] = "44a2a10678e7e50460879c3eb4453a65"
>   SRC_URI[sha256sum] = "1d8ee6262f8cc2148f06578eee522c755ba0896206b3464ca9bdc84f411b29c6"
>
Merged into OE-Core

Thanks
	Sau!


