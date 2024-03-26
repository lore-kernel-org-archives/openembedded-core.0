Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBB0C54E67
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 07:47:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.3220.1711439235612218775
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 00:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eLg4ItDU;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d90dfe73cso2787518f8f.0
        for <Openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711439233; x=1712044033; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vBoZ5x/jCnvDoDVTEPd2q7Ck3KKM64w7yxuIV9BakRk=;
        b=eLg4ItDUccK/vnU5FJkMVkkG+HbEqt2XHxddDLxDhgxDlvYztRqomanc5mAOyk1U5p
         QgKi902Y5fDbUW6oQ62kM9Nxhizg3xRKxy8+Wk39ypfyNymIFokF22aUD8sfGiegh3kz
         aPaxP6x1sRv/UPIHeZkmthJgqRWEsAI0sxYbri0QJKdsD1Bi19WoPrJ9MxaSt1ewSk2e
         ejAmWXispP+Ypok1mUVhVZJKJR/g1B4AxHA9AMWdlx4g9SCIaoGg6u9OJfKMsDg206o+
         vOT0NCLmGaEOD8eTb1yppDXp94NiNvH1O56keXtv1l4FCSiAravF8Hms0vr4hSzhCQSO
         o7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439233; x=1712044033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBoZ5x/jCnvDoDVTEPd2q7Ck3KKM64w7yxuIV9BakRk=;
        b=rYSIxcSv/ckBURFKBrWtYXc8/t8ussN2bJnKAlgyBIbOZondGoCqQNRmkQ5knt8LYE
         v1QZuC19Hmrgz3MGKnGAU1yUIXOZe3+chTuvtCQ3STdELcPiBCGX8tnlKXlcGBKrl7wy
         RRtso/fV6e6bSZV0urnRAls2mMXhG44zMIiFQoabL44Xt5VXXzb4cu/CERJ8z9L++AZr
         iHK63bDCoCMBEHZvbChJhc++MnYDRwlGqYRa7xM/Fzh6gOuT58iVE3J9Vo2yionfevtW
         gZSVQGpOHCQtQ814PPSPpG6+PbYF0fvoIdnvL1an3lxSuMOS8Sxw6wl0V8A1k847Dq6n
         ElPQ==
X-Gm-Message-State: AOJu0YyCteplO8MQr8ck7njDS3RoBmTtQbtY9YFFyINuJdZdEBk5beoq
	DnydJOHCOfUmis5kWPOpss0PQecPTZhaW2a3HVsUuevnXvCNhLPq3DiBj/lbLOw=
X-Google-Smtp-Source: AGHT+IEiPxQU+Kq2VxwWpEUbtBcuQy/p1b44WEBszLcSJuWeEXiE1n/SJHgXjP1CJx+GjqGlOJPCyw==
X-Received: by 2002:a5d:60c1:0:b0:33e:d139:412c with SMTP id x1-20020a5d60c1000000b0033ed139412cmr486141wrt.30.1711439233397;
        Tue, 26 Mar 2024 00:47:13 -0700 (PDT)
Received: from [10.139.9.184] ([154.47.27.148])
        by smtp.gmail.com with ESMTPSA id c16-20020a05600c0a5000b00414906bab98sm151116wmq.40.2024.03.26.00.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:47:12 -0700 (PDT)
Message-ID: <24a3eab2-30db-4ee6-accc-7f51577fcee5@gmail.com>
Date: Tue, 26 Mar 2024 08:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/selftest/overlayfs: test read-only rootfs
To: Openembedded-core@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>
References: <17BDA4425135504F.24786@lists.openembedded.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <17BDA4425135504F.24786@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 07:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197527

Just checking if there's any feedback for the patch or something that 
stops it from being merged.

Slava

