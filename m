Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNfa-0005cA-Jh
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:35:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2012 17:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="169162785"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2012 17:23:56 -0700
Message-ID: <5009F698.90201@linux.intel.com>
Date: Fri, 20 Jul 2012 17:23:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342714666-7951-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1342714666-7951-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] webkit-gtk: bump PR
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
X-List-Received-Date: Sat, 21 Jul 2012 00:35:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 09:17 AM, Ross Burton wrote:
> Accidently ommitted the PR bump from the previous patches, which change the
> build.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> index 180861e..0cc167b 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> @@ -15,6 +15,8 @@ DEPENDS = "zlib enchant gnome-keyring libsoup-2.4 curl libxml2 cairo libxslt lib
>              gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
>   DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
>
> +PR = "r1"
> +
>   SRC_URI = "\
>     http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
>     file://nodolt.patch \
>

Merged into OE-Core

Thanks
	Sau!


