Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RYibr-0003ot-7H
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 19:22:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2011 10:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="84396453"
Received: from unknown (HELO [10.255.12.35]) ([10.255.12.35])
	by orsmga001.jf.intel.com with ESMTP; 08 Dec 2011 10:15:28 -0800
Message-ID: <4EE0FEC0.9060901@linux.intel.com>
Date: Thu, 08 Dec 2011 10:15:28 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323279373.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1323279373.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/2] Qt4 fixes
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
X-List-Received-Date: Thu, 08 Dec 2011 18:22:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/07/2011 09:39 AM, Paul Eggleton wrote:
> A couple of fixes that I took the opportunity to do while I was testing
> building Qt 4.8.0 RC1. (Incidentally I will post the 4.8.0 recipes once
> the release is final, which reportedly should be within the next few
> weeks.)
>
> The following changes since commit 493746f1d7f1410284880203c1ac462d61ab5299:
>
>    matchbox-session-sato: respect VIRTUAL-RUNTIME_initscripts settings (2011-12-07 12:42:22 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/qt4-debug
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-debug
>
> Paul Eggleton (2):
>    qt4: fix debug symbol stripping
>    qt4: various tidy-ups
>
>   .../qt4/files/add_nostrip_for_debug_packages.diff  |   23 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt-4.7.4.inc                   |    4 +--
>   meta/recipes-qt/qt4/qt4-embedded.inc               |    3 +-
>   meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |    2 +-
>   meta/recipes-qt/qt4/qt4-native.inc                 |    3 +-
>   meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |    2 -
>   meta/recipes-qt/qt4/qt4-x11-free.inc               |    4 +-
>   meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |    2 +-
>   meta/recipes-qt/qt4/qt4.inc                        |    6 ++++-
>   9 files changed, 36 insertions(+), 13 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/add_nostrip_for_debug_packages.diff
>
Merged into OE-Core

Thanks
	Sau!


