Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt0ww-0000OL-Mo
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 18:59:58 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2012 09:52:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113364472"
Received: from unknown (HELO [10.255.14.238]) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 09:52:01 -0800
Message-ID: <4F2ACD40.3000002@linux.intel.com>
Date: Thu, 02 Feb 2012 09:52:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <77750FFE-A5A1-426D-A92E-775A8C95FF9A@dominion.thruhere.net>
	<1327512153-30830-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1327512153-30830-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH v2] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Thu, 02 Feb 2012 17:59:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/25/2012 09:22 AM, Eric Bénard wrote:
> the build is actually failing because host g++ and ld are used to
> compile and link
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>
> ---
> v2 : increment INC_PR
>   meta/recipes-qt/qt4/files/configure-lflags.patch   |   18 ------------------
>   .../recipes-qt/qt4/qt-4.7.4/configure-lflags.patch |   18 ++++++++++++++++++
>   .../recipes-qt/qt4/qt-4.8.0/configure-lflags.patch |   18 ++++++++++++++++++
>   meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   10 +++++++---
>   meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |    3 ++-
>   5 files changed, 45 insertions(+), 22 deletions(-)
>   delete mode 100644 meta/recipes-qt/qt4/files/configure-lflags.patch
>   create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/configure-lflags.patch
>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
>

Merged into OE-core

Thanks
	Sau!



