Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DAEF6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 12:28:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GCS6Fq006904; Tue, 16 Feb 2016 12:28:06 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LI_dNtT7HSjM; Tue, 16 Feb 2016 12:28:06 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1GCS3ti006885
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Feb 2016 12:28:05 GMT
Message-ID: <1455625683.28376.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2016 12:28:03 +0000
In-Reply-To: <1454424587-4251-4-git-send-email-mac@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454424587-4251-4-git-send-email-mac@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] bitbake.conf: Remove unhelpful default value for EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 16 Feb 2016 12:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> Setting EXTRA_OEMAKE to "-e MAKEFLAGS=" by default is a historical
> accident and many classes (e.g. autotools.bbclass, module.bbclass)
> and
> recipes have to override this default in order to work with sensible
> build systems.
> 
> Now that openssl and pciutils have been fixed to set EXTRA_OEMAKE
> explicitly it is possible to set EXTRA_OEMAKE = "".
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1a2f420..a32d293 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -474,7 +474,7 @@ export BUILD_STRIP = "${BUILD_PREFIX}strip"
>  export BUILD_NM = "${BUILD_PREFIX}nm"
>  
>  export MAKE = "make"
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> +EXTRA_OEMAKE = ""
>  EXTRA_OECONF = ""
>  export LC_ALL = "C"

I've merged this.

I just wanted to say thanks for taking this on, it required a bit of
work but is a good improvement and something several people have wanted
to see for a long time!

Cheers,

Richard

