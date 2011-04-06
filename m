Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7aPw-0002ZO-7X
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 23:37:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Apr 2011 14:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,312,1299484800"; d="scan'208";a="624659297"
Received: from unknown (HELO [10.255.12.228]) ([10.255.12.228])
	by orsmga002.jf.intel.com with ESMTP; 06 Apr 2011 14:35:27 -0700
Message-ID: <4D9CDC9E.6090009@linux.intel.com>
Date: Wed, 06 Apr 2011 14:35:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1302101718.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1302101718.git.paul.eggleton@linux.intel.com>
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 0/2] Update Qt4 to 4.7.2, security update
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
X-List-Received-Date: Wed, 06 Apr 2011 21:37:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2011 07:57 AM, Paul Eggleton wrote:
> From: Paul Eggleton<paul.eggleton@linux.intel.com>
>
> Move Qt 4.7.x from 4.7.1 to 4.7.2 and apply security patch from OE.
>
Paul could you please create or update the distro_tracking_fields.inc 
file. Entries are needed for each recipe that has a distinct PN.

Please refer to this wiki page for details: 
https://wiki.yoctoproject.org/wiki/Best_Known_Methods_%28BKMs%29_for_Package_Updating#Distro_Tracking_Fields

Thanks
	Sau!


> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: paule/qt-4.7.2
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt-4.7.2
>
> Thanks,
>      Paul Eggleton<paul.eggleton@linux.intel.com>
> ---
>
>
> Denys Dmytriyenko (1):
>    qt4: security advisory - blacklist fraudulent comodo certificates
>
> Paul Eggleton (1):
>    qt4: replace 4.7.1 with version 4.7.2
>
>   ...klist-fraudulent-comodo-certificates-patch.diff |  134 ++++++++++++++++++++
>   meta/recipes-qt/qt4/qt-4.6.3.inc                   |    1 +
>   meta/recipes-qt/qt4/{qt-4.7.1.inc =>  qt-4.7.2.inc} |    5 +-
>   .../0001-Added-Openembedded-crossarch-option.patch |    0
>   .../recipes-qt/qt4/{qt-4.7.1 =>  qt-4.7.2}/g++.conf |    0
>   .../hack-out-pg2-4.7.0.patch                       |    0
>   .../qt4/{qt-4.7.1 =>  qt-4.7.2}/linux.conf          |    0
>   meta/recipes-qt/qt4/qt4-embedded_4.6.3.bb          |    2 +-
>   ...qt4-embedded_4.7.1.bb =>  qt4-embedded_4.7.2.bb} |    0
>   ...s-native_4.7.1.bb =>  qt4-tools-native_4.7.2.bb} |    4 +-
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb   |    6 -
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb   |    6 +
>   meta/recipes-qt/qt4/qt4-x11-free_4.6.3.bb          |    2 +-
>   ...qt4-x11-free_4.7.1.bb =>  qt4-x11-free_4.7.2.bb} |    0
>   14 files changed, 148 insertions(+), 12 deletions(-)
>   create mode 100644 meta/recipes-qt/qt4/files/blacklist-fraudulent-comodo-certificates-patch.diff
>   rename meta/recipes-qt/qt4/{qt-4.7.1.inc =>  qt-4.7.2.inc} (89%)
>   rename meta/recipes-qt/qt4/{qt-4.7.1 =>  qt-4.7.2}/0001-Added-Openembedded-crossarch-option.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.1 =>  qt-4.7.2}/g++.conf (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.1 =>  qt-4.7.2}/hack-out-pg2-4.7.0.patch (100%)
>   rename meta/recipes-qt/qt4/{qt-4.7.1 =>  qt-4.7.2}/linux.conf (100%)
>   rename meta/recipes-qt/qt4/{qt4-embedded_4.7.1.bb =>  qt4-embedded_4.7.2.bb} (100%)
>   rename meta/recipes-qt/qt4/{qt4-tools-native_4.7.1.bb =>  qt4-tools-native_4.7.2.bb} (61%)
>   delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.1.bb
>   create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.2.bb
>   rename meta/recipes-qt/qt4/{qt4-x11-free_4.7.1.bb =>  qt4-x11-free_4.7.2.bb} (100%)
>
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>



