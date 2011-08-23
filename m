Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvfS4-0004MD-C8
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:06:49 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 18:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40786386"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 18:01:52 -0700
Message-ID: <4E52FC00.7030308@linux.intel.com>
Date: Mon, 22 Aug 2011 18:01:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313603220.git.anders@chargestorm.se>
In-Reply-To: <cover.1313603220.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH v3 0/1] Qt4: reduce build time
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
X-List-Received-Date: Tue, 23 Aug 2011 01:06:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 10:47 AM, Anders Darander wrote:
>
> Reduce the build time of qt4-embedded.
>
> V3: * Explicitly check if the phrasebook dir exists, instead of relying on a
>      try-except clause that also would catch other errors.
>
> V2 and earlier was a larger patch series. There were no modifications to this
> patch in V2.
>
> The following changes since commit 2e83e6755441cb14bd907d306974338c15173189:
>
>    kernel: restore crtsavres.o to enable building external modules on powerpc (2011-08-17 15:46:16 +0100)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core qt4-fixes
>    https://github.com/darander/oe-core/tree/qt4-fixes
>
> Anders Darander (1):
>    qt4: allow a reduction in build time
>
>   meta/recipes-qt/qt4/qt4.inc |   13 +++++++------
>   1 files changed, 7 insertions(+), 6 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


