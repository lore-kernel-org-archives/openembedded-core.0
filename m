Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R9b1g-0005Ur-MN for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 13:13:08 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBE3et012773 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:14:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T4mEyHhPwccI
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:14:03 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8UBE0Bx012768
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 12:14:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 12:07:34 +0100
In-Reply-To: <5dce142f3cf11663cd9cbac9165daa571107cc0c.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
	<5dce142f3cf11663cd9cbac9165daa571107cc0c.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317380861.12332.155.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 05/13] default-providers: define PREFERRED_PROVIDER_virtual/libx11-native
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
X-List-Received-Date: Fri, 30 Sep 2011 11:13:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-30 at 09:27 +0200, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/default-providers.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index d51ac64..7ff7891 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -9,6 +9,7 @@ PREFERRED_PROVIDER_virtual/libgl ?= "mesa-xlib"
>  PREFERRED_PROVIDER_virtual/update-alternatives ?= "update-alternatives-cworth"
>  PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-native"
>  PREFERRED_PROVIDER_virtual/libx11 ?= "libx11-trim"
> +PREFERRED_PROVIDER_virtual/libx11-native ?= "libx11-native"
>  PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"

This is a symptom of a problem. Why do we need libx11-trim-native and
libx11-diet-native?

If the BBCLASSEXTEND is in the right place we don't have this problem...

Cheers,

Richard



