Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 225977D9B4;
	Wed,  1 May 2019 15:45:05 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id t200so10385514itf.4;
	Wed, 01 May 2019 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=aY6dFWpV7+tYH50HOgxeqDj9cCZmbI2WR6V7SXLX5J0=;
	b=C1AHlAABe+BMb6ME/jykioP2OUfnPdtAWiJXCBFhXQlyTsBWw7/9cSpOvpfhv/VAZX
	/Y3VQbx+kfjDiZhN1Xvx1URiMZk5UsGRw8UfzpDq/fOJqH8IQmEZX4BXykFXssU8Zj6X
	annO0U9HaSdCmSPTW5kUYP7cKA/LdPF6vyaoN1hUuRlt323nyw/8R05ivMxos1eMf7Bq
	eItX+hiEfE5ay66oLHZoLMk+Wg3blCnU6cyJ2Pjh+kIksVE+Hrv5VlGKNDr+M07qI6Vf
	f3v/g8/juo3888pwlUm2MPGXgQfGO0Az8Ot19u7RC5tXqNY6MLoK274pAnJkLiF75vGA
	TxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aY6dFWpV7+tYH50HOgxeqDj9cCZmbI2WR6V7SXLX5J0=;
	b=swQfi+1CvZ5Iqlcu+1jPvyK2uiPVM9DNg13FADfEFTNbF7FTtPRXvJi89D1diUJW9O
	whrRHN73OGCDJIrddRlIAceCQpOXv2UzFciUWbBrzIUFYIm4AB4OU4+EZGd7551XFpcw
	PT7PrnTKQl2U2J0mjJUyopKDL++DcUPuYPttBkwcYvr1TdIBIZV1mPPYmeMHm2zf6GmX
	nM9pjwJCisoXomaFMM7j2ofIAq93+yH73dYv3zxH0IyFiMU6/c5sWvlJqo3r66v1HKRl
	DBDSlZKcNO0VzSLT1KFSAkysuNSZF5jBI3Kff10Xttt4vqg4hFqtGnmdKIIvaPC1GbYC
	d87A==
X-Gm-Message-State: APjAAAXujUfMrY4922jyNU2GROuP41C8kfi9ONzYxFRsXdm68W4w+jm4
	VBebwE95ohRzrnvQ3jBIiVM=
X-Google-Smtp-Source: APXvYqyPM/+Lkym6wjZbZgZkx5ON+Di6DSTirzdewzK8T53FpfLnW/iGXCQXOfUPCzS1w9GsVJxGJQ==
X-Received: by 2002:a24:694b:: with SMTP id e72mr8484227itc.48.1556725505655; 
	Wed, 01 May 2019 08:45:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	m3sm1888442ion.69.2019.05.01.08.45.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 01 May 2019 08:45:05 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <f3d54ab2a6c9fd0f452483c86b4a1f84d31a8420.camel@gmail.com>
To: Tom Rini <trini@konsulko.com>, Armin Kuster <akuster808@gmail.com>
Date: Wed, 01 May 2019 10:45:03 -0500
In-Reply-To: <20190501152748.GY31207@bill-the-cat>
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Wed, 01 May 2019 15:45:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-01 at 11:27 -0400, Tom Rini wrote:
> On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
> > Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > ---
> >  README                      |  2 +-
> >  meta-filesystems/README     | 12 ++++++------
> >  meta-gnome/README           | 10 +++++-----
> >  meta-initramfs/README       |  8 ++++----
> >  meta-multimedia/README      | 10 +++++-----
> >  meta-networking/MAINTAINERS | 32 +++-----------------------------
> >  meta-networking/README      |  6 +++---
> >  meta-oe/README              |  8 ++++----
> >  meta-perl/README            | 10 ++++------
> >  meta-python/README          | 12 +++++-------
> >  meta-webserver/README       |  8 ++++----
> >  meta-xfce/README            | 10 +++++-----
> >  12 files changed, 49 insertions(+), 79 deletions(-)
> > 
> > diff --git a/README b/README
> > index 7318f09..881115e 100644
> > --- a/README
> > +++ b/README
> > @@ -1,6 +1,6 @@
> >  Collection of layers for the OE-core universe
> >  
> > -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> > +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> >  
> >  This repository is a collection of layers to suppliment OE-Core
> >  with additional packages, Each layer have designated maintainer
> > diff --git a/meta-filesystems/README b/meta-filesystems/README
> > index 87cb685..d9f07df 100644
> > --- a/meta-filesystems/README
> > +++ b/meta-filesystems/README
> > @@ -10,30 +10,30 @@ Dependencies
> >  This layer depends on:
> >  
> >    URI: git://git.openembedded.org/bitbake
> > -  branch: master
> > +  branch: 1.40
> 
> I may be starting off on the wrong patch here, but, did 1.40 or
> bitbake.conf ever get patched up such that rm_work doesn't cause
> world-rebuilds every time?  I recall when digging into this before
> there
> was a "maybe if we tweak $something it'll be happy again with this
> older
> bitbake".  Thanks!

No it didn't... I seem to recall looking at it and it wasn't quite as
trivial as I had assumed but got distracted; sorry about that. If we
are still wanting to make oe-core backward compatible with older
bitbake I can open a bugzilla. 

For reference, here is the discussion: 
http://lists.openembedded.org/pipermail/openembedded-core/2019-March/279724.html

> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


