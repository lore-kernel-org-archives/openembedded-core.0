Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 52EF16FFCE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 06:04:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2364rKg026689
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2016 22:04:53 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.235) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Mar 2016 22:04:53 -0800
To: <openembedded-core@lists.openembedded.org>
References: <1456981633-16756-1-git-send-email-armccurdy@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56D7D404.4090500@windriver.com>
Date: Thu, 3 Mar 2016 00:04:52 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456981633-16756-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH] gcc-runtime.inc: disable libitm for little endian MIPS too
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
X-List-Received-Date: Thu, 03 Mar 2016 06:04:54 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/2/16 11:07 PM, Andre McCurdy wrote:
> libitm is already disabled for big endian MIPS, but needs to be
> disabled for little endian MIPS targets too.

No objection to the patch, but do we have any little endian MIPS currently
defined or buildable to test?

All of the samples I've seen are all big endian these days.  (QEMU or actual
boards.)

--Mark

> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 707db37..1c3dd54 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -12,7 +12,9 @@ EXTRA_OECONF_append_linuxstdbase = " --enable-clocale=gnu"
>  
>  RUNTIMELIBITM = "libitm"
>  RUNTIMELIBITM_mips = ""
> +RUNTIMELIBITM_mipsel = ""
>  RUNTIMELIBITM_mips64 = ""
> +RUNTIMELIBITM_mips64el = ""
>  
>  RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
>      ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
> 


