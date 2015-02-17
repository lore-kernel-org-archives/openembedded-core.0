Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-10.prod.phx3.secureserver.net
	(p3plsmtpa08-10.prod.phx3.secureserver.net [173.201.193.111])
	by mail.openembedded.org (Postfix) with ESMTP id E2FC47182C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 12:17:19 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-10.prod.phx3.secureserver.net with 
	id tQHK1p0040BVjqb01QHKq3; Tue, 17 Feb 2015 05:17:20 -0700
Message-ID: <54E33153.2000601@pabigot.com>
Date: Tue, 17 Feb 2015 06:17:23 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, 
	"Iorga, Cristian" <cristian.iorga@intel.com>
References: <cover.1424098977.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1424098977.git.cristian.iorga@intel.com>
Subject: Re: [PATCH 00/11] BlueZ 5 as bluetooth alternative stack
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Feb 2015 12:17:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2015 09:06 AM, Cristian Iorga wrote:
> Based on Peter A. Bigot Bluez5 switch patchset.
> Full credit given to original authors.
> Some changes/adaptations needed, all doneand implemented by Cristian Iorga.

I ran this through a build with no problems.  For the record, the 
changes I detected in my patches were fixing a connman RDEPENDS I 
somehow missed, and enabling bluez5 in ofono and gstreamer1.0-plugins-bad.

Thanks for pushing this through.

Peter
> Tested with each Bluetooth stack provider.
>
> The following changes since commit 6ae933b75c1c34a9d39e1aff0a0cb26a7ce4677f:
>
>    bitbake: tests/fetch.py: latest_versionstring add set of PN (2015-02-16 09:13:06 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ciorga/bluez5_switch_t2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/bluez5_switch_t2
>
> Cristian Iorga (1):
>    conf/distro/include/default-providers: updated bluez-hcidump providers
>
> Peter A. Bigot (9):
>    bluetooth.bbclass: simplify recipe inference of bluetooth provider
>    packagegroup-base: select distro preference for bluez provider
>    pulseaudio: select distro preference for bluez provider
>    qt-mobility: select distro preference for bluez provider
>    neard: select distro preference for bluez provider
>    libpcap: select distro preference for bluez provider
>    ofono: select distro preference for bluez provider
>    gstreamer1.0-plugins-bad: select distro preference for bluez provider
>    connman: depend on distro provider of bluez
>
> Richard Purdie (1):
>    default-providers: Set the preferred provider for bluez based on
>      version
>
>   meta/classes/bluetooth.bbclass                             | 14 ++++++++++++++
>   meta/conf/distro/include/default-providers.inc             |  4 ++--
>   meta/recipes-connectivity/connman/connman.inc              |  8 +++++---
>   meta/recipes-connectivity/libpcap/libpcap.inc              |  6 ++++--
>   meta/recipes-connectivity/neard/neard.inc                  |  4 ++--
>   meta/recipes-connectivity/ofono/ofono.inc                  |  6 +++---
>   meta/recipes-core/packagegroups/packagegroup-base.bb       |  3 ++-
>   .../gstreamer/gstreamer1.0-plugins-bad.inc                 |  4 ++--
>   .../gstreamer/gstreamer1.0-plugins-bad_git.bb              |  1 -
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc          |  4 ++--
>   meta/recipes-qt/qt4/qt-mobility_1.2.0.inc                  |  6 ++++--
>   11 files changed, 40 insertions(+), 20 deletions(-)
>   create mode 100644 meta/classes/bluetooth.bbclass
>


