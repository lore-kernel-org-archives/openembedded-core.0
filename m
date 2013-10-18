Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 533306BA14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 17:29:20 +0000 (UTC)
Received: by mail-lb0-f172.google.com with SMTP id c11so2911399lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 10:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Fi49PVL6TZTw63hTZP+8rueszHo4CcpZvYU2o6UZwPU=;
	b=flzznIVQ7bxASabmwqm0k4GGJ98NUQqzZGX7+qZysSMWdCzF5/09Uv3BOJlP+8PYXG
	8ZvuuxdOsa7938UWXU73AfMh6BGtGil5iyDPudzZhRxvCM5lW3T7hIzQb6UEEt8kDR56
	A58nBI0/Dr93ASACS3xky7UkvNWMWT7Ij/oWJbqSCnsTPSq2Fnd998T5M8dK+XwIGWE3
	TKgOLkO+aT7PVS4ctQhDG5wY0/G9ZAc0PZwuNUsgnU8iMFcH+NjF+sOKrK+HvANrYhoj
	auXsK/27X+XPHp6ObRXo4nnQTZ+a0cy67QKIm0yw3phtIIXG5nFZaEinQnEcZ0ypBE7t
	vZDQ==
X-Received: by 10.152.36.170 with SMTP id r10mr2101306laj.48.1382117360665;
	Fri, 18 Oct 2013 10:29:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.53.197 with HTTP; Fri, 18 Oct 2013 10:29:00 -0700 (PDT)
In-Reply-To: <8D2F1DD0-3071-47B6-82E3-646A6C881708@emagii.com>
References: <52615ACB.1010203@emagii.com>
	<34C59EF9-AA69-48F2-ACE4-6BBAAA88FD4A@dominion.thruhere.net>
	<8D2F1DD0-3071-47B6-82E3-646A6C881708@emagii.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 18 Oct 2013 10:29:00 -0700
X-Google-Sender-Auth: Daxof7xJ7RqJdhOzIsLsFmyUFPA
Message-ID: <CABcZANm5u0NA6rv-TPJ86xNmQcpL4b2jUq3SgVtSQaXbSprw7A@mail.gmail.com>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with PREFERRED_VERSION/PREFERRED_PROVIDER for the kernel
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
X-List-Received-Date: Fri, 18 Oct 2013 17:29:21 -0000
Content-Type: multipart/alternative; boundary=089e0160bb04520c9704e9074658

--089e0160bb04520c9704e9074658
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 18, 2013 at 10:05 AM, Ulf Samuelsson <angstrom-dev@emagii.com>wrote:

> In some cases, you might want to override a few things in the DISTRO.
>
> Maybe an easy way to handle this would be if the DISTRO conf file
> included an empty file at the end,
> which can be overridden by a file in your own layer.
>

If the distro wants to be able to be overridden, it should use ?= or ??= as
appropriate.
-- 
Christopher Larson

--089e0160bb04520c9704e9074658
Content-Type: text/html; charset=UTF-8

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Oct 18, 2013 at 10:05 AM, Ulf Samuelsson <span dir="ltr">&lt;<a href="mailto:angstrom-dev@emagii.com" target="_blank">angstrom-dev@emagii.com</a>&gt;</span> wrote:<br>

<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1po" style="overflow:hidden">In some cases, you might want to override a few things in the DISTRO.<br>
<br>
Maybe an easy way to handle this would be if the DISTRO conf file<br>
included an empty file at the end,<br>
which can be overridden by a file in your own layer.</div></blockquote></div><br>If the distro wants to be able to be overridden, it should use ?= or ??= as appropriate.<br>-- <br>Christopher Larson</div></div>

--089e0160bb04520c9704e9074658--
