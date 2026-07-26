Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB42C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 22:19:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19426.1785104342529385523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 15:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=auR/ipc0;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4955de8797cso12394335e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 15:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785104341; x=1785709141; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xcwmSwH1pYE4VetprWDPXrFdb9hv3+8lwVtNQMWcr0=;
        b=auR/ipc0R1ye/4/yHQWMorp0vydTFcgBrnNeN9ldPnmKkJ/UEK1QrOsGvnEjTF/4qm
         LO2s5X5HRot/YE+EiNgqwUFiGs/HsI+rMKeQ87NAIQm9cY57Hl90dsRvu3Nd7fanWnrp
         Z9kPtKMWqB+Dz5PzWxHT5tbY+2PFywYqSqPNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785104341; x=1785709141;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9xcwmSwH1pYE4VetprWDPXrFdb9hv3+8lwVtNQMWcr0=;
        b=EcD/lXdTZoheKL51PcCKBsR6qhBhZFhLW0aoL0S3G838GeHA2skdZtyx+SIfipgzs7
         r/R86GdyuIuJnnrYbixe6eQMxfG6NMcb0XacQgwPoW00ez7dHtulQ+3j1XHdIpT8M2ch
         AJy0fQ7lQ8vtFJL4Jt5/R3ymV/Vo1e5Tw/p5RLcnTBrHty3by56RO4tIxhUiXhc7WK7N
         RHvNH/Yqt8Lw5hVMgzwtawOV7XNeU8vbDxe91HHFcchDKToPsfOZR4elYdX4zi1nzWlh
         9In+FJIznTMyCgEuxgmgibhgW98utdIF+6bx+tZC1FWk8z/2KTaoUk3Xzi+FU8KyHoIX
         KdNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhAIhkcLS8ANPUaYp609iqQT3HXxDwelhcs4TiGTiJ4hyJnvyX/E821MxHM9AcGHUF3AfItaCMU7ZYNR1mFzFfLQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWQ0BY9h4Yxfrch5r6fvcSzAEoG7zI4RjXgWFx/eyBF6UABwpF
	V51aM+mKKEoOevX1XGJbRUdKfg8n8R/Pft41m1Cztv5N1go+MMtblzDLZecLzh7RHfs=
X-Gm-Gg: AR+sD13S3hXcVPE6zJhi1Gaw6svjzW+dhNZq36/c+pL5VVOHBQEGh5j9Z5xdaOW46Fj
	uZQMH6Zb/AnvcsrmQ01B2Bq5HH5dE8zmkn00zkqZ57/iU3xDFoPwMStuJBytXHIjz/8Bx6duSPf
	H8xbKQjuqqIX6OGCGKvGRwKnL2AlJ4RQqaj2DySqov6TdFXQM8b4vhzIb7m8twR/vmAYjFmo2HU
	59jTt2oq6HS4JUuyi4DqDC9hZMyEH568EXmJ8MWkCPfPX2FEGd2oJEmGFwbLOfjeg5W8KV/1ZJB
	yyE5UxocMXF/PAnYfnkUjp2ZrvTzYOy2woDXDWDjy2C1MC8RzEUuubrSd0KVnemy1I5bXIOAn1I
	XEGzvk4uMVV0XYksUZ55wdWuk1gNfjG6zrf6/xHmp+3sNtU99ZI/mdvQRgsgJYha7yrEUNYvwHn
	6slvmPlNI4gU89wsbrQn+QlRQ7Hms3LEmLhB2HxIpRI7/WVD36l0fyKvbrkmIVaRrRQA==
X-Received: by 2002:a05:600c:c4a7:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-496b56f1015mr75845455e9.8.1785104340660;
        Sun, 26 Jul 2026 15:19:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4eecb4fsm169764525e9.7.2026.07.26.15.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:19:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:19:00 +0200
Message-Id: <DK8UOCPISPDI.Y24K49JEQX1L@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 2/6] vim: Security Fix for
 CVE-2026-43961
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260725143231.230059-1-sdoshi@mvista.com>
 <20260725143231.230059-2-sdoshi@mvista.com>
In-Reply-To: <20260725143231.230059-2-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 22:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242026

On Sat Jul 25, 2026 at 4:32 PM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://github.com/vim/vim/commit/8af0f098c3a42a28661d0295364e
> [2] https://security-tracker.debian.org/tracker/CVE-2026-43961
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../vim/files/CVE-2026-43961.patch            | 104 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-43961.patch

This patch triggers a fuzz warning:
|ERROR: vim-tiny-9.2.0340-r0 do_patch: QA Issue: Fuzz detected:
|
|Applying patch CVE-2026-43961.patch
|patching file runtime/pack/dist/opt/netrw/autoload/netrw.vim
|patching file src/testdir/test_plugin_netrw.vim
|Hunk #1 succeeded at 639 with fuzz 1 (offset 10 lines).
|patching file src/version.c
|
|
|The context lines in the patches can be updated with devtool:
|
|    devtool modify vim-tiny
|    devtool finish --force-patch-refresh vim-tiny <layer_path>
|
|Don't forget to review changes done by devtool!
|
|Patch log indicates that patches do not apply cleanly. [patch-fuzz]
|ERROR: vim-tiny-9.2.0340-r0 do_patch: Fatal QA errors were found, failing =
task.
|ERROR: Logfile of failure stored in: ...bitbake-builds/poky-wrynose/build/=
tmp/work/x86-64-v3-poky-linux/vim-tiny/9.2.0340/temp/log.do_patch.3626438
|ERROR: Task (...bitbake-builds/poky-wrynose/layers/openembedded-core/meta/=
recipes-support/vim/vim-tiny_9.2.bb:do_patch) failed with exit code '1'
|ERROR: vim-9.2.0340-r0 do_patch: QA Issue: Fuzz detected:
|
|Applying patch CVE-2026-43961.patch
|patching file runtime/pack/dist/opt/netrw/autoload/netrw.vim
|patching file src/testdir/test_plugin_netrw.vim
|Hunk #1 succeeded at 639 with fuzz 1 (offset 10 lines).
|patching file src/version.c
|
|
|The context lines in the patches can be updated with devtool:
|
|    devtool modify vim
|    devtool finish --force-patch-refresh vim <layer_path>
|
|Don't forget to review changes done by devtool!
|
|Patch log indicates that patches do not apply cleanly. [patch-fuzz]
|ERROR: vim-9.2.0340-r0 do_patch: Fatal QA errors were found, failing task.
|ERROR: Logfile of failure stored in: ...bitbake-builds/poky-wrynose/build/=
tmp/work/x86-64-v3-poky-linux/vim/9.2.0340/temp/log.do_patch.3628755
|ERROR: Task (...bitbake-builds/poky-wrynose/layers/openembedded-core/meta/=
recipes-support/vim/vim_9.2.bb:do_patch) failed with exit code '1'

There was another vim CVE series from Vijay Anusuri[0] but I've
requested changes so, now, this series is applied directly on top of
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wryn=
ose-next

Maybe you can work with Vijay Anusuri and send a single consolidated
series with both your vim CVE fixes?

I'll hold this series in the meantime.

[0]: https://lore.kernel.org/openembedded-core/20260722123336.587556-1-vanu=
suri@mvista.com/T/#t
--=20
Yoann Congal
Smile ECS


