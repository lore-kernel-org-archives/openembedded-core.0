Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4C98E7E092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:46:54 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g69so7258439plb.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=J6yTrjOQv1z0fuIl42F31i2dEDF0sH9d0ZY0HdASg1M=;
	b=OPPXnsP2AF/ocimDgEM0LcfQQw3T+YTQMY3BbnEjWrQ/4U7//2NJbLjChQv8O1uXAZ
	lKmbXmqe4U5A9tDri4/zdiqC0g/xnQgoC+mOmiT6ioqjnHg3t6ecTON241BfrISvo56O
	waja87vorf3zB9YAFmXmvQL2hhuZ43PL9JFrweeGOQoPWuJMFG2MOmXPmu9yXvVYfJRm
	jxOE32kh1y5e5hcxNfFajZg+5uZwGbHxat+Gacb1HXK/lszE4zF40EBaxSsYNp7kHa7A
	pZ81gq75/qFtbs6egohsmN8ioZTKnk6DTfiWPNc/aIjXEKNqFMc8eyFIJmnPqPOLXDf8
	JIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=J6yTrjOQv1z0fuIl42F31i2dEDF0sH9d0ZY0HdASg1M=;
	b=p0MDSxqdjE6qOaioEVJS0dR+NwuHsXtxJwjgKDA+uQgKSMmQhbSdA61qQkegfAkr5Z
	1Y1SHZIAw9gERiAxK7FY7zqtA2mZPq9g3FbQw1IEVtRH+23/5KKUmrjXqjsKxse6wzhD
	XZfqmVfc9mRCX/dwB5c7CNP2jBRAw0Y7BmTiVTNd3CW3BiJFWzedG+13QCJTcCA+qmYm
	kA50oxFcRpzNx5e7P5sj9BHJ8pSvFSDFruibq8jtoVDVR0MnzEjCU5f1uGnuiUWQN2PB
	Y++Zgy+5vavDfz9L/pI4aj/dGN2mdIofbGor/g0ctmgyTfWycw9sQaAqOn8kwulgYIDt
	frVg==
X-Gm-Message-State: APjAAAXxQMS5701DKpd8VXiHTWWKRA57/DZ/SprfDs35f8o9lADLrUdO
	ReUSmAiF0dzQoD/TQP7g2OzLCDhiM8g=
X-Google-Smtp-Source: APXvYqw6kYSMa3QxPhU7UJsxIUMZOJebOBXiaVEosaBRbdjJzVJ4OdSN0xGMvNzxbAdA2k7lIgGQHw==
X-Received: by 2002:a17:902:6bc2:: with SMTP id
	m2mr76703108plt.24.1558385214998; 
	Mon, 20 May 2019 13:46:54 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	c15sm21976473pfi.172.2019.05.20.13.46.53
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:46:54 -0700 (PDT)
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20190515125201.12639-1-ovidiu.panait@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <af3ea444-a46c-fc93-7926-ffecfb9d9215@gmail.com>
Date: Mon, 20 May 2019 13:46:52 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190515125201.12639-1-ovidiu.panait@windriver.com>
Subject: Re: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
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
X-List-Received-Date: Mon, 20 May 2019 20:46:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/15/19 5:52 AM, Ovidiu Panait wrote:
> "--printf" only works with the stat variant provided by coreutils.
> 
> With busybox, when running grub-mkconfig, stat will fail with the
> following error:
> stat: unrecognized option '--printf=%T'
> 
> Usage: stat [OPTIONS] FILE...


this looks good to me.

> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>   ...fig-Use-c-instead-of-printf-for-stat.patch | 36 +++++++++++++++++++
>   meta/recipes-bsp/grub/grub2.inc               |  1 +
>   2 files changed, 37 insertions(+)
>   create mode 100644 meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
> new file mode 100644
> index 0000000000..9acddb73c8
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch
> @@ -0,0 +1,36 @@
> +From b5011ea2bc57d80b3e5a42bc308fa2000e85eab1 Mon Sep 17 00:00:00 2001
> +From: Ovidiu Panait <ovidiu.panait@windriver.com>
> +Date: Wed, 17 Apr 2019 12:10:28 +0300
> +Subject: [PATCH] grub-mkconfig: Use -c instead of --printf for stat
> +
> +"--printf" only works with the stat variant provided by coreutils.
> +
> +With busybox, when running grub-mkconfig, stat will fail with the
> +following error:
> +stat: unrecognized option '--printf=%T'
> +
> +Usage: stat [OPTIONS] FILE...
> +
> +Upstream-Status: Submitted [http://lists.gnu.org/archive/html/grub-devel/2019-05/msg00079.html]
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + util/grub-mkconfig.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/util/grub-mkconfig.in b/util/grub-mkconfig.in
> +index f8496d2..628706d 100644
> +--- a/util/grub-mkconfig.in
> ++++ b/util/grub-mkconfig.in
> +@@ -144,7 +144,7 @@ GRUB_DEVICE_BOOT_UUID="`${grub_probe} --device ${GRUB_DEVICE_BOOT} --target=fs_u
> + GRUB_FS="`${grub_probe} --device ${GRUB_DEVICE} --target=fs 2> /dev/null || echo unknown`"
> +
> + if [ x"$GRUB_FS" = xunknown ]; then
> +-    GRUB_FS="$(stat -f --printf=%T / || echo unknown)"
> ++    GRUB_FS="$(stat -f -c %T / || echo unknown)"
> + fi
> +
> + if test -f ${sysconfdir}/default/grub ; then
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 7d8c280b3f..7eb9e9c491 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -20,6 +20,7 @@ SRC_URI = "https://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
>              file://gcc8.patch \
>              file://0001-x86-64-Treat-R_X86_64_PLT32-as-R_X86_64_PC32.patch \
>              file://0001-grub-setup-Debug-message-cleanup.patch \
> +           file://0001-grub-mkconfig-Use-c-instead-of-printf-for-stat.patch \
>   "
>   SRC_URI[md5sum] = "1116d1f60c840e6dbd67abbc99acb45d"
>   SRC_URI[sha256sum] = "660ee136fbcee08858516ed4de2ad87068bfe1b6b8b37896ce3529ff054a726d"
> 

