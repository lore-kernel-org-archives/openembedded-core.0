Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id B97E460962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 13:55:15 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so25575316qko.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 06:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DzUGsSETMfgmwAh9B2RknzrgB3SjgTGw04Nb0y8o3F8=;
	b=PGWAsZ2fAOo4kNEaSkXZa/MsMwc8UlW9QF08He3zlgeOdMCJKHAgaOjQP8fS6jp807
	ozFI2zwe3oqxo5t0V5ZCBy97/vsDb6HT+T7jOX+DBOiYSzmpf7o9fza5qrhleqmtmZ3+
	6OT98rUHwllIZd0UiwLGmYSjIft85H/5EeulfM1pqhIiXFq4B5LrsCteYevDt+MAz2ri
	cVHFynPCK+Ar+bf/bOObAXsj1e+VZZevRlA5aevD1rEQfjUIdA6xtLJ+wEfA7MEZKc3f
	W+uoDrTL8eOGF+OmCxqLPNgPhWn5quTt8ScQPx59NBu0CR1ouNkL+6+fHOqrRpqcPJvf
	l4nw==
X-Gm-Message-State: ALoCoQk/G0RYVRmBlOW9hqtraI2JwCAg00XMzOyfS6gZF8ibagjHpABMAUmhhVcNfbi6gyAsDnfN
X-Received: by 10.140.235.195 with SMTP id g186mr4317328qhc.64.1433944516761; 
	Wed, 10 Jun 2015 06:55:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 06:54:56 -0700 (PDT)
In-Reply-To: <CAPHZmLZyCTG9MGuBrBRaMV_hdq_ASJ17TaxCD0D-3CNgVsMi3Q@mail.gmail.com>
References: <1433941677-9681-1-git-send-email-martin.stolpe@gmail.com>
	<CAMKF1sqbdiykJXaR5DboOHqnVqgnhygRPfgpFmKziQFEu5BUEQ@mail.gmail.com>
	<CAPHZmLZyCTG9MGuBrBRaMV_hdq_ASJ17TaxCD0D-3CNgVsMi3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 14:54:56 +0100
Message-ID: <CAJTo0LY3xydx4dtEf2ZtfMhO0yM0XaO_BacU1t1r=ZZXVUerLg@mail.gmail.com>
To: Martin Stolpe <martinstolpe@gmail.com>
Cc: Martin Stolpe <martin.stolpe@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: fix native builds when host has gcc5
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
X-List-Received-Date: Wed, 10 Jun 2015 13:55:19 -0000
Content-Type: multipart/alternative; boundary=001a11354c8a8caf8905182a3936

--001a11354c8a8caf8905182a3936
Content-Type: text/plain; charset=UTF-8

On 10 June 2015 at 14:27, Martin Stolpe <martinstolpe@gmail.com> wrote:

> Ok, then I was too slow in sending the patch. Haven't seen that it was
> fixed already.
>

My fault for not remembering this was already sorted.

FWIW, the fix is oe-core 47f67fa (ncurses upgrade).  Of course that won't
help anyone running fido on a host with gcc5, but I'm not sure we support
that...

Ross

--001a11354c8a8caf8905182a3936
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 June 2015 at 14:27, Martin Stolpe <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:martinstolpe@gmail.com" target=3D"_blank">martinstolpe@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div id=3D":2mn" class=3D"" style=3D"o=
verflow:hidden">Ok, then I was too slow in sending the patch. Haven&#39;t s=
een that it was<br>
fixed already.<br></div></blockquote></div><br>My fault for not remembering=
 this was already sorted.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">FWIW, the fix is oe-core=C2=A047f67fa (ncurses upgrade)=
.=C2=A0 Of course that won&#39;t help anyone running fido on a host with gc=
c5, but I&#39;m not sure we support that...</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11354c8a8caf8905182a3936--
