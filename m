Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 59C2979E1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 13:07:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j26-v6so5837819wre.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Nov 2018 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=p8II32R/lKchBQ6doWtOg+SQ6Zv847hCApvPMw7SYt8=;
	b=H+wa6qTMwSBrijGanZ49jbnzmEyzi51P5I46iIFeeppZk7iA53w6vFseyGPQCWy4QI
	550k7qKEf4cbavAm+natrZiiEqsSuQIhgO8j0TT7uuu2Usy/Y0F5iPG7lTJ5dAWYq4KV
	ecxeS0uh471DTMZM+f9CquFzuPG/sldiT7ljs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p8II32R/lKchBQ6doWtOg+SQ6Zv847hCApvPMw7SYt8=;
	b=moGwsTgllIFG6VcjJ+XaFdNxOAwFAZX3kwYGnEUGx4Lk92jGJxQ2UUBK+XEYgTbJxb
	G/JSAQbm84mI+M8nA3TPCqpFR4fb1l7yB72sWoLdJeaR2vUuF61muRFN+897F/645oNo
	D+F4b/45WXkjqrle3vSeh/bUVprzt2ml0wQcMdgRlok9z47chLEZsz5uF8a73wj153M7
	E0Yh8f+i6MyaqjhMfFQYA4jKb5xvsC++lSqUCoQM0e61lQvJS6N03IGeIzuEgtZPvfZx
	1JFX+q9L58I3q0YPN7jbYo+/u9cfUjYwImw9PGaba5BtnezDtasL5U9nggzxlHEwymbg
	c+Bg==
X-Gm-Message-State: AGRZ1gJt0E9our1ZNfm/Su/AJTAoggmExzFwLXQZFC4ryT91kFU4AcWW
	kItm2ugm0VbFceUYoahj334mLg==
X-Google-Smtp-Source: AJdET5cuKp+f2XptgK0/SgTYYiPTlQII3Gl7wOceG6hWhygUjCeNHmAD+TntQicUQO46cFXfOriDKw==
X-Received: by 2002:adf:9022:: with SMTP id
	h31-v6mr2134896wrh.297.1541077639675; 
	Thu, 01 Nov 2018 06:07:19 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b143-v6sm36848342wma.28.2018.11.01.06.07.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Nov 2018 06:07:18 -0700 (PDT)
Message-ID: <60cd5d96749323f477c73aaf22085a4a4c741497.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Nov 2018 13:07:16 +0000
In-Reply-To: <dd0f0d44e10ffd42f28bc7a5a939c99112481db9.camel@andred.net>
References: <09487c1d7e9d9a2cf0c60883ad209712c2d31dc2.camel@andred.net>
	<7d0550c8af1ad69f6b7832e8d5605e4fd09fe475.camel@linuxfoundation.org>
	<dd0f0d44e10ffd42f28bc7a5a939c99112481db9.camel@andred.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: broken sstate archives
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
X-List-Received-Date: Thu, 01 Nov 2018 13:07:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-11-01 at 12:22 +0000, André Draszik wrote:
> On Tue, 2018-10-30 at 16:49 +0000, Richard Purdie wrote:
> > I've not seen/heard of any reports of that before and it is
> > worrying.
> > The question is can you reproduce it? As things stand that is a
> > little
> > bit of a hard one to replicate/debug :(
> > 
> > Which host OS and filesystem was it?
> 
> I now have continuous rebuilds of above described scenario on two
> different
> physical machines and am getting broken sstate archives in a similar
> way to
> the description above every now and then for varying recipes and/or
> varying
> files inside a given sstate archive on one of the two machines (the
> faster
> one) so far.
> 
> Unfortunately I don't know which of the two physical machines was
> involved
> in my original description.
> 
> The faster machine is running Debian 9.5 and kernel 4.9.110-3+deb9u5
> the
> other Debian unstable and kernel 4.18.8-1 - builds happen inside a
> Debian 9
> docker container in any case. Both machines use btrfs.
> 
> 
> Nevertheless I'm tempted to rule out hardware issues, though because:
> * The sstate archives are either just archiving the output of
>   do_populate_sysroot (which itself is just hard-linking the output
> of
>   do_install), and that same do_populate_sysroot output is also used
> during
>   compilation of dependent recipes
> * Or the sstate is created by archiving the output of
> do_package_write_ipk,
>   where again the same IPKs (hard-linked) are used to build the final
> image
> * The defect seems to be inside the .tar, but an sstate archive is a
>   .tar.gz, and no temporary uncompressed .tar is stored in the file-
> system
>   to create the compressed .tar.gz
> 
> Please correct me if this reasoning is flawed.

I think the reasoning is reasonable. My prime suspect would probably be
btrfs and if you have the space/capability, I'd be tempted to try
builds on ext4 partitions on those machines...

> I'll play with a few bits and variations to try to narrow things
> down, but given the nature it'll likely take a while to get more
> insights.

Yes, problems like this tend to be "fun" to track down :(

Cheers,

Richard


