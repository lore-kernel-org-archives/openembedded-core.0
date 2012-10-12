Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TMjR8-0000OU-4i
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 19:54:14 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Oct 2012 10:40:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,577,1344236400"; d="scan'208";a="203820257"
Received: from unknown (HELO [10.255.14.5]) ([10.255.14.5])
	by azsmga001.ch.intel.com with ESMTP; 12 Oct 2012 10:40:57 -0700
Message-ID: <50785628.8060504@linux.intel.com>
Date: Fri, 12 Oct 2012 10:40:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Fri, 12 Oct 2012 17:54:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/12/2012 03:46 AM, Martin Jansa wrote:
> * bitbake uses PACKAGES_DYNAMIC as regexp
>    ^ could make matching faster (and it will be more clear that we're expecting regexp not glob)
>    * made all those last '-' optional, use .* (or nothing)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/classes/kernel.bbclass                              | 6 +++---
>   meta/conf/bitbake.conf                                   | 2 +-
>   meta/recipes-connectivity/connman/connman.inc            | 2 +-
>   meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
>   meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
>   meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
>   meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
>   meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
>   meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
>   meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
>   meta/recipes-graphics/directfb/directfb.inc              | 2 +-
>   meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
>   meta/recipes-graphics/pango/pango.inc                    | 2 +-
>   meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
>   meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
>   meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
>   meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
>   meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
>   meta/recipes-qt/qt4/qt4.inc                              | 2 +-
>   20 files changed, 26 insertions(+), 26 deletions(-)
>
Martin,

Did you do any verification with the buildhistory tools to ensure 
nothing changed in the packaging?

Thanks
	Sau!



