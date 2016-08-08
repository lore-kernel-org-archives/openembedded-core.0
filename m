Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE92977142
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u785tkNQ000488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 7 Aug 2016 22:55:47 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 7 Aug 2016 22:55:46 -0700
To: <openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1469609666.git.liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57A81EE0.5020909@windriver.com>
Date: Mon, 8 Aug 2016 13:55:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1469609666.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH V2 0/9] Fix udev dirs
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
X-List-Received-Date: Mon, 08 Aug 2016 05:55:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

Do you have any comments please ?

// Robert

On 07/27/2016 05:27 PM, Robert Yang wrote:
> * V2
>    - lib/udev/rules.d -> lib/udev in bitbake.conf
>    - Remove duplicated udev setting for more recipes
>
> // Robert
>
> The following changes since commit b32d430c3c7dccf3a8d06ab492d648893a05950f:
>
>    dpkg: use snapshot.debian.org for SRC_URI (2016-07-26 08:56:08 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/udev
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/udev
>
> Robert Yang (9):
>    bitbake.conf: add eudev's udevdir to FILES_${PN}
>    systemd: install udev.pc
>    libinput: fix udevdir
>    ofono: remove duplicated udev setting from FILES_${PN}
>    mdadm: remove duplicated udev setting from FILES_${PN}
>    xf86-input-vmmouse: remove duplicated udev setting from FILES_${PN}
>    eudev: don't move udev directory
>    pcmciautils: remove duplicated udev setting from FILES_${PN}
>    bluez5: remove duplicated udev setting from FILES_${PN}
>
>   meta/conf/bitbake.conf                                         |  3 ++-
>   meta/recipes-bsp/pcmciautils/pcmciautils_018.bb                |  2 --
>   meta/recipes-connectivity/bluez5/bluez5.inc                    |  2 +-
>   meta/recipes-connectivity/ofono/ofono.inc                      |  2 +-
>   meta/recipes-core/systemd/systemd_230.bb                       |  2 ++
>   meta/recipes-core/udev/eudev_3.2.bb                            | 10 +---------
>   meta/recipes-extended/mdadm/mdadm_3.4.bb                       |  2 --
>   meta/recipes-graphics/wayland/libinput_1.3.0.bb                |  4 +++-
>   meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.1.0.bb |  2 +-
>   9 files changed, 11 insertions(+), 18 deletions(-)
>

