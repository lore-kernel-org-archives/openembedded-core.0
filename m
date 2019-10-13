Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B3F9C7D58A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Oct 2019 05:09:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w14so20264254qto.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Oct 2019 22:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1Pa/mxBLffeoo+3+6GOfkC3f/G6JmbAWAfdQcygwvs0=;
	b=qFNdOFxrAFOACekVXUU0llD8cHDow3e8ZtWBacixDQ15ATc1sH2W5ZSMHttMtNI5Me
	8ol1gmLIEp1TnVPyEiXIVl8JkTt2WTIBvNuRXgdUBvee00qG2DYJvEpIN2gIjgxVPxZ5
	Tj16bhsHwele2RXH7S49wXmBhijE/GJjb8KQNYZi73PYF/YAjSMGu4geddmx24b91cE7
	+oMcwqWH0X70SU2pyE7GRw5pjPjPvKVAT3LECrUSsezdACUXMeQEoK4oJRbO7KQYky9T
	5a0oSrRBq3uoiJCcXZrJpzLLVQlXd1RTikfVSk0U9IfGnEvAkXLbjd4RN4jMvf1mppxT
	1MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1Pa/mxBLffeoo+3+6GOfkC3f/G6JmbAWAfdQcygwvs0=;
	b=BrRUJzAbDUT2NKuVnwZgGBF6P7Ow7iuTR8+UHxHnKmpl1jQZUeuq8XUMiK/JFhklwS
	jE1a1u4HULm6HL4PBqncmwvwwO2Euvk5kdUBzI4M/TkRP7DoT5STu9ZIbmptx7aeE6bC
	yoeYsdfOEzBACxrUwVu4Pp+ZgIzbWNmr1I39mbgOA/rtP3FM0JvvuVMsKhIDz1QuxhyF
	8GZld2L/h7ZmFzE73+5wcaJsYY7x1VZ/oV5Ab7VARB06vqZp/WRXN1pEVaJtRmHWHQWF
	RffMA/yt0YUbl2CXRnu7yX2BfvJMgA/N21K3s+f50ScV3iZI2qt/vimK+IpRdzqjUDTy
	QzbQ==
X-Gm-Message-State: APjAAAWFIMlwlSTMJ+nVnHVVu5sGEHHteUdsFhr2oMYwSi2PWplNxDtp
	in0pQAUNocmAJko+wASMLoIT0e/3Zo2zmyJVHT8=
X-Google-Smtp-Source: APXvYqxTwlGvfNsD+8WaY5ri1LLLRQwHE0XiOBZAMvFwYyW9OBlzaAhRH5yoaghYnD3LQKZ8LOlZMU2y01ppjCg7JHc=
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr15561884qvs.185.1570943399005; 
	Sat, 12 Oct 2019 22:09:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSN3s3YGNrods9t2bRsAbwVf1x1fRXDofVgjtr-BK29Bg@mail.gmail.com>
	<ce141cece91f76d77a7316394ecd9c8776e4b257.camel@gmail.com>
	<CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
In-Reply-To: <CAA=hcWRXoyXKyZqh-3dXxF6rPSMe2meejtGXK7xQ8ZZB+=-0-g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Oct 2019 22:09:32 -0700
Message-ID: <CAMKF1soEbDhviZb7LR3NcL4ieFr-Qw-G+k0eKVt1iScVDR1NDw@mail.gmail.com>
To: JH <jupiter.hce@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Failed to build zImage-initramfs
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
X-List-Received-Date: Sun, 13 Oct 2019 05:09:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 12, 2019 at 9:06 PM JH <jupiter.hce@gmail.com> wrote:
>
> Hi Khem,
>
> On 10/13/19, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sun, 2019-10-13 at 12:14 +1100, JH wrote:
> >> Hi,
> >>
> >> Apologize if it is not right mailing list for helps, please advise
> >> which mailing list I should go.
> >>
> >> I have been trying to build zImage-initramfs, according to the
> >> oe-core/meta/classes/kernel.bbclass, I defined following variables in
> >> local.conf:
> >>
> >> INITRAMFS_IMAGE = "zImage-initramfs"
> >
> > this should be the rootfs image that you want to bundle into kernel and
> > not the name of final kernel as above. Put something like core-image-
> > minimal-initramfs or somesuch here.
>
> Thanks for the response, could you have more specific what I should
> change? From kernel.bbclass, without defining INITRAMFS_IMAGE and
> INITRAMFS_IMAGE_BUNDLE copy_initramfs() and do_bundle_initramfs ()
> won't be called, am wrong about it?
>
> Anyway, I followed your instruction to define the rootfs image in
> local.conf, it did not work, please correct me.
>
> $ vi local.conf
> IMAGE_ROOTFS += " core-image-minimal-initramfs"
>

INITRAMFS_IMAGE should be an image name. Like core-image-minimal or somesuch

> Thank you very much Khem,
>
> Kind regards,
>
> - jh

