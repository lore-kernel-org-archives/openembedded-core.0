Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9CABC7825E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 19:30:15 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id b9so977261wra.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ugbv9vJ54Ai6UXA4NJV6hWDAhdkeoyhDHCuqnsIf92k=;
	b=iDxKapLMCifcvuPJwy1/qUAr9pqn1Oo47Tc9xDAhDqqk9LnU25XdS/VKiJfo5ks3q8
	4S6cdZKMvMvHdIMCS5uBnWdxNw+imXY26I77exmst27k0FSav4sBNMcQpby7EvcnlJ73
	HdOp66IS2BTx+GLMoNN9ODe/2Iw5EKFAD3F1us92Q3UOogKB1yeuVtLH4V8yMwSIKSKa
	vDkCmcAFtU5e/kTTJ4VY8ncTIS+JJ1QIUC61WRkaSXd/+wIgvtd+tfVpNKhNDnUMqNS1
	EZm+Vlsq0t7FDCfECw9QgIXdmHdzOwPkg+jAu4rGmkhhYsJzjlbf4r+mvva0IbCWzYrf
	DhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ugbv9vJ54Ai6UXA4NJV6hWDAhdkeoyhDHCuqnsIf92k=;
	b=BGGttnnz9z2HtR2uqtVlKhw/bZKLNvCjmFIAvrWsUaRUkonD5z1FnGE97y1IdLxiAF
	vnaFwKA0Cg1doRIaZdYumhMtMhTVa7a2ATr1DmlP8W3iyJPiY7A8oxKtHZG5zDPweljR
	QriiAtLLUtfuf1S8FiKQNtTkLHEs8RVqdR4X/dwFzFoV+WtK3KXuKBV7X5FQNlEnhh7n
	+UOcNUjeOEfRNUe24OGVcmv3ESg4SRWCbeXGpS4CD5tnrJoLdyMmsDVGhjLXIbWnOi7T
	j0y2mGAD2b6ttce9fpZqsCwybsj3lQx3QUJ1+K91DMWV35MoJ2nJIsDFZZ0N1jFlJyaA
	zp4w==
X-Gm-Message-State: AHPjjUje5Qp3NGtHaSJxmVfEkAOWAw3ZEH4nk5MuCmy8x+nL0Lws1jS5
	RwNso7YlCsURONirT+ELz6V3GzZgLiDMM2U+kzQ=
X-Google-Smtp-Source: ADKCNb5a+974xChSj7EmtVcME/C2+GGNsjHaUBdeI9vzYSUJK77my9JS48OZa4GjBt6UN1xiKi7CWdwQ3RSmcdptiD0=
X-Received: by 10.223.186.6 with SMTP id o6mr26992318wrg.263.1505763016342;
	Mon, 18 Sep 2017 12:30:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Mon, 18 Sep 2017 12:30:15 -0700 (PDT)
In-Reply-To: <CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 18 Sep 2017 12:30:15 -0700
Message-ID: <CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 19:30:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 18, 2017 at 12:19 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 September 2017 at 20:01, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> > The question is does it do something useful *now*?
>>
>> I don't have a board with a serial console to test at the moment.
>> Busybox hasn't changed in recent memory though, so as long as the
>> resize command does actually get run I presume it's still going to
>> work.
>
> Re-read the code.

I've never read the code before, so don't make any claims to know
*how* it works or worked :-)

> There's a call to ioctl with TIOCSWINSZ which I'm
> *guessing* is set window size.  Google is not useful for this!  It does all
> this on stderr.
>
> So yes it *should* work, but not if you redirect stderr to /dev/null.

We don't redirect stderr to /dev/null, only stdout.

> Yes, this is a mess. :)
>
> Ross

