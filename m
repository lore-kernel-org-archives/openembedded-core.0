Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1B75F6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:54:52 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IEsmhs032311; Fri, 18 Oct 2013 15:54:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OFWHluvF8Y8w; Fri, 18 Oct 2013 15:54:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9IEsjeJ032261
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 18 Oct 2013 15:54:47 +0100
Message-ID: <1382108082.29912.550.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: David =?ISO-8859-1?Q?Nystr=F6m?= <david.c.nystrom@gmail.com>
Date: Fri, 18 Oct 2013 15:54:42 +0100
In-Reply-To: <1382018386-25389-11-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
	<1382018386-25389-11-git-send-email-david.nystrom@enea.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/11] nativesdk-packagegroup-sdk-host: Add new DISTRO_FEATURE, sdk-pms
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
X-List-Received-Date: Fri, 18 Oct 2013 14:54:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2013-10-17 at 15:59 +0200, David Nyström wrote:
> Added a new distro feature called sdk-pms, since smartpm rdepends
> on the python runtime.
> This to avoid bloating the SDK tarball for those who does not
> want it.
> 
> Signed-off-by: David Nyström <david.nystrom@enea.com>
> ---
>  meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> index e298ff4..1f45c4c 100644
> --- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
> @@ -16,7 +16,8 @@ RDEPENDS_${PN} = "\
>      nativesdk-qemu-helper \
>      nativesdk-pseudo \
>      nativesdk-unfs-server \
> -    nativesdk-opkg \
> +    ${@base_contains('DISTRO_FEATURES', 'sdk-pms', 'nativesdk-opkg','', d)} \
> +    ${@base_contains('DISTRO_FEATURES', 'sdk-pms', 'nativesdk-smartpm','', d)} \
>      nativesdk-libtool \
>      nativesdk-autoconf \
>      nativesdk-automake \

I think we need to keep a list of DISTRO_FEATURES somewhere along with a
definition about what the feature is supposed to do. For example this is
clearly about power management, right? :)

Along with this addition could you start a list somewhere documenting
this?

Cheers,

Richard



