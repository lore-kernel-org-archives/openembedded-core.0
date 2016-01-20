Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7548A60616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K9JmTO009608; Wed, 20 Jan 2016 09:19:48 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4V0pCzhDaXCc; Wed, 20 Jan 2016 09:19:48 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K9Jiob009604
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Jan 2016 09:19:46 GMT
Message-ID: <1453281584.27999.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 09:19:44 +0000
In-Reply-To: <464df82b2db7df048ad9d9e6b2bea6841023bbf9.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
	<464df82b2db7df048ad9d9e6b2bea6841023bbf9.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/9] python-nose: upgrade to 1.3.7
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
X-List-Received-Date: Wed, 20 Jan 2016 09:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-01-19 at 21:56 +0000, Alejandro Hernandez wrote:
> Updates runtime dependencies, python-nose now depends on unittest.
> 
> Signed-off-by: Alejandro Hernandez <
> alejandro.hernandez@linux.intel.com>
> ---
>  .../python/{python-nose_1.3.6.bb => python-nose_1.3.7.bb}         |
> 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python-nose_1.3.6.bb => python
> -nose_1.3.7.bb} (75%)
> 
> diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb
> b/meta/recipes-devtools/python/python-nose_1.3.7.bb
> similarity index 75%
> rename from meta/recipes-devtools/python/python-nose_1.3.6.bb
> rename to meta/recipes-devtools/python/python-nose_1.3.7.bb
> index d9daea2..ec6158f 100644
> --- a/meta/recipes-devtools/python/python-nose_1.3.6.bb
> +++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "
> file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
>  
>  SRC_URI = "
> http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
>  
> -SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
> -SRC_URI[sha256sum] =
> "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
> +SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
> +SRC_URI[sha256sum] =
> "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
>  
>  UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
>  UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
> @@ -17,4 +17,8 @@ S = "${WORKDIR}/nose-${PV}"
>  
>  inherit setuptools
>  
> +RDEPENDS_${PN} = "\
> +  python-unittest \
> +  "
> +

This triggers:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'python-unittest-native' (but virtual:native:/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/meta/recipes-devtools/python/python-nose_1.3.7.bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'python-unittest-native' is unbuildable, removing...

https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/595/steps/BuildImages/logs/stdio

in a universe -c fetch.

Cheers,

Richard

