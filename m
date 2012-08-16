Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T24Kl-0007NS-M2
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 19:58:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Aug 2012 10:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181587848"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2012 10:46:17 -0700
Message-ID: <502D31E8.3090308@linux.intel.com>
Date: Thu, 16 Aug 2012 10:46:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	"Ashfield, Bruce" <Bruce.Ashfield@windriver.com>
References: <cover.1343325569.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1343325569.git.bruce.ashfield@windriver.com>
Subject: Re: [RFC PATCH 0/1] kernel.bbclass: remove default module_autoload and module_conf values
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
X-List-Received-Date: Thu, 16 Aug 2012 17:58:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2012 11:04 AM, Bruce Ashfield wrote:
> Richard,
>
> This is just what the subject implies, a RFC patch. While working
> on some updates and docs, I (once gain) ran across the module_autoload
> and module_conf default values in kernel.bbclass.
>
> I've always wondered if that was the best place for these, since the
> kernel.bbclass builds many different kernel versions.
>
> I've simply removed them here, without relocating them to any other
> recipe, since I can't see that they are really all that useful for
> most targest.
>
> This is a RFC, because I haven't done any research into what this
> may or may not break outside of oe-core and reference boards.
>
> Cheers,
>
> Bruce
>
> The following changes since commit fb53d69d9c726e6a663eaOn 07/26/2012 11:04 AM, Bruce Ashfield wrote:> Richard,
>
> This is just what the subject implies, a RFC patch. While working
> on some updates and docs, I (once gain) ran across the module_autoload
> and module_conf default values in kernel.bbclass.
>
> I've always wondered if that was the best place for these, since the
> kernel.bbclass builds many different kernel versions.
>
> I've simply removed them here, without relocating them to any other
> recipe, since I can't see that they are really all that useful for
> most targest.
>
> This is a RFC, because I haven't done any research into what this
> may or may not break outside of oe-core and reference boards.
>
> Cheers,
>
> Bruce
>
> The following changes since commit fb53d69d9c726e6a663ea276cc440676e20f8326:
>
>    documentation/dev-manual/dev-manual-intro.xml: typo fixed. (2012-07-26 18:53:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-rfc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rfc
>
> Bruce Ashfield (1):
>    kernel.bbclass: remove default module_autoload and module_conf values
>
>   meta/classes/kernel.bbclass |   19 -------------------
>   1 files changed, 0 insertions(+), 19 deletions(-)
>276cc440676e20f8326:
>
>    documentation/dev-manual/dev-manual-intro.xml: typo fixed. (2012-07-26 18:53:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-rfc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-rfc
>
> Bruce Ashfield (1):
>    kernel.bbclass: remove default module_autoload and module_conf values
>
>   meta/classes/kernel.bbclass |   19 -------------------
>   1 files changed, 0 insertions(+), 19 deletions(-)
>
It's soaked and merged into OE-Core now!

Thanks	
	Sau!



