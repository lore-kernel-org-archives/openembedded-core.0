Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QU0wk-000832-3M
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 20:24:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2011 11:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,333,1304319600"; d="scan'208";a="10305757"
Received: from unknown (HELO [10.255.13.55]) ([10.255.13.55])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2011 11:20:51 -0700
Message-ID: <4DEE6C02.6000906@linux.intel.com>
Date: Tue, 07 Jun 2011 11:20:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1307042670.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1307042670.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/4] Pending patches from O.S. Systems tree
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
X-List-Received-Date: Tue, 07 Jun 2011 18:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2011 12:25 PM, Otavio Salvador wrote:
> The following changes since commit 2a52f806f3789f717219651b97dc64fec3881f7f:
>
>    qmake_base.bbclass: fix lrelease/lupdate binary names (2011-06-02 18:26:19 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/master
>
> Otavio Salvador (4):
>    xf86-driver-common.inc: remove .la files to avoid unpackaged warning
>    gnutls: use INC_PR on 2.12.5 version recipe
>    gnutls: add p11tool into gnutls-bin
These three were merged thanks
>    package.bbclass: add support to split Qt translation files
>
There was some discussion about this patch, please resubmit when you 
have addressed those issues.

Thanks
	Sau!

>   meta/classes/package.bbclass                       |   41 ++++++++++++++++++--
>   .../xorg-driver/xf86-driver-common.inc             |    6 ++-
>   meta/recipes-support/gnutls/gnutls.inc             |    3 +-
>   meta/recipes-support/gnutls/gnutls_2.12.5.bb       |    2 +-
>   4 files changed, 45 insertions(+), 7 deletions(-)
>


