Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1433D610F5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 08:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F8vQ4t018223; Fri, 15 Aug 2014 09:57:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cbRRPjdjduCc; Fri, 15 Aug 2014 09:57:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7F8vNNZ018220
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 15 Aug 2014 09:57:25 +0100
Message-ID: <1408093044.21596.8.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Fri, 15 Aug 2014 09:57:24 +0100
In-Reply-To: <1408070991-31581-1-git-send-email-Chong.Lu@windriver.com>
References: <1408070991-31581-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] librsvg-native: add --disable-Bsymbolic to configure
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
X-List-Received-Date: Fri, 15 Aug 2014 08:57:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-15 at 10:49 +0800, Chong Lu wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
> 
> The older ld on the host doesn't have the -Bsymbolic-functions option,
> for example, the one on CentOs 5.x, we can disable it for native.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.40.2.bb |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> index 34d8ca1..6d9fd53 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.40.2.bb
> @@ -21,6 +21,7 @@ SRC_URI[archive.md5sum] = "acdecdb9f08f3bf662a68bf7dafb8b82"
>  SRC_URI[archive.sha256sum] = "48049b643294636df7de1a4b997414d699666f5dc44776945c218a257d2a291c"
>  
>  EXTRA_OECONF = "--disable-introspection --disable-vala"
> +EXTRA_OECONF_append_class-native = " --disable-Bsymbolic"
>  
>  PACKAGECONFIG ??= "gdkpixbuf"
>  # The gdk-pixbuf loader
> -

This kind of thing needs a comment explaining why we need it, preferably
giving an example of a host where there is this problem (as well as
binutils version?).

Cheers,

Richard


