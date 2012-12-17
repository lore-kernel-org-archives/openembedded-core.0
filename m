Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TkfGZ-0000KM-5R
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 19:18:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Dec 2012 10:03:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,303,1355126400"; d="scan'208";a="232711028"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.212])
	by azsmga001.ch.intel.com with ESMTP; 17 Dec 2012 10:03:30 -0800
Message-ID: <50CF5E72.6000709@linux.intel.com>
Date: Mon, 17 Dec 2012 10:03:30 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1355756780-12826-1-git-send-email-andrei.adrianx.dinu@intel.com>
In-Reply-To: <1355756780-12826-1-git-send-email-andrei.adrianx.dinu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Removed undisplayed picture from connman-gnome
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
X-List-Received-Date: Mon, 17 Dec 2012 18:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/2012 07:06 AM, Andrei Dinu wrote:
> - removed the picture that doesn't display in the
> connman-gnome "about" section.
> - updated the recipe to use the patch when running bitbake
> - created a folder with patches named "connman-gnome",
> the same as for connman.
>
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>   ...oved-icon-from-connman-gnome-about-applet.patch |   33 ++++++++++++++++++++
>   .../connman/connman-gnome_0.7.bb                   |    3 +-
>   2 files changed, 35 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
>
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
> new file mode 100644
> index 0000000..2a05e3c
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
> @@ -0,0 +1,33 @@
> +From 5907a23ad2f49702960a33f9e2039552673eabc7 Mon Sep 17 00:00:00 2001
> +From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +Date: Mon, 17 Dec 2012 14:01:18 +0200
> +Subject: [PATCH] Removed icon from connman-gnome "about" applet
> +
> +The connman-gnome "about" applet showed a picture that
> +can not be displayed. There is no designated picture
> +in connman-gnome to be used in the about section, so
> +it was removed.
> +
> +[OE-Core #2509]
> +
Missing Upstream-Status: tag here, please add and submit v2

Sau!
> +Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> +---
> + applet/main.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/applet/main.c b/applet/main.c
> +index f12d371..c7b3c7f 100644
> +--- a/applet/main.c
> ++++ b/applet/main.c
> +@@ -212,7 +212,7 @@ static void about_callback(GtkWidget *item, gpointer user_data)
> + 			"comments", _("A connection manager for the GNOME desktop"),
> + 			"authors", authors,
> + 			"translator-credits", _("translator-credits"),
> +-			"logo-icon-name", "network-wireless", NULL);
> ++			NULL);
> + }
> +
> + static void settings_callback(GtkWidget *item, gpointer user_data)
> +--
> +1.7.9.5
> +
> diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> index 6cceb2d..1559a9d 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> +++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
> @@ -10,7 +10,8 @@ DEPENDS = "gtk+ dbus-glib"
>
>   # 0.7 tag
>   SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
> -SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git"
> +SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
> +	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch"
>
>   S = "${WORKDIR}/git"
>
>


