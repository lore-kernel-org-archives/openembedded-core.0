Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id 51B907455C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id p62-v6so1763489oie.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dfir6xk9nrTSkbZ9gEv1sF5KoMYlBPERg7Rg63tVI0o=;
	b=LYRhYSFXWMLlvRvgF14o4F5MbNqa053S/PXGI4rUQUSz7nf7FXZZmS9x5cbgyhcS5b
	sFzNHrMw0KjKj4VNbM6JrAkqJJB+fMFE+9zsGcThDR15bLw6vFIMBk9fMWMNgE4n92NG
	zPWLbdSAeZPdk0wLcu2ifelpG2ify6Xi+tPlqnhw9C9qeuTy2TgcCriCfb0zTt1Lq7ff
	AmZdsezpc9lXx83UEqVcqeoVZuTS/Q5/vuo7t0Oaxkq554XMVnG4PLWbHU8Y6Mchb3B9
	hNmpp8+i+DoEgJz50+yebUlebKIxjUQbQ3SU2lq1VNP0116M6VuX7Bl7KXL8ANOo4w9R
	xGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dfir6xk9nrTSkbZ9gEv1sF5KoMYlBPERg7Rg63tVI0o=;
	b=VTORlHvOyAc1v+4rQD38//4irepjAt9QmX/eC8yOmCe+/lATpJmjQjlYVRdOk40QZl
	gd1zn5dTeHNrvZNSnbZBf6PkIqmloOfx3cKSJbTAEcm+hEG2bx2ombEup7WM10t86Uct
	amtXQ9JOPm5xJHclnMxf92oCwLGB5yOlfuWErfFQWfKYfRNvDzC7AAUt3bDBcT8lkdYP
	UzkhGQ7KuzrbNZsPaqc+PeiODg4iD16uRfSrIM7id09bjVC7KdKwsuh+M0XlZxHjnx6Y
	T9KsgjDLLcGmcdjeC+KUwRXAhx3lwQyzBxFaTgBAIyKdqlE0xq1B2eUlES8Mm20V+/KR
	My4A==
X-Gm-Message-State: ALQs6tCH7JgjqDARyogJr0KWtthkmoQojtjGzBuY3Pa8P34dA18uiI7W
	cjn/FBDEHTTRqbB5dcZKqd7PCvbZ30dj7JaXobrSuQ==
X-Google-Smtp-Source: AIpwx48tk0GK8C5b6qPw/ty0VnaJFZhGs5w4SwkNX8wbcaneL9hA3uuiWJvFYQVpIaLw6cPkfzcL+wDED8JAJrzgWP0=
X-Received: by 2002:aca:3255:: with SMTP id
	y82-v6mr1398862oiy.115.1523974838021; 
	Tue, 17 Apr 2018 07:20:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 17 Apr 2018 07:20:17 -0700 (PDT)
In-Reply-To: <0e94ee1a866743a5b9cc598969ea291c@XBOX02.axis.com>
References: <0e94ee1a866743a5b9cc598969ea291c@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Apr 2018 15:20:17 +0100
Message-ID: <CAJTo0LbH9w-CAG+dGgMdxnFA2NzhnLRxz9VA54NFkCyfB6DxMQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Olof Johansson <olofjn@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Tue, 17 Apr 2018 14:20:37 -0000
Content-Type: text/plain; charset="UTF-8"

On 16 April 2018 at 21:49, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> There was a discussion last year at the beginning of December related
> to this, triggered by a patch series to improve isELF that Olof Johansson
> sent:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145160.html
>
> It also included a patch that added -b to the file call:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145158.html

Whoops, must have missed that.  Sorry about this, this is now in my sumo queue.

> However, the discussion then turned to replace the isELF implementation
> with a new one that Ross Burton was working on:
>
> http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145205.html
>
> Whatever became of that? Is that still in progress?

Yes, it's still in progress.  I was hacking on it a bit more thing
morning in fact, as a proof-of-concept to extract the linkage from a
binary during QA and warn if a 32-bit executable is linking to the
non-largefile functions.  Obviously its 2.6 material now but I hope
I'll get around to finishing it off.

Ross

