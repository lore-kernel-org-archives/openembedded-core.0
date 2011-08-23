Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvfQF-0004En-ST
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:04:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2011 18:00:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40785863"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 18:00:09 -0700
Message-ID: <4E52FB98.5070907@linux.intel.com>
Date: Mon, 22 Aug 2011 18:00:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313503017.git.anders@chargestorm.se>
In-Reply-To: <cover.1313503017.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 0/5] Miscellaneous fixes: mainly qt- and DISTRO_FEATURES-related
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
X-List-Received-Date: Tue, 23 Aug 2011 01:05:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/16/2011 06:57 AM, Anders Darander wrote:
>
> A series with some miscellaneous fixes/changes.
>
> Patches:
> 0001: make it possible to build qt4 while disabling certain parts of it.
> 0002: A partial sync of qmake_base.bbclass from meta-oe. Hopefully we should
>        be able to delete qmake_base.bbclass from meta-oe after this sync.
> 0003-4: respect wifi and bluetooth in DISTRO_FEATURES while building connman
> 	and ofono.
> 0005: increase the likelihood that a rename and modification is detected,
>        instead of a deleta/add-pair.
>
> Patch 0005 is the patch that is most likely to be controversial. The other
> patches should be of minor impact, and result in a more consistent build
> environment (i.e. better respect for DISTRO_FEATURES).
>
> The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:
>
>    distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)
>
> are available in the git repository at:
>    git://github.com/darander/oe-core qt4-fixes
>    https://github.com/darander/oe-core/tree/qt4-fixes
>
> Anders Darander (5):
>    qt4: allow a reduction in build time
See comments from Richard.

>    qmake_base: add uclibceabi
>    connman: use DISTRO_FEATURES to enable wifi and bluetooth
>    ofono: conditionally enable bluetooth
>    create-pull-request: increase likelihood of detecting a rename
>
>   meta/classes/qmake_base.bbclass                   |    2 +-
>   meta/recipes-connectivity/connman/connman_0.75.bb |    4 ++--
>   meta/recipes-connectivity/ofono/ofono.inc         |    3 ++-
>   meta/recipes-connectivity/ofono/ofono_0.50.bb     |    1 +
>   meta/recipes-connectivity/ofono/ofono_git.bb      |    4 ++++
>   meta/recipes-qt/qt4/qt4.inc                       |   13 ++++++++-----
>   scripts/create-pull-request                       |    2 +-
>   7 files changed, 19 insertions(+), 10 deletions(-)
>
Merged into OE-Core, except for the Qt4 patch as already commented on by 
Richard

Thanks
	Sau!


