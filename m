Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 397A4745D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 16:17:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id u47so24117907qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O1fDDxOsqMXtgNYFpYRhyoiIU6miCJuX0T8KH9CIgZQ=;
	b=uWQ/yThTOl0YmKsGqnSjUsdJwoF/KN2UncvUVmb2WTu1NjjfIi2rVgmIr1NtAa99sr
	vgndBCLtfICb75S8RC82cOUQ6+WYjVu4XFDNN26jh8amnrX4U1zcOeT4YGFrScSPbBwd
	rpT37v2PepwHXhJ6JpLAjXpmA4BrwfHGByHBSEErFtOqooVqrTMSNXTY2kn4tXXgz/m0
	cg4vkjEzBoTGd85W5WoCG+HBI+XHPwcCVFQnFSoq2gcXWGrW7C7XzkcxvJfz/gg4ykgb
	ApO5e47qrJI9dlDhQxwYc1C0IUrVeuB5GizWRlIdRSBsIt1EXFGifo+752jCr6uteYGC
	Vsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O1fDDxOsqMXtgNYFpYRhyoiIU6miCJuX0T8KH9CIgZQ=;
	b=XraYuj+EfmD3bN1w09/myxqvPIxv3CpbiXr/59Y//Avg0jsNdYFJMrCRZQziUDGl9d
	ZzQEBjHZpg8I7BFrt4TovbPBqzltBUH1CCMpFotuCNpSshxpyCzhbl+KiNUV1HaZRlfL
	TuQlUzxjwbT58xPfnqhz9+MUDFyzdT2OQamn+ITjtU0Vg5crpCUDlZ2uFn7WxwCDtTUn
	GS3s+eQh5rQAXXUOC3TQCiLNOfnKo3d/366TMjE6ywq/bG70SPS8s9R1OOOzjQ1ErFUD
	yQeSo0qrvvnkX27CthErRnc/Mx3AbeCBDtfCS8yzAE02h3KQS+UOjjEHIqtth1KdxOTM
	uJNw==
X-Gm-Message-State: AJcUukdrajO2gpd6/xFuBVcW6iRYN+md/l4lvklxO0k9jSje96BGhGFU
	u/SyRnTJhPgR1rxzcK1DaknQ+tl8ubw7umNWrfrrGwkPDbA=
X-Google-Smtp-Source: ALg8bN5AR2tNTqtvVNMS/F/EGDjrUv+B8D0Ij3oJSXWnYvSdq7d6tAzLGm418xRiqra5Fnaxu/McPfDxxpyxICMfVeI=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr26804920qtn.254.1548087477932;
	Mon, 21 Jan 2019 08:17:57 -0800 (PST)
MIME-Version: 1.0
References: <20181129175214.3041-1-raj.khem@gmail.com>
	<3287314d6f8a7a23be48eb9ea168b3f148da7ae5.camel@andred.net>
In-Reply-To: <3287314d6f8a7a23be48eb9ea168b3f148da7ae5.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Jan 2019 08:17:31 -0800
Message-ID: <CAMKF1sr+VTsroSm_CNG+qZadFv1nXXj4TJ9RUY3d9rmWuf_JHw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Update to latest trunk
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
X-List-Received-Date: Mon, 21 Jan 2019 16:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9

this feature was implemented but does not emulate full
glibc behavior and its possible that app is expecting the glibc
behavior, I have fixed nfsutils app in past see for details

https://patchwork.kernel.org/patch/10707759/

I think you can start with suspecting app, I dont rule out libc bug
but thats less likely

On Mon, Jan 21, 2019 at 1:14 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> Hi,
>
> On Thu, 2018-11-29 at 09:52 -0800, Khem Raj wrote:
> > Complete changelogs are here
> > https://git.musl-libc.org/cgit/musl/log/?qt=3Drange&q=3Dc50985d5c8e316c=
5c464f352e79eeebfed1121a9..39ef612aa193cc6e954ac5a01574300ccd4b7ef9
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > V2: move to latest master ( 3 more commits for regressions )
> >
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> > core/musl/musl_git.bb
> > index 0d8f8eb2a4..b416ec45bf 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -4,7 +4,7 @@
> >  require musl.inc
> >  inherit linuxloader
> >
> > -SRCREV =3D "c50985d5c8e316c5c464f352e79eeebfed1121a9"
> > +SRCREV =3D "39ef612aa193cc6e954ac5a01574300ccd4b7ef9"
>
> With this, link detection doesn't seem to work correctly anymore, instead
> constant messages in the syslog:
>
>     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Ather=
os 8031 ethernet] (mii_bus:phy_addr=3D30be0000.etherne:01, irq=3D-1)
>     IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
>     fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx=
/tx
>     IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
>     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Ather=
os 8031 ethernet] (mii_bus:phy_addr=3D30be0000.etherne:01, irq=3D-1)
>     IPv6: ADDRCONF(NETDEV_UP): eth1: link is not ready
>     fec 30bf0000.ethernet eth1: Link is Up - 1Gbps/Full - flow control rx=
/tx
>     IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
>     Atheros 8031 ethernet 30be0000.etherne:01: attached PHY driver [Ather=
os 8031 ethernet] (mii_bus:phy_addr=3D30be0000.etherne:01, irq=3D-1)
>
> etc.
>
> I've tracked it down to commit d1395c43c019 ("allow freeaddrinfo of
> arbitrary sublists of addrinfo list" in musl.
>
> Even latest musl master de7dc1318f49 doesn't work for me with the same
> problem. The only way to make it work is to revert d1395c43c019 in musl,
> even with latest master.
>
> link detection should be a kernel thing, or not? So how can a user-space
> change affect the kernel's link detection?
>
> Any ideas?
>
>
> Cheers,
> Andre'
>
>

