Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T90zv-0003bv-NN
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 23:49:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2012 14:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,369,1344236400"; d="scan'208";a="188895544"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2012 14:37:04 -0700
Message-ID: <50467480.3070703@linux.intel.com>
Date: Tue, 04 Sep 2012 14:37:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1346776916.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346776916.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Package group fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 21:49:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2012 09:43 AM, Paul Eggleton wrote:
> Fix a couple of things missed in the package group changes.
>
>
> The following changes since commit 92f8605b81d373b66224b15355226f93ac5b3a46:
>
>    udev: Remove files moved to udev-extraconf (2012-09-04 15:41:01 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/packagegroup-fixes
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/packagegroup-fixes
>
> Paul Eggleton (2):
>    packagegroup-core-standalone-gmae-sdk-target: allow dbg package
>    packagegroup-*: add RREPLACES/RCONFLICTS
>
>   .../packagegroups/packagegroup-core-boot.bb        |    4 +++-
>   .../packagegroups/packagegroup-core-nfs.bb         |    4 +++-
>   .../packagegroups/packagegroup-core-sdk.bb         |    4 +++-
>   .../packagegroup-core-ssh-dropbear.bb              |    4 +++-
>   .../packagegroups/packagegroup-core-ssh-openssh.bb |    4 +++-
>   .../packagegroup-core-standalone-sdk-target.bb     |    6 +++++-
>   .../packagegroups/packagegroup-core-tools-debug.bb |    4 +++-
>   .../packagegroup-core-tools-profile.bb             |    4 ++++
>   .../packagegroup-core-tools-testapps.bb            |    4 ++++
>   .../packagegroup-core-device-devel.bb              |    3 +++
>   .../packagegroups/packagegroup-core-sdk-gmae.bb    |    4 +++-
>   ...packagegroup-core-standalone-gmae-sdk-target.bb |    6 +++---
>   .../packagegroups/packagegroup-core-clutter.bb     |    4 +++-
>   .../packagegroup-core-gtk-directfb.bb              |    4 +++-
>   .../packagegroups/packagegroup-core-x11-base.bb    |    4 +++-
>   .../packagegroups/packagegroup-core-qt.bb          |    4 +++-
>   .../packagegroups/packagegroup-core-qt4e.bb        |    4 +++-
>   .../packagegroups/packagegroup-core-x11-sato.bb    |    4 +++-
>   18 files changed, 58 insertions(+), 17 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



