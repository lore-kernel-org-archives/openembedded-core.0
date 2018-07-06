Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 70D09605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 03:28:30 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id l64-v6so6056855vkl.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 20:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YsQXGECfCy0Kh6a1s8xIjmCAzl696m2SYcTmczanGsA=;
	b=e5AWT/1etwbmY3rpD6NH6NRXDggEvi0qXE7/nrPq8s9Ch45q/+CS1pYC2EC/pNxb35
	qw3vDIrRSeSAgfAqDlsEpx4Ufe8JHPYlv99edvNig27qo/bkrsM466vcw72YnigJIKHH
	j167PlvtgBpFhRownejftQHw8dVLDxan4vaUu7wzFiby5/GZ9f6wpgajBkgEHSNsJesT
	EnYPf+O+L566xxX5Uk6w5unjjfA2Ohz9ZOICD1ryZlOeJ3ApId7mPGMg7V/+Qt0jLCMA
	FtdIkldJeInbXYg9ZRo0z8+tivex5h8f4FrXY/2ASR5ho3E1poRPlmz3jJNuVTTcDQyy
	v3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YsQXGECfCy0Kh6a1s8xIjmCAzl696m2SYcTmczanGsA=;
	b=m/nJlADwTvChbljfh4u1MIhXJDuk7pYGWBItzdvJl13gxOL0AplNscXPObGFItbaCF
	FYfK+SaBePEltiQdih6ax4+dH8NBaZ6Qe0udHu/gwgsEyh+3Lfkq15dl9keOX8MYWEfC
	h5MEVDxCk3fB+1btndHEGNujJwBBs72x0DLkuU7IjyK92u45H0TR2djXFE6713eVfASr
	Ct89FTOgXhwP3JVnwqayLIvWLoYdT5uMqcNqwa0/oi/P7pX74Jq0QKJPaiWfJAN3Zf2g
	Gmt5QlQrkeVYEVtfVvQKDAM3N3DUgu8+/bZGzaV6m5xnhGU62nnBbeUq962dnvZ30pQ8
	k2pQ==
X-Gm-Message-State: APt69E2KswIjIr+9ICulkkuZVs2GNWRsE9LLgowcE182M90om19EGkCd
	xDxemYPgzS3FTxgZ7KIlROpqvdH4VDKvFG2pgKe0QA==
X-Google-Smtp-Source: AAOMgpdcHDMSrrPfeTkQYbBmp1cMpaovuKo8ujxMAI1EwdeYVhYdNelmYGhUlqbWTvBbhyK4B9ZKu/9H+MpXJi5Na3g=
X-Received: by 2002:a1f:b04c:: with SMTP id
	z73-v6mr4803760vke.194.1530847711208; 
	Thu, 05 Jul 2018 20:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Thu, 5 Jul 2018 20:28:30 -0700 (PDT)
In-Reply-To: <20171115124041.23289-1-patrick@advancedtelematic.com>
References: <20171115124041.23289-1-patrick@advancedtelematic.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 5 Jul 2018 20:28:30 -0700
Message-ID: <CAJ86T=W476NOCmnwYcfs57wmM1eOshyBaaeSgrF0D6XPgU1Esg@mail.gmail.com>
To: Patrick Vacek <patrick@advancedtelematic.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ca-certificates: Add /etc to SYSROOT_DIRS
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
X-List-Received-Date: Fri, 06 Jul 2018 03:28:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 15, 2017 at 4:40 AM, Patrick Vacek
<patrick@advancedtelematic.com> wrote:
> From: Patrick Vacek <patrickvacek@gmail.com>
>
> For recipes that depend on native ca-certificates.crt, /etc should be
> added to the list of directories that automatically populate the
> sysroot, otherwise the file may not be there.
>
> Signed-off-by: Patrick Vacek <patrick@advancedtelematic.com>
> ---
>  meta/recipes-support/ca-certificates/ca-certificates_20170717.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> index 59e7d51437..52a1a07f68 100644
> --- a/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20170717.bb
> @@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ca-certificates.git \
>             file://sbindir.patch"
>
>  S = "${WORKDIR}/git"
> +SYSROOT_DIRS_class-native += "${sysconfdir}"

This change has now been merged, but unfortunately it looks wrong.
This use of += with an over-ride doesn't achieve what you describe in
the commit message (the += will append "${sysconfdir}" to the
over-ride value and then the over-ride value will COMPLETELY REPLACE
the original value of SYSROOT_DIRS, not add to it).

The change also appears to be unnecessary as ${sysconfdir} is appended
to SYSROOT_DIRS for -native recipes by default (via
SYSROOT_DIRS_NATIVE in staging.bbclass).

Exactly what issue were you trying to solve?

>
>  inherit allarch
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

