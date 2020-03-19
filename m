Return-Path: <brgl@bgdev.pl>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC3C6004E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 16:50:00 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h8so3003761iob.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Hr7snNukP0QSFe5gkCoj23KcM+yHlvB3hWwSAqa7sFA=;
	b=hatrLWKv0UOIRlPRiVE30TKPCxA2nnqq8KjHFNRLb/LyN6DA1kr/4ZaF2Lkh0UKKbJ
	eSIXI+gR4qoOZd8K9l+HjMLlzof9EWLePDLVyApCuEY/4zi7qvzrjSuw5A9NVMOzqJXI
	Q5Ih6yyP9i6FvOXTjrSdyu1R+MALorNlVBznZNuAahqRWT1UQVcroqN7sx7/2+CUnHGm
	K+H+gTkLyJ9ANenVx/dp2OLfxcua0KBLQdliU6KwzPsxF0yWgLpQnc4jtP+KrPToKRaL
	G4FDaTtUJ5L340nvMdz+SGk/HEdGau00hqbE/yU+Y4C37V8Qx0ZZTpIEcMQ/lL0OXnv0
	n8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Hr7snNukP0QSFe5gkCoj23KcM+yHlvB3hWwSAqa7sFA=;
	b=ZrtF2bIOzb5Aafa1debk/StFBhkYLUqg6Hl5aUz0waNvjAmpGMK1QdsZgi2qOjqEgW
	bT7CHQFNyt4qY8mh6ALaQT/KbyzFxf9P29Ty48Xu6fliHWx2VWU5f5a+P4FPL4Y0mRkF
	t9RXbomQ2rB1ywtbBnlojHrUXVM38eoE5X9tVwve1gymNaDOYIqXEkvZVb7gqdYUrtTy
	5ipyivw2F5/SP7r2ytk933uAINNI1L+uL6rSeyEPX+znaQ1azSoxVvo6JxtIuXRGcmKl
	y5AHP3bB6rrtVpBYcJcDYXjeyA4BfF/df36E3yd1GJ1UuChXbdTnNVxv1R2SYAgRdQKW
	+5tQ==
X-Gm-Message-State: ANhLgQ3Hdc71I7/A5JIhrjrcYf+d0IuvN/EqEpgd0Cur8vPPIZotYUVx
	W85QTGN+I3cOxjA/m7Kq13O6Leo0vo+AhrwsrjVEWw==
X-Google-Smtp-Source: ADFU+vshp3tjaoEbGdlRphPii0C2GzcttllIsZ/Xcb/HIegCUa8yjT71otD4HAnj2ekuL8NlXFpPlwdp2Ucy4mS2e7E=
X-Received: by 2002:a02:3808:: with SMTP id b8mr4121829jaa.136.1584636601309; 
	Thu, 19 Mar 2020 09:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200319164403.29605-1-brgl@bgdev.pl>
In-Reply-To: <20200319164403.29605-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Mar 2020 17:49:50 +0100
Message-ID: <CAMRc=MfAE42E=+CnMfuh_29QWOJACQnyJgbdRVXjm8EvhxHwsQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/2] image.bbclass: support two-stage deployment of image artifacts
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
X-List-Received-Date: Thu, 19 Mar 2020 16:50:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

czw., 19 mar 2020 o 17:44 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This is a follow-up to the discussion I started on the OE-core mailing
> list a couple days ago[1]. These patches propose to split the deployment
> of image artifacts into two stages where the first one includes all
> "regular" images and takes place before do_image_complete and the second
> is mostly aimed at wic right now and happens after do_image_complete.
>
> These patches work but I'm sending them as RFC mostly to continue the
> discussion about possible solutions for the circular dependencies between
> the rootfs and initramfs.
>
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2020-March/=
294094.html
>
> Bartosz Golaszewski (2):
>   image.bbclass: add an intermediate deploy task
>   image.bbclass: deploy artifacts in two stages
>
>  meta/classes/image.bbclass                    | 54 ++++++++++++++-----
>  meta/classes/image_types.bbclass              |  3 ++
>  meta/classes/image_types_wic.bbclass          |  4 +-
>  .../images/build-appliance-image_15.0.0.bb    |  2 +-
>  4 files changed, 47 insertions(+), 16 deletions(-)
>
> --
> 2.19.1
>

Just for clarity: this what the task order would look like for a
standard beaglebone-yocto image with these patches:

do_prepare_recipe_sysroot (32199): log.do_prepare_recipe_sysroot.32199
do_deploy_source_date_epoch (32201): log.do_deploy_source_date_epoch.32201
do_rootfs (32246): log.do_rootfs.32246
do_write_qemuboot_conf (8655): log.do_write_qemuboot_conf.8655
do_image_qa (8657): log.do_image_qa.8657
do_image (8661): log.do_image.8661
do_image_ext4 (35128): log.do_image_ext4.35128
do_image_tar (35133): log.do_image_tar.35133
do_image_jffs2 (35136): log.do_image_jffs2.35136
do_image_deploy (35246): log.do_image_deploy.35246
do_image_complete (35262): log.do_image_complete.35262
do_rootfs_wicenv (35264): log.do_rootfs_wicenv.35264
do_populate_lic_deploy (35267): log.do_populate_lic_deploy.35267
do_image_wic (35283): log.do_image_wic.35283
do_image_deploy_late (35448): log.do_image_deploy_late.35448

Bart

