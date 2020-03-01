Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 33D1D6041D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2020 08:20:34 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c24so196544wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2020 00:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jZsqgTbXQqnWSEZfRB10YQOBCCUOGXzN87RtqxGieEQ=;
	b=GCFn2eO6q+BiLxKomer5YwNs/FYAsLMeuiNUIeKeth/vwUoV9tENiRIifCioFM6GuU
	jkulS1/A94TcJJJYNr2VjlmkFviJqNxDZZzMEH99WRaqPk0wXt36On5URLfisqrIuiR+
	4pvpMjUHhXDCaC7EjEMve0cdxsO5/9WFGhIEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jZsqgTbXQqnWSEZfRB10YQOBCCUOGXzN87RtqxGieEQ=;
	b=IdUGrN2TXEYHbDd8sgcFDVi4OzjGWnV0zyN0XWdcKHlhmcL+vva015a4A7ob5lyMPK
	EuvE3TFAzMV9WRi7VCi6ywKNbzfs8NVAPnoIB1dnsbVOTe8S+piyftd7q4pq8stQjPjH
	fj5hAsNqpi1+0q93HBsmZBdRrgBh+o+5Wu+iiDipudHQTxPhGOhqUXQ7rCcDzNE668mO
	wWjbIQJOyANyi/rPQpR/WmsztFAHBp1wmkSlKb4+ed9EIVkI4YxMjzwUjq5kKlG8hfkk
	yDRNVj3aRyyF/E02w7jQVS/MC5pv1PqBLwv9EIvXTbf9zvoE7g45xxDpwcIb82TVlvlK
	1sOQ==
X-Gm-Message-State: APjAAAW7r2AD3h8LDvW+jxYTLS4fZr9JxiktHKzbDFlLHlGMMIs/Rmcj
	C7AbcmxCqsy71kNYpzOi+ss72g==
X-Google-Smtp-Source: APXvYqz4fV5GTbQnLsTXBkztl83YQvtO6UQkCoJQow/pn7+USVPTRGURd2l93BML65MeB+qudKFUMA==
X-Received: by 2002:a1c:7907:: with SMTP id l7mr13183127wme.37.1583050834852; 
	Sun, 01 Mar 2020 00:20:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h14sm4114679wrs.85.2020.03.01.00.20.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Mar 2020 00:20:34 -0800 (PST)
Message-ID: <6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 01 Mar 2020 08:20:33 +0000
In-Reply-To: <CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
	<CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Sun, 01 Mar 2020 08:20:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2020-03-01 at 00:17 -0800, Khem Raj wrote:
> 
> 
> On Sun, Mar 1, 2020 at 12:14 AM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > On Sun, 2020-03-01 at 00:12 -0800, Khem Raj wrote:
> > > 
> > > 
> > > On Sat, Feb 29, 2020 at 11:57 PM Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > On Sat, 2020-02-29 at 17:42 -0800, Khem Raj wrote:
> > > > > Errors like below are fixed
> > > > > 
> > > > > bus/connection.h is owned by uid 1000, which is the same as t
> > > > > he user running bitbake. This may be due to host
> > contamination
> > > > > 
> > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > ---
> > > > >  meta/recipes-core/dbus/dbus-test_1.12.16.bb | 4 ++--
> > > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > Why aren't we seeing this everywhere? The autobuilders don't
> > show
> > > > it
> > > > and no other reports. What is unique to your setup to reproduce
> > > > this?
> > > 
> > > These are QA warnings by default and in my distro I turned it
> > into
> > > error so they were being reported before too 
> > 
> > The autobuilder would show any warnings or errors and we're not
> > seeing
> > either.
> > 
> > > Secondly this is a Debian10 minimum container running in docker
> > where
> > > the user id is 1000 for the build user other than that there is
> > > nothing special 
> > 
> > We run debian10 builders on the autobuilder.
> > 
> > I just don't understand why weren't not seeing this everywhere. We
> > really need to understand why this is :/.
> 
> From what you see from fixes what it’s reporting are legit errors 
> Why it’s not showing up everywhere I am not sure
> I don’t see it on Ubuntu 18.04 boxes without docker as well 

I understand the need for the fixes, I'm just very concerned we have
what amounts to undetected non-determinism in the build :(

I'm more concerned about fixing that (and ensuring we can detect/fix
all cases) than I am about the individual errors.

Cheers,

Richard




