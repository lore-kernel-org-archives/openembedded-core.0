Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 598867FD57
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 21:25:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so14651794wro.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Dec 2019 13:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=c+BzQcB2qEVGid+S5xclHwcfON6GVVgJROlPtY6NcCU=;
	b=Q0TsIkaI7RQ3ALonQF2bKH/rPPaVMKPWqxAE3iHR3MMwA4+aHBF/TtuEETpdf3Kx0v
	pMaqh0eNrgzA7HBQLwhmYXmIOT77EXZGfZCA+5pkHVmlA84+m5H1/qy+xk4EKvrNk9+4
	PxUWAGeBTNbMBvB+pWNatRuN7PNKQ/LBEF+lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=c+BzQcB2qEVGid+S5xclHwcfON6GVVgJROlPtY6NcCU=;
	b=oJ+CfX3+YVgF+RSd4yxnskhDUx1jn6a+LajfvRqamyBKSHnp2k+08aKwiUW5uE7luV
	L2BkcGif85E8siTczrl+foDQ7XJkrRDEKCPV+pgheUZQwFxyf21W/Zxnid6AwN/iYZCh
	LKug+5yWhGFZyyNoUkts4DOsPO7mui//c0ysfawNTdq/40s/pnX/MR/vF/lh7GdbLZUI
	4V4jMwHPWk/tPF99dvCR+nf0aBLQ1w+4XhxQLicvhQqLxVerMzJbfVdTwifFo/9alnwr
	kTqTBMd4W3rq48TAA5KJxa6ui677aeAW8m7CXduMMyrqBZSvKvfavtFHf1eM4iFuSApf
	l97Q==
X-Gm-Message-State: APjAAAVChOeb3LEFwZ5raI4WNU06Bz0GHjHjq0NiuJ8qknyKLijejp9x
	f7RuC+sOExm4zMtH5f2mktYSGw==
X-Google-Smtp-Source: APXvYqy6dV7qeYRn9dstwNR6axZlW1ZJd9DQDupXyeIvbmRHBnKFpMsnOvLiAnHrO0BYJBDTwlf3+g==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr28818159wrr.27.1577049914044; 
	Sun, 22 Dec 2019 13:25:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n16sm18476468wro.88.2019.12.22.13.25.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 22 Dec 2019 13:25:13 -0800 (PST)
Message-ID: <a9bc7048e2f7dd45a6fd6e7730c8143573646ac7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sun, 22 Dec 2019 21:25:10 +0000
In-Reply-To: <CAJdd5Gbbmv45-q0G1FSDgfNLNQG+xHArorf=F=-wZtdOPU85xA@mail.gmail.com>
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
	<cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
	<CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
	<CAJdd5Gbbmv45-q0G1FSDgfNLNQG+xHArorf=F=-wZtdOPU85xA@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Sun, 22 Dec 2019 21:25:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-12-22 at 10:22 -0600, Joshua Watt wrote:
> On Sun, Dec 22, 2019, 10:17 AM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > 
> > On Sun, Dec 22, 2019, 10:09 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2019-12-22 at 10:00 -0600, Joshua Watt wrote:
> > > It won't help the other native/cross to target boundary mapping
> > > issue.
> > > 
> > > See above, I'm wondering if we could abuse the method field to
> > > make
> > > this work? Certainly we could test that...
> > 
> > That seems reasonable for a quick test. The method is supposed to
> > be the output hash calculation method, so my first instinct would
> > be that it is better in the long run to add another field e.g.
> > "class" or something.
> 
> Perhaps based on ${NATIVELSBSTRING} like sstate.bbclass path? That
> has nice congruency with sstate file paths, which I like

If only that were the right thing.

We need:

    if bb.data.inherits_class('native', d):
        d.setVar('SSTATE_PKGARCH', d.getVar('BUILD_ARCH', False))
    elif bb.data.inherits_class('cross', d):
        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))

i.e. SSTATE_PKGARCH but only for native/cross.

Cheers,

Richard


