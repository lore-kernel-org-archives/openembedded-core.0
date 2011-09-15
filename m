Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R4FuK-0006HJ-De
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 19:39:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2011 10:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48827972"
Received: from unknown (HELO [10.255.14.252]) ([10.255.14.252])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2011 10:34:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Date: Thu, 15 Sep 2011 10:34:15 -0700
In-Reply-To: <1315685266-16987-1-git-send-email-eric@eukrea.com>
References: <1315685266-16987-1-git-send-email-eric@eukrea.com>
Organization: Yocto Project / OTC / Intel
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1316108055.1058.81.camel@swold-mobl.bigsur.com>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4: add blacklist-diginotar-certs patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: sgw@linux.intel.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 15 Sep 2011 17:39:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2011-09-10 at 22:07 +0200, Eric Bénard wrote:
> - this patch comes from Nokia and blacklist all DigiNotar intermediates
> and root certificates, more details are available here :
> http://labs.qt.nokia.com/2011/09/07/what-the-diginotar-security-breach-means-for-qt-users-continued/
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  .../qt4/files/blacklist-diginotar-certs.diff       |   95 ++++++++++++++++++++
>  meta/recipes-qt/qt4/qt-4.7.3.inc                   |    1 +
>  meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>  meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
>  meta/recipes-qt/qt4/qt4-native_4.7.3.bb            |    2 +
>  meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |    2 +-
>  meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    2 +
>  meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>  8 files changed, 104 insertions(+), 4 deletions(-)
>  create mode 100644 meta/recipes-qt/qt4/files/blacklist-diginotar-certs.diff
> 

Merged this into OE-Core

Thanks
	Sau!



