Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2B1D7E3BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:40:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c6so709362wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=XpkVycfddYUdmgkAoya9bj9hG3jCp7e+xnpAc/BEgAs=;
	b=KHEiz6zwNecDOq+KGDzPpu+C6lC7Nn+3JfH5dFP6JU91/XwH3/exuBPoJoLArsdYL2
	ZjTTUgeJTfwV8I5unRTYiYevDcF4NnXhHelyetA9oIUGbFUo4IOzlnPY3bEnHOdDrAIl
	EpEqNyH2TWVqvvTc1wD9G1ToCqNMRa1M6KHec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XpkVycfddYUdmgkAoya9bj9hG3jCp7e+xnpAc/BEgAs=;
	b=Vw6cG4IJDgLBhtnBU84pYtHDoCEP+VgAA5EwZDlI6zYDkORgiw6Kra7g4vpi5UHg50
	wMvqQWiD6FObH825Q5AWAmnWIc5Zu71jAX9dX2yMvOpEV4bvKuI/9D0XIw3qYirfVPdl
	yEd/Vj+AEluBH0deMzFITiIdlJyQjqhvEPkfrW4/gDyK0aic9MkQFKR2f+kR2wPS3oYa
	xxhNodDZVULgfBhqdkOxDvy1WNNGQBmPbVkx/NPkq4bOMY4RjMVwjOzvlD+Ggq74Lk7C
	YaW4TmAaLE/eFk3xOVZmyI/aNFoIdGxy2WQyLVDWLwjy7Wf8mez62IVtG8+PG3cLOxAM
	9y4g==
X-Gm-Message-State: APjAAAVsNLb5beIEAs6l2QsztPGd+v/d49IzD63vbWF9faQuMp2ew02J
	wJw3El0yWt6WzK5cV8TBNWZ4MqGoyz4=
X-Google-Smtp-Source: APXvYqxee14Pd2CfapfL2O9FnBCm/ljcEfxEKiLSTsJqUM4f8qfcUsb2x320//uRUm33fCGVFuDdkA==
X-Received: by 2002:a1c:1bc1:: with SMTP id b184mr2114784wmb.42.1559216413675; 
	Thu, 30 May 2019 04:40:13 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f65sm2877261wmg.45.2019.05.30.04.40.12
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 04:40:12 -0700 (PDT)
Message-ID: <67c4faa0f02f1086c7910499ec4e917a12f090f4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Bunk <bunk@stusta.de>, changqing.li@windriver.com
Date: Thu, 30 May 2019 12:40:12 +0100
In-Reply-To: <20190530111515.GB20599@localhost>
References: <1559194340-420777-1-git-send-email-changqing.li@windriver.com>
	<20190530111515.GB20599@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2 V2] add rconflict for systemd/tiny-init
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
X-List-Received-Date: Thu, 30 May 2019 11:40:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 14:15 +0300, Adrian Bunk wrote:
> On Thu, May 30, 2019 at 01:32:18PM +0800, changqing.li@windriver.com
> wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> > 
> > 
> > Changqing Li (2):
> >   tiny-init: add rconflicts
> >   systemd: add rconflicts
> > ...
> 
> I wonder whether the conflicts between init systems could be handled
> with
>     RCONFLICTS_${PN} = "${VIRTUAL-RUNTIME_init_manager}"
> 
> This would avoid the problem that all n init systems would need 
> RCONFLICTS with all n-1 other init systems.
> 
> In my testing this seems to work with all supported package managers
> (including the self-conflict not causing problems).

I think we can support multiple init systems within one package feed,
at least to some degree. I'm also very nervous about the self-conflict, 
I'm surprised that works with all the package managers as I thought I'd
seen that fail. Was that with rootfs construction or just building the
packages?

Cheers,

Richard


