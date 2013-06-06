Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 601FE6A4AB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 15:11:04 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id k14so2272664oag.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2013 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=w7rFHyADbmLxIh5aIN6IPRMdgPXc0yoIaQ+EyaLDruU=;
	b=ZYA6fYseYB0hZpLK57UB//JVNywIzSxRJbWJxtfGi6Tad5KXbAG0qqtF42PE9masLL
	A/136cjvZDB6fEljYCHSFPQ0XdWWvJMfsw1xs+TM41eFGFYrP/AJDo854U0BCBVXJNmV
	rkWrr1kzDTix0POkt+CYSJfek9+3tNdjtvWhsX1B0J3AYZ9430AvVPhrKMxys8APTY2P
	Z/CJw065esraEBZPQgGuDQEuJJsfCKqJrgUKRjzWC6O7mRH4oDJbBrDP2ibZjr0T7NI7
	rI2PPWCb8GLPV92XEOhoC8JWC2M73epfhQHqty9+xrL3QebR7vvLObCio/8EaRYID5qU
	KiCA==
MIME-Version: 1.0
X-Received: by 10.60.145.143 with SMTP id su15mr2343830oeb.65.1370531464961;
	Thu, 06 Jun 2013 08:11:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Thu, 6 Jun 2013 08:11:04 -0700 (PDT)
Date: Thu, 6 Jun 2013 12:11:04 -0300
X-Google-Sender-Auth: tSzj1IbN-ZOXJkIL-QAdPOxx5rY
Message-ID: <CAP9ODKr9zNQENpsL_ASoKRWEfTauWhRx07Ps46=5u3D5=XXxng@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Linux kernel build dependency of 'bc'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Jun 2013 15:11:04 -0000
Content-Type: multipart/alternative; boundary=047d7b5d48821fb46604de7db939

--047d7b5d48821fb46604de7db939
Content-Type: text/plain; charset=ISO-8859-1

Hello Bruce,

I got a build failure in my auto builder; it has a very lean system install
and it spot something it is new for me. It seems the kernel now depends on
'bc' util.

I tried to find a 'bc-native'  and couldn't find so I'd like to know if it
is a known issue and if someone is already working in a 'bc-native' recipe
to proper fix the issue.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b5d48821fb46604de7db939
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Bruce,<div><br></div><div>I got a build failure in m=
y auto builder; it has a very lean system install and it spot something it =
is new for me. It seems the kernel now depends on &#39;bc&#39; util.</div>
<div><br></div><div>I tried to find a &#39;bc-native&#39; =A0and couldn&#39=
;t find so I&#39;d like to know if it is a known issue and if someone is al=
ready working in a &#39;bc-native&#39; recipe to proper fix the issue.<br>
<div><div><br></div><div style>Regards,</div><div><br></div>-- <br>Otavio S=
alvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. System=
s<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.o=
ssystems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com=
.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div></div>

--047d7b5d48821fb46604de7db939--
