Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T25TQ-000185-Ue
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 21:11:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 11:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,780,1336374000"; d="scan'208";a="181903288"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by azsmga001.ch.intel.com with ESMTP; 16 Aug 2012 11:59:17 -0700
Message-ID: <502D4305.4030405@linux.intel.com>
Date: Thu, 16 Aug 2012 11:59:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344480978.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1344480978.git.wenzong.fan@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] at 3.1.13: get 'at' depends on 'flex-native' explicitly
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
X-List-Received-Date: Thu, 16 Aug 2012 19:11:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2012 07:59 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> 'at' needs flex to generate source file lex.yy.c, but it doesn't
> depend on flex-native directly; This maybe cause a do_compile
> failure if flex-native is not built or included in project.
>
> Error message is:
>      error: lex.yy.c: No such file or directory
>
> Get 'at' depends on flex-native to fix this potential issue.
>
> [YOCTO #2919]
>
> The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:
>
>    foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/2919
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2919
>
> Wenzong Fan (1):
>    at 3.1.13: get 'at' depends on 'flex-native' explicitly
>
>   meta/recipes-extended/at/at_3.1.13.bb |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



