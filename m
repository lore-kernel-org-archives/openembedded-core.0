Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0aBC-0002z8-73
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:01:58 +0100
Received: by pbbjt11 with SMTP id jt11so719501pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:53:35 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.68.226.170 as permitted sender) client-ip=10.68.226.170; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.68.226.170 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.68.226.170])
	by 10.68.226.170 with SMTP id rt10mr4873679pbc.127.1330008815903
	(num_hops = 1); Thu, 23 Feb 2012 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=GGpmW25h0AyxoAliDYurYlex4eXeYMnMhqlVJn9J4/M=;
	b=I69egZK+Rgxmdo9IlXfyg/gh56LYK4KRI4BUD/WwECvoqlLZu2kwz1qVLHZyPBDZvk
	z9maDuuT5ChJG3sxMxX7VtzjG875CQopz99HjoGKbHSfEuP7xaHoGRvFBypB7d1D5eOJ
	Ld7TD7VOG2aG9cT4+AcFZCmF7gIQf9eqojUMk=
MIME-Version: 1.0
Received: by 10.68.226.170 with SMTP id rt10mr4149287pbc.127.1330008815859;
	Thu, 23 Feb 2012 06:53:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.210.71 with HTTP; Thu, 23 Feb 2012 06:53:35 -0800 (PST)
In-Reply-To: <32a9dc576917167f6c2392c822abf54fba58eaf2.1330004039.git.richard.purdie@linuxfoundation.org>
References: <cover.1330004039.git.richard.purdie@linuxfoundation.org>
	<5c6b81ada0814d1947d89120867bb9a4a5b0fa85.1330004039.git.richard.purdie@linuxfoundation.org>
	<32a9dc576917167f6c2392c822abf54fba58eaf2.1330004039.git.richard.purdie@linuxfoundation.org>
Date: Thu, 23 Feb 2012 12:53:35 -0200
X-Google-Sender-Auth: quNbQme2YYvEUwroddC16jv6B18
Message-ID: <CAP9ODKprbhrpzGo=_Qd+JBcvVkKWaS0=TgVM7XmApC2QPYG3fA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/16] libusb-compat: Address unpackaged files warning
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
X-List-Received-Date: Thu, 23 Feb 2012 15:01:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 11:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> WARNING: For recipe libusb-compat, the following files/directories were i=
nstalled but not shipped in any package:
> WARNING: =A0 /lib/libusb.la

Why not drop it?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


