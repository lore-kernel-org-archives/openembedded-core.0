Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRQnQ-0002TV-Bw
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:28:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 May 2012 09:18:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="150158249"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by fmsmga001.fm.intel.com with ESMTP; 07 May 2012 09:18:32 -0700
Message-ID: <4FA7F5D8.9060505@linux.intel.com>
Date: Mon, 07 May 2012 09:18:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335734193.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 0/3] glib-2.0, gobject-introspection, libsoup-2.4 upgrade
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
X-List-Received-Date: Mon, 07 May 2012 16:28:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2012 02:27 PM, Martin Jansa wrote:
> Tested on my images and fixed failing recipe, mostly it's about including header files like:
> glib-2.0/glib/gthread.h:28:2: error: #error "Only<glib.h>  can be included directly."
>
> The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:
>
>    bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME (2012-04-26 10:59:20 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull2
>
> Martin Jansa (3):
>    glib-2.0: upgrade to 2.32.1
>    gobject-introspection: upgrade to 1.32.1
>    libsoup-2.4: upgrade to 2.38.1
>
>   .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 ++++++++++++++------
>   .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
>   .../{glib-2.0_2.30.3.bb =>  glib-2.0_2.32.1.bb}     |    6 +--
>   meta/recipes-core/glib-2.0/glib.inc                |    2 +-
>   ..._1.31.20.bb =>  gobject-introspection_1.32.1.bb} |   13 +++--
>   ...libsoup-2.4_2.36.1.bb =>  libsoup-2.4_2.38.1.bb} |    8 ++--
>   6 files changed, 53 insertions(+), 54 deletions(-)
>   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
>   rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb =>  glib-2.0_2.32.1.bb} (91%)
>   rename meta/recipes-gnome/gnome/{gobject-introspection_1.31.20.bb =>  gobject-introspection_1.32.1.bb} (52%)
>   rename meta/recipes-support/libsoup/{libsoup-2.4_2.36.1.bb =>  libsoup-2.4_2.38.1.bb} (55%)
>

Merged into OE-Core

Thanks
	Sau!


