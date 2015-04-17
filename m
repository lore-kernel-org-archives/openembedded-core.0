Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AA66D73D5A
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 15:29:17 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so84413545ied.1
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 08:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5GK8X1UbnyNy4HeVWHwIJTaV31Vmv3X63DdMNPgpXJA=;
	b=WXhkRxQBF20qLZ241DrM2pkIfn1CgACo+7D/JtPl55CK2/dBtLE9ZEgB2hieRmBANb
	jQ6qLUD43/xcBGH6bNNiWqTbDYvzCmLqglMf87LhNPsdw9XZN5i1vA1wgNcUVCPyM+MK
	HB+/XQPrGPeKw7TQ+2Gpy/bIv4LV8phFulpB7pZC5tjs3xYu2/LcY4lOJskrJCUMBkVN
	3e84jQJfIqfoWyyYBt+AoL9VwDZHCFH3ZYOUV4Cik1Mbdgy/MzH4Iz1xbW5OJCA0/BQr
	VR3pKOypBLOGJ2Qv2hcUDWdyq8GWRiKVBrN/PvwMYaFxtT0mO1hjO0hfYKITeX1EnOiF
	JFQw==
X-Received: by 10.50.111.233 with SMTP id il9mr3698228igb.13.1429284558516;
	Fri, 17 Apr 2015 08:29:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Fri, 17 Apr 2015 08:28:48 -0700 (PDT)
In-Reply-To: <1429254936.6976.191.camel@linuxfoundation.org>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
	<CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
	<CAJ86T=VMoW-hX-Y6xPy835Hfn4W3Wqbn_s+TCYWfHZ42Oc368w@mail.gmail.com>
	<20150415100850.GA2338@jama>
	<CAJ86T=UwLFJ5LOAg48Z2jM973JyWc68EiEER9tADc+7qQdnDWQ@mail.gmail.com>
	<CAMKF1soYC_BnMGv4Su5Z+6v1oFKpYCfRWvFxdnPXp9i04BAHHQ@mail.gmail.com>
	<1429254936.6976.191.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Apr 2015 08:28:48 -0700
Message-ID: <CAMKF1sp-GdCWpiXG6y=sFf3U9U6PXG+JTy7fJ=ChRpRpem+v=A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Fri, 17 Apr 2015 15:29:18 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 17, 2015 at 12:15 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> autoconf-native is near enough one of the primary pieces of the
> dependency chain. Having it depend on perl-native is a very very bad
> idea, if its possible at all. It might be "correct" in principle but in
> practise its not workable.

in practice given sstate reuse, this impact of increased build time
may be mitigated now a days. In my case rebuild of native-tools seldom
happens
its only an impact when you do a build w/o sstate.

