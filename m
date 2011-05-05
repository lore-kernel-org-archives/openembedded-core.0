Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHwdm-0000e8-Ak for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:22:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BK1BZ010315;
	Thu, 5 May 2011 12:20:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09929-07; Thu,  5 May 2011 12:19:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BJtgP010309
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 May 2011 12:19:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <5811918639835ba1db4567f7c6f7e97ea71eebf9.1304581770.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<5811918639835ba1db4567f7c6f7e97ea71eebf9.1304581770.git.sgw@linux.intel.com>
Date: Thu, 05 May 2011 12:19:54 +0100
Message-ID: <1304594394.20791.18.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Kyle McMartin <kyle@redhat.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kroah-Hartman <gregkh@suse.de>,
	Arnaldo Carvalho de Melo <acme@redhat.com>, Greg,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 19/26] linux-yocto_git.bb: Backport upstream fix for gcc 4.6 compilation
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
X-List-Received-Date: Thu, 05 May 2011 11:22:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-05 at 00:57 -0700, Saul Wold wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../perf-tool-Fix-gcc-4.6.0-issues.patch           |  266 ++++++++++++++++++++
>  meta/recipes-kernel/linux/linux-yocto_git.bb       |    4 +-
>  2 files changed, 269 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
> new file mode 100644
> index 0000000..c3510ad
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
> @@ -0,0 +1,266 @@
> +Backported to linux-yocto kernel git version
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +
> +From patchwork Tue Apr 19 20:09:19 2011
> +Content-Type: text/plain; charset="utf-8"
> +MIME-Version: 1.0
> +Content-Transfer-Encoding: 7bit
> +Subject: [70/70] perf tool: Fix gcc 4.6.0 issues
> +Date: Tue, 19 Apr 2011 20:09:19 -0000
> +From: Greg Kroah-Hartman <gregkh@suse.de>
> +X-Patchwork-Id: 719212
> +Message-Id: <20110419201050.665258193@clark.kroah.org>
> +To: linux-kernel@vger.kernel.org, stable@kernel.org
> +Cc: stable-review@kernel.org, torvalds@linux-foundation.org,
> + akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk,
> + Ingo Molnar <mingo@redhat.com>, Kyle McMartin <kyle@redhat.com>,
> + Arnaldo Carvalho de Melo <acme@redhat.com>, Thomas Meyer <thomas@m3y3r.de>
> +
> +2.6.38-stable review patch.  If anyone has any objections, please let us know.

Bruce, can you confirm that with your SRCREV change, this patch isn't
required as you've integrated it directly?

I've not taken it for now...

Cheers,

Richard



