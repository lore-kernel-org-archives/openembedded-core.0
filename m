Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id A044B61CD9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 18:21:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t2so3267630wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qYw52KbtUmte4Z/cFDsYS5J57W8vg6frJs5kIEBMhnA=;
	b=nD6UM5ZlCN0K3Qsb4/lz3iKCDPS2hGRS5DBRgHMhDE8EikgVWJMN3lHwaWeQkhS8fI
	Fo9LY50yAdSIk2E4Vj3whC/0y5xSQ4WEInU7Qz1+zk+JIIwlLJmsEynkItDchsX0jpPl
	H78LNzBUTZe4Dmdw1LN3T4ri5X2WK4q5zzer9lE0OIM70lC/8RtpsrWEJ+lYTrS+ndO0
	4iJTjI3hPCbEBB4XYgVatHqvjEQSRZz9ci/+TYmfFWiCDK7i/lXDd294xtSuvU0My80H
	ZzwTbQAp2T0En+XFr9SdfLZis0h2zvRID6krXCMIIx4UcDXMiHLtjCTUy22wY7OV7lNG
	6+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qYw52KbtUmte4Z/cFDsYS5J57W8vg6frJs5kIEBMhnA=;
	b=UTJPJoeDR1FtNJNjJxRC+gZYqbrROW1HYBdvCdqkeN2AmPoaVIltWTn7+avpWtwZjZ
	cu199cBYiMU4xPGeZZiHivoPeeHLJ/WAuivjc/H4LqnSv4u5xdKQZeGmgF8+mk0xRU4j
	3icYAsLsfuOnh+rljRshnBBLfide3I5HlV3FBitmxqz4vQdpYZ7CwZoIXWYL5/qTuyEL
	MHt7UmNwjhpl4Uoe+7G/ZSh4EboCHaI7Y4JCzuMlcLZmmbLR9j8h/7LHL7QOHJEWTkh2
	+9qng8g2473VlY69wmY/ft9LIa2zq1FL9zvfAsnmQ8Ep5VEgipWwLuYzmtSvPIefAE6H
	AMBw==
X-Gm-Message-State: ANhLgQ12jm5V6cxFeSvS17AWE1dGnIijshqXnv0rNBh7xEU1/UUf8zg/
	acXGcE3fCUIpN6kvhZn0xjyQQZrdiGWOT03+cTs=
X-Google-Smtp-Source: ADFU+vtU4k87AXrDQXwIgdvMNt3HPu8x+GpW5G4q/IBx2FoGhT29MHYpgXpFlBkguMX2wr24CG1NGzlTG10iGDtLcn4=
X-Received: by 2002:adf:ecc7:: with SMTP id s7mr19363079wro.386.1584123673269; 
	Fri, 13 Mar 2020 11:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
	<20200313164014.GN1578@denix.org>
	<CAHtQpK7c88eUNPDcCoX7OdrDzhNhGyntYU53WqrJXXbSYtT7nQ@mail.gmail.com>
	<20200313181544.GO1578@denix.org>
In-Reply-To: <20200313181544.GO1578@denix.org>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 13 Mar 2020 19:21:02 +0100
Message-ID: <CAHtQpK7=vSh=f9=viqN6nCEcQKr7f+R=5nDfiN_38PN_hhFM5A@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] menuconf u-boot
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
X-List-Received-Date: Fri, 13 Mar 2020 18:21:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 13, 2020 at 7:15 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Mar 13, 2020 at 07:07:34PM +0100, Andrey Zhizhikin wrote:
> > JH,
> >
> > Please refer to my replies to Denys, cross-posting to unrelated lists
> > is generally not a good idea.
> >
> > On Fri, Mar 13, 2020 at 5:40 PM Denys Dmytriyenko <denis@denix.org> wrote:
> > >
> > > What's u-boot-imx?
> >
> > This is U-Boot fork for NXP devices (former Freescale),
>
> This was a rhetorical question - no answer was required.

That was mainly addressed to JH. :)

>
>
> > which is not maintained by OE-Core.
>
> Exactly my point.
>
>
> > > It's definitely not in openembedded-core, so there's no reason to cross-post
> > > there.
> > >
> > > If google doesn't help, it's recommended to post such specific questions to
> > > the corresponding mailing list for the layer this recipe comes from.
> >
> > The correct mailing list would be meta-freescale@yoctoproject.org and
> > JH already had some questions posted there.
> >
> > >
> > > If it's not clear where the recipe comes from, Layer Index can help:
> > > https://layers.openembedded.org/
> > >
> > > Thanks.
> > >
> > > --
> > > Denys
> > >
> > >
> > > On Fri, Mar 13, 2020 at 08:15:17PM +1100, JH wrote:
> > > > Hi,
> > > >
> > > > I tried to run bitbake -c menuconfig u-boot, it popped up a terminal
> > > > u-boot-imx configuration:
> >
> > It is not clear which yocto branch/machine you're trying to build
> > here. If you provide more details - then there is a bigger chance that
> > people would step in to assist you.
> >
> > > >
> > > > make: *** No rule make target 'menuconfig'. Stop.
> > > > Command failed.
> > > > Press any key to continue...
> > > >
> > > > How can I  run menuconfig u-boot?
> >
> > I've tried it now on the [master] branch of yocto for imx8mmevk
> > machine - it is building OK and I have the menuconfig from u-boot-imx.
> > Hence, please refer to my point above regarding more pre-information
> > on the issue.
> >
> > > >
> > > > Thank you.
> > > >
> > > > Kind regards,
> > > >
> > > > - jh
> > >
> > > > 
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> > --
> > Regards,
> > Andrey.
> >



-- 
Regards,
Andrey.

