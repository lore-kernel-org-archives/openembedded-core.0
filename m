Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B68AC71DF7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 06:47:50 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x124so961223wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Apr 2017 23:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=N/lQHIh8vs8S+IbYR8QK92GDaJSG/69IgN4RsB7WVso=;
	b=rUPYOspMkaRih+AaF1sgqVtWsMgTJXeMrRycLzIYCph3DEr8GO3aMEq4DA7RegRpsA
	DV2J1010JRqgaeFjaDHAhlPXfZWiEhQhpYC5knBYXcP9yHIf9wMP4fhz/FbI4CnWXoqd
	9Rq1gf/GqP+5/DDnl5bW2YBMMDdUxd38BSJTAeD80cJw+lTSVBDAhvLsPl9295SZ6gaj
	qK9/mxhyfSyrr8+ZFkYdILBtO3p8ot2Y1IS0CZmFf0F7xS98uXlLSW7L+7sMvF1eI7cQ
	HmcfFhcoLRvp9IxSI1sOVztWcTFZBHNkuWoPrXaUEJYRD4NbZXoSVC9dTEwZRquUZ1QF
	jqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=N/lQHIh8vs8S+IbYR8QK92GDaJSG/69IgN4RsB7WVso=;
	b=GWTsVRFwomiFNF6UzBcRnM16MdKkpAhTqTxcwg8nk9uvpZ32i8ewC28OC1l0lJPuLg
	OBtpby8JXD0MdiA0qNvirhyw5M2C8JKRPfM1vcGdxLOSJd1E/GvnEWol7oOxQAJMN6Od
	AvHOyS7YA7NlZ2V9flynzH6ztRBuIsrLXHaR9txL5uqg4nmlLnV17O4q8SqyeYZzACpz
	34AAMpStKGMFSuKY5Yawh8iSijdZsQXxr/s3NXvGdJKNsWIaulXNp8hw+W+Ldp/x3XaX
	vNMokmbNra/kFLszD9G0ItlTO/HzSDiVQQ0VBzmE3GygoVX1hd3cJHywGkf2etRNYtKm
	0MVg==
X-Gm-Message-State: AFeK/H1hTBAL1Rc3Wl3u9MbFttC74kS2TpMEz5i6PLpeuFEcmA6Cxaa2Zx/eFN4pl9AtZOY92mA6CkDhQM7onw==
X-Received: by 10.28.1.68 with SMTP id 65mr17787874wmb.63.1491374871387; Tue,
	04 Apr 2017 23:47:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Tue, 4 Apr 2017 23:47:51 -0700 (PDT)
In-Reply-To: <1490880013-10149-1-git-send-email-liu.ming50@gmail.com>
References: <1490880013-10149-1-git-send-email-liu.ming50@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 5 Apr 2017 08:47:51 +0200
Message-ID: <CAAQYJAu+Z_DZm-WvWrWK8VHPAf-Z+W4OqADq=S-WDo_jAkss8w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] kernel.bbclass: move in addtask kernel_link_images statement from linux-yocto.inc
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
X-List-Received-Date: Wed, 05 Apr 2017 06:47:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 30, 2017 at 3:20 PM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> Add kernel_link_images task in kernel.bbclass instead of adding it in
> linux-yocto.inc, or else the recipes inheriting kernel.bbclass might
> run into implicit dependency issues.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/kernel.bbclass               | 1 +
>  meta/recipes-kernel/linux/linux-yocto.inc | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 244087a..bc09fba 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -538,6 +538,7 @@ do_kernel_link_images() {
>                 ln -sf ../../../vmlinuz.bin
>         fi
>  }
> +addtask kernel_link_images after do_compile before do_strip
>
>  do_strip() {
>         if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 556546f..637506a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -65,6 +65,5 @@ do_install_append(){
>
>  # extra tasks
>  addtask kernel_version_sanity_check after do_kernel_metadata do_kernel_checkout before do_compile
> -addtask kernel_link_images after do_compile before do_strip
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


Hello,

this patch is useful i.e. when building non-yocto kernels for mips.
In our recipe we add exactly that task.

Cheers
Andrea

