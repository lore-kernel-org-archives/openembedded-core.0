Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S20nY-0001Jb-9n
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 14:39:28 +0100
Received: by vbbfr13 with SMTP id fr13so903720vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 05:31:01 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.71.80 as permitted sender) client-ip=10.52.71.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.71.80 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.71.80])
	by 10.52.71.80 with SMTP id s16mr6554897vdu.131.1330349461551 (num_hops
	= 1); Mon, 27 Feb 2012 05:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=29SuQ2TiWliNLK1LZRXmAGIuk/kjiw+EaBSQXcwbyBY=;
	b=xSgLnHS7hbOsNe/Wd+REGK5nB6tTlqm0ZobJVRd4sSSnH0QqXcjunr9R5hQElyonDQ
	kSeXZUSb/SeA715uqlQpgzaOSpsoxkTkZJI+/iQ6TiQSX9t2OPzAnZ2lxH4VevekqIhc
	+e3QuoiON+cX+mU7O4CkB/YybgE8mN+FcwJBQ=
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr5290228vdu.131.1330349461392; Mon,
	27 Feb 2012 05:31:01 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 27 Feb 2012 05:31:01 -0800 (PST)
In-Reply-To: <4FDB63C3-5AB6-45B2-8662-D302D8936B2A@dominion.thruhere.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted>
	<4FDB63C3-5AB6-45B2-8662-D302D8936B2A@dominion.thruhere.net>
Date: Mon, 27 Feb 2012 10:31:01 -0300
X-Google-Sender-Auth: G36QBBiCaex-wNSGzoFcIS9fYZI
Message-ID: <CAP9ODKr5_P=62V2TstE_bX8-jn6RXxcs2swT6E9ojGox6diRhA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 13:39:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 10:26, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
> 1) a package with /etc/rpc, /etc/hosts, /etc/protocols and /etc/services
> 2) a package with /etc/network/interfaces
> 3) a package with the initscript (probably move that into the ifupdown pa=
ckage)

I like this idea a lot :-D

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


