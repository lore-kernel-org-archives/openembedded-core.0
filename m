Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0D17D486
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:38:20 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 13so7787042pfw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0yKss5/LrYWO4jwZSF1bQB590pwjFdFMiHEesCA4SY4=;
	b=exAJBaB6t0VqiZwqQBXoABc+WOjncLhANONTcz/vaVOPtMsAu8YSoE2z40h/plE2Y/
	/xTlOkbRczdC/8NVkKT4VFX98TFwx6KMMsLUhuhZ9FAdma32Q3aS4B+gCPaX2e0DaO7Q
	+pPI8c6e1WhadgEsp+e5kyU5yaBI0nF+0ahIS4+zTUC6AHRSan8kzI3d7X31KcBYHl7t
	ht9uHoUXO4ls0bp/MRUSuPlHNuiF9qopTfiWOdLBolQxvXiMlX25nOwu8nBSVj7rSLts
	meaY7rPRXdqmpQuI37som/tlxAirmgdXQxpxmZ1ycaHzOK9BVBJkV6m5k1iHXBG/WA7H
	u0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0yKss5/LrYWO4jwZSF1bQB590pwjFdFMiHEesCA4SY4=;
	b=JqEeBR3qewssYUZWSpEa/6oOnWrS/6IZJ+MeBILAh7NRzbl03UpEOMkU/ngAo5lLcp
	rU0PdixQqM3dckApOwSlzbbxKy6j4iRcNfrEmJ5axXTrxBojVIArLBHCC06Pg8/YU9r1
	TOwRFqRQqd1tbw3DOXBpODHQQTUPpGYU/phjo0MkE3Du0caVcCU2z6F9xeryjnoTal6Y
	8C9hDnt6Yl1AlcUnbINtstUSp20g2tJFPbGXeCBlS9qndl5m/LAQeJxqlQPjWr07wMsN
	EhWtcP+gLYJbEnOpAj6ihI3//a5W4A3cLl961/RZEssllIhD9vskhgSFUOYgEtMLhlJA
	Yoiw==
X-Gm-Message-State: APjAAAUVjE/ooT458/8mUeQuz+qQRW7v/vmjkMq8OR5D54JixqpX8/nI
	D7dfXFkPcWuPostxjnOMfnGvA8RGRAk=
X-Google-Smtp-Source: APXvYqy0ZrQD6kSQ7Crx8wWLMa77ainkmX+pKyZ+yVoK+Qb20UU0+/LESDVZkuqPH0GFVVHCJzICcg==
X-Received: by 2002:a62:f247:: with SMTP id y7mr81600742pfl.18.1558384701038; 
	Mon, 20 May 2019 13:38:21 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id 2sm22161442pgc.49.2019.05.20.13.38.20
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:38:20 -0700 (PDT)
To: Peter Griffin <peter.griffin@linaro.org>,
	openembedded-core@lists.openembedded.org, nicolas.dechesne@linaro.org
References: <1557911842-12574-1-git-send-email-peter.griffin@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <b4c3588a-393c-32a5-7f90-b74de84eb08f@gmail.com>
Date: Mon, 20 May 2019 13:38:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <1557911842-12574-1-git-send-email-peter.griffin@linaro.org>
Subject: Re: [PATCH v2] mesa: Add backport of freedreno dmabuf modifiers patch.
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
X-List-Received-Date: Mon, 20 May 2019 20:38:20 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Peter

This patch looks fine, please add

Upstream-Status: Backport [reason]

to the patch and resend.

