Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8F47E669
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 18:09:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5PI94UM005190
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 11:09:04 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 25 Jun 2019 11:09:03 -0700
To: Adrian Bunk <bunk@stusta.de>, <openembedded-core@lists.openembedded.org>
References: <20190625172627.24662-4-bunk@stusta.de>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <8044fe9a-d4f7-9b89-015f-e4008805f831@windriver.com>
Date: Tue, 25 Jun 2019 14:09:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625172627.24662-4-bunk@stusta.de>
X-Originating-IP: [172.25.44.5]
Subject: Re: [PATCH] libnotify: Remove obsolete dependency on dbus-glib
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
X-List-Received-Date: Tue, 25 Jun 2019 18:09:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 6/25/19 1:26 PM, Adrian Bunk wrote:
> Upstream stopped using it in 2010.
> 
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   meta/recipes-gnome/libnotify/libnotify_0.7.8.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> index 82c137ca33..1c9084d919 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
> @@ -4,7 +4,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>   
> -DEPENDS = "dbus gtk+3 dbus-glib"
> +DEPENDS = "dbus gtk+3 glib-2.0"
>   
>   inherit gnomebase gtk-doc distro_features_check gobject-introspection
>   # depends on gtk+3
> 

Nice.

Are you doing a manual inspection and analysis or
something more automated that you can share as a script/workflow?

-- 
# Randy MacLeod
# Wind River Linux

