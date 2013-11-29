Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E5E996D138
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 06:09:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAT69n0G029034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:09:49 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 28 Nov 2013 22:09:48 -0800
Message-ID: <52982FAC.8010000@windriver.com>
Date: Fri, 29 Nov 2013 14:09:48 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <rongqing.li@windriver.com>
References: <1385705253-12512-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1385705253-12512-1-git-send-email-rongqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] webkit: block to build webkit on mips64 with libn32 ABI
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
X-List-Received-Date: Fri, 29 Nov 2013 06:09:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, Drop it, I will send a new one

On 11/29/2013 02:07 PM, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> To mips64 libn32, The HOST_SYS is mips64-*-linux-gnun32, the COMPATIBLE_HOST
> is mips64.*-linux, the regular expression matching both will return true. so
> append the ending position word into COMPATIBLE_HOST to make match failure
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> index 3581de3..8c78b5b 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> @@ -32,7 +32,7 @@ SRC_URI[md5sum] = "dcbf9d5e2e6391f857c29a57528b32a6"
>   SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a74cc9e7"
>
>   # webkit-gtk can NOT be built on MIPS64 with n32 ABI
> -COMPATIBLE_HOST_mips64 = "mips64.*-linux"
> +COMPATIBLE_HOST_mips64 = "mips64.*-linux$"
>
>   inherit autotools lib_package gtk-doc pkgconfig
>
>

-- 
Best Reagrds,
Roy | RongQing Li

