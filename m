Return-Path: <akuster808@gmail.com>
Received: from mail-ie0-f180.google.com (mail-ie0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF8E71637
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 18:55:39 +0000 (UTC)
Received: by mail-ie0-f180.google.com with SMTP id rp18so10564278iec.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 10:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=8K43xgNc7gouGFDqtYJRfcMgowX0jueKH+EyWBkK8ko=;
	b=huD++C2GbQJVqV/zMku8oL7zcxe/8bHHHPEXQfOsHE8jlzP4qFLTUvH1BjFnDUWJPc
	FEud5wO5guaIho5Dvzh/4ytvJywln+4u1kR2zwunce0e31VeuSf/gAVh0ZK96loDoVH6
	+ZR/frGb3E5oVoYWoXZCMWfNjUHpwAEAsLELZyN/yMm8iRxK1SIA5XdW4z1L/7PSdgwO
	ayQI2U8xJvNsR9c1h9GcH/LIyv/veRlx/kosNv9TxFrrulE8w5rjjh58oGJqv5deqPMC
	KXeQJ8EdMv+7jU5oiCGoGgDp8yjGja8Xd/mqUSJTSjXmMvV2Ndx1glNKfLu8xhZmmJww
	kAvQ==
X-Received: by 10.50.117.68 with SMTP id kc4mr6101521igb.25.1421261740470;
	Wed, 14 Jan 2015 10:55:40 -0800 (PST)
Received: from [10.22.9.11] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id
	a126sm12477611ioa.13.2015.01.14.10.55.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jan 2015 10:55:39 -0800 (PST)
Message-ID: <54B6BBA9.20501@gmail.com>
Date: Wed, 14 Jan 2015 10:55:37 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, openembedded-core@lists.openembedded.org
References: <cover.1420843293.git.sgw@linux.intel.com>
	<932bb762022801092df9d39dd5eb25aadcf1c2cf.1420843293.git.sgw@linux.intel.com>
In-Reply-To: <932bb762022801092df9d39dd5eb25aadcf1c2cf.1420843293.git.sgw@linux.intel.com>
Subject: Re: [PATCH 3/5] security_flags: disable pie support for libaio, blktrace and ltp
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
X-List-Received-Date: Wed, 14 Jan 2015 18:55:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Do we need this for Dizzy?

- armin

On 01/09/2015 02:51 PM, Saul Wold wrote:
> libaio when built with pie and fpie does not link correctly with blktrace or ltp
> so we need to disable those flags until a better solution comes along.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/conf/distro/include/security_flags.inc | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index 840f68a..d6f7e9c 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm = "${SECURITY_NO_PIE_CFLAGS}"
>
>   SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-blktrace = "${SECURITY_NO_PIE_CFLAGS}"
>   # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
>   # to CPPFLAGS it gets picked into CFLAGS in bitbake.
>   #TARGET_CPPFLAGS_pn-curl += "-D_FORTIFY_SOURCE=2"
> @@ -43,6 +44,7 @@ SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -51,6 +53,7 @@ SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libpcap = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libpcre = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-libproxy = "${SECURITY_NO_PIE_CFLAGS}"
> +SECURITY_CFLAGS_pn-ltp = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-lttng-ust = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-mesa = "${SECURITY_NO_PIE_CFLAGS}"
>   SECURITY_CFLAGS_pn-mesa-gl = "${SECURITY_NO_PIE_CFLAGS}"
>

