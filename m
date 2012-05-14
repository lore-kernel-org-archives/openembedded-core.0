Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1STxHt-000515-7c
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 17:34:18 +0200
Received: by qcso7 with SMTP id o7so3461651qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 08:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=4sTUZI2pGm0oK3mAS0iLENgFrdFvZVLKAhoHd14r5qU=;
	b=Pc9wz6guCj87/wbdWekqbb/SXG62NqGBDMkxbNaTXa686bN9bVXXBaw3Uk2VwXy3bg
	dKI9QCmdUotfQq9MCb7ODWybdHnWNI2T1p89M5NS7zjNesNAmmGo2H265E+jkYdrdLph
	RiF9Z01d3xOl48sfqouDgcpAo2oOJFPLH+gGbsR2xQxCrl05YYLdX56XnLHsh1f/IY9/
	xYGz9H03mvoIMi0Fgom27HWYXGnJpYovojZtp6RM6HpIlDpx20rREhoyjLkVgiYd4n6R
	WPOXGS302nslY/Vj5YZzADdbCKIKAV/R/h+GUOWoOVXpHElPVM7IN2tcc+ucX8wdsPtX
	tIEA==
MIME-Version: 1.0
Received: by 10.220.115.81 with SMTP id h17mr5224449vcq.66.1337009057782; Mon,
	14 May 2012 08:24:17 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.152.82 with HTTP; Mon, 14 May 2012 08:24:17 -0700 (PDT)
In-Reply-To: <FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
Date: Mon, 14 May 2012 12:24:17 -0300
X-Google-Sender-Auth: pcFtDOs7KaeVkt-_JDn4kBRL8LU
Message-ID: <CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 May 2012 15:34:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, May 14, 2012 at 11:06 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 14 mei 2012, om 15:47 heeft Otavio Salvador het volgende geschreven:
>
>> The pkgconfig files need to be installed in ${libdir} instead of
>> ${base_libdir}.
>
> Thanks for the patch, I was working on something similar :) I talked with=
 the kmod and udev people and they asked why we want kmod libs in /lib inst=
ead of /usr/lib. I didn't have an answer to that, does anyone else have a d=
ecent one? If not, let's not mess with $prefix and remove all the do_instal=
l changes.

OE-Core try to allow the use of /usr in a separated partition so it
seems it is a requirement for it to work in initrdless systems.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


