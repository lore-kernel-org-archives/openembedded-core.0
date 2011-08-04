Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qoz8N-0003Fc-BI
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:42:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 07:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="34408759"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 07:38:26 -0700
Message-ID: <4E3AAEE2.8@linux.intel.com>
Date: Thu, 04 Aug 2011 07:38:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311921799-28859-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1311921799-28859-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] polkit: depend on intltool-native instead of intltool
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
X-List-Received-Date: Thu, 04 Aug 2011 14:42:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 11:43 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   meta/recipes-extended/polkit/polkit_0.101.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
> index 64cca10..f3a6f1c 100644
> --- a/meta/recipes-extended/polkit/polkit_0.101.bb
> +++ b/meta/recipes-extended/polkit/polkit_0.101.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
>
>   PAM_SRC_URI = "file://polkit-1_pam.patch"
>   PR = "r1"
> -DEPENDS = "libpam expat dbus-glib eggdbus intltool"
> +DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
>   RDEPENDS_${PN} = "libpam"
>   EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
>

Merged into OE-Core

Thanks
	Sau!


