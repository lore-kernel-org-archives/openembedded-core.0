Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA7275BC6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 11:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B0WGt019955; Fri, 7 Aug 2015 12:00:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QVVxWtHSwd38; Fri,  7 Aug 2015 12:00:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t77B0Fic019931
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Aug 2015 12:00:28 +0100
Message-ID: <1438945214.30467.31.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 07 Aug 2015 06:00:14 -0500
In-Reply-To: <0321088b6ef57a419568c584ef1cc791bb40218b.1438619216.git.alexander.kanavin@linux.intel.com>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>
	<0321088b6ef57a419568c584ef1cc791bb40218b.1438619216.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] distcc: update SRC_URI to not use Google Code
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
X-List-Received-Date: Fri, 07 Aug 2015 11:00:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-08-03 at 19:29 +0300, Alexander Kanavin wrote:
> Google Code is shutting down soon and distcc has moved to github.
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-devtools/distcc/distcc_3.1.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.1.bb
> index e4b9313..8ea3cac 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
> @@ -17,16 +17,14 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
>  
>  RRECOMMENDS_${PN} = "avahi-daemon"
>  
> -SRC_URI = "http://distcc.googlecode.com/files/${BPN}-${PV}.tar.bz2 \
> +SRC_URI = "git://github.com/distcc/distcc.git \
>             file://separatebuilddir.patch \
>             file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
>             file://distccmon-gnome.desktop \
>             file://distcc \
>             file://distcc.service"
> -
> -SRC_URI[md5sum] = "a1a9d3853df7133669fffec2a9aab9f3"
> -SRC_URI[sha256sum] = "f55dbafd76bed3ce57e1bbcdab1329227808890d90f4c724fcd2d53f934ddd89"
> +SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"

Patch application fails in:
https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/418/steps/BuildImages_1/logs/stdio

which makes me wonder how identical these versions really are?

Cheers,

Richard


