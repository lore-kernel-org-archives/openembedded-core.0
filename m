Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id ABF366AE37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 12:47:05 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id g10so1333124vbg.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 04:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=21PIWecASVBBUUh64TYUR3vLKpfzOdwOfqkX3jkbEEg=;
	b=A92rz0na1Qzz6M2J4qxR3rsIr9i/ef6oKzcRoYAof2SshhAb9TRd/Rfntw9NBdQlUM
	TkPsjDr7fm+qcPYMSUC+wTyTtLJ6JbxfzZECJtw/4CJOx0FgwiZnKkUfq/lBrExKnLKe
	NKTL8tHADPS++m2quyZcVFnHTlQH3f8wqEAQQJ5Jrg/rqfssnpXSby8sm8qBaw/sFFCA
	Ev5IpEybEiSz+PbWUWB4lFnw5IJATDE66IjGU2xY7YIayPsHuWUA2KAGUh9MLi2AgplW
	nXkvEP7rjR0feqIkAEVQAY3zOilQ/5alOoJ6j8t6IgeUmZFIZeX8377vGJmVrb2YG41O
	LFHw==
X-Gm-Message-State: ALoCoQnrbmsiAbfOMRHUdoIAfbNvJdam0yWongNbPVQsOX0Go7iPxUe9kT5+Y8xIwxD4GGS2nShQ
X-Received: by 10.58.232.228 with SMTP id tr4mr1167464vec.34.1383914826129;
	Fri, 08 Nov 2013 04:47:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 8 Nov 2013 04:46:46 -0800 (PST)
In-Reply-To: <1383802501-10099-2-git-send-email-raj.khem@gmail.com>
References: <1383802501-10099-1-git-send-email-raj.khem@gmail.com>
	<1383802501-10099-2-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Nov 2013 12:46:46 +0000
Message-ID: <CAJTo0Lbjx2=Eq3zgyhyAvjhssymZV-CgGD3REr7unO2VqZXmAg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Upgrade 206 -> 208
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
X-List-Received-Date: Fri, 08 Nov 2013 12:47:05 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 05:35, Khem Raj <raj.khem@gmail.com> wrote:
> Create additional packages to bundle zsh and pam.d files

Oh, will this mean systemd-user actually works with PAM?  I hit this
problem before ELCE and ended up reverting the change to error instead
of warn on missing rules.

If so, please don't package the files in a separate package but ship
them with systemd itself as they are practically essential if PAM is
enabled. If the (negligible) size impact is a concern they can be
deleted if the pam DISTRO_FEATURE isn't enabled.

(and please sent patches with -M)

Ross

