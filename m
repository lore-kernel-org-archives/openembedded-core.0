Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD4E71B23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:06:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAQ06HMr022961
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Nov 2016 16:06:17 -0800 (PST)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 25 Nov 2016 16:06:16 -0800
To: Ross Burton <ross.burton@intel.com>,
	<openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1479837333-18054-1-git-send-email-ross.burton@intel.com>
	<1479837333-18054-2-git-send-email-ross.burton@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <486c464b-5757-0788-f722-024b98390d8b@windriver.com>
Date: Fri, 25 Nov 2016 19:06:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479837333-18054-2-git-send-email-ross.burton@intel.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: [PATCH][morty 2/2] Revert "epiphany: remove unnecessary libwnck3 dependency"
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
X-List-Received-Date: Sat, 26 Nov 2016 00:06:19 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Armin,

Probably a US Thanksgiving glitch but...

Morty needs both these patches to have an, err build epiphany.

I don't see a commit on morty or the non-existent morty-next.
What's the plan?

../Randy



Is there a plan to
On 2016-11-22 12:55 PM, Ross Burton wrote:
> This version of epiphany still needs libwnck3.
>
> This reverts commit fb5c4f181176710a4cfb3c875b5edb4e5aa5df73.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-gnome/epiphany/epiphany_3.20.3.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
> index 9115892..eba480b 100644
> --- a/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
> +++ b/meta/recipes-gnome/epiphany/epiphany_3.20.3.bb
> @@ -2,10 +2,11 @@ SUMMARY = "WebKit based web browser for GNOME"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>
> -DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr \
> +DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
>  	   gsettings-desktop-schemas gnome-desktop3 libxml2-native intltool-native"
>
>  inherit gnomebase gsettings distro_features_check upstream-version-is-even
> +# libwnck3 is x11 only
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
> @@ -21,3 +22,4 @@ do_configure_prepend() {
>  FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
>  RDEPENDS_${PN} = "iso-codes adwaita-icon-theme"
>  RRECOMMENDS_${PN} = "ca-certificates"
> +
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

