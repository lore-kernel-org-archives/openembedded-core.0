Return-Path: <brgl@bgdev.pl>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 984BD60247
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 13:26:47 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id d14so19519552ilq.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d2CorsP9+rpeIvEJuqCeDBRWV1UVdeGhQc2jPvzs09Y=;
	b=0pEcm/uNilUvGHNBtblbIEqDnC8adRitDoRGzYuupksozNMm3fXqF2R6t4Um1GhTsF
	hxESC21xjto9WHuJ2Qw020ZJ+04DkD+AOmp/tb70viu9F16cGwR7F/sVOeEuMXH7mC4e
	Fn29x97hHe6bLLHCvrDgbjF5KHjWkgnpMUJdoCf+0SAXqNOvAgWC1EkB2b0dhHVhgEQm
	pHtgCnTd17CKYIRl5+/9bApBkwCN8lrIcr/vVgvWOI9p8DYK1vcrxabUWKaTuuBw9S1B
	CoDiIUiJkJzdr5ha0neQLTl9NYEFaMpFeiihrTLiQMGG2N0Pf2xGJOow5y2BbpLeyDVJ
	8LbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d2CorsP9+rpeIvEJuqCeDBRWV1UVdeGhQc2jPvzs09Y=;
	b=uHqtpYLtpzbCyQNR36dQKqA4FdRojFKeSCUx0mt+8xjGm1/dcbzvO2/7jW0Hwk7dQT
	Yl132WNt5wZrONpWzw9HwCn4BQohOxI3lLia6d+fkgckcs1azVmNcT5/uYz79d1L2jk7
	2dSqYBCeBzZwiGqgICFyh/QnFuoNg3wzsxa57Ncv8HDwa8ypj/R1v3q22n8jgDCTggz9
	rS0O5lt6I7qIUfEVmx44fWWVEr+xPQWwzz5gsbfA3dchUi9KnToJeL1OaytC98d04OsD
	PkL0rnj+E1jJUc8nCYSL5sgiuwukUHa2iDoUkfm/lyfZSV3VbHCqwA3pZVP+meZIeRkg
	HmIA==
X-Gm-Message-State: ANhLgQ0hYNiJIJAZCCPe/rtRap4fbwhPR/1aq1IUDY5swGMHVk924EiN
	wedFpG67SjfrGfo4H+dXFlpFZrNsp2SIDokl9LUqzw==
X-Google-Smtp-Source: ADFU+vubJDd4LBGUZTDntaH85wzyM5HyjyTqWr5nlv/o27Vv7X7gmq55SHm3KTMPIE8u/0zbbo+ZlB4WCcMNtdEaetI=
X-Received: by 2002:a92:d4d0:: with SMTP id o16mr5210111ilm.40.1584451608165; 
	Tue, 17 Mar 2020 06:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAMRc=Mf_Ld80=Egf3jPBGYoGGZScSG3JHKL7cVArLihJSC8P0g@mail.gmail.com>
	<CAMRc=MdcU5UTt6iLcpjUDxs5JkwD3db7QP--b2xjXBpqiHfguA@mail.gmail.com>
	<f1026c8fbd01e72648f487e024ce3b18e09581cb.camel@linuxfoundation.org>
In-Reply-To: <f1026c8fbd01e72648f487e024ce3b18e09581cb.camel@linuxfoundation.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 17 Mar 2020 14:26:37 +0100
Message-ID: <CAMRc=Md9CECDMOq1VzgmxO0w9L=eD+HcXcUeZkRp3hGrXBsnvA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Guillaume Pain <gpain@baylibre.com>, Jerome Neanne <jneanne@baylibre.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Solving a circular dependency issue between the main image and initramfs
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
X-List-Received-Date: Tue, 17 Mar 2020 13:26:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 16 mar 2020 o 12:01 Richard Purdie
<richard.purdie@linuxfoundation.org> napisa=C5=82(a):
>
> On Mon, 2020-03-16 at 11:48 +0100, Bartosz Golaszewski wrote:
> > There has been no relevant feedback, but I've been experimenting with
> > various things. I think that the best approach would be to make image
> > artifacts installable into dependant recipes' sysroots (in
> > /usr/share/images/). This way the initramfs recipe could calculate
> > the
> > dm-verity hashes from the resulting ext4 image before it gets
> > deployed. We could also modify the kernel recipe to not fetch the
> > initramfs image from the shared directory but instead have it
> > installed in its sysroot.
> >
> > For this I tried to re-enable the do_install task in image.bbclass.
> > Unfortunately either I'm doing something wrong or standard tasks are
> > subject to different rules when it comes to dependencies. I've been
> > so
> > far unable to make do_install depend on any image tasks (i.e. make
> > do_install depend on do_image_ext4/wic etc.) no matter if I use
> > do_install[depends] or addtask or appropriate helpers from python.
> > Unfortunately I've been unable to find any information on that in the
> > manual.
> >
> > Is there some trick to changing the dependencies of standard tasks?
>
> I don't know how exactly you're configuring the system but it should be
> possible to have the main rootfs built first, adding in the signing,
> then have the initramfs depend on that.
>

I too thought this should be possible with current implementation and
yet I've spent so many hours on this to no avail it's not funny. :(

> I can understand some circular dependencies could creep in as many
> configurations have the initramfs as part of the main image but if you
> don't configure that, you shouldn't see those dependencies.
>

I think there are more problems with this and the main reason is the
fact that wic is just a regular image type. I'd argue it should be its
own recipe since it can fetch deployed files from multiple recipes
(including different images - for instance if we wanted to build a
special recovery image that would need to include the main image +
minimal rootfs).

First: the initramfs recipe needs to access an artifact generated by
do_image_ext4 from the main image. If we're not running do_install
from image.bbclass (which we currently don't), this can only happen
after do_image_complete which does the sstate deployment. So
initramfs.do_image_ext4 depends on rootfs.do_image_complete. Next the
kernel bbclass needs the initramfs image to assemble the fitimage - so
kernel.do_assemble_fitimage_initramfs depends on
initramfs.do_image_complete. Next we have the inter-dependencies
between the kernel and u-boot because we need to sign the fitImage for
dm-verity to make sense. Currently u-boot.do_build depends on
kernel.do_deploy. And then the culprit: rootfs.do_image_wic needs to
fetch the boot files so it depends on u-boot.do_deploy but
rootfs.do_image_complete runs after rootfs.do_image_wic. I guess if we
made wic a separate recipe - not just an image type, it could help
here.

> I do fear your "re-enable" do_install route isn't going to get you
> where you want to be.
>

Why not? This is what currently happens with the dependencies between
fitimage <-> u-boot when UBOOT_SIGN_ENABLE is set to "1". U-boot
installs the DTB image - that would normally be deployed - into the
/usr/share directory of kernel's sysroot.

> Can you give a simple example of how you reproduce the circular
> dependencies with standard poky or oe-core? That might let others give
> comment more easily.
>

It's very simple: add an initramfs to the recipe (INITRAMFS_IMAGE =3D
"some-image") and add the following to some-image.bb recipe:
do_rootfs[depends] +=3D "core-image-minimal:do_image_complete" with the
assumption that you're building core-image-minimal. You also need
"wic" in IMAGE_FSTYPES.

Best regards,
Bartosz Golaszewski

