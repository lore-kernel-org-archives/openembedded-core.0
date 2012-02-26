Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S1TOt-0006k3-MH
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 02:59:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2012 17:51:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111897641"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2012 17:50:44 -0800
Message-ID: <4F498FF4.3000806@linux.intel.com>
Date: Sat, 25 Feb 2012 17:50:44 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330116559.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1330116559.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/2] Pending patches in O.S. Systems' tree
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
X-List-Received-Date: Sun, 26 Feb 2012 01:59:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2012 12:50 PM, Otavio Salvador wrote:
> The following changes since commit 22194a04f224864dd687660e351a3a10da1f06fa:
>
>    scripts/hob: Launch the new hob (2012-02-24 18:05:46 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (2):
>    qt4-native: set headerdir as done in regular builds
>    useradd.bbclass: override USERADDSETSCENEDEPS to empty when building
>      cross packages
>
The useradd change was merged, still reviewing the qt4 one.

Thanks
	Sau!


>   meta/classes/useradd.bbclass       |    1 +
>   meta/recipes-qt/qt4/qt4-native.inc |    3 ++-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>



