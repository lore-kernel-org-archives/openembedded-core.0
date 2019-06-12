Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82C727E172
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 22:19:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k11so377934wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=YnG9VfhcCP+zWBKDpPa1IPft1GhAgQUnQf9bv2ge5ZI=;
	b=b5NUyN0GmvNqGeHqZzfhlm8xgFrG2hHuXZYaq4b5fgWkV57M6OfZOCIDBrUdv1tmMI
	iEstq6K8tRv5xjzm0Z6MbqQJ94oXv8fd7Fv03elDba3gqQKC2YS9LVDkVgp95DLNZ1U7
	kdvOAOsfZJXvuMfRgTfgF9GQ8eJVGQF2MxVmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YnG9VfhcCP+zWBKDpPa1IPft1GhAgQUnQf9bv2ge5ZI=;
	b=FTsZV3tz1MKDiIGWNyoVhCzxh8UzrB7TE6eOtRB68YdgwwuBTbNnpNa7tzPG3lcpSg
	rwfqJuGoJ2Mkzjo5PlQ9Tk7bbbebt57T3heYCnTJddiT7SjqDBVOuhXFM4ikR9T4Ss/G
	9chIro0D2vg/QyUbT0+ijT6wfFLfUSXklKW0kMH8/WV4Z80yqdCv2iajh1WF7bfMTA6r
	wYIy6kPaAiW5dt5cEDgp7Ma8zgbE//RkSJx76/XeOxt/Ikyu413OZ7ceAKjjrBYY51l4
	/05pdUTVNBMZhSXnG3Ffku8v+0bC+ZJFwA2rU+PdCYVd/notyW8DRQqWcMQn5N22dRaS
	BqzA==
X-Gm-Message-State: APjAAAWm2mQJY20qJa0f21sj8qr3LDVCdep+w+GReFaA7g0kBS6wg9Ic
	Ah3uZMexiR2JECQjl7vLiqrKaA==
X-Google-Smtp-Source: APXvYqwfEXH4SgreblgBHFoslOAH+HXmbgJs/rBxLGMDMl4PrctWLNiO4RsDtmrQKD9NqLXwtRZjPg==
X-Received: by 2002:adf:f946:: with SMTP id q6mr4572418wrr.109.1560377986231; 
	Wed, 12 Jun 2019 15:19:46 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s63sm701276wme.17.2019.06.12.15.19.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 12 Jun 2019 15:19:45 -0700 (PDT)
Message-ID: <a4d7d3e2e889945fbead01a1805149b69e579e49.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 12 Jun 2019 23:19:44 +0100
In-Reply-To: <CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
References: <20190612081559.5102-1-alex.kiernan@gmail.com>
	<51dc74acacf2f1daa52a012d083ca2ca56b67bd8.camel@linuxfoundation.org>
	<CAO5Uq5SBNF025u6metFbzeNfSWYOXiYTP5ePR_u1Z9++L_ds8A@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: uboot-sign: Check UBOOT_DTB_BINARY before adding deps
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
X-List-Received-Date: Wed, 12 Jun 2019 22:19:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-06-12 at 19:02 +0100, Alex Kiernan wrote:
> On Wed, Jun 12, 2019 at 10:59 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-06-12 at 09:15 +0100, Alex Kiernan wrote:
> > > Since UBOOT_DTB_BINARY empty means we don't need to inject
> > > signatures
> > > into the U-Boot DTB, we can remove the dependencies between
> > > consumers
> > > of
> > > these two classes and resolve a circular dependency between u-
> > > boot
> > > and
> > > kernel.
> > > 
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > > 
> > >  meta/classes/kernel-fitimage.bbclass | 2 +-
> > >  meta/classes/uboot-sign.bbclass      | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > Really wish we had tests and documentation for these classes...
> > 
> 
> I know... I have a dread anytime anyone touches it, me included... I
> sat on this change for a couple of weeks too.

I also have little idea what to do with the patches, I just don't have
enough information to make any informed decision here :/.

> The truth is the pair of them are fragile and hopelessly intertwined,
> but without tests they're never going to get rewritten, so I might
> try and take some of that on (or get someone here to do it) as I
> still have multiple issues with them - signing doesn't really work
> the way I want, I still have a circular dependency I've not tracked
> down, doubtless other things I can't immediately bring to mind.
> 
> If we were to add some tests around it, what would you pull out as
> the simplest thing that it could do which would be valuable?

I don't know enough about what its doing or how people are using it to
make a useful comment on that.

I'd suggest whoever writes the tests gets to document and test the way
they use it. They can then modify and improve the code such that the
tests keep working. If other untested usecases break, that would be
unfortunate and we'd want to add testcases if they got fixed.

I'd be quite happy to work to such a policy (within reason).

Cheers,

Richard