On 17.03.2024 20:33, Vyacheslav Yurkov via lists.openembedded.org wrote:
> From: Baruch Siach <baruch@tkos.co.il>
>
> Use the read-only squashfs filesystem to test the read-only case.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>   meta-selftest/wic/overlayfs_etc.wks.in    |  4 +--
>   meta/lib/oeqa/selftest/cases/overlayfs.py | 34 +++++++++++++++++++----
>   2 files changed, 30 insertions(+), 8 deletions(-)
>
> diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
> index 1e1e5836e7..066cd35b15 100644
> --- a/meta-selftest/wic/overlayfs_etc.wks.in
> +++ b/meta-selftest/wic/overlayfs_etc.wks.in
> @@ -1,4 +1,4 @@
>   part /boot --active --source bootimg-biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
> -part / --source rootfs --ondisk sda --fstype=ext4 --use-uuid --align 1024
> +part / --source rootfs --ondisk sda --fstype=${OVERLAYFS_ROOTFS_TYPE} --use-uuid --align 1024
>   part --ondisk sda --fstype=ext4 --size=5 --align 1024
> -bootloader --ptable gpt --timeout=1 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
> +bootloader --ptable gpt --timeout=1 --append="rootfstype=${OVERLAYFS_ROOTFS_TYPE} console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
> index cd0dc60c64..e31063567b 100644
> --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -353,6 +353,7 @@ EXTRA_IMAGE_FEATURES += "read-only-rootfs"
>   # Image configuration for overlayfs-etc
>   OVERLAYFS_ETC_MOUNT_POINT = "/data"
>   OVERLAYFS_ETC_DEVICE = "/dev/sda3"
> +OVERLAYFS_ROOTFS_TYPE = "ext4"
>   """
>   
>           self.write_config(config)
> @@ -367,13 +368,17 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>   
>       @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
>       def test_sbin_init_preinit(self):
> -        self.run_sbin_init(False)
> +        self.run_sbin_init(False, "ext4")
>   
>       @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
>       def test_sbin_init_original(self):
> -        self.run_sbin_init(True)
> +        self.run_sbin_init(True, "ext4")
>   
> -    def run_sbin_init(self, origInit):
> +    @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
> +    def test_sbin_init_read_only(self):
> +        self.run_sbin_init(True, "squashfs")
> +
> +    def run_sbin_init(self, origInit, rootfsType):
>           """
>           Summary:   Confirm we can replace original init and mount overlay on top of /etc
>           Expected:  Image is created successfully and /etc is mounted as an overlay
> @@ -384,7 +389,9 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>   
>           args = {
>               'OVERLAYFS_INIT_OPTION': "" if origInit else "init=/sbin/preinit",
> -            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True)
> +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': int(origInit == True),
> +            'OVERLAYFS_ROOTFS_TYPE': rootfsType,
> +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': int(rootfsType == "ext4")
>           }
>   
>           self.write_config(config.format(**args))
> @@ -437,7 +444,9 @@ IMAGE_INSTALL:append = " overlayfs-user"
>   
>           args = {
>               'OVERLAYFS_INIT_OPTION': "",
> -            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1
> +            'OVERLAYFS_ETC_USE_ORIG_INIT_NAME': 1,
> +            'OVERLAYFS_ROOTFS_TYPE': "ext4",
> +            'OVERLAYFS_ETC_CREATE_MOUNT_DIRS': 1
>           }
>   
>           self.write_config(config.format(**args))
> @@ -463,10 +472,14 @@ IMAGE_INSTALL:append = " overlayfs-user"
>   INIT_MANAGER = "systemd"
>   
>   # enable overlayfs in the kernel
> -KERNEL_EXTRA_FEATURES:append = " features/overlayfs/overlayfs.scc"
> +KERNEL_EXTRA_FEATURES:append = " \
> +    features/overlayfs/overlayfs.scc \
> +    cfg/fs/squashfs.scc"
>   
>   IMAGE_FSTYPES += "wic"
>   OVERLAYFS_INIT_OPTION = "{OVERLAYFS_INIT_OPTION}"
> +OVERLAYFS_ROOTFS_TYPE = "{OVERLAYFS_ROOTFS_TYPE}"
> +OVERLAYFS_ETC_CREATE_MOUNT_DIRS = "{OVERLAYFS_ETC_CREATE_MOUNT_DIRS}"
>   WKS_FILE = "overlayfs_etc.wks.in"
>   
>   EXTRA_IMAGE_FEATURES += "read-only-rootfs"
> @@ -477,4 +490,13 @@ OVERLAYFS_ETC_MOUNT_POINT = "/data"
>   OVERLAYFS_ETC_FSTYPE = "ext4"
>   OVERLAYFS_ETC_DEVICE = "/dev/sda3"
>   OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "{OVERLAYFS_ETC_USE_ORIG_INIT_NAME}"
> +
> +ROOTFS_POSTPROCESS_COMMAND += "{OVERLAYFS_ROOTFS_TYPE}_rootfs"
> +
> +ext4_rootfs() {{
> +}}
> +
> +squashfs_rootfs() {{
> +    mkdir -p ${{IMAGE_ROOTFS}}/data
> +}}
>   """
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197270): https://lists.openembedded.org/g/openembedded-core/message/197270
> Mute This Topic: https://lists.openembedded.org/mt/104989652/4455192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [uvv.mail@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


