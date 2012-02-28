Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S2CHf-0001W8-3W
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 02:55:19 +0100
Received: by vbbfr13 with SMTP id fr13so1631414vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 17:46:51 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.71.80 as permitted sender) client-ip=10.52.71.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.71.80 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.71.80])
	by 10.52.71.80 with SMTP id s16mr9482530vdu.131.1330393611812 (num_hops
	= 1); Mon, 27 Feb 2012 17:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ZpRcwZWXdxEyZ/caBqUTxk0cVXBplWVKjayZPSUA9DQ=;
	b=Vip6XjE8GNh0Kn4BM8D+y24l4/CkFvbwNVVs8mpTpVl4aCGzXHRcNCvFYlxINLBqdy
	D+b+JkQVkb7SjX7wCngCzYJFOehAuVg7+UWSdRCALUDv8LPSdjEfbCX0PxHt7NwPXq3d
	WpBtBSyRW25PYDekwS5SyEWnNdS3U4wOEmRpk=
MIME-Version: 1.0
Received: by 10.52.71.80 with SMTP id s16mr7812667vdu.131.1330393611683; Mon,
	27 Feb 2012 17:46:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Mon, 27 Feb 2012 17:46:51 -0800 (PST)
In-Reply-To: <4F4C279E.8020801@opendreambox.org>
References: <1330362610-12851-1-git-send-email-obi@opendreambox.org>
	<CAP9ODKr1faEWrO877gfeMkutp8_STOvNp81iA00uiC0w46A1qQ@mail.gmail.com>
	<1624619.CXJLtNuTG7@helios> <4F4C279E.8020801@opendreambox.org>
Date: Mon, 27 Feb 2012 22:46:51 -0300
X-Google-Sender-Auth: t8vMm_f1pOL1ptM5f1FJ7q1fFUY
Message-ID: <CAP9ODKo=z7tARxZ1yc0sFWf8nhnPn7px9WwyGOJHksC7shqTnw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] qt4.inc: depend on tiff
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
X-List-Received-Date: Tue, 28 Feb 2012 01:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2012 at 22:02, Andreas Oberritter <obi@opendreambox.org> wr=
ote:
> In this case, bumping PR just wastes everybody's CPU cycles for no gain.
> Anyway, here's an updated patch:

Not really; let's say if you had done a typo on the depends list it
would be unnoticed in autobuilders and commited onto master.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


