Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.2419.1618256692887795163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 12:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nNjfgrVw;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id x11so15477198qkp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lIme6gELxwDLT3R1HJoRLIng9RY8VcvvHuEOJAiTBKk=;
        b=nNjfgrVw+hl7sQGTZYoLsbOOsQG/9CxsLgxaLYroLd3qeRdj2qvhkB6lK26sJCxF+v
         oC7l+rqwRgMEpteJdhRE/Qtgdb1PhwMzm9AE40ySgRwrWELpyTuK7YJErurUZb4qo972
         auTlVrqWHAyWlaOQeIi7tdwF8SrrU/Dcnt5O+qHKIdAsLAjj97HECWvoF9AqgYpRi8CQ
         q/YTmJOC7UPf5MCKXf5lWpht2pOFhEIxxvuXLw/Dt8l89Le0N+ocRfAB8jyUDK7y2qwa
         MHJaiMTOzXD+lasPxzeARIWpe7VT/G0Q5YCJuFiNRWBgBqITmRFB7Ye+sDdYMEYjW8qg
         htNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lIme6gELxwDLT3R1HJoRLIng9RY8VcvvHuEOJAiTBKk=;
        b=QgI80KUA0Vc+qV/n2hg/QMIhqCmFPJuYtEIeLqzrjLjeX9/dhZIVgYqdR3v3UmiCZp
         axjLawkc35RpokCilbXfEngR/lOFsmBWF6an9K8aAyNa3EaBdwPb9rCUGjUa5A49sr7K
         BZ1vqs8uyp8OyEbYBfVJyzzecYaGxcNKrIfj6HJ92C3gx7hVelyFf/8ZLShsEWpPOskp
         5P0ye76xpVD9yQs03KkuuTUU9iSDr0e4tYp+dKPqlON+66S6nm1gw3iJ1k4LE3fGeNS5
         C5x7HBf7iV/43Kh1bLZIGovp55dqv0h9ytcUFAcu9lRSaqgUTxh306A3RdzaNszrcRmz
         JY5w==
X-Gm-Message-State: AOAM532jvpYhh7tTWyookle7iql/gJ+Dct+RC6DVR/ucYIN9TXq2ZeDS
	1FP20JOu2FX7zYk7AwY8Hrm4DzW3rg+fYXdwVsg=
X-Google-Smtp-Source: ABdhPJwsIwIJB3j200YWriXIR217P1iu01GKaSdvT09MExXDNdhwCTG1T6ycStoo6UMlUYJs8lAfWk/g0gXRiwk6Zw4=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr28516816qkd.381.1618256691924;
 Mon, 12 Apr 2021 12:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <D3Uc.1618248485581174676.TPEa@lists.openembedded.org>
In-Reply-To: <D3Uc.1618248485581174676.TPEa@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 12 Apr 2021 12:44:25 -0700
Message-ID: <CAMKF1spF-OQ6Q5GnK89tD0KhgnerwOcDLyOPDQ_Zmn963hsxUw@mail.gmail.com>
Subject: Re: [OE-core] Initramfs with OpenSBI for a RISCV SoC
To: sathishmls@yahoo.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 12, 2021 at 10:28 AM sathishmls via lists.openembedded.org
<sathishmls=3Dyahoo.com@lists.openembedded.org> wrote:
>
> Hi,
>
> i pulled openembedded-core, meta-openembedded, meta-riscv layers
> In build/local/auto.conf, added INITRAMFS_IMAGE =3D "core-image-minimal-=
initramfs" and INITRAMFS_IMAGE_BUNDLE =3D "1"
> I created core-image-minimal-initramfs.bbappend with adding riscv to COM=
PATIBLE_HOST
>
> trying to build with "bitbake riscv-initramfs-image"
>
> (without adding INITRAMFS_IMAGE in build/local/auto.conf, able to get su=
ccessfully the kernel Image files, dtbs, riscv-initramfs-image-mach1-??????=
?.rootfs.cpio.gz, except initramfs is NOT bundled along with the kernel Ima=
ge which i want)
>

you can try to build just the kernel which should build the initramfs
image too or build any other image than 'core-image-minimal-initramfs.

bitbake core-image-minimal

e.g.

> getting the following circular dependency error
>
> Identifying dependency loops (this may take a short while)...
>
> ERROR:
> Dependency loop #1 found:
>   Task /media/meta-mach1/recipes-kernel/linux/linux-mainline_5.11.bb:do_=
bundle_initramfs (dependent Tasks ['linux-mainline_5.11.bb:do_install', 'co=
re-image-minimal-initramfs.bb:do_image_complete'])
>   Task /media/meta-mach1/recipes-kernel/linux/linux-mainline_5.11.bb:do_=
deploy (dependent Tasks ['linux-mainline_5.11.bb:do_bundle_initramfs', 'pig=
z_2.6.bb:do_populate_sysroot', 'linux-mainline_5.11.bb:do_packagedata', 'de=
pmodwrapper-cross_1.0.bb:do_populate_sysroot', 'linux-mainline_5.11.bb:do_p=
opulate_sysroot'])
>   Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:=
do_compile (dependent Tasks ['linux-mainline_5.11.bb:do_deploy', 'opensbi_0=
.9.bb:do_configure'])
>   Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:=
do_install (dependent Tasks ['opensbi_0.9.bb:do_compile', 'pseudo_git.bb:do=
_populate_sysroot'])
>   Task /media/openembedded-core/meta/recipes-bsp/opensbi/opensbi_0.9.bb:=
do_populate_sysroot (dependent Tasks ['opensbi_0.9.bb:do_install', 'binutil=
s-cross_2.36.bb:do_populate_sysroot'])
>   Task /media/openembedded-core/meta/recipes-core/images/core-image-mini=
mal-initramfs.bb:do_image_complete (dependent Tasks ['opensbi_0.9.bb:do_pop=
ulate_sysroot', 'core-image-minimal-initramfs.bb:do_image_cpio', 'core-imag=
e-minimal-initramfs.bb:do_image'])
>
>
> ERROR: Command execution failed: 1
>
> Please suggest
>=20
>
