Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C4FA3600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 23:09:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z5so22104759wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 15:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Hbo04nrjlusXcYs1jxKVvnVwK9wLCjpgY5d157D9pHM=;
	b=QCUjI4Ug1UsST3yZcgMzEfcgjYjsm8U19ixRFVkAbsWPEpYmSaps40hrt3dzAYmZnI
	TLZfVnpuSTvRrVI75HpkTcemcHrgWP665l/2O7EjofKdkwobFjIhO7udXvyej+tk0IHE
	a9OP6ZY62BjEPU/1jAkclkyJ0K9uwea8pXhSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Hbo04nrjlusXcYs1jxKVvnVwK9wLCjpgY5d157D9pHM=;
	b=MNeN3jDeqXXPbG36y18Py4nOLmZUD0utw8nCNwQ6/Aeni0bwRwhNloprY1XcEnio2M
	NkHVSk0p80vPtodBQBFPesbfg5GmxHeWdra8Adfqr8L5iNeBWlO20xXR9/GkMWGI3gf7
	rOHN25rf2gOjoMGMiuR2E26eeQb1lRSOMqjIQkTIdLt/bL7wFfwwrt1xIXbGmuZESbGD
	eln6y/u5SdsSU+M7pVL8351qzg8+uVX6a5vwPYZdGfaiTpVggFxEvBgeliWGQthp7nd3
	yeYAfECqGUTAaURyb8YmQ7e4f+aZ0gjiLfnAfIPdwTtGqCTJuqWDjlDVogb+etcaTH+o
	X+Tw==
X-Gm-Message-State: AJcUukdlzEf82J/PAbgJwCta8FH0d+p7Q4oQoOurS6PSGt8y0lb1O+Kh
	DkQJupP4h47sXnDOLHCsB3JDrQ==
X-Google-Smtp-Source: ALg8bN7r3hVohpAqZ8NpRZRKMOwLirOZ+t95Kg21iF45JoMF1ND3qong9LvnINNytylx25fFn0J+Pg==
X-Received: by 2002:a05:6000:11c3:: with SMTP id
	i3mr28279116wrx.221.1546038567283; 
	Fri, 28 Dec 2018 15:09:27 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 3sm34310859wmw.46.2018.12.28.15.09.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 28 Dec 2018 15:09:26 -0800 (PST)
Message-ID: <5d6426bdf5c63bbce39ef01e26144798bb663f53.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2018 23:09:24 +0000
In-Reply-To: <0158f93e-f6f7-f1cf-dccf-b3eb4a328b15@windriver.com>
References: <cover.1545901142.git.liezhi.yang@windriver.com>
	<7b35228f2a7f688f6c1a6ecdbcefd6dd436c4b25.1545901142.git.liezhi.yang@windriver.com>
	<e2a93209edc2390de536dd34fdd405ea9ab5b8ab.camel@linuxfoundation.org>
	<0158f93e-f6f7-f1cf-dccf-b3eb4a328b15@windriver.com>
User-Agent: Evolution 3.30.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] oeqa: make it work for multiple users
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
X-List-Received-Date: Fri, 28 Dec 2018 23:09:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-12-28 at 15:57 +0800, Robert Yang wrote:
> 
> On 12/27/18 7:37 PM, Richard Purdie wrote:
> > On Thu, 2018-12-27 at 00:59 -0800, Robert Yang wrote:
> > > There are failures when multiple users run oe-selftest on the
> > > same
> > > host:
> > > 
> > > PermissionError: [Errno 13] Permission denied: '/tmp/oe-saved-
> > > tests/201812250324_qemu'
> > > 
> > > This is because /tmp/oe-saved-tests was created by user A, while
> > > user
> > > B tries
> > > to write data in it, then the error will happen. This patch can
> > > fix
> > > the problem.
> > > 
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >   meta/classes/testimage.bbclass   | 2 +-
> > >   meta/lib/oeqa/runtime/context.py | 7 +++----
> > >   meta/lib/oeqa/utils/dump.py      | 5 ++++-
> > >   3 files changed, 8 insertions(+), 6 deletions(-)
> > 
> > Putting this into /tmp isn't good. Why don't we move this to
> > LOG_DIR/runtime-hostdump/?
> 
> I'm afraid that we can't do this, the problem is that we need call
> get_bb_vars()
> to get LOG_DIR (d.getVar('LOG_DIR') doesn't work), but get_bb_vars()
> runs
> "bitbake -e" which doesn't work when "bitbake <image> -ctestimage"
> since there
> is a bitbake server running. We can only get BUILDDIR if we don't
> call
> get_bb_vars(), so I think that we have the following 2 solutions:
> 
> 1) Save it to /tmp/runtime-hostdump
> 
> Or:
> 
> 2) Save it to BUILDDIR/runtime-hostdump
> 
> What's your opinion, please ?

I think it should be possible to use LOG_DIR for most of the usecases.
It won't work for the "on target" mode but it should be possible
elsewhere even if we have to tweak the code a bit to ensure the right
variables are passed around?

Cheers,

Richard


