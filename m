Return-Path: <jpewhacker@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6428B7F989
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:38:04 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id z90so4480186ilc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=7NSWp7lRJVl6ZxjFntUoSiB3zlgj5oeVTGSdvZbs+eI=;
	b=o42rAMIbtFr+Pzm0rq+u7VhQozfTViZYVkl4Ir7e1v4mOHq162mIaWOhIld+gxaIXb
	CUFUoH9rY433F3TXIVLAfsXGiSrWvhoJueaVoObdsEzik7NH9mXC5CtPECqAGQLB/MsS
	4opkLNGYkNWRgbhZ1pfxjsu0rgsq7F9T/PATcsnNhgwaeDRMFgJh7I6hdQKOFHEOg/rg
	utzlvhII5W9QpMZ5vcXd9/HVCI4/fNLpih9JW498PPuLPyCqCoSOjmo13P+JbveqYQdP
	6cqQZfYBPfMbi2BRHpIZqWnDId/MkUjMau02/83V1sbx7wfspIknsMRbwaJeek6XtHS+
	gRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=7NSWp7lRJVl6ZxjFntUoSiB3zlgj5oeVTGSdvZbs+eI=;
	b=CDpDia6AYH6QpGIPAbH6jOj1d7h4qEO8TFyt2p+VA9RyHe2qHvVTS2ooetm65PklEk
	EhObiZp8ndXG+yUYza3bm0sI3maJDoLGaRtNcqigm8eaTQ9l/nsSuQh+l9sVb4yAC8GF
	svLwqd8UqZ5/MwAIQoJOyPV0joxQi7WJy6anizsaLtX/5sxYjsziauECqf3czuvpdpD9
	Xfbias1pW4Nm2CwBjVsMBEr9fUoOSj9zAfySTgJD5evuotNPShjykRqyTQNHCMbMdMl5
	2AxKC5UkHEliFd26og6khSjerlMbhStz1XFOQ2t2uRli2CRbjSBTLNeNAtBYEKAa781v
	NkEQ==
X-Gm-Message-State: APjAAAVWsp+tAkecHg6SuKGrkc+dBA4e4HFjL1JKft/eZQfRmZlgNo/a
	u0PKoZSBSbXrC7EnHF1AEZjhG+oeKjs=
X-Google-Smtp-Source: APXvYqzXjsLiAOODDmRDKVh000WiETTiM19Sd7xWica0VWiV1alsQOug2Xq1rjdmqroJlUpepH+ZZQ==
X-Received: by 2002:a05:6e02:d92:: with SMTP id
	i18mr10927392ilj.20.1575585484959; 
	Thu, 05 Dec 2019 14:38:04 -0800 (PST)
Received: from [10.30.196.43] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	h14sm3239730ilc.87.2019.12.05.14.38.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 14:38:04 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20191205213428.13693-1-richard.purdie@linuxfoundation.org>
Message-ID: <93a53bb8-3f54-2411-c1d9-83f74af2b6b8@gmail.com>
Date: Thu, 5 Dec 2019 16:38:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205213428.13693-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] qemu-helper-native/systemtap-native: Ensure sysroots are populated with dependencies
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
X-List-Received-Date: Thu, 05 Dec 2019 22:38:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12/5/19 3:34 PM, Richard Purdie wrote:
> As Alex Kanavin found, dependencies aren't always populated, particularly
> with the hash equivalence server enabled locally:
>
> 'bitbake core-image-minimal' with gtk+ disabled.
> can confirm with: $ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
> qemu-system-x86_64: Display 'gtk' is not available.
> Enable gtk in local.conf with: PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
> 'bitbake core-image-minimal', without deleting tmp/
> $ tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -display gtk
> qemu-system-x86_64: Display 'gtk' is not available.
>
> This change ensures the dependencies are correctly handled as the full
> sysroot is always depended upon even if things come from sstate.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/native.bbclass                           | 2 +-
>   meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb  | 2 +-
>   meta/recipes-kernel/systemtap/systemtap-native_git.bb | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index d5b6f6af8bb..2cc6ad60b34 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -185,7 +185,7 @@ native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
>   python do_addto_recipe_sysroot () {
>       bb.build.exec_func("extend_recipe_sysroot", d)
>   }
> -addtask addto_recipe_sysroot after do_populate_sysroot
> +addtask addto_recipe_sysroot after do_populate_sysroot do_prepare_recipe_sysroot

I didn't mention it, but cross.bbclass does this too.

>   
>   inherit nopackages
>   
> diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> index 372eebd8864..ab4eb2d2268 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
> @@ -21,4 +21,4 @@ do_install() {
>   }
>   
>   DEPENDS += "qemu-system-native"
> -addtask addto_recipe_sysroot after do_populate_sysroot before do_build
> +addtask addto_recipe_sysroot after do_populate_sysroot do_prepare_recipe_sysroot before do_build
> diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
> index 19cc1cf0f0a..b00f66e25dd 100644
> --- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
> @@ -3,4 +3,4 @@ require systemtap_git.bb
>   
>   inherit native
>   
> -addtask addto_recipe_sysroot after do_populate_sysroot before do_build
> +addtask addto_recipe_sysroot after do_prepare_recipe_sysroot do_populate_sysroot before do_build

