Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaF93-0008Ew-Nt
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:18:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2011 15:11:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="85787638"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2011 15:11:54 -0800
Message-ID: <4EE68A3A.9020209@linux.intel.com>
Date: Mon, 12 Dec 2011 15:11:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323365731-1225-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1323365731-1225-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH v3] lzop-1.03: add recipe
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
X-List-Received-Date: Mon, 12 Dec 2011 23:18:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2011 09:35 AM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> This is needed by some kernels when CONFIG_KERNEL_LZO=y (specifically, given
> the current defconfig, this affects linux-omap4 2.6 in the meta-ti layer).
>
> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
> ---
>   meta/recipes-support/lzop/lzop/acinclude.m4 |  390 +++++++++++++++++++++++++++
>   meta/recipes-support/lzop/lzop_1.03.bb      |   27 ++
>   2 files changed, 417 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-support/lzop/lzop/acinclude.m4
>   create mode 100644 meta/recipes-support/lzop/lzop_1.03.bb
>

Merged into OE-Core

Thanks
	Sau!


