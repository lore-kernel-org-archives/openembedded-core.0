Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0C0C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:39:52 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.1476.1659980382165381623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VGM1siHY;
 spf=pass (domain: gmail.com, ip: 209.85.210.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d20so8703157pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LuR7AyUFaL8WYBa3qC3EaPcJmhmg01aOnrBaFzO3lYE=;
        b=VGM1siHY9MGAsaBS+b7oeqEtJKEzmUZUMvBdBD8K8aJpKZPZfm+yZrwD1shckdLgvq
         cWU09za2jyMypRQ7MFpsi5AJsgYdZtaJvcIhnN14JE5RsCTSrfF/tkMWYFmL2w/Qw0p1
         Sx/kBAVbbCg4SefMQL5S1ooKiMlP57sxmBXSgmLseEaKEo59aKbi0JuRZ9uegyh73a+B
         ufhumZVRvIlten7AiLBYtE4T2XTEnil74iAmUjTZrTUraj6fxwmW8TlWK6uFnt80pI4O
         c3iXOgCE7M9TSSVs7qn9FE6la+fRs7HXs6OYT/JQsUdjmDP5wTTh4lwjeU/fQRDkg0jh
         1qEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LuR7AyUFaL8WYBa3qC3EaPcJmhmg01aOnrBaFzO3lYE=;
        b=DsYT+d5xpuiDDTPKYMNbm1hyVbrlmeVrjUPMV/2fuMg8ZoxxMdAJO7ftJWXQmy7WT+
         1NlydT7rK5PltWiDAvJ1ZJrKic6dWXkqJ6/exjX5kaA4VzUk7Btu39QYQb7LxlhVAKYa
         fa6QlqgrnqZmlWm+Egvl4I4gbrBke6XhuGAH5Ik9Eo8fbK1wl2DZnjmL8zoIfhqtnS4G
         14yaVCfWKh/LrG3v3YGuxZcoVJGb840f2CiJNwL4GetCKR2bfe/1Szca88nHtYTEPIyN
         j51MakMp+6I3NpbEZwgokJe8z93F7SosUjEvPRnGA9qfCYpcvYF12/v5N6zqs7HCL01t
         JtqA==
X-Gm-Message-State: ACgBeo25cSAonLgagfpYNdT0wvHOnvIDoTQqbfCsUWywtzk28odOI4+V
	s7/JjJq8hdGFGPKoEH4B7A4=
X-Google-Smtp-Source: 
 AA6agR7177lAghZ8rspWgZ69onhywEyRDljYmjfpJZy9iWDf1JH3SQx/1ZIAbHPBkdyucbfDZjEJWA==
X-Received: by 2002:a63:d117:0:b0:41a:f0ee:f194 with SMTP id
 k23-20020a63d117000000b0041af0eef194mr15685676pgg.588.1659980381482;
        Mon, 08 Aug 2022 10:39:41 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:f9ab:8bd3:9e60:d783?
 ([2601:646:9200:a0f0:f9ab:8bd3:9e60:d783])
        by smtp.gmail.com with ESMTPSA id
 b6-20020a655786000000b0041d9e78de05sm1453769pgr.73.2022.08.08.10.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 10:39:40 -0700 (PDT)
Message-ID: <c5feaf04-72c9-239c-2f79-03dd56cb5df0@gmail.com>
Date: Mon, 8 Aug 2022 10:39:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.1
Subject: Re: [OE-core] [PATCH v2 44/44] weston: upgrade 10.0.1 -> 10.0.2
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
 <20220808064237.3975347-44-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220808064237.3975347-44-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 17:39:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169110



On 8/7/22 11:42 PM, Alexander Kanavin wrote:
> Drop dont-use-plane-add-prop.patch as issue is fixed elsewhere
> (see the link in the patch).
> 

I think this needs some verification if this implied patch really fixes 
the problem. I will see if I can test it out in coming week.

> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   .../weston/dont-use-plane-add-prop.patch      | 32 -------------------
>   .../{weston_10.0.1.bb => weston_10.0.2.bb}    |  4 +--
>   2 files changed, 1 insertion(+), 35 deletions(-)
>   delete mode 100644 meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
>   rename meta/recipes-graphics/wayland/{weston_10.0.1.bb => weston_10.0.2.bb} (97%)
> 
> diff --git a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch b/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
> deleted file mode 100644
> index 1ac0695222..0000000000
> --- a/meta/recipes-graphics/wayland/weston/dont-use-plane-add-prop.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ece4c3d261aeec230869c0304ed1011ff6837c16 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 12 Sep 2020 14:04:04 -0700
> -Subject: [PATCH] Fix atomic modesetting with musl
> -
> -atomic modesetting seems to fail with drm weston backend and this patch fixes
> -it, below errors are seen before weston exits
> -
> -atomic: couldn't commit new state: Invalid argument
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/weston/-/issues/158]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - libweston/backend-drm/kms.c | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/libweston/backend-drm/kms.c b/libweston/backend-drm/kms.c
> -index 780d007..9994da1 100644
> ---- a/libweston/backend-drm/kms.c
> -+++ b/libweston/backend-drm/kms.c
> -@@ -1142,8 +1142,8 @@ drm_pending_state_apply_atomic(struct drm_pending_state *pending_state,
> - 		wl_list_for_each(plane, &b->plane_list, link) {
> - 			drm_debug(b, "\t\t[atomic] starting with plane %lu disabled\n",
> - 				  (unsigned long) plane->plane_id);
> --			plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
> --			plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
> -+			//plane_add_prop(req, plane, WDRM_PLANE_CRTC_ID, 0);
> -+			//plane_add_prop(req, plane, WDRM_PLANE_FB_ID, 0);
> - 		}
> -
> - 		flags |= DRM_MODE_ATOMIC_ALLOW_MODESET;
> diff --git a/meta/recipes-graphics/wayland/weston_10.0.1.bb b/meta/recipes-graphics/wayland/weston_10.0.2.bb
> similarity index 97%
> rename from meta/recipes-graphics/wayland/weston_10.0.1.bb
> rename to meta/recipes-graphics/wayland/weston_10.0.2.bb
> index e27dac164e..f81a33fd1e 100644
> --- a/meta/recipes-graphics/wayland/weston_10.0.1.bb
> +++ b/meta/recipes-graphics/wayland/weston_10.0.2.bb
> @@ -13,9 +13,7 @@ SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downlo
>              file://systemd-notify.weston-start \
>              "
>   
> -SRC_URI:append:libc-musl = " file://dont-use-plane-add-prop.patch "
> -
> -SRC_URI[sha256sum] = "8a9e52506a865a7410981b04f8341b89b84106db8531ab1f9fdd37b5dc034115"
> +SRC_URI[sha256sum] = "89646ca0d9f8d413c2767e5c3828eaa3fa149c2a105b3729a6894fa7cf1549e7"
>   
>   UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169068): https://lists.openembedded.org/g/openembedded-core/message/169068
> Mute This Topic: https://lists.openembedded.org/mt/92887040/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

