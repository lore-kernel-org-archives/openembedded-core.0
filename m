Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ss4cs-0000eF-G5
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 06:15:38 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jul 2012 21:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="170666670"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by azsmga001.ch.intel.com with ESMTP; 19 Jul 2012 21:04:14 -0700
Message-ID: <5008D8BE.70600@linux.intel.com>
Date: Thu, 19 Jul 2012 21:04:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1342699470.git.ross.burton@intel.com>
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
Subject: Re: [PATCH 0/3] Remove eggdbus
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
X-List-Received-Date: Fri, 20 Jul 2012 04:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 05:05 AM, Ross Burton wrote:
> eggdbus isn't actually used anything anymore, so remove the dependencies and
> delete the package.
>
> The following changes since commit 09d11c2794f445a4311f6cba3fdd79bfc216abc5:
>
>    package_ipk.bbclass: Fix python whitespace (2012-07-19 12:24:50 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ross/eggdbus
>
> for you to fetch changes up to c45181c5fcaee663c5ade1c81c78efd81fbd9875:
>
>    eggdbus: remove, nothing uses it (2012-07-19 13:01:51 +0100)
>
> ----------------------------------------------------------------
> Ross Burton (3):
>        libgnome-keyring: remove eggdbus dependency, it has an in-tree copy
>        polkit: remove dbus-glib and eggdbus dependencies, polkit uses gio for DBus
>        eggdbus: remove, nothing uses it
>
>   meta/conf/multilib.conf                            |    1 -
>   meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |   34 --------------------
>   meta/recipes-core/eggdbus/eggdbus/marshal.patch    |   28 ----------------
>   meta/recipes-core/eggdbus/eggdbus_0.6.bb           |   31 ------------------
>   meta/recipes-extended/polkit/polkit_0.104.bb       |    4 +--
>   .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 +--
>   6 files changed, 4 insertions(+), 98 deletions(-)
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus/marshal.patch
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus_0.6.bb
>
> Ross Burton (3):
>    libgnome-keyring: remove eggdbus dependency, it has an in-tree copy
>    polkit: remove dbus-glib and eggdbus dependencies, polkit uses gio
>      for DBus
>    eggdbus: remove, nothing uses it
>
>   meta/conf/multilib.conf                            |    1 -
>   meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch    |   34 --------------------
>   meta/recipes-core/eggdbus/eggdbus/marshal.patch    |   28 ----------------
>   meta/recipes-core/eggdbus/eggdbus_0.6.bb           |   31 ------------------
>   meta/recipes-extended/polkit/polkit_0.104.bb       |    4 +--
>   .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 +--
>   6 files changed, 4 insertions(+), 98 deletions(-)
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus/gtk-doc.patch
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus/marshal.patch
>   delete mode 100644 meta/recipes-core/eggdbus/eggdbus_0.6.bb
>

Merged into OE-Core

Nice cleanup!

Thanks
	Sau!


