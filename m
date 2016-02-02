Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id EF163601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 14:18:41 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id ik10so61447864igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 06:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1EKw//MXhsSGWEEM7yCWcFFn1+VeklKgbHYETzzcvQU=;
	b=Byku1+b1xoDfieYBRPuc7I7aMPpexnSkdBp9qC3j+B7dfYYHi79Fx6OpujExzR9JYb
	cOJ8PZs8kdIj63Ht42hjRnzkfZ2vBTmKJApb1U7Uwq7aadAskjpVyxWpCK39WyhHLmlj
	HfnXM92GBCWNqI9zrzBSrh3wG0HeTd5rTYDRE2FjHYABuaq148qKnwGv9sLnFmkbaux9
	b4lOiZ1+ixpA5j7XGMwrddH3OJ2zfSkTZTeryfC+s5wZSt7G8zeGJwhL21FniyAuKY0a
	qNnUa89TQXbw5vHzZIbnUC82h8203TBy4W0J9PqZfWXbeQBHhMQk/G1DXf1CCw/gnma3
	EBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1EKw//MXhsSGWEEM7yCWcFFn1+VeklKgbHYETzzcvQU=;
	b=jTvD7yMk1OAUXVZAgwkhXJ/CUy5cnTwYVYm7dTHiCa9fDNvuMtlskSAFlgobJL+B7h
	/AmSH13hg9T0DfroEA731H8aK/bivrMLwAc5550ise083WAGdqMsm02JZKvfY9y/hdbo
	nq8HbXGypyl81m2Oi4nBZkopNSpKobKPWbGN5he5Zhy48wlzr/5rOY5TSWSIJkf7+dml
	QL+/qIcEWSy3QPUyf4zixOz7C26Nbg607IjG3SmrSIsNbnaqzd+LjpSomVG2B44nMd0M
	O+WJU+GgNkBoOPzYpgRwpM8RqWVXxHjbvp0eQ7OiqOWMrZmcCP5OyF6LYQwxaM0kgFpJ
	rNLA==
X-Gm-Message-State: AG10YOTwMBmt7m32CLfbgU85YsifLxPJXsXSJQO19sooEpNpnamH91g0h/GN4S3wsYCMRHsA/KtNDPHIeG8BQT+R
X-Received: by 10.50.111.111 with SMTP id ih15mr18037247igb.78.1454422722291; 
	Tue, 02 Feb 2016 06:18:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 2 Feb 2016 06:18:22 -0800 (PST)
In-Reply-To: <20160202141018.GB2607@jama>
References: <1454419635-10822-1-git-send-email-ross.burton@intel.com>
	<1454419635-10822-4-git-send-email-ross.burton@intel.com>
	<20160202141018.GB2607@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 14:18:22 +0000
Message-ID: <CAJTo0LZgD_XXQYeZ+F19KccnDFBC-uf7zVPhgqu9iPzUfhcJtA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] python3: set INSANE_SKIP as libpython3.so is a trampoline library
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
X-List-Received-Date: Tue, 02 Feb 2016 14:18:43 -0000
Content-Type: multipart/alternative; boundary=089e0149be34b74b9f052aca2d65

--089e0149be34b74b9f052aca2d65
Content-Type: text/plain; charset=UTF-8

On 2 February 2016 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:

> This points to master-next branch and will probably became invalid next
> time master-next is rebased.
>

Whoops, rebase cruft.  Removed locally.

Ross

--089e0149be34b74b9f052aca2d65
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2016 at 14:10, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"=
mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2id" class=
=3D"a3s" style=3D"overflow:hidden">This points to master-next branch and wi=
ll probably became invalid next<br>
time master-next is rebased.<div class=3D"yj6qo ajU"><div id=3D":2ey" class=
=3D"ajR" tabindex=3D"0"></div></div></div></blockquote></div><br></div><div=
 class=3D"gmail_extra">Whoops, rebase cruft.=C2=A0 Removed locally.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--089e0149be34b74b9f052aca2d65--
