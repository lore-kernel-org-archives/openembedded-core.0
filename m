Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QWFWs-0002hq-DV
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 00:22:42 +0200
Received: by bwz5 with SMTP id 5so4865224bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KHpc/GZSdAz0zEQ0xIpJnMBuEObLLW0MBLG3bKTissU=;
	b=cKd4G9TsZq+4BVk78gUj1nO3bcj6YwvhVssTOnQ9BSfGDPikO3gYsJmLopSeojFRJs
	F7uERDqULeqUXAt7+O+HvoJ3qAh9boT7nqgQTj2EgbTFKJT6CcVKN+6R8/vg7Aqs1aKh
	r2iFq6DwpyELIda59g3apouGmxTVhfaJyA9Xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=RFdjJIj41QYDmsyEJCexamdXe/UVc3cLDQZ4Qh7ptfjcAXC8hukIqIdV6T4SMq5CZk
	V3OT4ifuX9ByCcLyWCQPUqkz8JMkuBA6o2SEiiHPBX6Lo3WJRriwIJH0GdemjDfDsnrs
	p2QjVwWU/tUU0uWGY0wZZ1SsXW3d8QZ2XcZrk=
MIME-Version: 1.0
Received: by 10.204.74.9 with SMTP id s9mr2551938bkj.184.1308003557750; Mon,
	13 Jun 2011 15:19:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 13 Jun 2011 15:19:17 -0700 (PDT)
In-Reply-To: <4DF68AD4.1020403@mentor.com>
References: <46ED2218-6735-449C-B10C-D557B92DA339@dominion.thruhere.net>
	<4DF672F2.2030909@linux.intel.com>
	<49501374-7FBE-400E-A91B-BD7EBD7FB65C@dominion.thruhere.net>
	<1308000620.15712.288.camel@rex> <4DF68AD4.1020403@mentor.com>
Date: Mon, 13 Jun 2011 22:19:17 +0000
X-Google-Sender-Auth: nDsccNDdYhZtdBMg1zmU2D_pxOM
Message-ID: <BANLkTimSnE4xh8Ny28OKWF6Y3zwcbCeM0Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 13 Jun 2011 22:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 22:10, Tom Rini <tom_rini@mentor.com> wrote:
> Until then, and even afterwards can we please get some testing of
> non-poky builds done? =A0I know the autobuilder is full but can't we toss
> a few things onto a personal box and try that a few times a week?

I think this ought to be the inverse. Poky ought to be less built
since it depends (or will depends) on oe-core so this needs to be
fully tested. After this passes then Poky and Yocto ought to be tested
since the base has been proved stable and like.

My 2c.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


