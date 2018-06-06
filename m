Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9335F75584
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 07:34:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w567XxHu015809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2018 00:34:20 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 6 Jun 2018 00:34:12 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1527214769.git.Qi.Chen@windriver.com>
	<31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <d0ee3a76-f842-d8fc-6f8b-60404802eea0@windriver.com>
Date: Wed, 6 Jun 2018 15:36:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <31d93c4a23eec59b835a52dc7002814e1b9fbe22.1527214769.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] buildtools-tarball: add nativesdk-libnss-nis
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
X-List-Received-Date: Wed, 06 Jun 2018 07:34:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 05/25/2018 10:54 AM, Chen Qi wrote:
> Recent glibc change removed libnss-nis module from glibc and a new
> recipe libnss-nis.bb was added.
>
> After this change, we need to make sure nativesdk-libnss-nis is also
> included in buildtools-tarball, otherwise, we may encounter the following
> error when using 'tar' command from buildtools-tarball.
>
>    tar: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2: \
>         symbol _nsl_default_nss version GLIBC_PRIVATE not defined \
>         in file libnsl.so.1 with link time reference
>
> This error occured on my ubuntu16.04 host with 'nis' configured in
> /etc/nssswitch.conf.
>
> So add nativesdk-libnss-nis to buildtools-tarball to fix this problem.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/meta/buildtools-tarball.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index d98a9c9..377733f 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -21,6 +21,7 @@ TOOLCHAIN_HOST_TASK ?= "\
>       nativesdk-wget \
>       nativesdk-ca-certificates \
>       nativesdk-texinfo \
> +    nativesdk-libnss-nis \
>       "
>   
>   MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"



