Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3s2q-0005LF-UQ
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:10:40 +0200
Received: by bke11 with SMTP id 11so1616384bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xa3ivQJIxWuhpB31QQSDM/BkIuxibc5wEivGyEzXz/Y=;
	b=G+4K/8Ar0CHyjZFl1uMsTR89aLDVNrwsV7lV4i8EuqLTecfuXdx2S3FndJBGP5h3GS
	2YZfwX1onTek6lIZj/tEqad35Brb2O1OZR9ie/CEYwm2vvj7jsP7QsuNT9Nt16RxgCkp
	PJIE4kx8TKKQqeEJT3H8EH7gvTzm54ICOs4vc=
MIME-Version: 1.0
Received: by 10.204.138.69 with SMTP id z5mr12238bkt.197.1316016330476; Wed,
	14 Sep 2011 09:05:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 09:05:30 -0700 (PDT)
In-Reply-To: <1316016075.26879.2487.camel@elmorro>
References: <1315978760.26879.1858.camel@elmorro>
	<CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
	<1316015141.26879.2469.camel@elmorro>
	<CAP9ODKpsEx=05bVBVYvxLhuDfb=14gdZ2KaERrWCkHQYQOfHpQ@mail.gmail.com>
	<1316016075.26879.2487.camel@elmorro>
Date: Wed, 14 Sep 2011 13:05:30 -0300
X-Google-Sender-Auth: oGZD6VnWf3DwoA-uylFjUb0W8Pw
Message-ID: <CAP9ODKpkWUs+7QspzHAMHS5JBDuO_HP93wmX5LoiSAckpnNHsg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 16:10:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 13:01, Tom Zanussi <tom.zanussi@intel.com> wrote:
> Well, my new version handles both grub 0.97 and grub2. =A0We need to keep
> grub 0.97 around because grub2 is GPLv3.

Sure; fully agree on that but we can get rid of two different scripts
and avoid duplicated maintainence work :-)

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


