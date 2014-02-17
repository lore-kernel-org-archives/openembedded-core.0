Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2273B6F08A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 11:14:24 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id cm18so21210850qab.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 03:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/iyVphKNERx4V2lFdvFu3gA2XGU0ASJS+LimLiFXikk=;
	b=aRSIA51mfYR6ojQ1kFbobeaFydmtvVuln+KYgiyKCTDFjXxBeVKrEOzfMUbZ6sqAi5
	9LWd1y7o/b0y7M2eHedHFPl6Z/JaVS1D8mQvGPfn/rL6d8y7xKm45obIheSj4QesQe4/
	notL6Us4Gw2UZANoykDNBcztYLPIPq81lS3vq/PqTMsml+QczNTQk4Lko1amZQ9gUs/c
	pIzTydmuFXyxAAzcHizpoEHBnyJspefBEKwvtm00kc0m7jIyZfDax3KfRCtl/fP/l+Eu
	Hid5C0Wr9r8p+eUPI5b+jYmGSPCK9u4UcXBlD+aDDsPGiDn9WNQv4jhDncrTuvQSG3Df
	hv8g==
X-Gm-Message-State: ALoCoQm6EJ4BTdGVAraePBj5JkvPwnt7fXrXF4xe0w/Vu0MBbP8I06KuGd4mSAIvo4iVRWzV40Aw
X-Received: by 10.224.98.139 with SMTP id q11mr33935889qan.64.1392635664865;
	Mon, 17 Feb 2014 03:14:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 17 Feb 2014 03:14:04 -0800 (PST)
In-Reply-To: <5301EDB4.4040804@communistcode.co.uk>
References: <5301E81D.3070204@communistcode.co.uk>
	<1392634148.14081.163.camel@ted>
	<5301EDB4.4040804@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Feb 2014 11:14:04 +0000
Message-ID: <CAJTo0LYRZhFe2zOxAStQca5HmoDasi6MeKV-piOu_1wTWKkd6Q@mail.gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: SDK Issues
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
X-List-Received-Date: Mon, 17 Feb 2014 11:14:24 -0000
Content-Type: text/plain; charset=UTF-8

On 17 February 2014 11:08, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Good shout, that seems to allow it to build; I didn't even realise
> ordering of linker libs could effect the build. I guess I have some
> reading to go do!

Modern binutils will only link objects that are actually used, so you
need to build the links in the right order so it doesn't just ignore
your request to link to a library (as nothing uses it) for it to then
fail later (symbols not found).

Ross

