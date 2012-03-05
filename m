Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S4f5y-0004Vi-NE
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:05:26 +0100
Received: by vbbfr13 with SMTP id fr13so3979425vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 12:56:51 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.68.241 as permitted sender) client-ip=10.52.68.241; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.68.241 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.68.241])
	by 10.52.68.241 with SMTP id z17mr37386223vdt.97.1330981011526
	(num_hops = 1); Mon, 05 Mar 2012 12:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KvFknQ9vA2/Nk8mC/TBVIqdMTRzE2LhMlCOk6WR0yIQ=;
	b=bUu1DvoRyCr5+Oao6kvu5RVN/GGGhzLlkV4lcaYC5V21a1+tkYAiytbARlAx6dEn/b
	OC8nk87in1ZFL+EAyegqYxIJTmFXVpaSazWGXHwNmtsiLoCvpYi7yY+ZyoAqK9FEfduj
	MO4gAT+CS6mFGjwLwCKkvsuob/6GXADhD9wb4bhEzqjWdYb7ru4zT/x/vp6eehTCMkM/
	zazDk2i5Ji2FiPhGISVai0BLOsWjJ7x0Sdf3sp8gIQwrUbVziTRoB8WCUJPwIZyTtlpT
	n+z0HO5Lu03vMikVndby97bUbZghL29JDee8HNT0id6CTdDIOKJRAjOCNxlVwd3wuwRs
	WcRA==
MIME-Version: 1.0
Received: by 10.52.68.241 with SMTP id z17mr32009211vdt.97.1330981011262; Mon,
	05 Mar 2012 12:56:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 5 Mar 2012 12:56:51 -0800 (PST)
In-Reply-To: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
References: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
Date: Mon, 5 Mar 2012 17:56:51 -0300
X-Google-Sender-Auth: TM7HyKfXWhTKs4Kc_m0j4V6uRTU
Message-ID: <CAP9ODKq_JrKF4LJwRt5Fcg79+xQfdVQqPBJZyq_=Lv7zu36koA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: read only rootfs?
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
X-List-Received-Date: Mon, 05 Mar 2012 21:05:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 5, 2012 at 17:39, Cliff Brake <cliff.brake@gmail.com> wrote:
> What are the best practices for implementing a read-only rootfs built
> with OE? =A0I've looked at a few things like poky-tiny.conf, but figured
> I would ask.

You could the image feature for it; depending on the image complexity
it might just work or need few fixes for some postinsts to work in
offline mode.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


