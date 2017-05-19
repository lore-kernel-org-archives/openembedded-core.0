Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6513160777
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:51:43 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id t26so61420635qtg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=13G32h38/DAfp9CK629wMvGwZeLJFls12ssfGm1qM/A=;
	b=j96KH6CR63VoJteQEz7Mn4d3jZuC3I1Gig2Kpy6MP51L6MvZbWSGNLluOe2JB2GgEp
	tEQmCZlRqIqRyHypLrWlEoCctjA+KQA59OfBL5u3+f1PvAwyfl4zPIPyhUjSW5zRj1+/
	QL7GZ35tU1XOVmajqRFlweKoR/imeIdUXR1vH8efTua6WMa9UvfXQA3cjnHcn69MBHiN
	7EFhjGizh6HM72Nl3mn67uQdNJmZ+LjaMdwqzWDf/IKGqdLP5rSvmpb3UNwkyX37/Ith
	0JBI2qPRW9ADgLrRvBqhGP8WFwre47LirxNhfrpnbmPHseBXyrTRkmp4ReJF6oQSkkMU
	geDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=13G32h38/DAfp9CK629wMvGwZeLJFls12ssfGm1qM/A=;
	b=U4DykUMkRaOx+b7PO4/bb4UTj5TuJN0Q637WNUsKaGt29k/ehufagDwQcy2Y7DN4Ix
	qTgHV97dBsBG541bqBJApUPSMvdZK0kTGIXxuu0HJeeS54kbFqzBq/Un1NuRd4p7HzTc
	S19ryNFlqWLldhXespd0tTrp5mIc+dVls/2z+PaKBy6pJoUrFCZ36ll1NwDr9MOZ4QAk
	svOweULmnScFKM4d/6iEYI9gOequBvFbtvrbDKi6bqSPnHdY0xLgPC3UX1mAVMxIwobO
	hH+cVu4qTar8QJoZovVqvvhLnNEeYnuiLioTP+NlgsIOYAeS1CaCXx1jtF5nTMNQ96+M
	KNIQ==
X-Gm-Message-State: AODbwcCl5wmZk6XVVU7Us9XK/gRCd+ZcZ5B2M7mQntxhz306c0Ob7ds6
	gZLdLiw/WKOhwOqh4lltgHal6ahyxqzj
X-Received: by 10.200.50.49 with SMTP id x46mr10571549qta.105.1495209105317;
	Fri, 19 May 2017 08:51:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 19 May 2017 08:51:24 -0700 (PDT)
In-Reply-To: <20170519154856.21505-1-max.krummenacher@toradex.com>
References: <20170519154856.21505-1-max.krummenacher@toradex.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 16:51:24 +0100
Message-ID: <CAJTo0Lbf1u7b+X6JTH-S+n+N80OSkFGcZnvoRnAKBgcqQ2q6xg@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Fri, 19 May 2017 15:51:44 -0000
Content-Type: multipart/alternative; boundary="001a113577a2967634054fe27fdc"

--001a113577a2967634054fe27fdc
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 16:48, Max Krummenacher <max.oss.09@gmail.com> wrote:

> +Upstream-Status: Inappropriate [oe build specific]
>

Is this really inappropriate?  We're finding a bug in the build system but
that doesn't mean we're the cause of the breakage.

Ross

--001a113577a2967634054fe27fdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 16:48, Max Krummenacher <span dir=3D"ltr">&lt;<a href=3D"=
mailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2a8" class=3D"=
a3s aXjCH m15c216722bf22d17">+Upstream-Status: Inappropriate [oe build spec=
ific]<br></div></blockquote></div><br>Is this really inappropriate?=C2=A0 W=
e&#39;re finding a bug in the build system but that doesn&#39;t mean we&#39=
;re the cause of the breakage.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Ross</div></div>

--001a113577a2967634054fe27fdc--
