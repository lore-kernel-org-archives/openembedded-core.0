Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rd614-0007Bg-Dx
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Dec 2011 21:10:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2011 12:03:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88631608"
Received: from unknown (HELO [10.255.15.200]) ([10.255.15.200])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2011 12:03:16 -0800
Message-ID: <4EF0EA03.7010600@linux.intel.com>
Date: Tue, 20 Dec 2011 12:03:15 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324407759.git.otavio@ossystems.com.br>
	<444cb0c0c2b99cac90d3b9964d44021c08b1a774.1324407759.git.otavio@ossystems.com.br>
In-Reply-To: <444cb0c0c2b99cac90d3b9964d44021c08b1a774.1324407759.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 9/9] udev: split utilities onto udev-utils
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
X-List-Received-Date: Tue, 20 Dec 2011 20:10:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 20/12/11 11:04, Otavio Salvador wrote:
>  FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
> +RRECOMMENDS_${PN} += "udev-utils"
> +

<snip>

> +FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
> +

The sysvinit scripts for udev itself, and the live-install image call
the udevadm binary. Is RRECOMMENDS adequate to ensure it's available?

My reading of the documentation[1] leads me to believe so but I'm not
sure if all of the package back-ends support this properly. Can you
share which package back-end(s) you tested with?

Cheers,
Joshua

1.
http://www.yoctoproject.org/docs/current/poky-ref-manual/poky-ref-manual.html#var-RRECOMMENDS
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre


