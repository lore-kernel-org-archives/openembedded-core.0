Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 392A0719B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 15:16:23 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n85so628018pfi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AXePtYymY9yK1Tlc90qrz6mFD5pwTcKcR4bTKJ1C3Ok=;
	b=G4CSwi05QFt4yfCNI7MhqC13lKHTvGPMaeTgCjwD6ceZawQH86XoyhsLupQJiK3gN/
	v4VeKhIF0Yjo2hfch1IgRk0YKs3PY17AdwpJqc5XMy3y986qYd9Vq7pm6L5KwOOQU0nv
	gIQ+VX/ywfsWuiPngAZm4Z+KXW89LlEBP+7fXsDRYU8QyF5KvtOYANzlVY5ZTn8IPWn1
	P2PgnTY0b1TZDh+F3F7qmXmguh1gYXGpEn2F3AtD6qmOGhoMd0UfcSrTFulqlKLz5xqV
	gSnFPFqRPv3Qb76ji/dh0yD34OW1ve7ImST/9XS28m3McdNBeEa3Gi/ciDBa4v4eDgEu
	TIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AXePtYymY9yK1Tlc90qrz6mFD5pwTcKcR4bTKJ1C3Ok=;
	b=kYDYgvXXYuihy4Ta2xai6PTrokqQpf6jMYYZz7HmRoP1pRRsStV11c1Uv6ErBNXr2O
	HhGmEq08Kke+nYkNdYG/GR9Tel0NsjnKG1MxUisZILmEzkMKoXC9U5+E+b/0bjtUMusR
	tNBFnV6494yPsTesjspeoRTyBoSMGlFD9BNOy7oj6D3/HQlPfXxGvzzhfU4LhX+g5y+7
	MAaCNmhDw/wKc9i4lJn2UBmzAHBluajrME/ZeqBaeIcuh6fmDslGtj161D380VDHDiXJ
	JOHXdB9OybdhrKGpSxYLk5wwTqwTw+Fy8VbDZN68M85gCYt4ezAD0aPWcXrHKtTK2N5j
	sEPQ==
X-Gm-Message-State: ABUngvfLAEupKOuvbLm+SQxMTfNZ0KuY3Qzeny9G1OnuvuYfTrAaTjkm5dSZjkbEEvNBqg==
X-Received: by 10.98.67.89 with SMTP id q86mr142000pfa.178.1478704585153;
	Wed, 09 Nov 2016 07:16:25 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:b5e1:5184:77d2:e8cb?
	([2601:202:4001:9ea0:b5e1:5184:77d2:e8cb])
	by smtp.gmail.com with ESMTPSA id sh9sm41042pac.41.2016.11.09.07.16.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 07:16:24 -0800 (PST)
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	"Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>
References: <1478601718-12481-1-git-send-email-sona.sarmadi@enea.com>
	<3230301C09DEF9499B442BBE162C5E48ABEB644D@SESTOEX04.enea.se>
From: akuster808 <akuster808@gmail.com>
Message-ID: <176055c3-bd60-fbb0-e5af-a25c56c9390c@gmail.com>
Date: Wed, 9 Nov 2016 07:16:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <3230301C09DEF9499B442BBE162C5E48ABEB644D@SESTOEX04.enea.se>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb
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
X-List-Received-Date: Wed, 09 Nov 2016 15:16:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2016 03:58 AM, Sona Sarmadi wrote:
> Hi guys,
>
> curl 7.51.0-r0 addresses all these CVEs. I wonder if we can upgrade krogoth and morty to curl 7.51.0-r0 as well?
Updating morty seems plausible . I appears the changes are mostly bug fixes.
Krogoth is a large jump and I would not recommend upgrading the package.

- Armin

> Both package versions are using same share library version i.e. libcurl.so.4.4.0 so I assume full ABI compatibility.
>
> tmp/work/i586-poky-linux/curl/7.47.1-r0/sysroot-destdir/usr/lib/libcurl.so.4.4.0
> tmp/work/i586-poky-linux/curl/7.51.0-r0/sysroot-destdir/usr/lib/libcurl.so.4.4.0
>
> For more info see:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10617
>
> Thanks
> //Sona
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Sona Sarmadi
> Sent: den 8 november 2016 11:42
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] curl: Upgrade 7.50.1.bb -> curl_7.51.0.bb
>
> The upgrade addresses following CVEs:
> CVE-2016-8615: cookie injection for other servers
> CVE-2016-8616: case insensitive password comparison
> CVE-2016-8617: OOB write via unchecked multiplication
> CVE-2016-8618: double-free in curl_maprintf
> CVE-2016-8619: double-free in krb5 code
> CVE-2016-8620: glob parser write/read out of bounds
> CVE-2016-8621: curl_getdate read out of bounds
> CVE-2016-8622: URL unescape heap overflow via integer truncation
> CVE-2016-8623: Use-after-free via shared cookies
> CVE-2016-8624: invalid URL parsing with '#'
> CVE-2016-8625: IDNA 2003 makes curl use wrong host
>
> Reference:
> https://curl.haxx.se/docs/security.html
>
> Fixes [Yocto #10617]
>
> Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
> ---
>   meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)  rename meta/recipes-support/curl/{curl_7.50.1.bb => curl_7.51.0.bb} (94%)
>
> diff --git a/meta/recipes-support/curl/curl_7.50.1.bb b/meta/recipes-support/curl/curl_7.51.0.bb
> similarity index 94%
> rename from meta/recipes-support/curl/curl_7.50.1.bb
> rename to meta/recipes-support/curl/curl_7.51.0.bb
> index a21419a..e1a996b 100644
> --- a/meta/recipes-support/curl/curl_7.50.1.bb
> +++ b/meta/recipes-support/curl/curl_7.51.0.bb
> @@ -14,8 +14,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \  #  SRC_URI += " file://configure_ac.patch"
>   
> -SRC_URI[md5sum] = "015f6a0217ca6f2c5442ca406476920b"
> -SRC_URI[sha256sum] = "3c12c5f54ccaa1d40abc65d672107dcc75d3e1fcb38c267484334280096e5156"
> +SRC_URI[md5sum] = "09a7c5769a7eae676d5e2c86d51f167e"
> +SRC_URI[sha256sum] = "7f8240048907e5030f67be0a6129bc4b333783b9cca1391026d700835a788dde"
>   
>   inherit autotools pkgconfig binconfig multilib_header
>   
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


