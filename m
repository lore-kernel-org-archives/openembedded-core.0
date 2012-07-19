Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrlZA-0006Oh-3m
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 09:54:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 00:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168352615"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 00:43:09 -0700
Message-ID: <5007BA8C.2070302@linux.intel.com>
Date: Thu, 19 Jul 2012 00:43:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342550573.git.ross.burton@intel.com>
In-Reply-To: <cover.1342550573.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/2] WebKit fixes
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
X-List-Received-Date: Thu, 19 Jul 2012 07:54:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/17/2012 11:44 AM, Ross Burton wrote:
> Fix up a warning, and make compilation fast again.
>
> This may cause failures when doing a parallel build due to a GNU Make bug,
> but it's harder to replicate than originally thought (I can't replicate it
> anymore).  If we get failures again hopefully we'll be able to work out what
> the real cause is.
>
> The following changes since commit 219a855f99bc45fd273f62df9507be7223eff1b4:
>
>    useradd.bbclass: Fix for multilib builds (2012-07-17 10:56:26 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/webkit
>
> for you to fetch changes up to 66df0bb01e0162d51bb20b03d11157d42a057563:
>
>    webkit-gtk: remove spurious install_prepend hack (2012-07-17 19:41:43 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (2):
>        webkit-gtk: remove no-parallel bodge
>        webkit-gtk: remove spurious install_prepend hack
>
>   meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    9 ---------
>   1 file changed, 9 deletions(-)

> Ross Burton (2):
>    webkit-gtk: remove no-parallel bodge
>    webkit-gtk: remove spurious install_prepend hack
>
>   meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    9 ---------
>   1 file changed, 9 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


