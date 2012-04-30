Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOsEF-0000Kq-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:09:31 +0200
Received: by lagw12 with SMTP id w12so1868545lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=nleRlmbCseGE+pHVpRNYgskDjDzol8bjSW2+I02x1c0=;
	b=dl/ojv+i/jaJKMfqz4Dx70erjwEVmiWE2kZGdDyeRBjHCOh9q5sDBf4pIQABfCWrOS
	euTCgEMjVBIsMYimqPvn/NUfu+uQ2PaRowtfIfeakEinLmHqVySEHp8vxYzkaNF5oTKn
	fINmyzRdNNQaSaNUslboCiiiIXxskDwZR88iAFkMCE9os+NGBDYahlHAuN9raNGYoskT
	5WNoEde4RiLF9T+wgwfPpM9lsNYbB7KNKJoT13GFHzvudEnPDFQhvO7QvORnTWxRswTj
	T9bwKRIA4Db9xsVnnTo+X9oXwrTaYEDL22TcUo5YtBdnSegcPdnGb40tCajoXr8fuA2X
	Gqww==
Received: by 10.152.112.97 with SMTP id ip1mr20100259lab.31.1335797989723;
	Mon, 30 Apr 2012 07:59:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 07:59:18 -0700 (PDT)
In-Reply-To: <1335797635.7415.22.camel@ted>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
	<CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
	<1335797635.7415.22.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 07:59:18 -0700
Message-ID: <CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 15:09:32 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 30, 2012 at 7:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>> hmmm. Whats the error ?
>
> http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/42/steps/shell_24/logs/stdio

that should not happen. Its seems to be issue in eglibc option group
handling somehow its asking for regexp which should be isolated in
option groups

Did this work fine with 4.6 ?


