Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 406137E73F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:38:32 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x15so2657244wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=7cgpUe5jxf3/HWXbL9r1UuF97mN32vDD6ZhCnxMKqpY=;
	b=exiBOzT7NGj0RGGF44ft8glHBSlqAudoVu/kHmKGny/C+5TmfHNrCOygAOBlorkLlk
	2XjnKDYKrtjpZsgl8eLxG5RszKcStmxxVcC4MOcVp2yxHlc2JysLPWC0c2lxhByVNe1l
	J+x+po5+orqiT8TxJBhzmgwnFEuQKu0qWhJcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=7cgpUe5jxf3/HWXbL9r1UuF97mN32vDD6ZhCnxMKqpY=;
	b=W/xJnvSGe3FO82tPwP63b8vi2HQ+0KQLWij5pAyYRfm+gqrwkNmxwkrm4fr5DRwuCT
	SzUwelvJ+HB9PK+GjcqsULqvGLBFyjHM9R6u4dD86R56KGhxUWHaHC790VHOb0UyedDR
	Q53EnvliVfvxQVaagXZkTbd5OZolOSe87zJb9YC7053JtWIapb8wp5rRLCMP6ufXF67p
	1a5IpZCKge9BS+dZrDjvBDEE26NbPDpGAfzp6P9eJaf8LWZdJaIZViucVKYPmIyHZ7yh
	37M9l24YNxkzqkDXCJNlIC+Pa64E03J8xnSI345EWBmzFhtTHtUDS/U/KB3yPbajDV6w
	756Q==
X-Gm-Message-State: APjAAAXNSjgGNg3Lf6nvI265PoPJIsEaHJzYhrRHb9fNAlkF9ZmPQFGx
	ETpIB7SoPSlFlDV6CoWS+uNEUQ==
X-Google-Smtp-Source: APXvYqxlcZ8nRX1is+qlpojY0UvE9Efa2iiUEMdz095syMHpU6G+qYtgT8wz3V3rdz5w1MK/Ok0lmQ==
X-Received: by 2002:a1c:968c:: with SMTP id y134mr2772996wmd.122.1560854312958;
	Tue, 18 Jun 2019 03:38:32 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id u6sm3415481wml.9.2019.06.18.03.38.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 03:38:32 -0700 (PDT)
Message-ID: <9fc59dea44a78f0806b4b203b1e6cac37da1ffdf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:38:29 +0100
In-Reply-To: <8f1047b7-a0f0-8fa4-bcfd-51fad5083050@windriver.com>
References: <cover.1560763400.git.Qi.Chen@windriver.com>
	<28e0391ef22f3e131227d66dae731fa14f48e1a0.1560763400.git.Qi.Chen@windriver.com>
	<f70ae3aaabc1a52a994fe5a0eae73f9e0416c851.camel@linuxfoundation.org>
	<8f1047b7-a0f0-8fa4-bcfd-51fad5083050@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] manifest.py: fix test_SDK_manifest_entries
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
X-List-Received-Date: Tue, 18 Jun 2019 10:38:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-06-18 at 10:09 +0800, ChenQi wrote:
> On 06/17/2019 11:54 PM, Richard Purdie wrote:
> > On Mon, 2019-06-17 at 17:24 +0800, Chen Qi wrote:
> > > TOOLCHAIN_OUTPUTNAME could be overridden. So use this variable
> > > directly
> > > instead of its default value ${SDK_NAME}-toolchain-
> > > ${SDK_VERSION}.
> > > 
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >   meta/lib/oeqa/selftest/cases/manifest.py | 7 ++-----
> > >   1 file changed, 2 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/lib/oeqa/selftest/cases/manifest.py
> > > b/meta/lib/oeqa/selftest/cases/manifest.py
> > > index c0b25ab..5d13f35 100644
> > > --- a/meta/lib/oeqa/selftest/cases/manifest.py
> > > +++ b/meta/lib/oeqa/selftest/cases/manifest.py
> > > @@ -86,11 +86,8 @@ class VerifyManifest(OESelftestTestCase):
> > >           try:
> > >               mdir = self.get_dir_from_bb_var('SDK_DEPLOY',
> > > self.buildtarget)
> > >               for k in d_target.keys():
> > > -                bb_vars = get_bb_vars(['SDK_NAME',
> > > 'SDK_VERSION'], self.buildtarget)
> > > -                mfilename[k] = "{}-toolchain-
> > > {}.{}.manifest".format(
> > > -                        bb_vars['SDK_NAME'],
> > > -                        bb_vars['SDK_VERSION'],
> > > -                        k)
> > > +                toolchain_outputname =
> > > get_bb_var('TOOLCHAIN_OUTPUTNAME', self.buildtarget)
> > > +                mfilename[k] =
> > > "{}.{}.manifest".format(toolchain_outputname, k)
> > Whilst I agree there is a problem here, this code is iterating over
> > multiple targets. Isn't TOOLCHAIN_OUTPUTNAME only going to be
> > correct
> > for one of them?
> > 
> > Cheers,
> > 
> > Richard
> > 
> > 
> 
> This code is iterating over d_target.keys(), which is 'target' and 
> 'host'. And the TOOLCHAIN_OUTPUTNAME is for self.buildtarget, which
> is 
> core-image-minimal. Thus, we are basically checking 
> ${TOOLCHAIN_OUTPUTNAME}.target.manifest and 
> ${TOOLCHAIN_OUTPUTNAME}.host.target.
> e.g.
> tmp-glibc/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-
> qemux86-64-toolchain-2.7+snapshot.host.manifest
> tmp-glibc/deploy/sdk/poky-glibc-x86_64-core-image-minimal-core2-64-
> qemux86-64-toolchain-2.7+snapshot.target.manifest
> 
> So I think things are correct.

You're right, I was going from memory and thought this code was
handling the case where there are two different targets in an SDK (e.g.
a multilib) but that isn't the case. I've queued the patch for testing.

Cheers,

Richard


