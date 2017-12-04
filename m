Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A866378423
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 16:38:30 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c204so8907324pfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 08:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IufNe3eHjaRHb5ODRBd8sElUalQsKgfU9Uy+UzpTVac=;
	b=gzTQIQQaFRD7foNbhxtNhzhhffPx8G5jMQmvCxu/ZYzdb7MtHbwqjvHCi8fyel3IEx
	zUMfql51H1L1p51AFwdG7xxPNUYrdp5PZ3uGRBxVsbd7RO2yBkydAh2OuNWYQ2RzsjJh
	a5CVBjNf27NUW7G7/PMxjZyKq67f6i3k/EYKyLdCjUQOPkWIXDOx5kc83L45u6aPHmop
	JbnKGJLyCswag7/47juL1Y33CSri3k9cI/27PF/OCzcZ0ZcF2X9OqPSoca1NYflsiHi6
	fgOFV/q9PQb5a3+PsHwjIjxReMY0wVeM+4kppR4iq6mly8z7d74oz+dhpuYx6yhLSoTE
	lWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IufNe3eHjaRHb5ODRBd8sElUalQsKgfU9Uy+UzpTVac=;
	b=ISaZfTgj3hNiv+bdtoM+dKlup+f55NGzdGDr4QnNp3DQQ9ZWveRdr47kv8qX02Fr5N
	JYL47oWnmu5Kq7soqObCJePrpCqQWbYSxLFp+CinwvqWmI+pAH7G59cXeEYXYGrFQO8k
	0ksuL3+wuZAfwZy1APKTrYHauc78SV24necdd0iXJLFZ7eohnxZeorW0RKvKBgLFknjD
	8P/ZNWrr0LoPqi5GPeeQFGBQMw1+j/g2BSaU+Fb/LVpuL2VRkWYJuBCpk/gxHTUynXgE
	8NvkXZtOjfknMXgXyBcz9NirUkmEBQG+PDFPw94VkaRhohtIRwlfse6XIq+AzYv+m/Kl
	kW/Q==
X-Gm-Message-State: AJaThX5Z/ozofuHEtTPjIne0J6lgV02GeuT3OxuBb4lmSAOQzAobOl8/
	JCYLdY9JPozjbtlUvxdqREOWeSDaugDoaFdgJ4g=
X-Google-Smtp-Source: AGs4zMa1Qs5+937KhjordSuWQdrC4gCSi0STi1w3/KwIy2bWjs++rCtvuoAg9SnilV4Adj1wLHSPWLmc8yFbRbQ3siA=
X-Received: by 10.84.213.144 with SMTP id g16mr15142630pli.339.1512405511717; 
	Mon, 04 Dec 2017 08:38:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Mon, 4 Dec 2017 08:38:01 -0800 (PST)
In-Reply-To: <fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Dec 2017 08:38:01 -0800
Message-ID: <CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Mon, 04 Dec 2017 16:38:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Outside of the normal patch refreshes and boot issues, there are new
> build time tools within the kernel that required the following
> dependencies:
>
> For ORC_UNWINDER support in x86-64:
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native elfutils', '', d)}"

do we need both target and host elfutils

>
> And for certificate processing during the build, we need ssl headers
> and hexdump:
>
>   DEPENDS += "openssl-native util-linux-native"
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 6876ab707153..69787adb2dec 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -28,10 +28,13 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
>  SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>  SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
>
> -LINUX_VERSION ?= "4.14-rc+"
> +LINUX_VERSION ?= "4.15-rc+"
>  LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> +DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native elfutils', '', d)}"
> +DEPENDS += "openssl-native util-linux-native"
> +
>  COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64)"
>
>  KERNEL_DEVICETREE_qemuarm = "versatile-pb.dtb"
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

