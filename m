Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC1D781D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 14:07:22 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id k93so85203596ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 07:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=jvaHIcUrjUJRA0NMgkXP/L6vxYmfJGsgTAxfVdjfDo4=;
	b=F+nJ0gPeqvoyFgCho+/EZcJdtwqlNGTMG3JXe0I50d7CqZg1fkgPUJg+LjhN4TiXdp
	WA41sNdXk5tovVuu9Tg9seOu4ADJ6I/SN6R4fxBBamvLeskcB5cAWctYO5rKR3eBFwZp
	cDd3eVHIeLLU8UnouVvnK35HWiY9agUB4ROg7oskxi7Ndh2s05WiPvMwfblznfuXDCCc
	WQ33ObkXQNcZPTEh7KXjenHo9rdNBrFbVvZbFZ9e5ILqo7Uhrb2QjfNNky7scgz4Q+N3
	P7If8JtqtE6uzPwXAxxaMlletOMUmomLW4VQtB/GpO1/3suaYUlckGUQ789uVtAdGPFy
	R5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jvaHIcUrjUJRA0NMgkXP/L6vxYmfJGsgTAxfVdjfDo4=;
	b=t7uWkGzD5QzG1u2CJjDuPUHzcbjNW+dcPB/IYpBtxHBarGaSDtrAYB+CM56nCkyour
	Dwyn2eAZ7dy9MsowF7lj6V/kOXjFMNbiCBCXQu+MCI+0Rh14lmZLTK0mNjujrUbr45UI
	26zVykvta5cq+/OFpedX9kkWqN1VItJXx303MKIjTm3M42BB6+BFqAO74KIuiDgrlwuE
	RV9g6MRsKu60xssm60kNswgQLtTaZfsVaPb1hEP6L8jQHyReqM1Lbe47MP/YVL/Mgpyj
	3K2luALbGS7WK5ow38gj6OTxJz4MVrEYd/FI+dyLlLs2Ist9837az3Cz4GMUX2wb3FZf
	+BDQ==
X-Gm-Message-State: AKS2vOxDt65X2A92AxcPlBeisVp6av+4UKfnVr2WYkl576zZ6Xe+NpIz
	ca5SdDBq1feZJw==
X-Received: by 10.107.173.18 with SMTP id w18mr26750247ioe.80.1497967644058;
	Tue, 20 Jun 2017 07:07:24 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b70sm7905770ioe.57.2017.06.20.07.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 20 Jun 2017 07:07:22 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1497967641.21055.1.camel@gmail.com>
To: Ulrich =?ISO-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 09:07:21 -0500
In-Reply-To: <20170620085256.okya3zax2xhdshiz@pengutronix.de>
References: <20170507013304.30165-1-JPEWhacker@gmail.com>
	<CAJTo0Lafr6dearC1uiQpumEUHA9ggAC59MhtvFWVvYi-Oc_8TQ@mail.gmail.com>
	<20170620085256.okya3zax2xhdshiz@pengutronix.de>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] openssh: Atomically generate host keys
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
X-List-Received-Date: Tue, 20 Jun 2017 14:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-06-20 at 10:52 +0200, Ulrich Ölmann wrote:
> On Tue, May 23, 2017 at 03:37:16PM +0100, Burton, Ross wrote:
> > On 7 May 2017 at 02:33, Joshua Watt <jpewhacker@gmail.com> wrote:
> > > diff --git a/meta/recipes-
> > > connectivity/openssh/openssh/sshdgenkeys.service
> > > b/meta/recipes-connectivity/openssh/openssh/sshdgenkeys.service
> > > index 148e6ad..af56404 100644
> > > --- a/meta/recipes-
> > > connectivity/openssh/openssh/sshdgenkeys.service
> > > +++ b/meta/recipes-
> > > connectivity/openssh/openssh/sshdgenkeys.service
> > > @@ -1,22 +1,14 @@
> > >  [Unit]
> > >  Description=OpenSSH Key Generation
> > >  RequiresMountsFor=/var /run
> > > -ConditionPathExists=!/var/run/ssh/ssh_host_rsa_key
> > > -ConditionPathExists=!/var/run/ssh/ssh_host_dsa_key
> > > -ConditionPathExists=!/var/run/ssh/ssh_host_ecdsa_key
> > > -ConditionPathExists=!/var/run/ssh/ssh_host_ed25519_key
> > > -ConditionPathExists=!/etc/ssh/ssh_host_rsa_key
> > > -ConditionPathExists=!/etc/ssh/ssh_host_dsa_key
> > > -ConditionPathExists=!/etc/ssh/ssh_host_ecdsa_key
> > > -ConditionPathExists=!/etc/ssh/ssh_host_ed25519_key
> > > 
> > 
> > Can you not continue to use ConditionPathExists to only run this
> > unit if it
> > needs to run?  You can prepend the argument with | to make them
> > logical OR
> > instead of logical AND, if I'm reading this documentation
> > correctly.
> 
> Am I right that if we have a read-write mounted root-FS with already
> existing
> keys in /etc/ssh the service unit will nevertheless be started on
> _every_ boot
> now as the files which are checked for existance in /var/run/ssh are
> missing?

Yes. The service is actually run when the first ssh connection is made
(not at boot time), but it will do so on the first connection every
boot cycle. I don't know a way to do a complex conditional in systemd,
so this does the superset and makes sshd-check-key figure out if the
key actually needs generating or not. Perhaps there is a better way to
do this with the systemd conditional syntax that I am not aware of?
Ideally, the conditional checks in the systemd unit would be able to
use the SYSCONFDIR from /etc/default/ssh, but I'm not sure if that is
possible.

> 
> Best regards
> Ulrich
> -- 
> Pengutronix
> e.K.                           |                             |
> Industrial Linux Solutions                 | http://www.pengutronix.d
> e/  |
> Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-
> 0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-
> 5555 |


