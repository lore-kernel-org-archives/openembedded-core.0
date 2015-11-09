Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C598073E11
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 19:00:37 +0000 (UTC)
Received: by ioc74 with SMTP id 74so129913746ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Nov 2015 11:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GrPE9mVxFPdzjoO/m7DoojHP5fHq3mlS9z8EkkznL/E=;
	b=XI+6J9MNvMp65gVrQ8RkaKq1kdOk0Zpitk9lQNf/Zd/JV/EI3HkG5IBY24Bcv98v2z
	149yyAhRINu4nC/Hh0BDaYKVjWC1j3Afx3aAG7xOMB04yXZ3cRu+dc+YwnFwFGncXGOT
	dTRMlpbJEu1Vn5TubmYKhtuBtd2jUlB4UWGnx/c+tCTdOxUAQs/ePWH0DfbWNEMX0fIO
	FGITgBei6icdJS72IPGFWLbWJJOcfELObq7XhOVUGq2+AAUNP6pfl9MEdM6YaVBTG2ST
	kHbSJBISSpEswbF9jpXw6N45gLqSZUyhfN7Tr+1fb/Du51C8K5UBsjQB2K2ARq8wmXJC
	Zurw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GrPE9mVxFPdzjoO/m7DoojHP5fHq3mlS9z8EkkznL/E=;
	b=eumNrfgX6ZQxWf/EvC++LC8u49obwRqaIRcgrVr2XPieNizJ3e/FxwkEsv4ZXGdGJM
	fM0orXtmRmH6yCAhZksbcDLRZpvGsni0ndgkNEirXSV2pRG0pT2jwHJrXORSIxKbI+VJ
	DHtdj9dvHvnl8qwOZp+Xz+OPbHSDHDP/SrPQ7OSus7v3pkvThji/tgqiucj5iwCO59IO
	PxG5btFs0QyBRsE8qufwdd8GYp6KqTHXt2MOLAAdy6Iav037Hl9Wutg5HejwdnOzEEZg
	9RAhsDIM7GrwuFQpY8ry6fMp+NY/0WYqHyBtaI4LBmrIfsP8P74Oh3p8J/Eix+i+mpVI
	y/YA==
X-Received: by 10.107.3.42 with SMTP id 42mr9276iod.83.1447095636418; Mon, 09
	Nov 2015 11:00:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.93.7 with HTTP; Mon, 9 Nov 2015 11:00:16 -0800 (PST)
In-Reply-To: <866bda5147b9f6af8f58d799bdcbf92e7fd31d3d.1447063562.git.mariano.lopez@linux.intel.com>
References: <cover.1447063562.git.mariano.lopez@linux.intel.com>
	<866bda5147b9f6af8f58d799bdcbf92e7fd31d3d.1447063562.git.mariano.lopez@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 9 Nov 2015 12:00:16 -0700
X-Google-Sender-Auth: so44ZxADxsAnFZ8l5X-2ZXO6bPE
Message-ID: <CABcZAN=HSmR4nqaBf1zLAyZ5xe348_C=BZLFAR5At0PZD=fO7A@mail.gmail.com>
To: mariano.lopez@linux.intel.com
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] icense.bbclass: Create image license manifest
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
X-List-Received-Date: Mon, 09 Nov 2015 19:00:40 -0000
Content-Type: multipart/alternative; boundary=001a113ed3445d6508052420358a

--001a113ed3445d6508052420358a
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 9, 2015 at 3:23 AM, <mariano.lopez@linux.intel.com> wrote:

> From: Mariano Lopez <mariano.lopez@linux.intel.com>
>

Minor, but the commit message subject line has a typo: icense.bbclass.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ed3445d6508052420358a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Nov 9, 2015 at 3:23 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:marian=
o.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Mariano Lopez &=
lt;<a href=3D"mailto:mariano.lopez@linux.intel.com">mariano.lopez@linux.int=
el.com</a>&gt;<br></blockquote><div><br></div><div>Minor, but the commit me=
ssage subject line has a typo: icense.bbclass.</div></div>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a113ed3445d6508052420358a--
