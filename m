Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QSAzw-0003BA-GU
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 18:43:52 +0200
Received: by bwz5 with SMTP id 5so1263591bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2011 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mRBDSXbF5a4VYqluR4f5Mzmo4UIpCwbUxClpkoucddw=;
	b=oXFBiU4wTvYRJEg31c9wCpc5TQ1KgRD0GVnTfSlY8Jqdd7OG962khzi5LvAskRBb7n
	s8IG4GNCfk+nek7eB8zzpXfp5rLsGK7mbd8NmAnW6g1FDbK1WHeh4a1r3jNHPYMikjUZ
	OkHMtmbEENjNUfpOYqLzQmT3qfDXC+IZtEMvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lDwN2k+26x2156EXze5m8YhQEVQwQbkjWYLXHLXelM+EC76LVJL7J/lUUhoYay+xk4
	qV67Pp+G8sV79jWAPiBxmqqR0K6PkgE43dh5XEFJZIR2q04Zw/w22m3bWTjfbw7jy2yG
	6bdapm5Dv8MWVAhpM9W1ktg/aLin8Kh3VJINs=
MIME-Version: 1.0
Received: by 10.204.47.18 with SMTP id l18mr968891bkf.31.1307032840223; Thu,
	02 Jun 2011 09:40:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.203 with HTTP; Thu, 2 Jun 2011 09:40:40 -0700 (PDT)
In-Reply-To: <1307032661.27470.581.camel@rex>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<e96c2e88aaf1cd22faac3b7ae61ccf34adfe92ba.1306958862.git.otavio@ossystems.com.br>
	<1306960665.3119.11.camel@lenovo.internal.reciva.com>
	<BANLkTi=q-bMwYtjTAqAXeaB4QQ_n85y8Rw@mail.gmail.com>
	<1307032661.27470.581.camel@rex>
Date: Thu, 2 Jun 2011 16:40:40 +0000
X-Google-Sender-Auth: zLp2wBSKNCXbkml1lu3RIZa52Ek
Message-ID: <BANLkTi=i0cOaa=w=Fvt0XkUmXAkOj+tFFw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] busybox: enable mdev by default
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
X-List-Received-Date: Thu, 02 Jun 2011 16:43:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 2, 2011 at 16:37, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I'm afraid I'm with Phil on this. I don't like the idea of enabling
> something we don't actually use. This really needs to become some kind
> of configure option which would at the same time disable/replace udev so
> the patch in its currently form isn't acceptable.

I'll drop it from my tree since I am using an bbappend on our local layer.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


