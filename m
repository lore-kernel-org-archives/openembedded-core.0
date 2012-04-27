Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsrL-0000Wl-8i
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:37:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2012 14:28:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="137600212"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2012 14:28:07 -0700
Message-ID: <4F9B0F67.6010708@linux.intel.com>
Date: Fri, 27 Apr 2012 14:28:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334114318.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/3] Important fixes for rc3
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
X-List-Received-Date: Fri, 27 Apr 2012 21:37:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2012 08:19 PM, Otavio Salvador wrote:
> The patches in this set are all important IMO and I do think they
> ought to be included.
>
> The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:
>
>    hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (3):
>    connman: backport test script fixes
>    distrodata.bbclass: fix comment typo
>    flex: backport Debian patches to fix generated code warnings
>
>   meta/classes/distrodata.bbclass                    |    2 +-
>   .../connman/test-set-ipv4-method-api-fix.patch     |   50 +++++++++++++++++
>   .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++
>   meta/recipes-connectivity/connman/connman_0.79.bb  |    4 +
>   .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 ++++++++++++++++++++
>   .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 ++++++++++++++
>   meta/recipes-devtools/flex/flex_2.5.35.bb          |    5 +-
>   7 files changed, 215 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
>   create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
>   create mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
>   create mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
>

Merged into OE-Core

Thanks
	Sau!


