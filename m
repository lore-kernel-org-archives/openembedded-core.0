Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RZ60q-0006V0-K2
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:21:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2011 11:14:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84795270"
Received: from unknown (HELO envy.home) ([10.255.12.30])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2011 11:14:48 -0800
Message-ID: <4EE25E38.3060704@linux.intel.com>
Date: Fri, 09 Dec 2011 11:15:04 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
In-Reply-To: <e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.3
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
X-List-Received-Date: Fri, 09 Dec 2011 19:21:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/08/2011 07:40 AM, Otavio Salvador wrote:
> This unify recipes for target and native builds and also drops the the
> already merged patches.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../dosfstools/dosfstools-native_2.10.bb           |   19 -----
>  .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 -------------------
>  .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 --------------------
>  .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++++++++----------
>  .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++++---------
>  .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 ------
>  .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
>  7 files changed, 69 insertions(+), 261 deletions(-)
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
>  delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
> 

> diff --git a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch b/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
> deleted file mode 100644
> index 4460f06..0000000
> --- a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -Only use the system's llseek().
> -
> -Upstream-Status: Inappropriate [licensing]
> -We're tracking an old release of dosfstools due to licensing issues.

What are these licensing issues, and are they no longer an issue?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


