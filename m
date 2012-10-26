Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRmEz-0001gK-Tm
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 17:54:34 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:41:02 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so9009311oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=9AV5moaJNTNXZy7AFaAxgxxedWNMhHOnlgr9W29L0ag=;
	b=NYUiLed2ZSdjEZQqd3a4KnoRXuNI4nMHa3DF3meq4u+n/zp6Uka6Fy7i3L49nhryix
	LfoJ1PTm3MLttWPjvILMJAP/yGeM0qWIsEcBdz77LGIg0mqrJSJr/Zyb3855EjLxaUvZ
	OwRumq5ff1ULu/rh7Jx0ZETX8QFMUQDKtS1Bc+mm6YFl3oz+HeVp5cwHJPr5jvz8HG6Z
	+0UmZSps4U8dmdWPFNp7xz2fykOo+GN32D6O5Mx6GzCpL0MuoExjXw078yIF+EN6pcwG
	oYtvXu8Pzrf5jmHaPSdhefahHIzls4mv2eVMv2b2u/t9uy1+YcWRUFZyp3kZyxgRO3+d
	NQqw==
Received: by 10.182.0.1 with SMTP id 1mr18593028oba.18.1351266061940;
	Fri, 26 Oct 2012 08:41:01 -0700 (PDT)
Received: by 10.182.0.1 with SMTP id 1mr18593018oba.18.1351266061844; Fri, 26
	Oct 2012 08:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 08:40:41 -0700 (PDT)
In-Reply-To: <CAP9ODKoZXu2dbvrhGDegKsH+vDEisgtf7r2u6TcBwYy2ZEPHDA@mail.gmail.com>
References: <CAJTo0LYm7bwU0fNYcD8wQ3unJm_ShoW-ej5tZ3FeeogEztJGnQ@mail.gmail.com>
	<k6e9ht$ra9$1@ger.gmane.org>
	<CAP9ODKoZXu2dbvrhGDegKsH+vDEisgtf7r2u6TcBwYy2ZEPHDA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 16:40:41 +0100
Message-ID: <CAJTo0Lb3_R+=uX-QTE_60pQ4N=xNS0fqCZ3jiQLhAZZaEotFgQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmV9BNTTZ7AVFBxLBskYnDRm0K/zbVZc05hQs340yeDRUVQWjH5AMYO3A2y+mKBNQTgyLw1XufZNUQbyw8w561l4Oh7L8wpn+wKTPVDJfPrHOK16ANB/xcjO6sic2PkyerX+5RZKx8FIxR3ZGgcoSK559xRmY21qM+dNLCFA6RG2LMaKfIeoY01Tl1XjsoLogDVG6LO
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] Danny stable release branch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 15:54:34 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 16:35, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Who's the maintainer for the oe-core danny branch?
>
> I hope there's no delta between oe-core and poky one so Ross is the
> maintainer as far as I know.

Correct. Poky is literally oe-core+bitbake+yocto-docs glued together,
no work happens in the poky repository directly, just the "upstream"
repositories.

Ross


