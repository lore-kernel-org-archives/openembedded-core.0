Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 71A987253B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Dec 2014 15:12:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBKFBw0E006555
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 20 Dec 2014 07:11:58 -0800 (PST)
Received: from server.local (128.224.21.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 20 Dec 2014 07:11:58 -0800
Message-ID: <549591BD.7020607@windriver.com>
Date: Sat, 20 Dec 2014 10:11:57 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
References: <1419083848.13316.38.camel@linuxfoundation.org>
In-Reply-To: <1419083848.13316.38.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-libc-headers: Upgrade 3.17 -> 3.17.7
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
X-List-Received-Date: Sat, 20 Dec 2014 15:12:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-12-20 8:57 AM, Richard Purdie wrote:
> Whilst we don't usually take linux-libc-headers point release, 3.17.3
> fixes a userspace header issue which caused gdb to fail to build on
> mips. We therefore may as well upgrade to the latest point release.

Agreed. Not what we like to do .. but a full update is better than a single
patch.

I have 3.18 headers in testing now, but we'll likely jump over that an
go to 3.19+ to match the next kernel update.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
> new file mode 100644
> index 0000000..7332597
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.7.bb
> @@ -0,0 +1,7 @@
> +KORG_ARCHIVE_COMPRESSION = "xz"
> +
> +require linux-libc-headers.inc
> +
> +SRC_URI[md5sum] = "59cc7d0a236b08de743d6d9421f0f2c6"
> +SRC_URI[sha256sum] = "a3c8e6aee912bfd2e69abf9df5a06058434a8771bcaa1784b5980bf1b5298e1c"
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
> deleted file mode 100644
> index 3417697..0000000
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.17.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -KORG_ARCHIVE_COMPRESSION = "xz"
> -
> -require linux-libc-headers.inc
> -
> -SRC_URI[md5sum] = "fb30d0f29214d75cddd2faa94f73d5cf"
> -SRC_URI[sha256sum] = "f5153ec93c5fcd41b247950e6a9bcbc63fa87beafd112c133a622439a0f76251"
> -
>
>


