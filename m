Return-Path: <net147@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id AD5A06C119
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 10:55:05 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id s9-v6so14656155pfm.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zl01HO2qpbIRjUA7WcRWV0B26K7bxmnyLo5oSvayOR8=;
	b=Ud0ig34+oivIGAF9qDsnOVY9sxczVeKh1ZfQGlTjTIip9sU/ZuONWcnOE3plgXfgOM
	/8HCSu29j2U/0hLCCPdPhblE9VwISFzp+Wk8Q9x8ct+jrXeaCpDxSEIVsZBz89vQacLI
	koOuC6tbv+H4Z8Zd/1i6+7N1WfH4vPzonGM2Ahp///wZe7hKuKzsJFMwih+nO1Y5Z0pK
	fAmnLICAuhM/mU0GkZGduC42fRoRSlcLSRySCTccpE2Ty+2PXu28uYbCeOWmob+cFvfm
	dLdAL8mwwgmAwb2VciP569u2Km3kNqqdilWKJnbw9WOah3y9FDot8oB4AOPdt3glbB1I
	7kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zl01HO2qpbIRjUA7WcRWV0B26K7bxmnyLo5oSvayOR8=;
	b=ApYaJDV3FwaqmfErhzzodZ5BPLU0lV6WeP3tmSc7BL5tBpWkZbvpPi53WAG4ekfxkt
	smKCRL5ogpmecC0w6+KKX9nId8zm2Z9pX0tnyDawhvDagd5e0ikgBIl5pihDh9sp+/PJ
	DHDYETtK4eWshM74gaOPOaSFtasmBzYXaSlLxq2a1K9Pxcn5XQnWpUiOcUuVgXYes3JM
	R55iY3gYvfmPfc6zmPEKVjWjIDiiP9HOChaHmAvbjr4HpZiZanlmdgef3YpSuOp4yOv1
	rEHL2gQMhQWpl39C8HlIbL/f24NEf8ZW2zmWS+aBJPKyaTL9nyrDtM09WcFswATgUddw
	UUug==
X-Gm-Message-State: AGRZ1gJsv5WpSgxaRmB+bd7AEibZPVf3tn0SPhMmkmsIg243Jac2uYAg
	GxW9eYzxZ5dLd+VxOcr6qGJprP3tmaUHk0CCfiM=
X-Google-Smtp-Source: AJdET5eexHXFEgNQlp70ORi5Zt8wSM7KS72VW5ROr4IhxCWGQscREZEpXLNLhqgarbRnFSFJNNcXBJ+oZ37hiWSeqD8=
X-Received: by 2002:a62:6799:: with SMTP id t25mr22290802pfj.139.1542624906534;
	Mon, 19 Nov 2018 02:55:06 -0800 (PST)
MIME-Version: 1.0
References: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
From: Jonathan Liu <net147@gmail.com>
Date: Mon, 19 Nov 2018 21:54:53 +1100
Message-ID: <CANwerB2J_darmy4oh=EQAC0kMmhkVfH_RBAMH8Cm7UH3dyS4Hw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apt: update SRC_URI
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
X-List-Received-Date: Mon, 19 Nov 2018 10:55:05 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 1 Nov 2018 at 14:16, <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> update SRC_URI since previous link is not valid now
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/apt/apt.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
> index f1cde30..50f22c8 100644
> --- a/meta/recipes-devtools/apt/apt.inc
> +++ b/meta/recipes-devtools/apt/apt.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
>  LICENSE = "GPLv2.0+"
>  SECTION = "base"
>
> -SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
> +SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz \

Why don't you replace apt with ${BPN} and 1.2.24 with ${PV} in SRC_URI?

>             file://use-host.patch \
>             file://makerace.patch \
>             file://no-nls-dpkg.patch \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Regards,
Jonathan

