Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E58806D885
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 10:47:31 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACAlRCp008924; Tue, 12 Nov 2013 10:47:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZEczkc8oLUWH; Tue, 12 Nov 2013 10:47:27 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rACAlMR6008919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Nov 2013 10:47:25 GMT
Message-ID: <1384253239.6460.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joe Slater <jslater@windriver.com>
Date: Tue, 12 Nov 2013 10:47:19 +0000
In-Reply-To: <1383947372-20075-1-git-send-email-jslater@windriver.com>
References: <1383947372-20075-1-git-send-email-jslater@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] linuxdoc-tools: add dependency on texinfo
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
X-List-Received-Date: Tue, 12 Nov 2013 10:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-08 at 13:49 -0800, Joe Slater wrote:
> We do run makeinfo, so we want to DEPEND on texinfo-native.

makeinfo is checked for by the sanity tests so we require it be present?

Cheers,

Richard

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> index ba9c72e..d8122e6 100644
> --- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> +++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> @@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
>  LICENSE = "GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
>  
> -DEPENDS = "groff-native openjade-native"
> +DEPENDS = "groff-native openjade-native texinfo-native"
>  
> 
>  SRC_URI = "${DEBIAN_MIRROR}/main/l/linuxdoc-tools/linuxdoc-tools_${PV}.orig.tar.gz \



