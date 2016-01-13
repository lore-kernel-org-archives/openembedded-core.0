Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id EC2A4731CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 14:56:27 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3pgX0W2Dlvz3hjkf;
	Wed, 13 Jan 2016 15:56:27 +0100 (CET)
X-Auth-Info: RGOPfKxgz1F1jef3+99d4D+Qx06A/2FPab8IGVOAJgQ=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3pgX0V60ChzvdWS; 
	Wed, 13 Jan 2016 15:56:26 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Wed, 13 Jan 2016 15:34:58 +0100
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<CAP9ODKr1iOkB-n7yfyOGk0dYnuni1V5=84k1CK1eG+TPFsFLuA@mail.gmail.com>
In-Reply-To: <CAP9ODKr1iOkB-n7yfyOGk0dYnuni1V5=84k1CK1eG+TPFsFLuA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201601131534.58933.marex@denx.de>
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
X-List-Received-Date: Wed, 13 Jan 2016 14:56:28 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wednesday, January 13, 2016 at 01:04:31 PM, Otavio Salvador wrote:
> On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
> > Upgrade U-Boot to latest version and drop upstreamed patches.
> > 
> > Repair configuration of U-Boot during build. It is no longer
> > possible to run "make foomachine" in U-Boot. Instead, it is
> > necessary to do "make foomachine_defconfig ; make". Fix this
> > in u-boot.inc and u-boot-fw-utils*.bb .
> 
> Please drop this config suffix, from u-boot.inc. The config value
> should be used as is and the respective BSP ought to be fixed to
> change _config to _defconfig.

If I don't have the _defconfig there AND I define UBOOT_MACHINE in my machine
file, it will call "make machine", which no longer works.

> Apart from that, it seems fine. As suggested by Khem, please post it
> with rename detection so we can double check it.

Best regards,
Marek Vasut

