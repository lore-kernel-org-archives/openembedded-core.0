Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63AE577EA8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 03:46:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAT3kftp019655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Nov 2017 19:46:41 -0800 (PST)
Received: from server.local (128.224.21.180) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 28 Nov 2017 19:46:40 -0800
To: Saul Wold <sgw@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
References: <20171129032818.2545-1-sgw@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <3ad9c2bf-f486-4062-6d8c-70ce3779b39b@windriver.com>
Date: Tue, 28 Nov 2017 22:46:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171129032818.2545-1-sgw@linux.intel.com>
Subject: Re: [PATCH 1/2] kernel-yocto: ensure sccs variable is set when using KBUILD_DEFCONFIG
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
X-List-Received-Date: Wed, 29 Nov 2017 03:46:42 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Let me take both these into my queue for some extra testing.

I have some other changes that could interact with them.

But they do look fine to me .. I'd just like to test them and
put them in my pull request.

Bruce

On 2017-11-28 10:28 PM, Saul Wold wrote:
> When using KBUILD_DEFCONFIG, $sccs should be set to the $WORKDIR/defconfig
> regardless if it compares or is copied. Otherwise $sccs is not set and the
> defconfig is not found correctly.
> 
> Part of
> [YOCTO #12162]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/classes/kernel-yocto.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 1d447951c49..98ec78fb768 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -110,8 +110,8 @@ do_kernel_metadata() {
>   				fi
>   			else
>   				cp -f ${S}/arch/${ARCH}/configs/${KBUILD_DEFCONFIG} ${WORKDIR}/defconfig
> -				sccs="${WORKDIR}/defconfig"
>   			fi
> +			sccs="${WORKDIR}/defconfig"
>   		else
>   			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
>   		fi
> 


