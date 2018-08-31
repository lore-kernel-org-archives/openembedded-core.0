Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 500FF79540
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 19:55:15 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id 89-v6so2176755qkp.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 12:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7pmPngcpwTmS6BMb74K2y3NN5Fwl7NkiHk0aAVllYH8=;
	b=H5AEqWbFq5c8EvSbOSpqPJUPFvqq4xqHnbHbVtZK2vjeGN5O7BhckrjqYNhNEevxMm
	Ueddg4zFRuRdGcdfPcVdg+G0yJEucsj5Ie+AEtL937yCkRIO34OZRD8ci3WjKMl1Wwqs
	j8F9a6Ih8dsQpel1lWBozPEDL6YyDfdfdEYrlnyuVset/wFJK1T1G+UZWFkHeE7SgFAe
	1uOP5QuUNerYLg5VAEEc0iexRPE3nYgZEsDsImn5fMepcFSTlrVpqd6ol3F+MADJEe0H
	PPOQLPY7v/eIdu6+6WgrdyjNVQMFmdioQYXXaQaHFvhVR+ESRjFJWpbBZn4Q7sas6UB0
	Cx5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7pmPngcpwTmS6BMb74K2y3NN5Fwl7NkiHk0aAVllYH8=;
	b=nI5jpezr3qPZybR7ZX+Xjney3LJZO9K5XQq0A84+/3V24r8rwRQ777rUEyQFOf/RW9
	RPOufJsrqbhPWF0AFJCMDRk3/Zk3cGtnWYjDjThMn+ibjwRLAivnus3dyunwa/MOuzNl
	6PinNazZERdF3nAYC+12+o5Cpfh9zJ2+o+YkzHfekuVd97VwwIEbRsMK9pHb8uxojE+a
	rpJHPCxSNO4Nwm1KJwRYaDWgKni+9uIzORvr0x4ykmhDjXFf/O+bNkrcNhn2WHk9hSRp
	qFG3ecMzTfjS4jr3t+O8bqOiOk3XMzf9OSRrEoAamkqE3dIwfazU9qPBBuazpg76Rh++
	IYog==
X-Gm-Message-State: APzg51AfacupoqQ7/9UnhtphliH1bO89LWvHhqyQBxCMU+LA9IhvqcDs
	Joki/8gj3ug5VXsxqSofp52H+xRICwPCF8Qf+qs=
X-Google-Smtp-Source: ANB0VdbZe9MH1S/1EqaB/gjRrp66ENc4zmVXecbPSIHrglf8uPIJJs7NZ0NCFaFg9fnUB8/7t41upbx49SAjD94B9dI=
X-Received: by 2002:a37:9904:: with SMTP id
	b4-v6mr16914569qke.102.1535745316006; 
	Fri, 31 Aug 2018 12:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
In-Reply-To: <CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 12:54:49 -0700
Message-ID: <CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Fri, 31 Aug 2018 19:55:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 11:14 AM Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> On Fri, Aug 31, 2018 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Aug 30, 2018 at 4:26 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
> > > This updates CMake to the 3.12.1 stable release. All patches were
> > > rebase on top of the new source file and all them applied without
> > > changes.
> > >
> > > The number of patches has changed as all them were applied on the Git
> > > tree and re-exported, to avoid any fuzzy warnings.
> > >
> >
> > This is a major version update and cmake is quite deep in foundation of build
> > there are large packages outside OE-Core which depend on it. Can you give
> > some details on testing to make us feel comfortable ?
>
> I did basic testing but all patches applied fine. If desired, it can
> be postponed to next release as it is indeed not critical.

build meta-qt5 with it there is lot of hairy stuff there

