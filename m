Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8Rpy-0003pr-Mf
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 10:16:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2012 01:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="188295590"
Received: from unknown (HELO helios.localnet) ([10.252.121.155])
	by orsmga001.jf.intel.com with ESMTP; 03 Sep 2012 01:04:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 03 Sep 2012 09:03:30 +0100
Message-ID: <5808938.Nh0F33ee0J@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <2c0055c43eae1489aee3e5e3fa2b8481d10fe0ce.1345155936.git.andrei@gherzan.ro>
References: <754a26c722091d5922d1ef095def13f1cf57f27f.1345155936.git.andrei@gherzan.ro>
	<2c0055c43eae1489aee3e5e3fa2b8481d10fe0ce.1345155936.git.andrei@gherzan.ro>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V2 PATCH 5/6] task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 08:16:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 17 August 2012 01:28:51 Andrei Gherzan wrote:
> For machines with no hardware clock it makes no sense to have this
> init stript. Moreover, we avoid a boot error in this way.
> 
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> ---
>  meta/recipes-core/tasks/task-core-boot.bb |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/tasks/task-core-boot.bb
> b/meta/recipes-core/tasks/task-core-boot.bb index 6487436..2947509 100644
> --- a/meta/recipes-core/tasks/task-core-boot.bb
> +++ b/meta/recipes-core/tasks/task-core-boot.bb
> @@ -34,6 +34,7 @@ RDEPENDS_task-core-boot = "\
>      base-files \
>      base-passwd \
>      busybox \
> +    ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)}
> \ ${VIRTUAL-RUNTIME_initscripts} \
>      ${@base_contains("MACHINE_FEATURES", "keyboard",
> "${VIRTUAL-RUNTIME_keymaps}", "", d)} \ modutils-initscripts \

Why did this get added to task-core-boot? This is meant only to contain items 
that are essential for booting; I'm not sure that support for the rtc 
qualifies.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


