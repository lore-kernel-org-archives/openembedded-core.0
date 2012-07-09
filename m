Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SoHco-0006W6-FS
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:19:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 10:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175125222"
Received: from unknown (HELO [10.255.13.35]) ([10.255.13.35])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2012 10:08:43 -0700
Message-ID: <1341853718.6761.218.camel@trz-ThinkPad-T420>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Mon, 09 Jul 2012 12:08:38 -0500
In-Reply-To: <cover.1341845577.git.bruce.ashfield@windriver.com>
References: <cover.1341845577.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 0/1] linux-yocto: update 3.4 SRCREVs (perf + unionfs fix)
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
X-List-Received-Date: Mon, 09 Jul 2012 17:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 10:59 -0400, Bruce Ashfield wrote:
> Saul/Richard,
> 
> I was waiting on the resend of Tom's perf series to send the updated
> kernel parts for this. That's out, and the kernel parts now need to
> be updated.
> 

There are also perf patches for 3.2 - did I miss the updates for those?

Tom

> I've also staged a unionfs build fix along with the perf updates.
> 
> Cheers,
> 
> Bruce
> 
> cc: Tom Zanussi <tom.zanussi@intel.com>
> 
> The following changes since commit f40ce3e1f4ceebc90b3c058dc82750829149c21d:
> 
>   package_rpm: Avoid duplicate package generation failures (2012-07-09 11:38:02 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib zedd/kernel
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (1):
>   linux-yocto/3.4: perf scripting & unionfs fixes
> 
>  meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
>  meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 




