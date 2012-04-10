Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SHZMx-0001n7-24
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 13:36:19 +0200
Received: by vbbfr13 with SMTP id fr13so3154659vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dLJ2bDyDlBJDYfEVM4hms8L1L/lk0wSo4WoDkCuw/+A=;
	b=W3lj3B3piBzP+ZMiOAQUp3o/jVWDrXDRIYCDHrz53V7418HIOp+KCy1Oiyrfotiedk
	1b3ev1TL/DtFCyFbXjxcAUpAmq+rAktLLip0GvuVm+jdHawDZanIt5N/04F4WFqCu0/e
	5T0f2UPnqUyvTv8OSKEx6HWRLVdUnamo2qNkmcsBZdl/YYpZBLZ4PhuJ8wRLCYh9kvD4
	+wYIAtAXlcNsDb8Ug5ORNdzrB9UPHxUDO3BwuJ79m2jcDc9QROcRC+6uWA49nMAzkj0o
	XSWpxdz4HhKbX2c9tSKpQ8Hki2ERWSpvwuwlnbXv8RoTI8xbv/jyz92R2bUqzfNI+qkz
	hukg==
MIME-Version: 1.0
Received: by 10.220.156.72 with SMTP id v8mr655228vcw.45.1334057221093; Tue,
	10 Apr 2012 04:27:01 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Tue, 10 Apr 2012 04:27:01 -0700 (PDT)
In-Reply-To: <3FB0FE38-93D2-44D1-9BFF-2E742A8BEA92@dominion.thruhere.net>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
	<637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
	<CAP9ODKrEiLo7DMkNBks8s8jHw=WgTQ3S_zf-QUYSseLqD5tMEQ@mail.gmail.com>
	<3FB0FE38-93D2-44D1-9BFF-2E742A8BEA92@dominion.thruhere.net>
Date: Tue, 10 Apr 2012 08:27:01 -0300
X-Google-Sender-Auth: IylrCFOkZ9_Kxk7oIF21zQIZDLU
Message-ID: <CAP9ODKrkEomQ+7G5eRAwhKCWiKezAEKwboTfZG8C3sAEdo9PGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
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
X-List-Received-Date: Tue, 10 Apr 2012 11:36:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 08:24, Koen Kooi <koen@dominion.thruhere.net> wrote=
:
>> Can you clarify what is your concerns?
>
> It changes the default behaviour. There shouldn't be any behaviour change=
s so late in the release cycle.
> And apart from that, it should use PACKAGECONFIG :)

I agree about PACKAGECONFIG but this behaviour change seems acceptable
for me since most users won't  be using 3g and will be not affected by
this.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


