Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1U1d8v-00012J-2V
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Feb 2013 14:28:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Feb 2013 05:11:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,590,1355126400"; d="scan'208";a="256754761"
Received: from unknown (HELO [10.255.12.85]) ([10.255.12.85])
	by orsmga001.jf.intel.com with ESMTP; 02 Feb 2013 05:12:28 -0800
Message-ID: <1359810748.26721.0.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 02 Feb 2013 07:12:28 -0600
In-Reply-To: <cover.1359764964.git.tom.zanussi@linux.intel.com>
References: <cover.1359764964.git.tom.zanussi@linux.intel.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] systemtap 'crosstap' fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Feb 2013 13:28:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-02-01 at 18:34 -0600, tom.zanussi@linux.intel.com wrote:
> From: Tom Zanussi <tom.zanussi@linux.intel.com>
> 
> This is a patch to systemtap and fixes a problem where a passed-in
> builddir gets lost in the session copy constructor when connecting
> to remote hosts, resulting in failed script compilation.
> 
> The patch has been submitted upstream but no feedback yet.
> 

Please hold off on this - it works but there may be a better way...

Thanks,

Tom

> The following changes since commit 75f470cd18d693a9a96d9849291c2c8de4dcbeb8:
> 
>   qt4: Add space for _appends (2013-02-01 22:49:47 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-constructor-fix
>   http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/systemtap-constructor-fix
> 
> Tom Zanussi (1):
>   systemtap: make session copy constructor pick up kernel builddir
> 
>  .../systemtap/systemtap/copy-constructor-builddir.patch | 17 +++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.bb          |  2 +-
>  meta/recipes-kernel/systemtap/systemtap_git.inc         |  1 +
>  3 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap/copy-constructor-builddir.patch
> 




