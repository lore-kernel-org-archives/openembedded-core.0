Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7A060FF8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 18:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1801; q=dns/txt; s=iport;
	t=1583173014; x=1584382614;
	h=subject:from:to:cc:references:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=7X6uoE8jzAk6cc1jKDWT4q7nXExbdaaKJNavwekF9B8=;
	b=apopw+YOMWasnk241GkR3Qz44diu2iKS6WH3f40cbVwnbJw0uaBrG0Cf
	EQQfwsrnMsckYzbGHgayYdRCJ3AD+oB0C9p/mUryTESj+dYhf5SAd+KMY
	QWSpceTUiREbK+nlxoqX0C+Nn6eJrv+/4aZQVtivleTc1LQquP0ICg7/i o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AoAABYTF1e/xbLJq1lHAEBAQEBBwE?=
	=?us-ascii?q?BEQEEBAEBgWcHAQELAYMUVSASKoQUiCNgh2YlmUOBewkBAQEMAQEfEAQBAYR?=
	=?us-ascii?q?AAoIvNAkOAgMNAQEFAQEBAgEFBG2FVgyFZAEFIxVBEAsYAgImAgJXEwYCAQG?=
	=?us-ascii?q?DIgGCe6pldYEyhUqDPIE+FHoqAYw+gUE/gREnDGWBfD6FGIJEgl4ElnVmmEC?=
	=?us-ascii?q?CRodSjw4GAhqDSItGizBzqjwCBAsCFYFSOYFYMxoIGxWDJwlHGA2Qa4Rjhxk?=
	=?us-ascii?q?/AzCQdAEB?=
X-IronPort-AV: E=Sophos;i="5.70,507,1574121600"; d="scan'208";a="23950776"
Received: from aer-iport-nat.cisco.com (HELO aer-core-2.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	02 Mar 2020 18:16:50 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-2.cisco.com (8.15.2/8.15.2) with ESMTPSA id 022IGnkT029958
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 2 Mar 2020 18:16:50 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: openembedded-core@lists.openembedded.org
References: <20200214192456.2944-1-rbilovol@cisco.com>
Message-ID: <36999460-5db4-29f6-e0e5-4ef152893fbc@cisco.com>
Date: Mon, 2 Mar 2020 20:15:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214192456.2944-1-rbilovol@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-2.cisco.com
Cc: xe-linux-external@cisco.com
Subject: Re: [PATCH] kernel-devsrc: support 4.4+ ARM/ARM64 kernels
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
X-List-Received-Date: Mon, 02 Mar 2020 18:16:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Gentle ping

On 2/14/20 9:24 PM, Ruslan Bilovol wrote:
> Linux Kernel 4.4 is an LTS kernel so people may still
> build it with OE.
> 
> Thus make copying of some files optional:
>   - arm64 module.lds file first appeared with kernel v4.6 commit
>     fd045f6cd98e arm64: add support for module PLTs"
>   - arm32 *.tbl files first appeared in kernel v4.10 in
>     commit 96a8fae0fe09 "ARM: convert to generated
>     system call tables"
> 
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>   meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 2fa4be67cc..2ac679e204 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -147,7 +147,7 @@ do_install() {
>               cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
>               cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
>   
> -            cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/
> +            cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
>   	fi
>   
>   	if [ "${ARCH}" = "powerpc" ]; then
> @@ -187,7 +187,7 @@ do_install() {
>   
>   	# required for generate missing syscalls prepare phase
>   	cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build
> -	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build
> +	cp -a --parents $(find arch/arm -type f -name "*.tbl") $kerneldir/build 2>/dev/null || :
>   
>   	if [ "${ARCH}" = "x86" ]; then
>   	    # files for 'make prepare' to succeed with kernel-devel
> 

