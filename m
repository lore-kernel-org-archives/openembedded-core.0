Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8BA8B6107E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 12:17:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m10so9229584wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 04:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=tQGL435kupF1mwGb0N7lH7LkPa85IjA++GCMAlOFAUA=;
	b=a5xLhJjVUqUDGm7eOSi8ko9cxxilZKUlo1bP/WTqTt+DTSYt/bQIcbHjPAZWOGQ4x5
	e6LVWvbHS7Yi9TqntWsTpT3SpyiPvVPQoEu4uRFYynPHKXPXNF6QCer/m3cD+4+nlv4V
	9YRaMyJmnCRVY9u0ihPMAGEHK9KkpCdc0bB20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=tQGL435kupF1mwGb0N7lH7LkPa85IjA++GCMAlOFAUA=;
	b=t1sm0wicP3BOI/N6/4+1n28/cfHwZ4/A5UIN0fB/9xFcMw70tDPs5t036/DmLHTe1w
	F0Y/vuwuRHtU4CqFMaY5r4TRa926A+4+92ePnp+FCtLad4Aw2yA2KagKH+8iTM5OBxpi
	KCSVhXbg/TQvYRR8JfKDQ7v/mP74sUOqBmy9+eglVb1FRyV0IAVlJizsID1WpvFrYO2d
	m6AnThrJiMamSBGndFZSpUfO0m9u5ssBEyUYB+Ekwxkd6WmCbASXHRiC522CqQv0Neg/
	wV8es5mCrgZ7oqbtxSxJA7cl2iWd8DkPLJI2PaBXPMTFQiSZm+H9BOLC6cXCSbTJMaOf
	rLVA==
X-Gm-Message-State: APjAAAUPzjCv4azr1kjAfHinvHJyWecu3HJM6pf+JxMH+LtOR1uctWan
	SJgp5brxpAjCafoshDmfDNLbLQ==
X-Google-Smtp-Source: APXvYqzNhX1XuAJv5DAjSynmQ/zHWOiKs0nC3d0/tl7iaJuPY3rTokBSNyT8nzFu56YLis0AHL20hQ==
X-Received: by 2002:a1c:994b:: with SMTP id b72mr4844917wme.83.1582892227202; 
	Fri, 28 Feb 2020 04:17:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g25sm17654686wmh.3.2020.02.28.04.17.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 04:17:06 -0800 (PST)
Message-ID: <e23ac45d87d91062ca03be8b255999effab6b972.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 12:17:05 +0000
In-Reply-To: <20200228120849.GA31133@dell5510>
References: <20200228061225.32003-1-petr.vorel@gmail.com>
	<6558d8c05b858a831ecd4dd79df70f4764b10c6c.camel@linuxfoundation.org>
	<20200228120849.GA31133@dell5510>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Fri, 28 Feb 2020 12:17:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-02-28 at 13:08 +0100, Petr Vorel wrote:
> Hi Richard,
> 
> > > Changes v3->v4:
> > > * Fix musl build with LIBS=-lfts
> > Unfortunately the musl build is still failing with this version:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1627
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1631
> Any idea, how to fix it? libcgroup uses the same flag LIBS=-lfts.
> Maybe the variable isn't propagated.
> Or is the dependency expressed enough?
> 
> DEPENDS_append_libc-musl = " fts "
> EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "
> 
> I'll have to put back patch
> 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch, but
> that's bad, buildroot works without it.

I have to admit I haven't looked in detail at the issue. These builds
are proving a bit tricky to sort out as there are so many issues with
different patches. It will be later today before I could think about
that. I'm hoping Khem may have more ideas.

Unfortunately there is a second ltp issue (non-musl):

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/574

It would be nice to move to the new version and drop some of the
patches for 3.1...

Cheers,

Richard



