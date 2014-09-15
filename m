Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 439C8609B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 13:12:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8FDCGhc017474
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 Sep 2014 06:12:16 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 15 Sep 2014 06:12:15 -0700
Message-ID: <5416E596.5070500@windriver.com>
Date: Mon, 15 Sep 2014 09:11:50 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1410576597-16290-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1410576597-16290-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH] linux-yocto: add to qemuppc64 to bb file
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
X-List-Received-Date: Mon, 15 Sep 2014 13:12:21 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-12 10:49 PM, Armin Kuster wrote:
> Not sure if this this is the correct process.

I'll grab the patch and carry it here, and update the SRCREVs at the
same time as the other BSPs.

As for adding qemuppc64 fully to the supported set of emulated BSPs
for 1.7, that's Richard's call (and I haven't checked to see if the
other patches were merged).

Bruce

>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto_3.14.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> index e06b191..dfe1de0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
> @@ -6,6 +6,7 @@ require recipes-kernel/linux/linux-yocto.inc
>   KBRANCH_qemuarm  ?= "standard/arm-versatile-926ejs"
>   KBRANCH_qemumips ?= "standard/mti-malta32"
>   KBRANCH_qemuppc  ?= "standard/qemuppc"
> +KBRANCH_qemuppc64  ?= "standard/qemuppc"
>   KBRANCH_qemux86  ?= "standard/common-pc/base"
>   KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
>   KBRANCH_qemumips64 ?= "standard/mti-malta64"
> @@ -13,6 +14,7 @@ KBRANCH_qemumips64 ?= "standard/mti-malta64"
>   SRCREV_machine_qemuarm ?= "c32a2e1190325f685a61196f38fc03ceff2645bf"
>   SRCREV_machine_qemumips ?= "1ff50c529b49ceb55a670258f7cb8233c8006c6c"
>   SRCREV_machine_qemuppc ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
> +SRCREV_machine_qemuppc64 ?= "12e9828a5b78891374375233b4075f682b9fbd0e"
>   SRCREV_machine_qemux86 ?= "58d49fe770ad642e2bc0616159195ba837dc513b"
>   SRCREV_machine_qemux86-64 ?= "b85edae6fd61ceadfc08099608e8ac90aa4c5c33"
>   SRCREV_machine_qemumips64 ?= "dcd579737386fca4d7bcf224bc118b14eb3c1d55"
> @@ -27,7 +29,7 @@ PV = "${LINUX_VERSION}+git${SRCPV}"
>
>   KMETA = "meta"
>
> -COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64"
> +COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemuppc64|qemumips|qemumips64|qemux86-64"
>
>   # Functionality flags
>   KERNEL_EXTRA_FEATURES ?= "features/netfilter/netfilter.scc"
>


