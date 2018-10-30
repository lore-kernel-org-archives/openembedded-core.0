Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id AA48B79BE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 19:46:28 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id e126so8501382vsc.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 12:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jgRDwAXySkWtHoaS7pa3kPfcibRsbhYH+hFFbOd2Hbs=;
	b=ZNqvIMM+00oYMIzi7KsqBKJP2S+5Hjb8e6E0QWEQjkVwHGt7DvPXSNuruZu1LQ5n8K
	yWIFIAbS5vwDfmoZ4TLKV8dkOtegLVdJktOXgLq7XITAH/yQOWPGOVBlmnOrdRDSZ4DU
	s1wu6OIgNR5hd+EwwLu7YcjbXlZVzR16VWjyfJ6jz/kQ8/1v8hhsr1WSgKa3ZDB6DQS5
	IVE2ey3F6ot8bNp/jzmc78WvMV6kBwbDzVYo8NeBkjC4m6ss5TPqjHyc5BtwtwSSeJB3
	rM7Ou5iBkgmvNkndKBzsaehpR/59b9hG+UOnUhxbVui4RR3jxKoC3EwUfWX0nGLJ8nie
	Sllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jgRDwAXySkWtHoaS7pa3kPfcibRsbhYH+hFFbOd2Hbs=;
	b=Q+btvW41Fj+eISEvoto5VBLRieJp2XAwY/wCrlahj+VX9tcBmo/WETz6iIvkn8Hu8g
	W+FdqHTGTFnBVV2PxV09h8MfmkIdoaj0EL97z7l/PWA1ZNdRQ0pqnrCVPTYAXIxOwLTZ
	c1yujI9K+XuR20WLycpblFtpvKJfeZcf/sWA7B8hORN8Ue35//lFtYc6ufzAxb8DC+NZ
	Zkz99VeDK0Yjh4zwxY9UKDWPBKMZriQPg2QnHh5p2SM8ZrD1VlkBp3KOyMAm66ZgdLm2
	DqGSGvv63/GjWANd4ATQMd5qoMudmpsquB4BCy4gbnQYmJDRF3wW/8Q/q18cJoVSdUYi
	4y5Q==
X-Gm-Message-State: AGRZ1gIAav/LQc3D8WxJ1QAubaek38PmBJlHJshFxo826qBIgmPZhPbB
	1bsVl9acWpayscfDD9P5U+M8OwlV01reRBxo0ZE=
X-Google-Smtp-Source: AJdET5fmBss2ejMOWzJIM493dJv9NSoAw5anv3pxTcln+IGKtwEW0h8sE47sojV4V4EQnxV2z+yHGBnsoBqX4L782bA=
X-Received: by 2002:a67:7344:: with SMTP id o65mr25828vsc.223.1540928789408;
	Tue, 30 Oct 2018 12:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <1540926266-21324-1-git-send-email-bruce.ashfield@windriver.com>
In-Reply-To: <1540926266-21324-1-git-send-email-bruce.ashfield@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Oct 2018 12:46:18 -0700
Message-ID: <CAJ86T=XNsuVsh0SWvx-BB4H9r_Y+UsfJzqq4vFG=cs8_tpps2A@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 19:46:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 30, 2018 at 12:05 PM Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
>
> As was warned by commit 312ee68752fa [kconfig: announce removal of
> oldnoconfig if used], oldnoconfig has been removed from the 4.20 kernel.
>
> So we switch our default mode to olddefconfig.
>
> commit fb16d8912 [kconfig: replace 'oldnoconfig' with 'olddefconfig',
> and keep the old name as an alias] introduced olddefconfig in the 3.10
> kernel, we shuffle oldnoconfig to the fallback target.
>
> The fallback mode allows kernels between 3.10 and the currently listed
> oldest kernel of 3.2 to continue to configure.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>
> v3: dropped 'yes' from the pipeline
>
> v2: Tweaked to add a fallback mode as suggested by Andre McCurdy
>
> Not for the release, just wanted to get this in the queue for
> when master reopens so we'll be ready for 4.20+ kernel versions
>
> Tested by configuring linux-yocto*
>
> Bruce
>
>
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e04d2fe00434..880c5ef17283 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>         :
>  }
>
> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} oldnoconfig"
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B} CC="${KERNEL_CC}" oldnoconfig"

Apart from inexplicably swapping the positions of the O= and CC=
options on the fallback command line (?!?), this version looks good.

>  python check_oldest_kernel() {
>      oldest_kernel = d.getVar('OLDEST_KERNEL')
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

