Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMP79-00045f-Ed
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:35:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2011 11:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2922936"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:32:31 -0700
Message-ID: <4DD2BF3F.8080708@linux.intel.com>
Date: Tue, 17 May 2011 11:32:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305295079.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1305295079.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] Qt4 fixes
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
X-List-Received-Date: Tue, 17 May 2011 18:35:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2011 06:59 AM, Paul Eggleton wrote:
> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>
> These patches update Qt 4.7 series from 4.7.2 to 4.7.3, and make it easier
> for other layers such as meta-oe to enable more SQL drivers.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: paule/qt-4.7.3
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/qt-4.7.3
>
> Thanks,
>      Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>
>
> Paul Eggleton (3):
>    qt4: update from 4.7.2 to 4.7.3
>    distro_tracking_fields.inc: update for qt 4.7.3 upgrade
>    qt4: split out SQL driver config flags to QT_SQL_DRIVER_FLAGS
>
>   .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
>   meta/recipes-qt/qt4/{qt-4.7.2.inc =>  qt-4.7.3.inc} |    5 +--
>   .../0001-Added-Openembedded-crossarch-option.patch |    0
>   .../recipes-qt/qt4/{qt-4.7.2 =>  qt-4.7.3}/g++.conf |    0
>   .../hack-out-pg2-4.7.0.patch                       |    0
>   .../qt4/{qt-4.7.2 =>  qt-4.7.3}/linux.conf          |    0
>   ...qt4-embedded_4.7.2.bb =>  qt4-embedded_4.7.3.bb} |    2 +-
>   ...s-native_4.7.2.bb =>  qt4-tools-native_4.7.3.bb} |    4 +-
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 ----
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb   |    6 ++++
>   ...qt4-x11-free_4.7.2.bb =>  qt4-x11-free_4.7.3.bb} |    2 +-
>   meta/recipes-qt/qt4/qt4.inc                        |    4 ++-
>   12 files changed, 31 insertions(+), 30 deletions(-)
>   rename meta/recipes-qt/qt4/{qt-4.7.2.inc =>  qt-4.7.3.inc} (89%)
>   rename meta/recipes-qt/qt4/{qt-4.7.2 =>  qt-4.7.3}/0001-Added-Openembedded-crossarch-option.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.2 =>  qt-4.7.3}/g++.conf (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.2 =>  qt-4.7.3}/hack-out-pg2-4.7.0.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.2 =>  qt-4.7.3}/linux.conf (100%)
>   rename meta/recipes-qt/qt4/{qt4-embedded_4.7.2.bb =>  qt4-embedded_4.7.3.bb} (87%)
>   rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.2.bb =>  qt4-tools-native_4.7.3.bb} (61%)
>   delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
>   create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.3.bb
>   rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.2.bb =>  qt4-x11-free_4.7.3.bb} (88%)
>

Merged into oe-core and poky

Thanks
	Sau!



