Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F95B6C56C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 13:15:17 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id p197so3532849itp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 05:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GnzWOWboqKj7wzgZy5fnKWfnspfEWvyPJzNl9hIcx5k=;
	b=xTgHo3NJUfECSnGsExFmMN8BGW892ZQfH6bLl0/3wQpocgUdZnMkT3hErPp2xJ0a3B
	wg1j7hQbC/vea5sPKMq2O/BAuu8VpNp7uUu9idfsIsW0c8nmUygTIeM+hSFl4tTR1T5D
	uakpoi8KKRTukD19nNCMw4PwVNlvd09fIPEI7sQuR3Vs2xcw/dYQ8Rb/k4dAnSX92Opk
	qkHUp6y2MhZSby6qyMqcW3gSO4Tdcxp6Nh7s/eHpI+3dXyIzdi3Q6X7P1paD0KWcMM85
	dR4cQXNKwEjjeHnzlnD0j0AcPwTe/0wUraIv/gbzDddj/HhmMUOEAsmCVjs4t2jXuQ/6
	xuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GnzWOWboqKj7wzgZy5fnKWfnspfEWvyPJzNl9hIcx5k=;
	b=rAMHjvaftuNbc8Pwp8A0/WOVHE29uhpgRhZkWKf0IN49IUhEjkff8rjSE/Er89BiJb
	5+yTesQVbPlq60xHlaafuoeIRNUvjZP9KZ1nsTFnXJGenEnzn6toaZQoOjiTyHXP/FcY
	o0CAGHa3UPBKlGYImDSVHerSl0ptHkqj5EAM4R/Be6EGTnWSp+AbwfiXf4ZezXPpcNl9
	M0HOnBOub60RBFlYCTTxWP+WCtIdQEAv6pgX813l4jrceFiWle2kJVe3CshPfV7N5F9v
	riXpXkuRwPfTHZNYCkxCM1NIsHDEavsxW+2UxBcZoyavXEdEgKmdbkZ6h6/fBQUsgCF/
	jUhg==
X-Gm-Message-State: AA+aEWajo7l/DrLO920Xj7vvfF6mRozkyeefuWzyenuuvgL3PayvrwZa
	uwjIOtJVRFu+21O52qrjXX4b45Lm0FrP89sFdRIjZg==
X-Google-Smtp-Source: AFSGD/UVHggEmO07zpZdKrNdGbAUqByVqYOFuvhY6bq+AMNv9KIy4zZuFSvB+ZoOtVFbCDHTyvgrJXBxoU7ruVfEuE0=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr1338753itg.26.1543497318458; 
	Thu, 29 Nov 2018 05:15:18 -0800 (PST)
MIME-Version: 1.0
References: <cover.1542781427.git.liezhi.yang@windriver.com>
	<bd77663c215d2ed20cb3765b95e62b9b14330896.1542781427.git.liezhi.yang@windriver.com>
	<CAP9ODKquwOEHEcQc2EOZzty_+GgO1ONKAZU_U4h-L9PRxwFWBg@mail.gmail.com>
	<2e148cdc-6ba1-e945-26f3-51ac35674a85@windriver.com>
In-Reply-To: <2e148cdc-6ba1-e945-26f3-51ac35674a85@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Nov 2018 13:15:07 +0000
Message-ID: <CAJTo0LacrSjy+xfqVa7k5pDM2OAYHr08e7AiprvKpsps1+kmeA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: c.andersen@kostal.com, Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] uboot-sign.bbclass: fix signature and deployment
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
X-List-Received-Date: Thu, 29 Nov 2018 13:15:17 -0000
Content-Type: text/plain; charset="UTF-8"

This didn't get merged before other pieces did, so can you please
rebase and resend?

Ross
On Thu, 22 Nov 2018 at 01:43, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
>
> On 11/22/18 1:20 AM, Otavio Salvador wrote:
> > Hello,
> >
> > On Wed, Nov 21, 2018 at 4:08 AM Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> Fixed:
> >> MACHINE = "beaglebone-yocto"
> >> KERNEL_CLASSES += "kernel-fitimage"
> >> KERNEL_IMAGETYPE_beaglebone-yocto = "fitImage"
> >> UBOOT_MACHINE_beaglebone-yocto = "am335x_boneblack_vboot_config"
> >> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> >> UBOOT_SIGN_KEYDIR = "${TOPDIR}/conf"
> >> UBOOT_SIGN_KEYNAME = "dev"
> >> UBOOT_SIGN_ENABLE = "1"
> >> IMAGE_INSTALL_remove = "kernel-image-zimage"
> >>
> >> $ cd conf
> >> $ openssl genrsa -F4 -out dev.key 2048
> >> $ openssl req -batch -new -x509 -key dev.key -out dev.crt
> >> $ cd ../
> >> $ bitbake u-boot linux-yocto
> >> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
> >> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto-2018.07-r0.dtb matches
> >> Binary file tmp/deploy/images/beaglebone-yocto/u-boot-beaglebone-yocto.dtb matches
> >> Binary file tmp/deploy/images/beaglebone-yocto/u-boot.dtb matches
> >>
> >> And there would be no signature info when rebuild from sstate:
> >> $ bitbake u-boot linux-yocto -cclean
> >> $ bitbake u-boot linux-yocto
> >> $ grep signature tmp/deploy/images/beaglebone-yocto/*.dtb
> >> No result
> >>
> >> This s because kernel directly edit ${DEPLOY_DIR_IMAGE}/u-boot.dtb, (Note, it
> >> is global ${DEPLOY_DIR_IMAGE}, not recipe's DEPLOYDIR), so that the modified
> >> info is not in sstate, and would be lost when rebuild from sstate.
> >>
> >> There are other problems in previouse code:
> >> - The u-boot.dtb is provided by u-boot, but edited by kernel during signing, so
> >>    it should be deployed by kernel rather than u-boot.
> >>
> >> - The u-boot.do_concat_dtb directly install files to global ${DEPLOY_DIR_IMAGE},
> >>    this is incorrect, the ${DEPLOY_DIR_IMAGE} should be installed by do_deploy.
> >>
> >> - It seems that it assumes do_deploy depends on do_install according the comments,
> >>    but they have no relationships:
> >>    # do_concat_dtb is scheduled _before_ do_install as it overwrite the
> >>    # u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
> >>
> >> - The do_concat_dtb should be run after do_compile, but it doesn't have this
> >>    dependency.
> >>
> >> Make u-boot install u-boot.dtb to ${datadir}, kernel copies u-boot.dtb from
> >> ${STAGING_DATADIR} to ${B} and deploy it can fix the problem.
> >>
> >> [YOCTO #12112]
> >>
> >> Reported-by: Christian Andersen <c.andersen@kostal.com>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >
> > The change itself looks good, I noticed that the script part is not
> > using 4 spaces for indenting and as this is being changed, it might
> > make sense to address this as well.
>
> Thanks, sounds good to me, I will make another patch for it after this is merged.
>
> // Robert
>
> >
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

