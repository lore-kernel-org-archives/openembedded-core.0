Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD6D6C198
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 10:52:48 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id s5so3144258oth.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2019 02:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y+phrHLjNEgqUaTUh86XltFzNFqjmVnAeMrAdYRHpg8=;
	b=S/4M1pzePRanxQS9RdjLxL15NPaR302ZObCOQ4IrAoZzwZaZUUvQiGRIlYLTyoy+8z
	wLvXx08HBRQH1tOmkI75MBqKcUJCrrsMHqzJ6BtyqAoYY6plYAZ8f8jWtbFugavtqoMe
	zjXCJnlCxIEnW8G7aeYVijaRsV283hgPAHnJ8cRfntcaQnu1lya3StsOuRnfjv6a7uwV
	DWTbTk/l37Wj/UF/a4jxKoW4AaXl7qrYp+AGJILfvg3HdSTzrEcse/1XISsnLg+juSGy
	4sGaXi4BqQz7VPbwpgom//ZiWUOofUpk09/dDkDiN0X63ziiJ6Xyj3wfUE8vhA18jwW+
	AQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y+phrHLjNEgqUaTUh86XltFzNFqjmVnAeMrAdYRHpg8=;
	b=D8du2lCsAPYTW+DKyc216ltLpBHUPoYRfjumNqAJfh9rqO09zxVhaeODWtkPeoQn38
	1Xvp/b2AOHImA0NE7a3gfQIDfLgiwC1/8vKnIQGLLasP73ZJRnP4Z/7mOLGM1v+0Jolo
	bXrgbg8C9iI+1wMA4ZCMA5f5dyIoVO+fEY/SNJQ09DyHIYs1u2oV5CI9gS6KIn1wrXmF
	AdjnAzX7/P/d7/wR7SGdjCuK5lql8UuRQriZkvKfD2F5NW74PqqDarmb1lGqMdTDwPZW
	/oVCIyxyANd765npuS+fGpFeuRsMsWjxDgtZJRoE8oJh4L8sNC1uHle0s1X1QYDdM/Xe
	b6oQ==
X-Gm-Message-State: AHQUAuYciN/UnXQi9V6LCh8klEIfCnfwOUDodrAoKW80UOLNjJD0p6Ku
	aE9XPfw5vmotSwQrfOpznJDtdoTjaLOnnyrEuhA=
X-Google-Smtp-Source: AHgI3IZD5GvWikMsTZv99s5z1429l6cNGMlDhJ/yaBbfBtHYQUIA8InrPuvNj7tD/8Vaa6W4qFJQfrVGkvId94OLOYs=
X-Received: by 2002:a9d:7653:: with SMTP id o19mr7851937otl.12.1550055169160; 
	Wed, 13 Feb 2019 02:52:49 -0800 (PST)
MIME-Version: 1.0
References: <CAHN4dxphUCH+QvMFStdoPe_6BJYUKpzfQy-iR8vEZMUJ+k41LA@mail.gmail.com>
In-Reply-To: <CAHN4dxphUCH+QvMFStdoPe_6BJYUKpzfQy-iR8vEZMUJ+k41LA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Feb 2019 11:52:34 +0100
Message-ID: <CANNYZj9VonBDOVD0fyH7JcwdwUQxhAuyM1AcwRGEyLeeg74xBw@mail.gmail.com>
To: =?UTF-8?Q?Jo=C3=A3o_Rasta?= <freakforever@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gl support for qemuaarch64
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
X-List-Received-Date: Wed, 13 Feb 2019 10:52:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 12 Feb 2019 at 18:54, Jo=C3=A3o Rasta <freakforever@gmail.com> wrot=
e:
> I was trying to build virgl-gtk branch for ARM qemu target, but I'm not c=
ompletely sure if it's possible as it generally seems to require KVM.
>
> qemu-system-aarch64 has the virtio-gpu-pci device, which i'd assume to su=
pport GL forwarding to the host if compiled with libvirglrenderer. I've als=
o been able to run a cross-compiled image reporting [drm] 3d Acceleration e=
nabled. However, I was not able to start any graphics application on the gu=
est.
>
> Could someone pls clarify this?

First, do you need specifically qemuarm64? qemux86_64 is significantly
faster because it has kvm. I never tried arm or other emulation
targets because of that, it's all tested with x86*.

The tests you need to do are:
a) run 'dmesg | grep drm'. What do you see?

b) add kmscube to your image and run that. There is a demo video I
made so you can see how it works:
https://www.youtube.com/watch?v=3D0YBuku3JESc&feature=3Dyoutu.be

Alex

