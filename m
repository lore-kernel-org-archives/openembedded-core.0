Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QbJ7V-0004qQ-Hd
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Jun 2011 23:13:25 +0200
Received: by pzk36 with SMTP id 36so3661959pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2011 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=+gX4+0UjfnFhYmgHZ0Q+fI3h26G5F+rPDr0ayP9TXgI=;
	b=Su4/7P01WnbhnIknOyOa3rVNwk1CGOpCQ7RbXnTirI8CSqCM/x+1XlwKGS3JT0nd9Z
	ADSSmsubgjbJkkEyjziGSdEh8OXcpd3JtCAD0Qo1mJ5QHEfZsYSmo+Cw/fNWZLaAtXs5
	sUspaZNnQrSeZ8TTfYgMYHXKjr59gUQNvEP2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ZEIJAvxSEIAQ/69quBF9Gr+4Hgz6Loch3wrA5tx0CZ7PNgMSdpoFnGyjsU0JSV1nqk
	TeQnUrzvg7MfY89bnf7Zw7UsEoXb2D1uRQtRs48pWBvXbAFrPp6a+FL3+Z9C999lrP8v
	RmB7cSVKQnzGIfp81WLG0R0ABDuBhdoWg4WBg=
Received: by 10.68.22.2 with SMTP id z2mr3428971pbe.428.1309208984056; Mon, 27
	Jun 2011 14:09:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.105 with HTTP; Mon, 27 Jun 2011 14:09:14 -0700 (PDT)
In-Reply-To: <1309207282.3035.3.camel@lenovo.internal.reciva.com>
References: <CFB391EB-D84F-4616-887D-DAFAB036EA42@dominion.thruhere.net>
	<4E0699D1.9090308@gmail.com> <4E074ABB.80405@gmail.com>
	<48356C52-61A1-42BE-92AA-704FB136D8A3@dominion.thruhere.net>
	<1309167774.21613.264.camel@phil-desktop>
	<8815E10D-6790-48AD-811D-5BE977A17380@dominion.thruhere.net>
	<1309170035.21613.289.camel@phil-desktop>
	<BANLkTimbUn+g6wsnH6661GWT3kbg_WxTLw@mail.gmail.com>
	<1309207282.3035.3.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Jun 2011 14:09:14 -0700
Message-ID: <BANLkTim3LtS=6+t_4e+8EnjUu9nwf5UVFA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc-cross-kernel problems
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
X-List-Received-Date: Mon, 27 Jun 2011 21:13:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 27, 2011 at 1:41 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Mon, 2011-06-27 at 13:15 -0700, Khem Raj wrote:
>> you need to include gcc-package-cross.inc using
>>
>> require gcc-package-cross.inc
>>
>> in the newly added gcc-cross-kernel_csl-arm-2007q3.bb
>> and all should be set.
>
> That'll cause it to install "gcc" into the sysroot though, right? =C2=A0I
> guess you could use a do_install_append to blow it away again, maybe
> that wouldn't be so awful.

hmm the purpose of gcc-cross-kernel.inc is to override do_install
thats in gcc-package-cross.inc
I was trying to avoid duplication of code but you are right if the
symlinking part is done in do_install_append() then we can avoid the
duplication and still provide special do_install for
gcc-cross-kernel. But I think now a days gcc-cross-kernel is out of fashion

So I am ok with the patch Koen proposed based on your suggestion.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


