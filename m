Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF7F74813
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 13:31:32 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id y63so3811072itb.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SFg9OSCxidm2iBx8FPIJkmEja9yPypAhILz33KYv5Vc=;
	b=qOqbKoPAX49kn4ms1KHepXF7cGA5V3pElQ/IBuIBxARa2LgahzD0iNQUBpBWblNC2z
	hUWCDOVKIloXXv5sppOBWD/9iRP6JxooWcjSQtmTsWwZ9uIqvmvkFM0QUZI8z852cS8L
	37BnLenCzjha+Z6y4EEwvPBNC8gGaigYUIkEIJqtK6MbUzLSdj6AbhMifzYPLEQdQPsX
	FA1SynFbAvNTnxpPMsJu4bdTtJmvIKFMG8L9Esb9p+J3PG+fIONb0/ojIQx8VzDkHh1f
	8gZedlrf37I7GXMES67WIzXLlQZEsu/iRaiyChTEki5exjHk8PYvWyTbcDc8Ya9Xr63j
	MGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SFg9OSCxidm2iBx8FPIJkmEja9yPypAhILz33KYv5Vc=;
	b=gtoq5/ODb3xY0hz1+gYh66BMj9EelPfLEZ7yVaRNGqhGBQeLMWT2jJxw1/bh+1YhH6
	vnGkyxRT5uHwAsxyzKk9WhmRyDt9vWZ8st4tp5UeuzuN3BgGC9I3UeyYOORE9PTQW0v6
	wF+8PlvbZrziN9ukKNiP78vPFMn/CPlMkxmnbpK0K9u25t/A9zFv8xL6J4jMKdUBkWij
	nciR6G7iU50DfV3fvpL5PQd2lML7DfcFkl5SjUBhWYc6kQJMzHv57d/9DAudYl+AZ8U1
	/9HP5rphnxP+6HTlhdVTw4E3hpMSTgNYLBztJP/si6yPdRg3up+ywr01t8rZ9dTelFqr
	h0cg==
X-Gm-Message-State: APjAAAWdld9G+MW3FyhFr23J05eQEYrtjhdACvnbeh1t3KN2XD5K1UtD
	Vr90dUKZ4egHjnJ9uoZRaxwcJUFFEyR2MfeJE3hZ6Q==
X-Google-Smtp-Source: APXvYqyqRgmw+65dDB9vywN+gB+pLSBZHvQop2xq4XrRYnJMytfTg8yvgOpMJWBuaraidhsANdXkTsoubBs5+vU/wGA=
X-Received: by 2002:a24:52c5:: with SMTP id d188mr4690381itb.130.1553866293235;
	Fri, 29 Mar 2019 06:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
In-Reply-To: <CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 13:31:22 +0000
Message-ID: <CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
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
X-List-Received-Date: Fri, 29 Mar 2019 13:31:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 29 Mar 2019 at 12:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Fri, 29 Mar 2019 at 13:04, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > But GTK+ doesn't depend on librsvg at all, and this is a failure in
> > adwaita-icon-theme.  Why doesn't the dependency belong on
> > adwaita-icon-theme?
>
> I believe adwaita runs some utility that gtk provides?

Sure, but gtk+ doesn't link to librsvg, so a DEPENDS isn't the correct fix.

Patch incoming.

Ross

