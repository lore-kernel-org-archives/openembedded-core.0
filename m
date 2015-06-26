Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 82D8E75B28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 13:10:42 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so54725102qke.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 06:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J828s7mpVUCII7rQmrzbfxyiQuHcqRxjWeaWipmLtlk=;
	b=cV+evgA66/UGkiK8GstfzYnBSkPGA+Y3k+zAc7WxQbZZuC6Ex/CQS46YnoQYf5jT6+
	qTWnnlvBixF55IxWG1eJ44qA6KC9PSdt+J+lWSa4JsVwc1sEAWA1q7ULij0Bn2AWOY16
	tIxFazmJ6+OBOj4b+ICjxHmscyrfpLv+d7OCC7CHyhOFABHZQ5MBb3lIQIq1xV21y7Fx
	h0UhbDDhTJtdQNd/xQcNSQZ0PsfJmC6ipde7p79Gy5qNtSqd6HRBkNe0IR2dm2oSaxKy
	pYsg/KfxpdNC5wfNgqsnBQVwhvFhmxsSgFP8doWWRdowBZwJUSJUYIZcLgQeyZivsH+z
	EI1w==
X-Gm-Message-State: ALoCoQmdJo90T/9rGg0geA45GG5y1xOkut7rHt7A7m6rBKZ+rFrXICWM+5eGlVwQctbNHKmo2/2S
X-Received: by 10.55.27.11 with SMTP id b11mr3325202qkb.105.1435324243246;
	Fri, 26 Jun 2015 06:10:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 26 Jun 2015 06:10:23 -0700 (PDT)
In-Reply-To: <7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
References: <cover.1435299778.git.liezhi.yang@windriver.com>
	<7eaec2a8209ca34e5d8b247f31935af496134aea.1435299778.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jun 2015 14:10:23 +0100
Message-ID: <CAJTo0LbVU3u8dustr-dv6ySQmAyU6nR2c6r7=cPP-9GdRFeZsg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: check /bin/sh is dash or bash
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
X-List-Received-Date: Fri, 26 Jun 2015 13:10:42 -0000
Content-Type: multipart/alternative; boundary=001a1147f32ea8157205196b7759

--001a1147f32ea8157205196b7759
Content-Type: text/plain; charset=UTF-8

On 26 June 2015 at 07:23, Robert Yang <liezhi.yang@windriver.com> wrote:

> The build would fail when /bin/sh links to ksh or csh, we only test dash
> and bash AFAIK.
>

csh definitely isn't a suitable candidate for /bin/sh, and I doubt ksh is
too.  Are people really doing this? They're just wrong...  I seriously
doubt Linux would boot with /bin/sh->csh and ksh would be asking for
trouble.

Was this a real world problem, or a hypothetical problem?

Ross

--001a1147f32ea8157205196b7759
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 June 2015 at 07:23, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mail=
to:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3j1" cla=
ss=3D"a3s" style=3D"overflow:hidden">The build would fail when /bin/sh link=
s to ksh or csh, we only test dash<br>
and bash AFAIK.<br></div></blockquote></div><br>csh definitely isn&#39;t a =
suitable candidate for /bin/sh, and I doubt ksh is too.=C2=A0 Are people re=
ally doing this? They&#39;re just wrong...=C2=A0 I seriously doubt Linux wo=
uld boot with /bin/sh-&gt;csh and ksh would be asking for trouble.</div><di=
v class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Was this a rea=
l world problem, or a hypothetical problem?</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f32ea8157205196b7759--
