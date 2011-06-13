Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWGQu-0003tC-Eo
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 01:20:36 +0200
Received: by bwz5 with SMTP id 5so4899229bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 16:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OPfRfbJ5lIIgvvLO+SeNjej7FEyyb2oBnNSXENwZ65U=;
	b=f6mNsYI90ohgkeHk7+lKwOGdK3vhV6E1mgucp7VD+WqpmtuYTTLejoU/F8+428zr5J
	KmJHa1h3GC0PSzHdZiGH9N7C5ZPMC+v4yW1iWfmMT8uTQlBFbzhxbtHiyauGdcPi2IYf
	bV/bgmN+Ppjf9SqyM+x1tKKFBUbR9VJ1erSUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=oTiW3uGFwLxCqGKd2XWKX9Ut0JOpBoMQ7IQBfENe1RoCKl0tCJyZcunj9CXElNfimZ
	Zi6t2qfowXipjH8mQO5aXr8v9o6YCmzKr6hZX4LQlhHtWsuZuYzRjemEljvq1EemVpYv
	OG+aEn/dbeg7Z0RyWiC02aqvSsjwru8Th++Pc=
MIME-Version: 1.0
Received: by 10.204.39.65 with SMTP id f1mr5221686bke.157.1308007028116; Mon,
	13 Jun 2011 16:17:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 13 Jun 2011 16:17:08 -0700 (PDT)
In-Reply-To: <1308006251.15712.309.camel@rex>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex> <4DF68AD4.1020403@mentor.com>
	<1308004543.15712.297.camel@rex> <4DF692CA.3030000@mentor.com>
	<1308006251.15712.309.camel@rex>
Date: Mon, 13 Jun 2011 23:17:08 +0000
X-Google-Sender-Auth: fT-l2tSoLymUV3Racom3pJ82VPY
Message-ID: <BANLkTi=035xAQJS5kwhUGvDiGsanfD_FKQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Where is atom-pc.conf hiding?
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
X-List-Received-Date: Mon, 13 Jun 2011 23:20:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 23:04, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> So on the one hand I do understand your concern. I'm personally and
> Yocto are doing the best we can. On the other I'd suggest if testing
> certain combinations is this important to you (or Mentor?), stepping up
> and helping with the testing would be *much* appreciated and it isn't
> the sole responsibility of myself or Saul.
...

It would be easier and better if people at Yocto could start basing
their work on oe-core so stuff get tested there instead of Poky. Poky
would then be an integration point not a base.

More then once I got broken trees for stuff that were pushed to
oe-core and were not working due missing fixes or features that were
pushed to Poky's bitbake but not to the upstream one.

Doing this would help to improve it a lot. For example meta-intel
would be already fixed since people would be using it against oe-core
and would have already noticed the missing machine  definition and
like.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


