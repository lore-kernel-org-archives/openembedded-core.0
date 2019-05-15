Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 572877DE8C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:23:30 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id u11so1600052otq.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pA2X0/cbGTVSWPqeLgwM010xK5qtokqWvj2TmhtV/FU=;
	b=GaJnKOEQeCDPHm7WsZ2NMJzVaSk/K9TFZTDDudsYZy8pLDaA5DgAJ4XB5GpboXZ2aq
	13c/F1aF+cqxZVnnxqAlWvbkMXUobdgwRamKF0hLgPHsMAGm393/D/JXtEpkLE8NJuLl
	YQTkZDHnAmblCzZaZ/iuI9kC8V8c6ZTcV2tWQ9XMprnjBrlKWgr+fvbWXhZtCgS7NmV9
	jSJ0NfG8aaNmXXP0MwxTBveVyM1UJBeiDnosKn6b0xn78bfR3qHaVXvrzkj8CHhKX1zk
	8L7NXC48EW2Kxo2JmHNEyAhS/6qIICXoiZWWBW7DamahYSrh/LgaYO1M7MEoPPTpbVXa
	4cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pA2X0/cbGTVSWPqeLgwM010xK5qtokqWvj2TmhtV/FU=;
	b=IDfDZHzeAivhrj8mHVDOOHhTzD6SYbf9WwO6/W2RqNxzvVYWP9gEmpVA3gvURG7LwP
	H5Mj3w0WvWDJnITg7x/eExtvENsjG6sijT/mgGaItzyXEUMpoO/DYhFNPljzaO/IBvDZ
	e/Zf3iQ0dHHrnrcNng/H8ETQgSXK8oALr7TiIpvKV1t2X504Rzu4BKcse7BDtsm0EzCL
	TjtVPmSqYbcXJgB9SIgmacmta1+jJQhXNoYr0xxZpAaliJZQxP3t4uLBrMYKE3AiGia+
	WtT12fg4BrcWc3KojPcmeyOZP+3eElPRoNVoB1jhRFsesh9VMrYwpRf35nfq+GHzP/Go
	XJLg==
X-Gm-Message-State: APjAAAVC1rrbko0ePCWQHcnM5Wew3KdfODRBKtw3fTWU4ihG07uyIu2f
	/EuiYi6XnpiVIgnHUi10fm0ZJ7mifl3YaJ1wKKa38w==
X-Google-Smtp-Source: APXvYqzR/5OUbvd23hkXgp8A961JVBlwpDbF7O4/xWm9B49D+mOhSRFOlXywCF0xtcr/FmqKfsSbxChdvdvfvugWl1c=
X-Received: by 2002:a05:6830:148e:: with SMTP id
	s14mr5954452otq.54.1557912211247; 
	Wed, 15 May 2019 02:23:31 -0700 (PDT)
MIME-Version: 1.0
References: <1557911110-10999-1-git-send-email-peter.griffin@linaro.org>
In-Reply-To: <1557911110-10999-1-git-send-email-peter.griffin@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 May 2019 11:23:19 +0200
Message-ID: <CANNYZj9MQzJkOmp_Af3GTVPi8RawmTe2js4QejqYAkS2uw=rPQ@mail.gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Add backport of freedreno dmabuf modifiers patch.
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
X-List-Received-Date: Wed, 15 May 2019 09:23:30 -0000
Content-Type: text/plain; charset="UTF-8"

Email subject should include [thud], otherwise it won't be noticed.

Alex

