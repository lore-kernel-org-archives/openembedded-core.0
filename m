Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3804377635
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:16:34 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id v125so23069662qkh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7bcUuDAHOW4CVuHbD3pI1Vxg2f5732Wktoo/lFc2wxU=;
	b=s7/iIhus7JX2ziC6D2zO4s6GUJXbqFSybaVXY+27l8iApnz/jsVI7KaYnF67/gGBFa
	YzUQC10+1qUt5NokUh6kLNXtAA1eyddkqAhXrOjM5mV6RfbmcpM7lIVtyz3kwToIgZ3B
	2cTFl9NMVsS+QNF/O1GoKW5WQgmMybtsDd5XzkQWDg9c834ffaOBUM/8Qfn/zRr76pCg
	eSU5UzonI5osF7m1uvp9Wv1boa/l0f9zyJtTlZlCUeru3QJfYyWq+Jy8WqhUq480zSeG
	rJCEfKPANCXTf/bE8Y1Z5SCD3MA0uT28Rb9Pu0FDeaSsbGlm3HOFT5Tn6joS7zoXdNaC
	DQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7bcUuDAHOW4CVuHbD3pI1Vxg2f5732Wktoo/lFc2wxU=;
	b=VcNvQnCRMgLITtkSfQgCfzrLfXKOKy4eFJ/RKcRudTIqMjR9KCyeO+rIYvGzfgMt08
	r4mgse0uBp/OqoJILuxLPaj6/wtacerCaGtonNhGxmh3iY6hAnfQrxcdKwgaOrpqrkRa
	u9HZF0T9ruJuVQeCdp9hNpiQ0H0vUUW/SzZldDdlmTDUyXcDab7NAS7atvwDU2g64c9D
	+fsOieHEB35xgpUa2SP4Hcrf713kOodJiziPI2+G2RbQbrOoGJUYWGlQ91zHrj2VOi0H
	SmRlnDiCDdyXvWTCLHLaMzsei3JN8jKrrcWIxhJRQK8U5nEgp7IbT+dFRvDeA241owKR
	y75A==
X-Gm-Message-State: AMke39lKVQuyvgLDDwaPqHvLd8/R2ObcBLiO0KesI1UY2UyZTk7jz6GCwEjvKLu5t4vcRKL0hPWWVfPDsilBf2l8
X-Received: by 10.55.1.134 with SMTP id u6mr2990941qkg.36.1488917795866; Tue,
	07 Mar 2017 12:16:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 12:16:15 -0800 (PST)
In-Reply-To: <1488917974.3261.25.camel@linux.intel.com>
References: <1488916121-30447-1-git-send-email-msm-oss@mcclintock.net>
	<1488917974.3261.25.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 20:16:15 +0000
Message-ID: <CAJTo0LZrvj7SzJjM-RORyJHwVcrdTb9jvBrsy08uRXtFrSNkQg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utility-task: Add do_patchall task
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
X-List-Received-Date: Tue, 07 Mar 2017 20:16:36 -0000
Content-Type: multipart/alternative; boundary=001a114046c452a98c054a29b058

--001a114046c452a98c054a29b058
Content-Type: text/plain; charset=UTF-8

On 7 March 2017 at 20:19, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> >  meta/classes/utility-tasks.bbclass | 7 +++++++
> >  meta/conf/documentation.conf       | 1 +
>
> Doc patches goes into the yocto mailing list.


But this patches meta/conf/documentation.conf, which is part of oe-core.

Ross

--001a114046c452a98c054a29b058
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2017 at 20:19, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><span class=3D"">&gt;=C2=A0 meta/classes/utility-task=
s.<wbr>bbclass | 7 +++++++<br>
&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
<br>
</span>Doc patches goes into the yocto mailing list.</blockquote></div><br>=
But this patches meta/conf/documentation.conf, which is part of oe-core.</d=
iv><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</di=
v></div>

--001a114046c452a98c054a29b058--
