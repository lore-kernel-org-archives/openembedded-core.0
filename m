Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0EsT-0006v8-BJ
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:17:13 +0100
Received: by vcqp1 with SMTP id p1so170297vcq.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:08:52 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.220.156.201 as permitted sender) client-ip=10.220.156.201; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.220.156.201 as
	permitted sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.220.156.201])
	by 10.220.156.201 with SMTP id y9mr12645095vcw.22.1329926932840
	(num_hops = 1); Wed, 22 Feb 2012 08:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Gf1kTaLOBBX8SJKJrgu03SPBfWmtQfEJMe7/71y5g8k=;
	b=rNy+P+QYmQwfxGsmSnRxaPVbYhw1GNYqmlBSzHCNtlRrqQjrRBhPWxxfVoWvjF6l5E
	dTy58LTxWc9Ljx93yf151gP7q8JkSVuxJwTeGj8uqU4apg98zysXCyG3n40+Yw22TLxx
	8ObrR6VGr0XbMr4xJkwl7yD2tFpx4ASZWmhRw=
MIME-Version: 1.0
Received: by 10.220.156.201 with SMTP id y9mr10192133vcw.22.1329926932528;
	Wed, 22 Feb 2012 08:08:52 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 08:08:52 -0800 (PST)
In-Reply-To: <1329926741.20261.164.camel@ted>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<287F5295-D8E2-4540-A20D-28D934EAEA88@dominion.thruhere.net>
	<1329920131.20261.148.camel@ted>
	<9FF37BD6-73C7-4056-B38F-BCC8740C5A95@dominion.thruhere.net>
	<1329923198.20261.160.camel@ted>
	<AB7E7710-28E1-4A2E-8822-CB710F839D7C@dominion.thruhere.net>
	<1329926741.20261.164.camel@ted>
Date: Wed, 22 Feb 2012 14:08:52 -0200
X-Google-Sender-Auth: uE2fo_HM4puVx9xjsdwJcmD7x1w
Message-ID: <CAP9ODKp2b6EeyJf==KqgB4+tM==p0rd2PSvFE20girHMf1Dyzw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:17:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 14:05, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> If its not indicated, oe-core is a reasonable assumption but providing a
> poky tree for convenience shouldn't cause quite as much friction as it
> does since it is better than no tree at all and some of us can manage
> them fine.

I fully disagree.

This is an OE-Core mailing list so it is expected to have patches here
based on OE-Core mailing list.

Mistakes are also expected to happen, as just did, and it is just a
matter of resending it to fix it. Relaxing it will make the whole
testing cycle a nightmare for all people involved in OE-Core.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


