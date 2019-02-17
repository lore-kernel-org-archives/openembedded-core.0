Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 27C4E7C706
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 22:45:44 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q187so3169809wme.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 14:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=WMe8SHuyVEIaD858g0ghI/6tqSANRJu1G/KkSmSzZ5U=;
	b=Umm5zcRtpSpvdROSTOwBUOqsELaWAQ1D8/pdbkd2kHtB9zLq1g6qz9OyiY+ZECH0Ce
	nbiplZ4KbO9JB6WgoP/x44W5trKl17Gnavty2cLBxG6pJPkNf0X1dBVL0OUqa0YeFkMK
	P9fS/dvScJssdbFNrLnT683OfCjVlQlaWSzZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WMe8SHuyVEIaD858g0ghI/6tqSANRJu1G/KkSmSzZ5U=;
	b=eZP0z9sD0m2u4YKBPl+GL+QGv9cJEWlgT7qw9FkUbigArNALluDLDidoL9F0WxlexV
	NjugHWl7h34DLYhS2PsUhvMs/+McytLZIMw4TM+Cv6GmuCWF7zmuQRslMNrE723pXcVp
	XkoLN9kSnN+ZPmZPLshmqD/mSssb9V4yJZPnCVMT1Qk+x9apn+QfOka4LtqqprlH6VdP
	C/kYddNEFQfO1k5+J92i7zENMvHNYjc46bts2ZMrwbDEu2Z1wWFyHbMfSS/jl0Bq4XGo
	mfnS7F1AksU2z9xi+A+S2SxSahL+D8yWqnyCOTs3QHr7hbfV4Mup/ysQIy5BJXHG6lwu
	TFbQ==
X-Gm-Message-State: AHQUAuYUs9WkYmMKUbDL6G90vHE4Q+30tYFDTxS0vCwbUCJv5eQhW3nh
	I/r0NmSzC+dRAcyqNPaboE0d5g==
X-Google-Smtp-Source: AHgI3IYHwODB9bHF0KY3bhT4ikahdVZmyX3xigpSsjfTiSZDW0hOshxzNb0fCryFj0thfhNKE1hEUQ==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr14843810wmh.144.1550443545587;
	Sun, 17 Feb 2019 14:45:45 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y22sm45836553wrd.45.2019.02.17.14.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 14:45:44 -0800 (PST)
Message-ID: <8f156c0c1b0cc7fe18bd25a03a8f5f0cdc4f422d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 22:45:43 +0000
In-Reply-To: <8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
References: <1550123438-37723-1-git-send-email-ee.peng.yeoh@intel.com>
	<f26f1ce6b9b79817950b93f9aa0e38d32671e78f.camel@linuxfoundation.org>
	<8f788c03bb214b6b23dacec18b9efbc32d6bf81c.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/2 v7] test-case-mgmt
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
X-List-Received-Date: Sun, 17 Feb 2019 22:45:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-02-17 at 17:54 +0000, Richard Purdie wrote:
> > Despite my changes there are things that still need to be done.
> > Essential things which need to happen before this code merges:
> > 
> > * oe-git-archive is importing using the commit/branch of the
> > current 
> >   repo, not the data in the results file.

Also now fixed. I put my patches into master-next too.

With this working, I was able to run something along the lines of:

for D in $1/*; do
    resulttool store $D $2 --allow-empty
done

on the autobuilder's recent results which lead to the creation of this
repository:

http://git.yoctoproject.org/cgit.cgi/yocto-testresults/


> > * Revisit and redo the way the git branch handling is happening.
> > We 
> >   really want to model how oe-build-perf-report handles git repos
> > for 
> >   comparisons:
> >   - Its able to query data from git repos without changing the
> > current 
> >     working branch, 
> >   - it can search on tag formats to find comparison data

Which means we now need to make the git branch functionality of the
report and regression commands compare with the above repo, so we're a
step closer to getting thie merged.

Ultimately we'll auto-populate the above repo by having the autobuilder
run a "store" command at the end of its runs.

I have a feeling I may have broken the resulttool selftests so that is
something else which will need to be fixed before anything merges. Time
for me to step away from the keyboard for a bit too.

Cheers,

Richard



