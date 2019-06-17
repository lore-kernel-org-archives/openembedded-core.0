Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0005B6C3B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 12:26:24 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so1647637wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 05:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bQ72wook5qps/47jOM5oLZtU9em1i1/iwq3LoxhiIZ8=;
	b=S38mVIzNHCn2yBaH+Zm9ysY7xTAM9QOOjYRqLYV9n0VX5lNClIvVgAIiz1ggiZ8Sml
	3czk8/kA8W3dqdnNFksMqMZtC9p0Zt5AzF+cbO7xdz53bEyLo6rF+JNHnEXjxr3Sqbb2
	LL8cx+6gkKgIftxdgl2ZfYMg/d7B+xPCW5ImI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bQ72wook5qps/47jOM5oLZtU9em1i1/iwq3LoxhiIZ8=;
	b=o+Dv8E1DpT0eVukXDiJbqFZVDxXR/FQe4A2ji+JiaQim+dXizxO8DxgxZyt8/PDavO
	m2IJUJ5xzkZLHU2bvj6b5vy1vqD3ZySbm37nQP140QNQGCtN1smLtRN7g68+M2y0yeZV
	zNgqfVvJ7YhJs08A1SM5R+tcspEGpyOy/bBU5SG1wM/yv2g10gf8KkUJ+nl0yT/39LdO
	zj2B/iEBU2wsSv0Upts9DikAPuJWD3yf9HJcuqK/Gekk2cDSkTLSxVocaimewHKtklTD
	uV/rMAgLh/eSAy7RjCqjhUETck9gtrXx/akHHMN+Y+eZvJfO7LMwI/ISWWqlbKQVqgbs
	HK1g==
X-Gm-Message-State: APjAAAXbl12znDVUTQonsP9y+zOD5J3jhrmKdeS9noQezSb0aeU74NCL
	DUDvRmxMOS9mLhM7PvWbn/ukTg==
X-Google-Smtp-Source: APXvYqw99X9sH/9DnutWGqWzy1815J07f7HCX2l+8H51lGraHKw+yjfX/1QdTFSZGfwZxSSALJ7+zQ==
X-Received: by 2002:adf:fc85:: with SMTP id g5mr76236524wrr.324.1560774385533; 
	Mon, 17 Jun 2019 05:26:25 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k125sm13170759wmf.41.2019.06.17.05.26.24
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 05:26:24 -0700 (PDT)
Message-ID: <6eb5c69287bced8573b2c8a24c84fad04ed95ab7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster <akuster@mvista.com>, cminyard@mvista.com, minyard@acm.org
Date: Mon, 17 Jun 2019 13:26:23 +0100
In-Reply-To: <9b9c62c9-ae11-54da-d9cd-f11c8b142439@mvista.com>
References: <20190429194342.28461-1-minyard@acm.org>
	<20190525132912.GJ2743@minyard.net>
	<9b9c62c9-ae11-54da-d9cd-f11c8b142439@mvista.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add release field to version in rpm package dictionary
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
X-List-Received-Date: Mon, 17 Jun 2019 12:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-06-16 at 19:11 -0700, akuster wrote:
> Hello Micheal,
> 
> 
> On 5/25/19 6:29 AM, Corey Minyard wrote:
> > On Mon, Apr 29, 2019 at 02:43:42PM -0500, minyard@acm.org wrote:
> > > From: Corey Minyard <cminyard@mvista.com>
> > I haven't heard anything on this.  Is this a proper change?
> > 
> > -corey
> I don't see this email in the mailing list for either May 25 nor Apr
> 29.
> Could we be dropping this from this domain "acm.org" ?

I'd like to test that patch as it might explain some issues in
buildhistory I've not quite gotten to looking into yet...

I suspect its part of our current mailing list woes. We're looking to
migrate but we've recently found that has its own set of problems too
:(

Cheers,

Richard


