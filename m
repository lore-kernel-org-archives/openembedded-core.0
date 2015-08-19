Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4714173CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:26:30 +0000 (UTC)
Received: by iodt126 with SMTP id t126so23040571iod.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xdPs+bPPnWuPs30bW3pI2oStTYt/nji+SIaYxtbQtOw=;
	b=icIIJlU0pbH8/PY8maH8Q8Q+THp8FJe24EDFggQG/U2Feff7FihYCfyb+wvsV2N/SC
	zl77FHaBQXJTS1iCyaS6Rw5Ot5Q8o6R/Z0/nrx8Vgae/JJEGAnis+nt/FRHFxYR9tUnN
	GXn0Pr/KB+beiQXVitkLurvqFU7s6Qz23kNGUY4i5VNFK7hhfOP/AUannEKTANd8od+c
	ZoDqDmpDlqY1Kni2arrvHw9qfihJ6aCBVsEMEX6a8iSZpHGRJx1J1A0fBP2QNFtHBDMK
	i8iNVR+l4fuuiQjfY9nFpHCjBQTnI3SdEiLXW3tzr3dFmWBJ7ZLAGIgQHDKXueESIuBC
	BKwg==
MIME-Version: 1.0
X-Received: by 10.107.6.166 with SMTP id f38mr13439737ioi.148.1440015990605;
	Wed, 19 Aug 2015 13:26:30 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 19 Aug 2015 13:26:30 -0700 (PDT)
In-Reply-To: <5d7a87b67d76994b2a71bcb40d256e22304c6f31.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<5d7a87b67d76994b2a71bcb40d256e22304c6f31.1439991562.git.alexander.kanavin@linux.intel.com>
Date: Wed, 19 Aug 2015 22:26:30 +0200
Message-ID: <CALbNGRSyp39S0FcAsGw+EXHp85GaU=HAW9OKJQi0Ta4WeFnHQA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 17/22] glib: add a warning suppression patch to glib
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
X-List-Received-Date: Wed, 19 Aug 2015 20:26:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 3:40 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> Otherwise QA check will fail.
> Some schemas in gsettings-desktop-schemas (such as proxy and locale)
> are still using deprecated paths, as of 3.16.1. This causes warning
> messages, and meta/lib/oe/rootfs.py complaints about them.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...warning-about-deprecated-paths-in-schemas.patch | 32 ++++++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb      |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
> new file mode 100644
> index 0000000..54e830c
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
> @@ -0,0 +1,32 @@
> +From 41534253b6b61ed4769eb6a3966698a50ee73b71 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 12 Jun 2015 17:08:46 +0300
> +Subject: [PATCH] Remove the warning about deprecated paths in schemas
> +
> +Some schemas in gsettings-desktop-schemas (such as proxy and locale)
> +are still using deprecated paths, as of 3.16.1. This causes warning
> +messages, and meta/lib/oe/rootfs.py complaints about them.
Upstream-Status?

Andreas

