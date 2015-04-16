Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id E25D073D45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 17:32:16 +0000 (UTC)
Received: by qcpm10 with SMTP id m10so10332246qcp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 10:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=UYnUawiLOuXOjqKydLG+MF+A2Y7X5OGwDSwuQw7RaVA=;
	b=Hhs8m+4+leLFEkpVgzyg4DF9C48cuDyRGpRV7veZSjhIFIGlQDoQZ7M9JfNTYdVPw8
	19P3o9ax6aM+TBxWTuzjUq2Q8p0Schff1hZtK1ZBNCnns00Zrqg61mrCTFzjnsjyhMvA
	8miv43p3nKiX+Apdcj+413mJd+px9gmyZp8yDok35I7pwiBM4FjZRvr9SkgZ9JWehoSp
	4rqf6spUEgREJCHvHccJ3hrudYEqrl0LkNGxasB7zXNQmA8X4r3oKrbrBuVvp3sPnWXc
	fpm3dVDHrwQpkrr3RSRw/Um7zYYY/9cu3OrpY8bKRpUI4RCf3n7M+c2FnJyTm5el4lJF
	ugbQ==
X-Received: by 10.55.21.224 with SMTP id 93mr66482379qkv.89.1429205537185;
	Thu, 16 Apr 2015 10:32:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Thu, 16 Apr 2015 10:31:57 -0700 (PDT)
In-Reply-To: <54CADCE5.4050009@windriver.com>
References: <cover.1419500687.git.Chong.Lu@windriver.com>
	<d63d5ff53d6f64ac6d4a72c770283a21e0750112.1419500687.git.Chong.Lu@windriver.com>
	<54CADCE5.4050009@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 16 Apr 2015 10:31:57 -0700
X-Google-Sender-Auth: QFkl2flnOsr5_yg9U3xoP1wUC9o
Message-ID: <CABcZANkX1BoFvFQ_AzvBtRCyvSyrWP9+-9eJkTz1a_2kBU1axQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] check-layers.py: some checks for distro and bsp layer
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
X-List-Received-Date: Thu, 16 Apr 2015 17:32:17 -0000
Content-Type: multipart/alternative; boundary=001a1147b1525ae4380513dad890

--001a1147b1525ae4380513dad890
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 29, 2015 at 6:22 PM, Chong Lu <Chong.Lu@windriver.com> wrote:

> ping


While I like the concept, re-implementing the file parsing is not ideal. It
also traverses the filesystem rather than obeying the layer BBFILES. There
are a number of issues with that.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1147b1525ae4380513dad890
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 29, 2015 at 6:22 PM, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"=
mailto:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">ping</blockquote></div=
><br>While I like the concept, re-implementing the file parsing is not idea=
l. It also traverses the filesystem rather than obeying the layer BBFILES. =
There are a number of issues with that.<br>-- <br><div class=3D"gmail_signa=
ture">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake=
, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Enginee=
r, Mentor Graphics</div>
</div></div>

--001a1147b1525ae4380513dad890--
