Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8554760017
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 22:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3BMRgJA015032; Sat, 11 Apr 2015 23:27:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jh9cIyt0lAiC; Sat, 11 Apr 2015 23:27:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3BMROCn015029
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Apr 2015 23:27:36 +0100
Message-ID: <1428791244.6976.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
Date: Sat, 11 Apr 2015 23:27:24 +0100
In-Reply-To: <1428609535-15027-4-git-send-email-dmitry_eremin@mentor.com>
References: <1428609535-15027-1-git-send-email-dmitry_eremin@mentor.com>
	<1428609535-15027-4-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] lsb: provide lsb-core-ARCH
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
X-List-Received-Date: Sat, 11 Apr 2015 22:27:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-09 at 22:58 +0300, Dmitry Eremin-Solenikov wrote:
> Some lsb packages depend on correct lsb-core-ARCH package being
> installed (or rather provided) on the target file system. Provide this
> package name by main lsb package.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
> ---
>  meta/recipes-extended/lsb/lsb_4.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
> index 1ae1e26..c3a79c0 100644
> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
> @@ -4,6 +4,10 @@ HOMEPAGE = "http://prdownloads.sourceforge.net/lsb"
>  LICENSE = "GPLv2+"
>  PR = "r2"
>  
> +LSB_CORE = "lsb-core-${TARGET_ARCH}"
> +LSB_CORE_i586 = "lsb-core-ia32"

A _x86 here is probably a better option?

Cheers,

Richard

> +RPROVIDES_${PN} += "${LSB_CORE}"
> +
>  # lsb_release needs getopt
>  RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_getopt}"
>  
> -- 
> 2.1.4
> 



