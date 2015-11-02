Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id E095360125
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 12:17:17 +0000 (UTC)
Received: by qgem9 with SMTP id m9so114081689qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Nov 2015 04:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ysNrhb/JEoTD+onZi9QEVhhqttw2JNE4R9fYWP4qHAs=;
	b=f+4eprKZhHyf20z9CkV7fguuVlbwc69ls2OO0wiZm2ZTvMi/VtBi6srN7L5eKBipjK
	I2aCvT4KkySLRdXMZ7dSF7f4x381ywSONSQReHvafuyOceHFE0WGKR0LM4S7IBjivPN2
	w4izIeb9fJqAIUBaR4sQRayECvx587aBPE2kpuEYtBP6RAo4AD+UBscmFH1R4iTEGd9/
	vtoc+SxFsCB6ta8UbKYeLYpMEOStwdlhSjPblb8pZb7DA8ceCwsqr3habJJu6UEJffrH
	uyE0WwpdnIS3ZYgQuTts43JskvfAy2Oyi5C9TKKu6VajmyatBvywEM1DdChTMC3kQ6Dh
	f9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ysNrhb/JEoTD+onZi9QEVhhqttw2JNE4R9fYWP4qHAs=;
	b=VVo7kKGUDz2rdOBhc5oWwD+UpUIuc1+l7jbcnMKe5+QD+RlSetaGWf+nrc57Dh9DlG
	6ROFKn5oWQ1X7Z3zGNbEDNRssd3ctXAouYcASzV8rgzhoE8Lm6FQwLdoQlTqUXGT0mgw
	TfQ0xPIBQbbMgq9LtnxBI1lEegLjCVV6AeUfwB/UVY/DQSY8kzPJ9Xqjpt/9yoJ0Y54G
	hjdqC9TAys8BKSqHBIvKtwgYkhALtGsqPE79mFUMinSSPGxQ3sb87vYhS1C4UEnoSjab
	b4fFokwHYnZnblwpzAby9tpPBTgerrNWFYGVnuFGK3E7Nl7TOfQ8Kitw35tgy+C0vARL
	D0/Q==
X-Gm-Message-State: ALoCoQkIPznrzVAoW6Hsn5c/WA3OPZQu+8SfO+DcMUdmpT4f4wYquvA7nFKqSOhbGU1W14fK2Bza
X-Received: by 10.140.132.11 with SMTP id 11mr30877566qhe.64.1446466637227;
	Mon, 02 Nov 2015 04:17:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Mon, 2 Nov 2015 04:16:57 -0800 (PST)
In-Reply-To: <5631E434.7010006@windriver.com>
References: <cover.1444976827.git.kai.kang@windriver.com>
	<5631E434.7010006@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Nov 2015 12:16:57 +0000
Message-ID: <CAJTo0Lb3YOuRWMNMnTOq=4gUuzX4Kr4egur7mxVE7widHBty2g@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Upgrade sqlite to 3.9.0
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
X-List-Received-Date: Mon, 02 Nov 2015 12:17:20 -0000
Content-Type: multipart/alternative; boundary=001a113502d017812105238dc282

--001a113502d017812105238dc282
Content-Type: text/plain; charset=UTF-8

On 29 October 2015 at 09:17, Kang Kai <Kai.Kang@windriver.com> wrote:

> Kai Kang (1):
>>    sqlite: 3.8.10.2 -> 3.9.0
>>
>
> Ping.
>

As Stephen's weekly status mails show, we're frozen whilst 2.0 is being
prepared.  This patch has been merged into my staging branch (ross/mut) for
when we thaw.

Ross

--001a113502d017812105238dc282
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 October 2015 at 09:17, Kang Kai <span dir=3D"ltr">&lt;<a href=3D"mail=
to:Kai.Kang@windriver.com" target=3D"_blank">Kai.Kang@windriver.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Kai Kang (1):<br>
=C2=A0 =C2=A0sqlite: 3.8.10.2 -&gt; 3.9.0<br>
</blockquote>
<br>
Ping.<br></blockquote></div><br>As Stephen&#39;s weekly status mails show, =
we&#39;re frozen whilst 2.0 is being prepared.=C2=A0 This patch has been me=
rged into my staging branch (ross/mut) for when we thaw.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113502d017812105238dc282--
