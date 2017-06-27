Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD9D77F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 20:35:10 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id 62so35178568wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=BcfmqHn8VtDuz76BAq+eim2i6+6owvZ3ncMHw9IMzU0=;
	b=xsQplVhZgUx+vMaKo4Yi5RmgntqSfD2eeRBRgni6AfSV99YU45HViVQ2orKP07ouoZ
	cu+w/rLojO6tFn7FFFjFuFvRM5A1uxYrtHiQC3Zdphn4+dQDhbc343cATTixMm55aDSj
	MB+Ut47fq5DzBbt048+YfML0kaq4PKn9yUTQ/MPagwuetsElqa2X0CcGkTXKIFWGFZA1
	gFvLdcGAU9eN4itbhK85KBTuLa3SlUYjxV9ahbV8rA/VGybcPAbX/tmCoQ2SIX1+g62y
	Inf4yDSgFVrdVqd5A1QnAeaDedWu0k0RUdA+r4gJisIKFkFAxvaYa1NGo/JGy4FBTPTu
	xySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=BcfmqHn8VtDuz76BAq+eim2i6+6owvZ3ncMHw9IMzU0=;
	b=VjbqNL+BNPyw5xx8674tT32ztLWrnO0Eh3PHXhcAOTrP+hb3feMLmfhR06ey3wyvUS
	2F78NoCuF/D7U1Rro2lN2gFXKs8lBsGdsibvZbJ/YuV6lXxBKnUi/n1PhmH40di0eSEF
	sA5Fx/Q5rjgTIadg9l9haXpY0gGoHa814oy+4cbFFpsIp3ZbvNnZpsJ7o8VdGyppwxKX
	Lh02vAguz+IG9PiYjzPj4VzXIQNVFBnnkIQzD7w+a3ibI4FTSaxGi+0KsR1oFR160fUO
	YYk1JzvtvV8WicVXfRGsdmWxJcRyxsSgUz9jAvLFpNQBxpsHrPXbLTAtnVZy9UDFb+Il
	n8hw==
X-Gm-Message-State: AKS2vOy9lLWQM0e6u8hsB/4XGF/RAyrZT851edazR2p2EGLqSnQjGDiM
	l78n5N7ozosLQd7MYxs=
X-Received: by 10.28.1.8 with SMTP id 8mr4553547wmb.88.1498595711381;
	Tue, 27 Jun 2017 13:35:11 -0700 (PDT)
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com.
	[74.125.82.48])
	by smtp.gmail.com with ESMTPSA id j125sm929283wmf.6.2017.06.27.13.35.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 13:35:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f48.google.com with SMTP id w126so35071841wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 13:35:09 -0700 (PDT)
X-Received: by 10.28.92.130 with SMTP id q124mr4925875wmb.21.1498595709811;
	Tue, 27 Jun 2017 13:35:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.176.5 with HTTP; Tue, 27 Jun 2017 13:35:08 -0700 (PDT)
In-Reply-To: <cover.1498569961.git.ed.bartosh@linux.intel.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
Date: Tue, 27 Jun 2017 17:35:08 -0300
X-Gmail-Original-Message-ID: <CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
Message-ID: <CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>, 
	Fabio Berton <fabio.berton@ossystems.com.br>, "Burton,
	Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Tue, 27 Jun 2017 20:35:11 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 27, 2017 at 10:28 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> The patchset also fixes long standing bug: wic updated fstab
> inplace in rootfs directory. This causes other tasks working with
> rootfs directory to produce incorrect results or crash. This is
> fixed by copying rootfs to the temporary directory before updating
> fstab.

As you is working on this, please also include Fabio's patch on the
patchset. It includes a command like option to disable fstab change at
all. For delta-based updates this is imperative.

Fabio, could you point him the last patch revision?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

