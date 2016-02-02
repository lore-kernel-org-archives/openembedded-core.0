Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 02FE7772AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 21:48:10 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so33650522ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Sp/qkkZNimTY4uxRTGZvTxqbINWOkhp57Zj6P0Ra7EQ=;
	b=N9H0Su6ztaVsK8LnO6yK6q4SjLP/VZshQvydar68i3P6w3UIFb87fNFzzP7+oWdqk7
	PKcj/h9b5nfshPK9Et9t4OCjwztekDUstauvYiNpYqgRYjIEQqvTPd5QkSU1srex1gwb
	X8xhJHEVDpAsYClMeaWGXIQztQ1lDxn0ovw6s5cn4JsZ/4YylyGtDxflNoFOMDJ+wkEv
	L3lGVJ8Bnjzje7USjuZFdsd5u534Ig1mZcfZ9hxMkCFpW8o2NL3KOPEeQxlJJZ5i6Cmo
	rB8r6ITI3FAdOaQXkarm+sww6ARtkMLOep26sCNFrQhJ7oK1BahhaimLquZ6JTSoqndH
	Dj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Sp/qkkZNimTY4uxRTGZvTxqbINWOkhp57Zj6P0Ra7EQ=;
	b=NfvCmLrr/7EB/Pc5fdYxL7v9JkpgJOyfPe4hJhLzFZRscmdJj57+24KFQiZuRcAalp
	nR5uZVp7a/1mgx4UMLODKFAgy872x/K7wJ10vi4efX9FOfLIg+k59NyUOYouGzIv1z6J
	GJyNbE2BqXlm/qnueAL6+j+/XyhvC4f3TYrN+og+fmHooIAGYA3HTg4pBPKF/CQG+FR0
	5WihlQeiNPS7zUv2p9BcllVNFwrjQNohuBlQp3WxhquNDWd8DPrBzc72L9ZzJALprXu0
	d8hXfX5+lapWmxxhAKaEbR1w4t9OLN26jVgi8SiDlN02DGs2fhIzmceft36CUB4cRa1Z
	ScbQ==
X-Gm-Message-State: AG10YOQ/oT55E3M2Ba3VxMX6edFp/YuFt5F1b4aLi0H/nssSupovFWC0VfxiDopReDyP/lidK2l41nK2f5XDZ0GH
X-Received: by 10.107.3.220 with SMTP id e89mr10303667ioi.99.1454449691364;
	Tue, 02 Feb 2016 13:48:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 2 Feb 2016 13:47:51 -0800 (PST)
In-Reply-To: <CAJ86T=UJL+69b2nvcnEWJyUjA_KYwi91kbUz88hcKOQwPE+ONg@mail.gmail.com>
References: <1454363382-13387-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbfKq2CtEj3Y8zBmgQiXPNJF4587R2httpbmsNHgG+mhA@mail.gmail.com>
	<CAJ86T=XibuPtxUY2c+TQ35_KdBO47wRoCuSehgTbGfaR+tb8_A@mail.gmail.com>
	<CAJTo0LZ5BC4MWpaHL2Zk=ts5iJ-7-U9UQAVetBLwqUzEBLs0Qg@mail.gmail.com>
	<CAJ86T=UJL+69b2nvcnEWJyUjA_KYwi91kbUz88hcKOQwPE+ONg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Feb 2016 21:47:51 +0000
Message-ID: <CAJTo0LYnCiZD0RMiUVfQVHjMmsvEA=h9g0KrhOo_wfPAS5sx5A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH] curl: disable curl-config binconfig file
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
X-List-Received-Date: Tue, 02 Feb 2016 21:48:11 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c32ab01052ad075e8

--001a113f0e7c32ab01052ad075e8
Content-Type: text/plain; charset=UTF-8

On 2 February 2016 at 18:40, Andre McCurdy <armccurdy@gmail.com> wrote:

> setup.py actually parses the output of curl-config --libs (ie "-lcurl
> -lnettle -lgnutls -lz") to decide which ssl implementation curl has
> been built against. There's nothing in curl's pkg-config file which
> gives that same information.
>
> A second question is why pycurl thinks it needs to know which ssl
> implementation curl is using. I don't think it really does, but fixing
> it and then rewriting setup.py is not a trivial patch.
>

Huh, it looks a lot like the pkgconfig file isn't complete.  Also my
initial look at "can I rewrite this setup.py to use pkgconfig" was quickly
abandoned with your same conclusion...  agreed: this patch is on hold!

Ross

--001a113f0e7c32ab01052ad075e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2016 at 18:40, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D=
"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2bv" class=3D"a=
3s" style=3D"overflow:hidden">setup.py actually parses the output of curl-c=
onfig --libs (ie &quot;-lcurl<br>
-lnettle -lgnutls -lz&quot;) to decide which ssl implementation curl has<br=
>
been built against. There&#39;s nothing in curl&#39;s pkg-config file which=
<br>
gives that same information.<br>
<br>
A second question is why pycurl thinks it needs to know which ssl<br>
implementation curl is using. I don&#39;t think it really does, but fixing<=
br>
it and then rewriting setup.py is not a trivial patch.</div></blockquote></=
div><br>Huh, it looks a lot like the pkgconfig file isn&#39;t complete.=C2=
=A0 Also my initial look at &quot;can I rewrite this setup.py to use pkgcon=
fig&quot; was quickly abandoned with your same conclusion... =C2=A0agreed: =
this patch is on hold!</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113f0e7c32ab01052ad075e8--
