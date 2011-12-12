Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RaAlu-0003hp-7n
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Dec 2011 19:38:42 +0100
Received: by lami14 with SMTP id i14so52867lam.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2011 10:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YIAFPFgkFllzf9DEwDETQodOl8btzFDfZ7+Froa2Jxk=;
	b=MZmeNv1MBu/2JgY8Sww35gODky607dnuQZwPIRtD3YhNm/wYDECsj+gaDt/ZasQsxA
	imK05+H4rjwvKNjYZYRqkVVavzlpA4vWTAEKZ9QU4UeqChPL7358nt1d7FwPWQnLjlfu
	dSr0Lx+4WxdDBGYyNJSIoE6G0ZA0oAxGJkk00=
Received: by 10.152.104.206 with SMTP id gg14mr12798585lab.41.1323714704354;
	Mon, 12 Dec 2011 10:31:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 12 Dec 2011 10:31:13 -0800 (PST)
In-Reply-To: <1323714076.24417.100.camel@phil-desktop>
References: <1323477267.5309.206.camel@ted>
	<CAMKF1sre0Wk1C_m6sS8yM4-apZYeOYp=Va-Mm19jpXqukUjFBA@mail.gmail.com>
	<1323714076.24417.100.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Dec 2011 10:31:13 -0800
Message-ID: <CAMKF1srN_+EJcqT_UjOB4gM9RKsMNn4-LyZVa5iN08xBD7FW1g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow do_compile_kernelmodules to use PARALLEL_MAKE
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
X-List-Received-Date: Mon, 12 Dec 2011 18:38:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2011 at 10:21 AM, Phil Blundell <philb@gnu.org> wrote:
> Indeed. =C2=A0It's been that way basically forever; I think this was to a=
void
> a class of problems caused by trying to run "make install" with -j.

correct I wanted to highlight it since its important to know when we
write recipes
and have special compile steps


