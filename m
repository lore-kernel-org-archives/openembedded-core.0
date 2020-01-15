Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0772C7FA0E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 10:11:54 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so15152608wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 02:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QyQyTYB/btYOeA9ZlUATcjdhtsAmAiH235Tv3zswJW0=;
	b=HVWIKNzZdBUycWeaLtyjP6dUXYJXSl1h+re4907qmqQ+0Qg7qu5iQz1HRnah73sjRG
	Di8n/LelMYd+0G0KPLVJmP6iX0KGC7zh1j1/tlhnoSkHptdcy5Afny31ErRMZRw1zR3g
	n2LZYzpf8Xpff1czvXzWvZrtbQS0Q5jTXjuRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QyQyTYB/btYOeA9ZlUATcjdhtsAmAiH235Tv3zswJW0=;
	b=uf9HYp+stUk4Z0LLgpixVg6aut9IBrN6bhTolkuUnhnj0gqFAgdAsxGcQ2lCNhu/K5
	66oawq+1uFxokd1l1+XpvdP82VoFRaFaYRtHylk8kktwMfOlRwiTPJT4BAgLhM/ncmOz
	NCXP8IJu/ooISbnK0lqXPL+j/hv/VGh66RCRxhUA4OFhAfF4Yd1HzFnGiuGWQbLh9s16
	eQ6WQWNb40HKww/2Pb2RvYXXVRWJymRzp9ax0p5m1dZo1mp7csKHNYfJsKkXd0RIwnGb
	rtlTd/Nc7Sr3Uzv2LNIMVdDxOegD0+jqHaUs8hSH/KBgIaAia5wUn1dlUr52To8Zk1RO
	1xdw==
X-Gm-Message-State: APjAAAUA0dlC7wxAdbDMTcWAl5vhujUZsQwiYT011bHPUUETcpB8EH4N
	lAULCGQiTINE8cXTg4Zxm7M+Y2nwwRg=
X-Google-Smtp-Source: APXvYqzE9rvNatsDXV9OIsbV+dUmq0DwMnuTbMQAjFZx8cYAEXX5U2tZUqz/uaHU63+E6XE6d+SBOw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr30878744wrm.241.1579083115690;
	Wed, 15 Jan 2020 02:11:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e16sm23962322wrs.73.2020.01.15.02.11.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 02:11:55 -0800 (PST)
Message-ID: <50e1b55b6b461da89e067f3d35c07bef015ad6d0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Jan 2020 10:11:54 +0000
In-Reply-To: <eb4b74da5c7986f53a7e419dcfef2d4acf11dcdc.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
	<eb4b74da5c7986f53a7e419dcfef2d4acf11dcdc.1578993027.git.Martin.Jansa@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCHv5 3/8] kernel-artifact-names.bbclass: use PR instead of PKGR in KERNEL_ARTIFACT_NAME
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
X-List-Received-Date: Wed, 15 Jan 2020 10:11:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-14 at 10:12 +0100, Martin Jansa wrote:
> * otherwise PKGR seen in do_install, do_deploy and do_deploy_links
> will
>   have different value in each of them (PRSERV will return different
>   value of EXTENDPRAUTO because TASKHASH is different for each of
> these
>   tasks and also cause unnecessary multiple EXTENDPRAUTO increments
> for
>   each build).
> 
> [YOCTO #12937]
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/kernel-artifact-names.bbclass | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-artifact-names.bbclass
> b/meta/classes/kernel-artifact-names.bbclass
> index 529e0c565e..41ef6e884d 100644
> --- a/meta/classes/kernel-artifact-names.bbclass
> +++ b/meta/classes/kernel-artifact-names.bbclass
> @@ -6,7 +6,12 @@
>  
>  inherit image-artifact-names
>  
> -KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}"
> +# Intentionally use PR instead of PKGR, because EXTENDPRAUTO
> included
> +# in PKGR will have different value for
> do_install/do_deploy/do_deploy_links
> +# tasks with different TASKHASH, causing multiple EXTENDPRAUTO
> increments for
> +# each kernel build and more importantly preventing do_deploy_links
> to
> +# reference artifacts created do_deploy task
> +KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PR}-${MACHINE}"
>  KERNEL_ARTIFACT_LINK_NAME ?=
> "${KERNEL_ARTIFACT_NAME}${IMAGE_VERSION_SUFFIX}"

Perhaps this is why patch 5/8 is necessary? ("kernel.bbclass: drop
unnecessary package_get_auto_pr for do_install")

I suspect there are links between these two patches...

Cheers,

Richard


