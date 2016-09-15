Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 515EB60851
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 22:32:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8FMWAn2006506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Sep 2016 15:32:11 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 15:32:10 -0700
To: Patrick Williams <patrick@stwcx.xyz>,
	<openembedded-core@lists.openembedded.org>
References: <b88d60f8-7916-b1a0-f381-b62c9111c7be@windriver.com>
	<1473973877-14758-1-git-send-email-patrick@stwcx.xyz>
	<1473973877-14758-2-git-send-email-patrick@stwcx.xyz>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <ecdad621-c98d-aa2b-a789-9102d2b3182f@windriver.com>
Date: Thu, 15 Sep 2016 18:32:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473973877-14758-2-git-send-email-patrick@stwcx.xyz>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH v2 2/2] util-linux: Disable bfs support
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
X-List-Received-Date: Thu, 15 Sep 2016 22:32:12 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-15 05:11 PM, Patrick Williams wrote:
> Disable building of mkfs.bfs, which is used to create
> BFS file-systems used by SCO UnixWare.  This is highly
> unlikely to be utilized and there are otherwise no
> references to 'bfs' throughout the rest of the tree.


SCO, yeah not many people using that...
some people (that I work with) would remove the code upstream even!

Thanks Patrick.

../Randy

>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 608f198..c635502 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -46,7 +46,7 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
>                         --disable-vipw --disable-newgrp --disable-chfn-chsh \
>                         --enable-write --enable-mount \
>                         --enable-libuuid --enable-libblkid --enable-fsck \
> -                       --disable-minix --without-udev \
> +                       --disable-minix --disable-bfs --without-udev \
>                         usrsbin_execdir='${sbindir}' \
>  "
>
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

