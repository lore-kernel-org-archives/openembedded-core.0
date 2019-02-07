Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8EBF46C10F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 19:34:31 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id x124so6497346itd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 11:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zFtE9p0B5N5YQgqYdGSlOVz+coP7zsa8xhN9DQhc6kw=;
	b=vKwydjnma+klPr2Q97iIKofqfzVbMM97ZbgGHh4ZZY8yRsS4cw4+vFnyK9ji0vNk3p
	HdJBN5amrhR6r8UwCusman/xYiALSqMRUykzmkVUvHui8EdfqWGuOVxiJZBzDMiRVtzu
	2l+rfv1mX2ouStfMPsu/DH9D1pOhpY5AIm4nctXK62uRfTRNJorZORdh8eRDEfVruirx
	w1CXFq+2CQ8+yFefRqzetC9lbcJ1RhGnFfCMdbQ5DLAmU76E8FDLZLGLGX588AUIqzrx
	5VRI4ZI/chbYKglVFOX+AUp1YYsMtczux/9eD/XpiFZep/ojkpEhHSxUNuo4HFwM9wAg
	i5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zFtE9p0B5N5YQgqYdGSlOVz+coP7zsa8xhN9DQhc6kw=;
	b=Y1Lz/B+dAQJRiYbrh6dVmmmj+I7AEBrtLVhng2sJ8lZpSpbdmRrBh/gRO4/oPCyWSn
	eL/6+sDzKd1LFCQ+5OMgICG/LHitkXDSVOA/hycT3N4juKty2pKxQYMUvsAHiyuT4yMN
	a21LUMj9pM6l4OzHOLfqsje0TKOmz03a8nHUaNxkXmokCGQ6Hx0TVORgXsYgPcNa4k+E
	Qhq/6CMhXMGkL4MsxT6RotgcYsbbWW3AFeKktJLdRRSLBvk1lUjScqsmMAAMPTBxwXYv
	0DHDK11fuaoFOT3m2dEpPr8zCECZcDumgwnrczJjeEd40WxfIqrsxuvCBjqZsJ13Iwi+
	OaRA==
X-Gm-Message-State: AHQUAuZksja/8MHfz9V3q/JkQQVf30U9LDMlRC+OdT/ewMDi5i7Q23m2
	lRx5v2D0UPx6Cb+Ods19tBA=
X-Google-Smtp-Source: AHgI3IZvUgtGF24qYS/njZ0XL0Um51ptytv0zoY0t1pYgyneBAPVI8rIRl0VuHZUjV46tSWDzqfUdw==
X-Received: by 2002:a6b:fb01:: with SMTP id h1mr4989152iog.185.1549568072544; 
	Thu, 07 Feb 2019 11:34:32 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b73sm9911238itd.0.2019.02.07.11.34.31
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 07 Feb 2019 11:34:31 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <11dfd6136db6e2f538efb95e124bcfcd1797efa6.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Martin Jansa
	<martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 07 Feb 2019 13:34:31 -0600
In-Reply-To: <01574523a8aa31529bbedabeee90ec541d91cb10.camel@linuxfoundation.org>
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
	<CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
	<CA+chaQcx9tecJLN1jytyn41DGrEyJVHYPDRREXYUbtjFzD5EJg@mail.gmail.com>
	<118388284a74868c06bf5205a2268aea605d24e3.camel@gmail.com>
	<CAJdd5Gbg4hCkVUKopz5qXcqxEjmJsM-XP83rHKiqz3bHYUka_w@mail.gmail.com>
	<01574523a8aa31529bbedabeee90ec541d91cb10.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
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
X-List-Received-Date: Thu, 07 Feb 2019 19:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-07 at 17:21 +0000, Richard Purdie wrote:
> On Thu, 2019-02-07 at 10:59 -0600, Joshua Watt wrote:
> > On Thu, Feb 7, 2019 at 10:44 AM Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> > > Martin,
> > > 
> > > Do you by any chance build in Docker (or some other transient
> > > container)? We recently found an issue with building in docker
> > > where when the primary container command would exit, causing the
> > > container to terminate. When the container terminates, the kernel
> > > unceremoniously sends SIGKILL to all its processes. This plays
> > > *very* poorly with pseudo because pseudo keeps it's entire
> > > database
> > > in a in-memory sqlite database and only flushes it out to disk on
> > > a
> > > periodic interval, or when it get SIGTERM (maybe SIGQUIT?) or
> > > exits
> > > normally. By default the pseudo daemon will also hang around for
> > > 20(?) seconds waiting for a new connection from a pseudo client,
> > > meaning that when our docker container was exiting, there were
> > > potentially several pseudo dameons sitting around waiting for a
> > > client with unflushed databases in memory that suddenly got a
> > > SIGKILL and all their data was lost. This was particularly bad if
> > > you aborted a build while it was running, or some build failure
> > > occurred. Since 
> >  the pseudo database was lost, the only way to correct these errors
> > was to clean and rebuild.
> > > I think pseudo could handle this better and keep the database on
> > > disk instead of in memory, but in the short term you can hack
> > > bitbake to pass the -S flag when invoking the pseudo client which
> > > will make it tell the dameon to shutdown (and thus flush the
> > > database) if it is the last connection.
> > 
> > FWIW, this patch makes it much easier to do that
> > http://lists.openembedded.org/pipermail/bitbake-devel/2019-February/019813.html
> > Just add
> >  FAKEROOTCMD += "-S"
> > in local.conf
> 
> Should we be doing that by default? Is there a downside?

pseudo won't stick around waiting for connections from other clients.
I'm not sure if this would impact performance at all, as I'm not sure
how often a client is able to connect during the "grace period" to
prevent a new server needing to be spun up. I would image this
potentially cuts down on the spin up time for back-to-back fakeroot
tasks in the same recipe?

> 
> Keeping the database flushed to disk would likely be slow but this
> seems reasonable.

I think there are 3 options in increasing order of
complexity/risk/safety

 1. Add -S to FAKEROOTCMD by default
 2. Make pseudo flush the in memory cache every time the last client
disconnects
 3. Remove the in-memory cache from pseudo completely and make it write
to disk each time. Even if we removed all disk flushes from the sqlite
database to keep sync()'s down, it would no worse that what happens
today in any case I can think of (specifically, a power loss will cause
lost data), and in many cases it would be better (e.g. SIGKILL and
crashes in pseudo wouldn't cause data loss).

> 
> Cheers,
> 
> Richard
> 
> 
-- 
Joshua Watt <JPEWhacker@gmail.com>


