Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 885CF6012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 10:32:12 +0000 (UTC)
Received: by igvg19 with SMTP id g19so12104034igv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 02:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=D6f6NFm4wE6V/Npm5j8zwEPx5TAQS7TzA0GlWLqHxuc=;
	b=tg2SyMgnBqigiIRBtUNAcZTTF1qTtBIwXHicq0SEzhO0CjuSNfddKL1ZreJBomVd07
	a443wOA2rskWNMcLoaNwzg57X8kQoeGj4FxAMYxZ37tn2oeceYyUjz+hSMKv3PHuz7uY
	p/iAjmRbwx2Y/zSx+xhF8WkCKy2hJklphAW3AVzLtYb2rzLgOK2JktFQoBGGC85fQN2Q
	xxBQ1S2971MiS0XVq4VaDy5LB4EM1ChK2wbFyvqMNgwNPtmqz2SGvcjhjYeZjXO/NYFB
	IYf3YIA/aj7qSe1gMFzGMjEMs5j9NBnTBeZuXZUlk+eAwrsb5ustWM33jYNXIbcKAFyk
	F/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D6f6NFm4wE6V/Npm5j8zwEPx5TAQS7TzA0GlWLqHxuc=;
	b=F5Bzh8W0TxlhhbexGLxlIBu+TVd1zZ4pslmvqDNNIdGHpeDoMojLSPUXypnNkt38OH
	VrQEbpel9IvLXjXtLQj+CAT22tE1Fq8+/Duf/R7lVYOiVl0887L/mW1OWdvB9WQdG+Jd
	kdNm8GCFsfAPyyFgDKv1QAp/kfrvSzn9c0JmYmnWvR/o0wqosJpm06qoXB57YUeVOVSY
	IODPQ+U3CIGKz76MqOgO2fwItgqJXK6aAi28Nl9aKYeIwDLLYuTxlNnIildC9l/YZHrn
	MD+NQga12kFUdqcjmWQN8gALo7fJl/CO3ftjFCBDvrwCXJCasc9HAWN/CAVcKguSKZHX
	YRxQ==
X-Gm-Message-State: ALoCoQkjt03QLFs2vsm3uaEdAOaHe0trwZCSdWp7cd2TwbokIuHv6GXzh9khW6ZL7rU0Z9KQsOZ+
X-Received: by 10.50.143.38 with SMTP id sb6mr431873igb.78.1448533932971; Thu,
	26 Nov 2015 02:32:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 26 Nov 2015 02:31:53 -0800 (PST)
In-Reply-To: <8cb295e56ceee220419763aef08f75ea106f6e08.1448491263.git.peter.seebach@windriver.com>
References: <cover.1448491263.git.peter.seebach@windriver.com>
	<8cb295e56ceee220419763aef08f75ea106f6e08.1448491263.git.peter.seebach@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Nov 2015 10:31:53 +0000
Message-ID: <CAJTo0LajVwG1t3H5_EfZYxvu7US-uB5OW3LTYQrK1p0kAoXUzw@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()
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
X-List-Received-Date: Thu, 26 Nov 2015 10:32:14 -0000
Content-Type: multipart/alternative; boundary=001a1135ffb885354205256f1639

--001a1135ffb885354205256f1639
Content-Type: text/plain; charset=UTF-8

On 25 November 2015 at 22:42, Peter Seebach <peter.seebach@windriver.com>
wrote:

> +Upstream-status: upstreamed to 2.23
>

I've fixed this whilst merging to my staging branch but we're building
tooling around Upstream-Status so using the defined values would be
appreciated.  So in this case, "Upstream-Status: Backport (upstreamed to
2.23)" would be correct.

Ross

--001a1135ffb885354205256f1639
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 November 2015 at 22:42, Peter Seebach <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":d5p" class=3D"a3s" style=3D"overflow:hidden">+Upstream-status: upstrea=
med to 2.23<br></div></blockquote></div><br>I&#39;ve fixed this whilst merg=
ing to my staging branch but we&#39;re building tooling around Upstream-Sta=
tus so using the defined values would be appreciated.=C2=A0 So in this case=
, &quot;Upstream-Status: Backport (upstreamed to 2.23)&quot; would be corre=
ct.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a1135ffb885354205256f1639--
