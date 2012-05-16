Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUiwD-0007nX-6r
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:27:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 11:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="144793665"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2012 11:16:59 -0700
Message-ID: <4FB3EF1A.40300@linux.intel.com>
Date: Wed, 16 May 2012 21:16:58 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337035611.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1337035611.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] runqemu: fix the tests for core-image-*
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
X-List-Received-Date: Wed, 16 May 2012 18:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2012 01:49 AM, Peter Seebach wrote:
> This replaces the =~ tests with a dash-friendly shell idiom which is,
> IMHO, comparably readable (I actually like it better) and also works
> on more versions of bash.
>
> A side note:  Do we really need a more complicated test instead of
> just "*core-image-*"?
>
> The following changes since commit 36d1717e2ad4ca1620ee9f01b524b5ff2f499b26:
>    Paul Eggleton (1):
>          classes/rootfs_*: fix splitting package dependency strings
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib seebs/cleanup
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/cleanup
>
> Peter Seebach (1):
>    runqemu: replace bashism with working shell idiom
>
>   scripts/runqemu |   13 +++++++------
>   1 files changed, 7 insertions(+), 6 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Thanks
	Sau!


