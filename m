Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvfSb-0004Rg-Qx
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:07:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 18:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40786556"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 18:02:35 -0700
Message-ID: <4E52FC2B.8020208@linux.intel.com>
Date: Mon, 22 Aug 2011 18:02:35 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313598136.git.josh@linux.intel.com>
In-Reply-To: <cover.1313598136.git.josh@linux.intel.com>
Subject: Re: [PATCH 0/1] Disable dtrace and system tap for glib-2.0-native
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
X-List-Received-Date: Tue, 23 Aug 2011 01:07:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 09:24 AM, Joshua Lock wrote:
> Per discussion on the Yocto mailing list:
> https://lists.yoctoproject.org/pipermail/yocto/2011-August/004571.html
>
> Regards,
> Joshua
>
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
>
>    kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib josh/work
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=josh/work
>
> Joshua Lock (1):
>    glib-2.0: explicitly disable dtrace and systemtap for native varaint
>
>   meta/recipes-core/glib-2.0/glib.inc |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