On Wed, 15 May 2019 at 11:07, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> This is required to get weston-simple-dmabuf-drm to work
> and also now required by Chromium v73 ozone-wayland backend.
>
> It is present in mesa 19.0, backporting to Thud which is
> on 18.1.9.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  ...ckport-of-freedreno-dmabuf-modifiers-patc.patch | 140 +++++++++++++++++++++
>  ...-freedreno-add-query-for-dmabuf-modifiers.patch | 101 +++++++++++++++
>  meta/recipes-graphics/mesa/mesa_18.1.9.bb          |   1 +
>  3 files changed, 242 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/0001-mesa-Add-backport-of-freedreno-dmabuf-modifiers-patc.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
>
> diff --git a/meta/recipes-graphics/mesa/0001-mesa-Add-backport-of-freedreno-dmabuf-modifiers-patc.patch b/meta/recipes-graphics/mesa/0001-mesa-Add-backport-of-freedreno-dmabuf-modifiers-patc.patch
> new file mode 100644
> index 0000000..1a5aa68
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/0001-mesa-Add-backport-of-freedreno-dmabuf-modifiers-patc.patch
> @@ -0,0 +1,140 @@
> +From 6de2fe7bdd1bbe7a1d56c91fabe32a3dbcb736ac Mon Sep 17 00:00:00 2001
> +From: Peter Griffin <peter.griffin@linaro.org>
> +Date: Wed, 15 May 2019 10:07:49 +0200
> +Subject: [PATCH] mesa: Add backport of freedreno dmabuf modifiers patch.
> +
> +This is required to get weston-simple-dmabuf-drm to work
> +and also now required by Chromium v73 ozone-wayland backend.
> +
> +It is present in mesa 19.0, backporting to Thud which is
> +on 18.1.9.
> +
> +Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> +---
> + ...-freedreno-add-query-for-dmabuf-modifiers.patch | 101 +++++++++++++++++++++
> + meta/recipes-graphics/mesa/mesa_18.1.9.bb          |   1 +
> + 2 files changed, 102 insertions(+)
> + create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> +
> +diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> +new file mode 100644
> +index 0000000..57ebd8f
> +--- /dev/null
> ++++ b/meta/recipes-graphics/mesa/files/0001-freedreno-add-query-for-dmabuf-modifiers.patch
> +@@ -0,0 +1,101 @@
> ++From c4bee1a1b3fb224002fe8c263bedbce1b705ed49 Mon Sep 17 00:00:00 2001
> ++From: Peter Griffin <peter.griffin@linaro.org>
> ++Date: Mon, 13 May 2019 19:18:56 +0100
> ++Subject: [PATCH] freedreno: add query for dmabuf modifiers
> ++
> ++Backport of mesa 7c4b9510d by Fritz Koenig. Tested with Weston
> ++and weston-simple-dmabuf-drm client.
> ++
> ++Upstream-Status: Backport from 19.0
> ++
> ++Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ++---
> ++ src/gallium/drivers/freedreno/freedreno_screen.c | 43 ++++++++++++++++++++++++
> ++ src/gallium/drivers/freedreno/freedreno_screen.h |  3 ++
> ++ 2 files changed, 46 insertions(+)
> ++
> ++diff --git a/src/gallium/drivers/freedreno/freedreno_screen.c b/src/gallium/drivers/freedreno/freedreno_screen.c
> ++index f338d75..cbb5b8a 100644
> ++--- a/src/gallium/drivers/freedreno/freedreno_screen.c
> +++++ b/src/gallium/drivers/freedreno/freedreno_screen.c
> ++@@ -40,6 +40,7 @@
> ++
> ++ #include "util/os_time.h"
> ++
> +++#include <drm_fourcc.h>
> ++ #include <errno.h>
> ++ #include <stdio.h>
> ++ #include <stdlib.h>
> ++@@ -732,6 +733,37 @@ fd_screen_bo_get_handle(struct pipe_screen *pscreen,
> ++      }
> ++ }
> ++
> +++static void
> +++fd_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
> +++             enum pipe_format format,
> +++             int max, uint64_t *modifiers,
> +++             unsigned int *external_only,
> +++             int *count)
> +++{
> +++     struct fd_screen *screen = fd_screen(pscreen);
> +++     int i, num = 0;
> +++
> +++     max = MIN2(max, screen->num_supported_modifiers);
> +++
> +++     if (!max) {
> +++             max = screen->num_supported_modifiers;
> +++             external_only = NULL;
> +++             modifiers = NULL;
> +++     }
> +++
> +++     for (i = 0; i < max; i++) {
> +++             if (modifiers)
> +++                     modifiers[num] = screen->supported_modifiers[i];
> +++
> +++             if (external_only)
> +++                     external_only[num] = 0;
> +++
> +++             num++;
> +++     }
> +++
> +++     *count = num;
> +++}
> +++
> ++ struct fd_bo *
> ++ fd_screen_bo_from_handle(struct pipe_screen *pscreen,
> ++              struct winsys_handle *whandle)
> ++@@ -921,6 +953,17 @@ fd_screen_create(struct fd_device *dev)
> ++      pscreen->fence_finish = fd_fence_finish;
> ++      pscreen->fence_get_fd = fd_fence_get_fd;
> ++
> +++     pscreen->query_dmabuf_modifiers = fd_screen_query_dmabuf_modifiers;
> +++
> +++     if (!screen->supported_modifiers) {
> +++             static const uint64_t supported_modifiers[] = {
> +++                     DRM_FORMAT_MOD_LINEAR,
> +++             };
> +++
> +++             screen->supported_modifiers = supported_modifiers;
> +++             screen->num_supported_modifiers = ARRAY_SIZE(supported_modifiers);
> +++     }
> +++
> ++      slab_create_parent(&screen->transfer_pool, sizeof(struct fd_transfer), 16);
> ++
> ++      return pscreen;
> ++diff --git a/src/gallium/drivers/freedreno/freedreno_screen.h b/src/gallium/drivers/freedreno/freedreno_screen.h
> ++index 6be739a..5558066 100644
> ++--- a/src/gallium/drivers/freedreno/freedreno_screen.h
> +++++ b/src/gallium/drivers/freedreno/freedreno_screen.h
> ++@@ -89,6 +89,9 @@ struct fd_screen {
> ++      struct fd_batch_cache batch_cache;
> ++
> ++      bool reorder;
> +++
> +++     unsigned num_supported_modifiers;
> +++     const uint64_t *supported_modifiers;
> ++ };
> ++
> ++ static inline struct fd_screen *
> ++--
> ++2.7.4
> ++
> +diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> +index 86d6a6b..0558690 100644
> +--- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> ++++ b/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> +@@ -7,6 +7,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> +            file://0004-Use-Python-3-to-execute-the-scripts.patch \
> +            file://0005-dri-i965-Add-missing-time.h-include.patch \
> +            file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> ++           file://0001-freedreno-add-query-for-dmabuf-modifiers.patch \
> + "
> +
> + SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
> +--
> +2.7.4
> +
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
> +       }
> + }
> +
> ++static void
> ++fd_screen_query_dmabuf_modifiers(struct pipe_screen *pscreen,
> ++              enum pipe_format format,
> ++              int max, uint64_t *modifiers,
> ++              unsigned int *external_only,
> ++              int *count)
> ++{
> ++      struct fd_screen *screen = fd_screen(pscreen);
> ++      int i, num = 0;
> ++
> ++      max = MIN2(max, screen->num_supported_modifiers);
> ++
> ++      if (!max) {
> ++              max = screen->num_supported_modifiers;
> ++              external_only = NULL;
> ++              modifiers = NULL;
> ++      }
> ++
> ++      for (i = 0; i < max; i++) {
> ++              if (modifiers)
> ++                      modifiers[num] = screen->supported_modifiers[i];
> ++
> ++              if (external_only)
> ++                      external_only[num] = 0;
> ++
> ++              num++;
> ++      }
> ++
> ++      *count = num;
> ++}
> ++
> + struct fd_bo *
> + fd_screen_bo_from_handle(struct pipe_screen *pscreen,
> +               struct winsys_handle *whandle)
> +@@ -921,6 +953,17 @@ fd_screen_create(struct fd_device *dev)
> +       pscreen->fence_finish = fd_fence_finish;
> +       pscreen->fence_get_fd = fd_fence_get_fd;
> +
> ++      pscreen->query_dmabuf_modifiers = fd_screen_query_dmabuf_modifiers;
> ++
> ++      if (!screen->supported_modifiers) {
> ++              static const uint64_t supported_modifiers[] = {
> ++                      DRM_FORMAT_MOD_LINEAR,
> ++              };
> ++
> ++              screen->supported_modifiers = supported_modifiers;
> ++              screen->num_supported_modifiers = ARRAY_SIZE(supported_modifiers);
> ++      }
> ++
> +       slab_create_parent(&screen->transfer_pool, sizeof(struct fd_transfer), 16);
> +
> +       return pscreen;
> +diff --git a/src/gallium/drivers/freedreno/freedreno_screen.h b/src/gallium/drivers/freedreno/freedreno_screen.h
> +index 6be739a..5558066 100644
> +--- a/src/gallium/drivers/freedreno/freedreno_screen.h
> ++++ b/src/gallium/drivers/freedreno/freedreno_screen.h
> +@@ -89,6 +89,9 @@ struct fd_screen {
> +       struct fd_batch_cache batch_cache;
> +
> +       bool reorder;
> ++
> ++      unsigned num_supported_modifiers;
> ++      const uint64_t *supported_modifiers;
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
>             file://0004-Use-Python-3-to-execute-the-scripts.patch \
>             file://0005-dri-i965-Add-missing-time.h-include.patch \
>             file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> +           file://0001-freedreno-add-query-for-dmabuf-modifiers.patch \
>  "
>
>  SRC_URI[md5sum] = "2f8d2098ab478bc3907e42130577b54a"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

