Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B6CE7731BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 17:09:49 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pgZyP6ML5z3hjZK;
	Wed, 13 Jan 2016 18:09:49 +0100 (CET)
X-Auth-Info: 6J4dl+fdpXXv7VDWcMUwk0fg3yaNS0QD2tn3or0LHp4=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pgZyP4fn3zvdWS; 
	Wed, 13 Jan 2016 18:09:49 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 13 Jan 2016 18:09:49 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<201601131730.04848.marex@denx.de>
	<CAP9ODKpjBu42wpQNMntA8b33e2wL371ViXu4cXz7-P2vi3X0Sw@mail.gmail.com>
In-Reply-To: <CAP9ODKpjBu42wpQNMntA8b33e2wL371ViXu4cXz7-P2vi3X0Sw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601131809.49390.marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 17:09:51 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 13, 2016 at 05:40:20 PM, Otavio Salvador wrote:
> On Wed, Jan 13, 2016 at 2:30 PM, Marek Vasut <marex@denx.de> wrote:
> > On Wednesday, January 13, 2016 at 04:55:56 PM, Otavio Salvador wrote:
> >> On Wed, Jan 13, 2016 at 1:53 PM, Marek Vasut <marex@denx.de> wrote:
> >> > On Wednesday, January 13, 2016 at 04:39:53 PM, Otavio Salvador wrote:
> >> >> On Wed, Jan 13, 2016 at 12:34 PM, Marek Vasut <marex@denx.de> wrote:
> >> >> > On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
> >> >> >> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
> >> >> >> > Upgrade U-Boot to latest version and drop upstreamed patches.
> >> >> >> > 
> >> >> >> > Repair configuration of U-Boot during build. It is no longer
> >> >> >> > possible to run "make foomachine" in U-Boot. Instead, it is
> >> >> >> > necessary to do "make foomachine_defconfig ; make". Fix this
> >> >> >> > in u-boot.inc and u-boot-fw-utils*.bb .
> >> >> >> 
> >> >> >> Please drop this config suffix, from u-boot.inc. The config value
> >> >> >> should be used as is and the respective BSP ought to be fixed to
> >> >> >> change _config to _defconfig.
> >> >> > 
> >> >> > If I don't have the _defconfig there AND I define UBOOT_MACHINE in
> >> >> > my machine file, it will call "make machine", which no longer
> >> >> > works.
> >> >> 
> >> >> I know and the right fix is to use the right value to UBOOT_MACHINE
> >> >> as we do for KERNEL_DEVICETREE.
> >> > 
> >> > So what is the right value ? UBOOT_MACHINE := "foo_defconfig" ? This
> >> > does not sound right at all.
> >> > 
> >> > And what is the right value of UBOOT_CONFIG then ?
> >> 
> >> foo_defconfig.
> >> 
> >> This is what we pass for make to configure the board and should be the
> >> given value.
> > 
> > OK, that makes sense. You didn't answer my question about UBOOT_MACHINE
> > though. Any thoughts on that ?
> 
> If using UBOOT_MACHINE = "foo_defconfig" will work just fine.

This makes no sense at all, does it ? How can UBOOT_MACHINE contain _defconfig ?
This sounds like a crude hack, not a systematic solution.

Best regards,
Marek Vasut

