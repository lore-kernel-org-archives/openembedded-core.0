Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVUMA-0003oT-JQ
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:32:47 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Nov 2011 12:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,593,1315206000"; d="scan'208";a="96671591"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 12:25:46 -0800
Message-ID: <4ED53FCA.8000509@linux.intel.com>
Date: Tue, 29 Nov 2011 12:25:46 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
	<2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe-core 10/10] gconf: add polkit to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 20:32:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 06:09 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-gnome/gnome/gconf_3.2.3.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> index aa9da78..907f0ba 100644
> --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> @@ -3,7 +3,7 @@ SECTION = "x11/gnome"
>   LICENSE = "LGPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>
> -DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
> +DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
>
>   PR = "r1"
>

What is this solving? This also would require polkit to have a 
BBCLASSEXTEND with native.

Sau!


