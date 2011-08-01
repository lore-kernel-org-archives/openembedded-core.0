Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnw1E-00009d-RY
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 19:11:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2011 10:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,301,1309762800"; d="scan'208";a="34310534"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 10:06:47 -0700
Message-ID: <4E36DD27.8040609@linux.intel.com>
Date: Mon, 01 Aug 2011 10:06:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1311862525.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311862525.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Mon, 01 Aug 2011 17:11:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 07:18 AM, Paul Eggleton wrote:
> Here's a fix as discussed for the PACKAGE_EXTRA_ARCHS issue since the
> tune file changes. It may not be the proper fix but it does at least it
> makes the value of this variable correct again.
>
> The following changes since commit 1fe892ab6876c405599c79657221a8b4675b6ecf:
>
>    Update TERMCMD message to align with previous change (2011-07-27 17:43:27 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/core-pkgarch-fix
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/core-pkgarch-fix
>
> Paul Eggleton (1):
>    bitbake.conf: remove PACKAGE_EXTRA_ARCHS_tune-XXX default
>
>   meta/conf/bitbake.conf |    1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
Pulled into OE-Core
Thanks
	Sau!


