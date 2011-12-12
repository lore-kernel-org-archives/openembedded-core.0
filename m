Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RaFCT-0008Qs-Rr
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 00:22:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2011 15:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="86465061"
Received: from unknown (HELO [10.255.12.64]) ([10.255.12.64])
	by orsmga002.jf.intel.com with ESMTP; 12 Dec 2011 15:15:29 -0800
Message-ID: <4EE68B10.8010201@linux.intel.com>
Date: Mon, 12 Dec 2011 15:15:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
In-Reply-To: <e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 2/3] dosfstools: update native to 2.11
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
X-List-Received-Date: Mon, 12 Dec 2011 23:22:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2011 07:40 AM, Otavio Salvador wrote:
> This unify recipes for target and native builds and also drops the the
> already merged patches.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   .../dosfstools/dosfstools-native_2.10.bb           |   19 -----
>   .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 -------------------
>   .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 --------------------
>   .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++++++++----------
>   .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++++---------
>   .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 ------
>   .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
>   7 files changed, 69 insertions(+), 261 deletions(-)
>   delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
>   delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
>   delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
>   delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb

Merged into OE-Core

Thanks
	Sau!



