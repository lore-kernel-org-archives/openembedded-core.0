Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3D973E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7P8pVtw008147; Tue, 25 Aug 2015 09:51:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 56-eh6B6KJrC; Tue, 25 Aug 2015 09:51:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7P8pIkG008142
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 25 Aug 2015 09:51:30 +0100
Message-ID: <1440492678.12105.413.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Aug 2015 09:51:18 +0100
In-Reply-To: <16c46495d37fed950d54ef66134e6cb77771e696.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
	<16c46495d37fed950d54ef66134e6cb77771e696.1440454289.git.chris_larson@mentor.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] bitbake.conf: add MIRROR vars to SRC_URI vardeps
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
X-List-Received-Date: Tue, 25 Aug 2015 08:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-24 at 15:18 -0700, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
> 
> Changes to what mirror we happen to fetch from shouldn't cause rebuilds.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/conf/bitbake.conf | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 21f1698..1407c5f 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -581,6 +581,23 @@ SAVANNAH_GNU_MIRROR = "http://download.savannah.gnu.org/releases"
>  SAVANNAH_NONGNU_MIRROR = "http://download.savannah.nongnu.org/releases"
>  CPAN_MIRROR = "http://search.cpan.org/CPAN"
>  
> +SRC_URI[vardeps] += "\
> +    APACHE_MIRROR \
> +    CPAN_MIRROR \
> +    DEBIAN_MIRROR \
> +    GENTOO_MIRROR \
> +    GNOME_GIT \
> +    GNOME_MIRROR \
> +    GNU_MIRROR \
> +    GPE_MIRROR \
> +    KERNELORG_MIRROR \
> +    SAVANNAH_GNU_MIRROR \
> +    SAVANNAH_NONGNU_MIRROR \
> +    SOURCEFORGE_MIRROR \
> +    XLIBS_MIRROR \
> +    XORG_MIRROR \
> +"

Do you mean vardeps here? Don't you want to exclude them?

Cheers,

Richard


