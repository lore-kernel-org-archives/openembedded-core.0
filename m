Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B3A5B726E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 14:19:15 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id n8so10961227qaq.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 06:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QcX66TvwOrqxica4ie/HUw5KzrpusEobulCT5x2UjnA=;
	b=czCxRa0cTgl8tXn+ddlzzjJpdQdQgQ2dVvZkuBNeOv9dHiFKnUHqlbCUF9XBVfHIzU
	PU8+7vZQMP2YuyV+NLUpH6fXMBU5YXvKuuQ+JGNU6JJjLBPVbUdQODFOmh7VyOxaUxII
	r+N+c/AZir433kkgD/KdRHZAsvxrW8C8ekGP2gem1ywR4Md6a22Yg4vnV88Xs5rBrsH1
	rXmiUJiSReQoc1xTDDD4KGj0l7YY56CpXjEfyJGI8YrjjYWxaA6pJM6oKqE2H/4p5Yb8
	1aAP8JwPCiVhfeQ1h8qD1jRn7isUl890P0OxH6mhShTbfzyk2Ys+kROb1LoO8gE2/wkD
	HoDA==
X-Gm-Message-State: ALoCoQm0rH63JLFv1/WPBDU4F0DnNHaMpnBfiZq8y50klR3q2JfveRJageGcMzG0QThnrLyPPaZr
X-Received: by 10.229.190.65 with SMTP id dh1mr8642639qcb.28.1423232356315;
	Fri, 06 Feb 2015 06:19:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 6 Feb 2015 06:18:56 -0800 (PST)
In-Reply-To: <CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
	<CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Feb 2015 14:18:56 +0000
Message-ID: <CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 14:19:20 -0000
Content-Type: multipart/alternative; boundary=001a11339bec080d8e050e6c1bae

--001a11339bec080d8e050e6c1bae
Content-Type: text/plain; charset=UTF-8

On 6 February 2015 at 14:10, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> I think they should re-run. Otherwise we can end having errors and QA
> issues unnoticed until a full rebuild.
>

That was the state of things until my original patch last week.  The patch
had the side-effect that changing QA tasks causing *everything* to
rebuild.  I'm really not sure that's a good solution.

Ross

--001a11339bec080d8e050e6c1bae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 February 2015 at 14:10, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":81c"=
 class=3D"a3s" style=3D"overflow:hidden">I think they should re-run. Otherw=
ise we can end having errors and QA<br>
issues unnoticed until a full rebuild.</div></blockquote></div><br>That was=
 the state of things until my original patch last week.=C2=A0 The patch had=
 the side-effect that changing QA tasks causing *everything* to rebuild.=C2=
=A0 I&#39;m really not sure that&#39;s a good solution.</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11339bec080d8e050e6c1bae--
