Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-05.prod.phx3.secureserver.net
	(p3plsmtpa09-05.prod.phx3.secureserver.net [173.201.193.234])
	by mail.openembedded.org (Postfix) with ESMTP id CA4E77233B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 00:30:58 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-05.prod.phx3.secureserver.net with 
	id PcWx1p00T0BVjqb01cWxVC; Thu, 04 Dec 2014 17:30:58 -0700
Message-ID: <5480FCC1.6050106@pabigot.com>
Date: Thu, 04 Dec 2014 18:30:57 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1417029596.git.pab@pabigot.com>
In-Reply-To: <cover.1417029596.git.pab@pabigot.com>
Subject: Re: [PATCH 0/3] Miscellaneous bluez patches
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
X-List-Received-Date: Fri, 05 Dec 2014 00:30:58 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Ping.  These are independent of the RFC patches.

On 11/26/2014 01:44 PM, Peter A. Bigot wrote:
> These resolve the conflict for provider of hcidump between bluez4 and
> bluez5, provide a new package containing the useful tools in bluez5 that
> upstream doesn't think should be installed, and provides a mechanism for
> enabling the experimental features such as the new GATT interface.
>
> The following changes since commit ab63640fad50954b0440ab107c96dbd3f919ea4d:
>
>    gdk-pixbuf: use ptest-gnome (2014-11-25 13:03:30 +0000)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib pabigot/bluez5
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pabigot/bluez5
>
> Peter A. Bigot (3):
>    bluez-hcidump: select provider as bluez4 or bluez5
>    bluez5: add a package for tools left in the build area
>    bluez5: support experimental through PACKAGECONFIG
>
>   meta/conf/distro/include/default-providers.inc     |  1 +
>   .../bluez/bluez-hcidump_2.5.bb                     |  2 +
>   meta/recipes-connectivity/bluez5/bluez5.inc        | 29 +++++++++++++-
>   meta/recipes-connectivity/bluez5/bluez5_5.25.bb    | 46 ++++++++++++++++++++++
>   4 files changed, 77 insertions(+), 1 deletion(-)
>


