Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B55126FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 14:48:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so14713801wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 07:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Uk6HVb6EtVgWCZykJesRamO97cbe2PXUSQX9cVFmQxw=;
	b=cWytoteYUQBOtvSMBPPl3l+apdpszLUfZ3Qc01ai5C43g4xR0p/1+gXMS8lwCcyWFe
	3UeBR+CSlVUimx1Pp5nRp5s56FlTnP+f46KWJ5Fcq/IbeQtFzPWdrkWHOfGgP7Mbg1xd
	sArZY32HquLvxglaAOnsYM2kSFYuI1ueE/NENgs5rOukcCjJpEsINHdAluk0AW95LddZ
	B84iPrvyNNru72k9eIZroIxRab1ykyX5v0hzz/AY47I+1u2jcKu9R+vHlZDI0BJ9j83F
	LDhSBNyXhNpmZdzfUieDJyMk6TwOrYrHcnvFqWZ8rW3vTa0cRZwpfroqk5gn2PVMJ0LR
	iT4A==
X-Gm-Message-State: ALyK8tLrxOanuMVoL8saWmfVDxRMCHW2ju6m/IPN0retcYq4usjx5NBac0H0z6qGRAbRNQ==
X-Received: by 10.28.168.7 with SMTP id r7mr12001796wme.9.1466434139462;
	Mon, 20 Jun 2016 07:48:59 -0700 (PDT)
Received: from localhost ([185.46.212.65]) by smtp.gmail.com with ESMTPSA id
	q71sm14023698wme.17.2016.06.20.07.48.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Jun 2016 07:48:57 -0700 (PDT)
Message-ID: <1466434134.6499.27.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2016 15:48:54 +0100
In-Reply-To: <CAMKF1srfaxLS3wn5d5Fu46i5-hU+kGj3dViD_v7YyF3wut013A@mail.gmail.com>
References: <1465571533-21604-1-git-send-email-git@andred.net>
	<1465571533-21604-2-git-send-email-git@andred.net>
	<CAMKF1srfaxLS3wn5d5Fu46i5-hU+kGj3dViD_v7YyF3wut013A@mail.gmail.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] uclibc: never build with SSP
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
X-List-Received-Date: Mon, 20 Jun 2016 14:49:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Khem,

On Mi, 2016-06-15 at 17:20 -0700, Khem Raj wrote:
> On Fri, Jun 10, 2016 at 8:12 AM, André Draszik <git@andred.net> wrote:
> > From: André Draszik <adraszik@tycoint.com>
> > 
> > This doesn't work, as the initial gcc that is used for compiling
> > uclibc doesn't have support for SSP yet (since that will only
> > be available once uclibc has been compiled). Since during that
> > same compilation step uclibc is trying to build its own utils
> > those are failing to compile with SSP enabled as the
> > initial gcc doesn't have access to the required libraries,
> > yet.
> 
> Please look at how we do this for glibc based systems.

Are you saying glibc is compiled *with* SSP enabled?

I can't seem to find anything relevant. The only thing I can find seems to
result in glibc and (and glibc-initial) and all glibc executables (!) being
compiled without stack protector. As you seem to have something in mind, can
you please be more specific and give me a pointer?


>  This patch is
> not something we need.

This patch fixes uclibc builds when SSP has been enabled by including
security_flags.inc in distro.conf. Why is it not needed? Can you be more
specific please?


Cheers,
Andre