On 5/15/19 2:17 AM, Peter Griffin wrote:
> This is required to get weston-simple-dmabuf-drm to work
> and also now required by Chromium v73 ozone-wayland backend.
> 
> It is present in mesa 19.0, backporting to Thud which is
> on 18.1.9.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>   ...-freedreno-add-query-for-dmabuf-modifiers.patch | 101 +++++++++++++++++++++
>   meta/recipes-graphics/mesa/mesa_18.1.9.bb          |   1 +
>   2 files changed, 102 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> 
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> new file mode 100644
> index 0000000..57ebd8f
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> @@ -0,0 +1,101 @@
> +From c4bee1a1b3fb224002fe8c263bedbce1b705ed49 Mon Sep 17 00:00:00 2001
> +From: Peter Griffin <peter.griffin@linaro.org>
> +Date: Mon, 13 May 2019 19:18:56 +0100
> +Subject: [PATCH] freedreno: add query for dmabuf modifiers
> +
> +Backport of mesa 7c4b9510d by Fritz Koenig. Tested with Weston
> +and weston-simple-dmabuf-drm client.
> +
> +Upstream-Status: Backport from 19.0
> +
> +Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> +---
> + src/gallium/drivers/freedreno/freedreno_screen.c | 43 ++++++++++++++++++++++++
> + src/gallium/drivers/freedreno/freedreno_screen.h |  3 ++
> + 2 files changed, 46 insertions(+)
> +
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_screen.c
> +index f338d75..cbb5b8a 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> +@@ -40,6 +40,7 @@
> +
> + #include "util/os_time.h"
> +
> ++#include <drm_fourcc.h>
> + #include <errno.h>
> + #include <stdio.h>
> + #include <stdlib.h>
> +@@ -732,6 +733,37 @@ fd_screen_bo_get_handle(struct pipe_screen *pscreen,
> + 	}
> + }
> +
> ++static void
> ++fd_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
> ++		enum pipe_format format,
> ++		int max, uint64_t *modifiers,
> ++		unsigned int *external_only,
> ++		int *count)
> ++{
> ++	struct fd_screen *screen = fd_screen(pscreen);
> ++	int i, num = 0;
> ++
> ++	max = MIN2(max, screen->num_supported_modifiers);
> ++
> ++	if (!max) {
> ++		max = screen->num_supported_modifiers;
> ++		external_only = NULL;
> ++		modifiers = NULL;
> ++	}
> ++
> ++	for (i = 0; i < max; i++) {
> ++		if (modifiers)
> ++			modifiers[num] = screen->supported_modifiers[i];
> ++
> ++		if (external_only)
> ++			external_only[num] = 0;
> ++
> ++		num++;
> ++	}
> ++
> ++	*count = num;
> ++}
> ++
> + struct fd_bo *
> + fd_screen_bo_from_handle(struct pipe_screen *pscreen,
> + 		struct winsys_handle *whandle)
> +@@ -921,6 +953,17 @@ fd_screen_create(struct fd_device *dev)
> + 	pscreen->fence_finish = fd_fence_finish;
> + 	pscreen->fence_get_fd = fd_fence_get_fd;
> +
> ++	pscreen->query_dmabuf_modifiers = fd_screen_query_dmabuf_modifiers;
> ++
> ++	if (!screen->supported_modifiers) {
> ++		static const uint64_t supported_modifiers[] = {
> ++			DRM_FORMAT_MOD_LINEAR,
> ++		};
> ++
> ++		screen->supported_modifiers = supported_modifiers;
> ++		screen->num_supported_modifiers = ARRAY_SIZE(supported_modifiers);
> ++	}
> ++
> + 	slab_create_parent(&screen->transfer_pool, sizeof(struct fd_transfer), 16);
> +
> + 	return pscreen;
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.h b/src/gallium/drivers/freedreno/freedreno_screen.h
> +index 6be739a..5558066 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.h
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.h
> +@@ -89,6 +89,9 @@ struct fd_screen {
> + 	struct fd_batch_cache batch_cache;
> +
> + 	bool reorder;
> ++
> ++	unsigned num_supported_modifiers;
> ++	const uint64_t *supported_modifiers;	
> + };
> +
> + static inline struct fd_screen *
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> index 86d6a6b..0558690 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> @@ -7,6 +7,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0004-Use-Python-3-to-execute-the-scripts.patch \
>              file://0005-dri-i965-Add-missing-time.h-include.patch \
>              file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> +           file://0001-freedreno-add-query-for-dmabuf-modifiers.patch \
>   "
>   
>   SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
> 

