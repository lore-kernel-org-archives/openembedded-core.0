Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 077976067C;
	Mon,  3 Sep 2018 19:53:01 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id g44-v6so1626730qtb.12;
	Mon, 03 Sep 2018 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CZpJtGKeHOLD/hsPqcUUAnkd70BA/2aaOHbeyiNT548=;
	b=kh9qrvnAUAsfdY0mF4Dw5Qrb0kc1RsPihQPVpUXgxDNQhQ5RuiX1y7r+uhYwHlC0rB
	LuJcQbiPwY6YQifelNrf3KYOmbLPCR0oxIJLGpyoBhesp8AaqPbnzeT9R/oNwkSBU147
	u3l7kMRBiilz0gqLaU6uRosfxn28V2nM7EhBgC/+H2LsbIpy4jRNGBngsG1Gvc5WIs5f
	ffi/Ll+hDpCBdT3J/8x2RgNcK3Fz1w+MJAsu3hYtLrPGYlIvSHFVVOl7fImPawS9jyGY
	c46wNFfGF0eyxuQ52aNLWCDbjlhdmd7gft/yOlZ9K1kFr+L+6WHj1dSZNa66psQMYzOB
	3G2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CZpJtGKeHOLD/hsPqcUUAnkd70BA/2aaOHbeyiNT548=;
	b=pnoaqH551kV33lve6NQfa58DHJraoJbMcH8QFI7HmN7LxY11PcdpPKbQl1uPnc0jUE
	PslIhMOqSHPClto8rwYGHyEVlw+l/ms94GzAutILJHWt/2eah671gpxJGeRypi+zx279
	i5MCfJcbfFTAX+oueoxyMoMxlFkx8gTIZnMmJUwLCcfbGeOeXQBiSx4mXNCXr7mVcg0i
	l55HyMi3D9A+GMKjMkY56pgF27vzR4E+aLs9kqQ42p9tRfYBaVPBVsfv3hiVWgOxTlh+
	CcSKE1O6zuEbqk8Tm4+CZE79iUYi8nvxyY5gLHQRiVz52ZywG5fHYPue12QG/pom5PEZ
	sO0Q==
X-Gm-Message-State: APzg51ATaO4gUnuAso0O23Hk5mObSuZQAm9rnnq33QsOax3RjLsYSR+B
	WrxAsj8eGndXw2UpzZ0MQHssHZWhSOXMlXFp2opRPTWP
X-Google-Smtp-Source: ANB0VdaOExNzA+3dpR6w5RdDlqH51+hIYEnsVgp4Ibie0cUrbIUGSfoR+MzBfsIGJxLkD1/XYY0cQSCB0pRfz+uLn1s=
X-Received: by 2002:ac8:32ea:: with SMTP id
	a39-v6mr28030649qtb.234.1536004382465; 
	Mon, 03 Sep 2018 12:53:02 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Mon, 3 Sep 2018 22:51:14 +0300
Message-ID: <CAGCTLNRLn3MzQakECzUXpfrC+gw_QdudgYxBn-GuU4FGChKt9Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][qt5] : Text is hidden in Qt5 apps
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
X-List-Received-Date: Mon, 03 Sep 2018 19:53:02 -0000
Content-Type: multipart/alternative; boundary="0000000000009721950574fce34a"

--0000000000009721950574fce34a
Content-Type: text/plain; charset="UTF-8"

Hi,
I built custom image based on wayland instead of x11
it support Qt5 apps.
I built simple Qt5 app and tried to build it for the custom image to run it
there.
the application is work but the text is hidden !
The same for the test app "Qt5_Cinematicexperience"
No text at all for all films.

Thanks,


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000009721950574fce34a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I built custom image based on wayland i=
nstead of x11</div><div>it support Qt5 apps.</div><div>I built simple Qt5 a=
pp and tried to build it for the custom image to run it there.<br></div><di=
v>the application is work but the text is hidden !<br></div><div>The same f=
or the test app &quot;Qt5_Cinematicexperience&quot;<br></div><div>No text a=
t all for all films.</div><div><br></div><div>Thanks,</div><br clear=3D"all=
"><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div=
>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div>

--0000000000009721950574fce34a--
