Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SUP1A-0002Fa-JK
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:10:52 +0200
Received: by vbbfr13 with SMTP id fr13so48926vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=jUzuFYEq0cO4raw9z9c93rfSEc+DgeIMRL519pizqJA=;
	b=p3wW7/1a07dtKD2YpOjHlKOPSnbGEfkBVBOv4QIY75Geim4lQqrg1T9nv0TNN0IS40
	I7UpRAr7m+xJHX+Y75YXxdSWw6GJurp4sH2u1n0jFVodY/RXn6gzPeSr3Em5GJyfXMp8
	wK3Wnkbjwr3f8o4Bp1vJEUT2CulyQmRe/6Cmsw/qEHB/SIYwBs9j3+fhX7pQwnrzCR/h
	gFGsxSl0L38xfhSAaTiIrO4KZ9eAGQjaQgYKwDu8CTqpTLcecWqf4HDu4/2W01S3qT/x
	/LsG71S9sbOIKXdWFKYuOpXqN85JS8GRS/wzDhP/7Pfex62AUV7wq3XDnDLnDHHNpaUS
	Cr/g==
MIME-Version: 1.0
Received: by 10.52.97.230 with SMTP id ed6mr241037vdb.65.1337115651787; Tue,
	15 May 2012 14:00:51 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Tue, 15 May 2012 14:00:51 -0700 (PDT)
In-Reply-To: <CAMKF1spONAWa-N3=OK9fF9-+yuvKizoxfWEO_xQwZVZUUvZ17Q@mail.gmail.com>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
	<CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
	<1337104514.2711.45.camel@ted>
	<CAMKF1spONAWa-N3=OK9fF9-+yuvKizoxfWEO_xQwZVZUUvZ17Q@mail.gmail.com>
Date: Tue, 15 May 2012 18:00:51 -0300
X-Google-Sender-Auth: XuHzjw1idfjqWVkLhUDZXwg9OmE
Message-ID: <CAP9ODKpMeR64dX4rfe1QtWS6=E1NpMWVG6mYCZAmH0tQt7=1DA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 21:10:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 5:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
> I think this should not be made so mandatory in OE-Core IMO since none of=
 modern
> systems would do something like that.

I agree with you Khem; I think that systems that require this ought to
use a initramfs or initrd image for it. I see no it as not worth to
support it and the amount of hassle to support it is not worth it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


