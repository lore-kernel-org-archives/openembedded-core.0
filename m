Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE238C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 11:08:43 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.10049.1639048122000936741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 03:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T+RFXrXM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id u1so8964364wru.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 03:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kQKLCpiqPX41kJMEbE9JCVYKsMaLDKxdTD5p/6aAFik=;
        b=T+RFXrXMcomXmGmRUgd7bTMQG9EG1Lnr31jPqHFl6WQ2lxDg8bGJ3EZ4MltRncoUC/
         5VB9GSdRLedPHqOw1mDwVMsoW4TDqjgZbkHgyNynIfduxhCeSqjJod5yOOug1E8YaedO
         wuFVeVXBvEPq3Gbm7ihu5B4nrYh1+TEY35mbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kQKLCpiqPX41kJMEbE9JCVYKsMaLDKxdTD5p/6aAFik=;
        b=W3s22tyL0ag9TbBQTP3FOC9Q9QilQqZsCt+D7P2t5dy9u3GXfg5Ihm42y3iNpolvoi
         fLUVT0BhcM3wDgMfRTEFaBp6thv9fXFpwN9BqH7pjCOhhjAgHytBFluB7f+9D11q++QN
         EgwNtY44b4WtL5jdr+JBlg5DCdmrCdpNaGdmbS+8I0u1NqYOF7J6df8lYnBfNw0u5Ni3
         Q8YpiiQZvKiO3Ui2tURn3MokqQRthHCxTk+xGc4aHbsjw9iSvs3FraFbHaM/NCoFkw4I
         AbS4lttoSQ10TR8JZXlv6+avHmM7rVcKZ7vxZepAbrNLckXEbLxiYPtRPW2VJKRmFPF8
         7iiQ==
X-Gm-Message-State: AOAM530PMOWha9XkikXszXKf9IIHz29k1gMNthTcJmcB+yi3czHM4+kO
	xgWP6Ishith1GH/ZQcLUD6BrWw==
X-Google-Smtp-Source: 
 ABdhPJy78WdDW8k9Ir9IdM4VrXf0cwFbpWtALd9n+bLp4hTXQQ7li82chvNXsB4y9Cgpi+OTS8B1aA==
X-Received: by 2002:adf:ce03:: with SMTP id p3mr5607024wrn.145.1639048120285;
        Thu, 09 Dec 2021 03:08:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed?
 ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id
 l5sm7587821wrs.59.2021.12.09.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 03:08:40 -0800 (PST)
Message-ID: 
 <26ede260f595ddb3d8cdda552d74ac478c1e529f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 09 Dec 2021 11:08:39 +0000
In-Reply-To: 
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
	 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 11:08:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159445

On Fri, 2021-11-19 at 07:15 +0100, Vyacheslav Yurkov wrote:
> This class provides an image feature that mounts /etc as an overlayfs
> file system. This is an extension for existing overlayfs class, which
> doesn't support /etc
> 
> Signed-off-by: Alfred Schapansky <alfred.schapansky@avantys.de>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/classes/overlayfs-etc.bbclass | 93 ++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 meta/classes/overlayfs-etc.bbclass
> 
> diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
> new file mode 100644
> index 0000000000..78caf0211b
> --- /dev/null
> +++ b/meta/classes/overlayfs-etc.bbclass
> @@ -0,0 +1,93 @@
> +# Class for setting up /etc in overlayfs
> +#
> +# In order to have /etc directory in overlayfs a special handling at early boot stage is required
> +# The idea is to supply a custom init script that mounts /etc before launching actual init program,
> +# because the latter already requires /etc to be mounted
> +#
> +# The configuration must be machine specific. You should at least set these two variables if you
> +# are not happy with default values:
> +#   OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
> +#   OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
> +#
> +# To control more mount options you should consider also setting file system type and mount options:
> +#   OVERLAYFS_ETC_FSTYPE ?= "ext4"
> +#   OVERLAYFS_ETC_MOUNT_OPTIONS ?= "defaults"
> +#
> +# The class provides two options for /sbin/init generation
> +# 1. Default option is to rename original /sbin/init to /sbin/init.orig and place generated init under
> +#    original name, i.e. /sbin/init. It has an advantage that you won't need to change any kernel
> +#    parameters in order to make it work, but it poses a restriction that package-management can't
> +#    be used, becaause updating init manager would remove generated script
> +# 2. If you are would like to keep original init as is, you can set
> +#    OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
> +#    Then generated init will be named /sbin/preinit and you would need to extend you kernel parameters
> +#    manually in your bootloader configuration.
> +#
> +# Regardless which mode you choose, update and migration strategy of configuration files under /etc
> +# overlay is out of scope of this class
> +
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
> +IMAGE_FEATURES_CONFLICTS_overlayfs-etc = "package-management"
> +
> +OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
> +OVERLAYFS_ETC_FSTYPE ?= "ext4"
> +OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
> +OVERLAYFS_ETC_USE_ORIG_INIT_NAME ?= "1"
> +OVERLAYFS_ETC_MOUNT_OPTIONS ?= "defaults"
> +
> +python create_overlayfs_etc_preinit() {
> +    PreinitTemplate = """#!/bin/sh
> +
> +echo "PREINIT: Start"
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +mount -o remount,rw /
> +
> +mkdir -p /proc
> +mkdir -p /sys
> +mkdir -p /run

Sorry about the delay replying on this. Something has been bothering me about
the code and I haven't been able to articulate it. I think Ross is right about
part of it, the defaults are very device specific and need to be invalid by
default which checks to ensure they're set.

The second thing which I don't really like is this mix of shell and python, it
is very confusing to read. I'd much rather we put template files into
meta/lib/files/ and then read them from there for the variable substitutions. We
do this for other scripts. I appreciate the overlayfs class merged without that
but I think we need to fix this there as well.

Adding the tests in this series is really great through, thanks for that!

Cheers,

Richard







