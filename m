Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S0Egh-0006J8-1P
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:05:03 +0100
Received: by vbbff1 with SMTP id ff1so150613vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 07:56:42 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.27.10 as permitted sender) client-ip=10.52.27.10; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.27.10 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.27.10])
	by 10.52.27.10 with SMTP id p10mr15455540vdg.16.1329926202294 (num_hops
	= 1); Wed, 22 Feb 2012 07:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=UONoAaHPOdv9XyNUxA6XWjhbRzRZhbDcGcrUxcnK0kA=;
	b=c97M4GPk6bG8KjOtbGOpLG8X27ru8ekjVBovN/pVneesm8IKoGdWriXmF1XAcUj1u+
	OzJSKDCEpnHUc6h5E8rzB6quFY+cEGkfBWZrnPVFyIa4qzT9ZUnr1nH/NfQjGsDj3OA6
	ce0K8sZBACT+NOqI33VUTliaWcUbm8a3W40a4=
MIME-Version: 1.0
Received: by 10.52.27.10 with SMTP id p10mr12659594vdg.16.1329926202234; Wed,
	22 Feb 2012 07:56:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.149.81 with HTTP; Wed, 22 Feb 2012 07:56:42 -0800 (PST)
In-Reply-To: <2032247.UMYq2ztU6u@helios>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<1329923198.20261.160.camel@ted>
	<CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
	<2032247.UMYq2ztU6u@helios>
Date: Wed, 22 Feb 2012 13:56:42 -0200
X-Google-Sender-Auth: OUCiRY6yFultLSqACxkWIXyorqU
Message-ID: <CAP9ODKo_94H_HkxHbvpe-hXpS6t0=5Dqv5QUSHPW+DsYJ=jncA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 22 Feb 2012 16:05:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 13:53, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Except here we are talking about a single patch that adds a single file, =
which
> is easily downloadable from the web interface. If it were more complicate=
d I
> could understand the fuss, but right now this is almost ridiculous.

It doesn't seem that easy; it seems Koen tried to apply it and it has faile=
d.

Besides, Robert didn't complain about people asking it to be resend.
Who is complaining is Richard and I am just justifying the reasoning
why it is more the logical to expect it to be done based on OE-Core.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


