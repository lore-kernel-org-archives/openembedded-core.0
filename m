Return-Path: <mackeyme9@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB6D65CE8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 15:58:50 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z19-v6so5184385ioh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Aug 2018 08:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=V9g0gWk4UnSAPUUjXTfDzSdf8S5NhvcXcrlFQtCNbzQ=;
	b=qQh189odUgc/NXz8JYyXOKzXvSMG6J8SKHGp1fDh0Rpq+33cVggE+RZMluNhCie7XE
	QJ6DCKk0iYiamf360PBCAj7NwyZdQyu83fixReOtm3tpsfO4li6+L/Flesz2rABQunVP
	Q5X71P11k7r7HRnNMhXiDrHggnqYgBtdHbr09NuPExSu3e5o5TsKZOyKYW9hsu0s9uVB
	KalUzjHK6FOmEV1SOMGyyKqR6FX9P9OUGmeo5Q07Elh7zUfAuk291v/bVttIc4J412kG
	AvaHUmcfjX4YTFj7wVDX9OtCPmdbIoeevVDaSOO/hAHJ/lYuIMfTGeeVr3gEkzieKYKd
	k/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=V9g0gWk4UnSAPUUjXTfDzSdf8S5NhvcXcrlFQtCNbzQ=;
	b=QG7jrPrAhgs8E2IhdWiTKAIm8wHgM9D15AWA4e50vNci4BXrwzncdmTu+xBtcM9xDt
	sJgMW6ri2VZSwfjnTrs+ptBuYK3OQ6Hrc6syJsfmcApF1g4vgb9+YEOX7hYxCcvXDJbX
	+fiRowcM/f1QPdbQ0qy2qUwzSxhrCVb+3lQ1qj6yewbB7q77l/9H1GLYEIZmssdN1qMY
	kpu1FrE112Oj978Z2Zqeh7r8CZoN4V4XDuB5xwOc9WCq4KhD1rpe0+DLvKiQhHw9aQlD
	T/syvqX5m7JBfmraA9KO2VZaHkVw/xpnY6Yi88tdIgxCZifSCnrFthkcmiqpBZ71OUJ2
	CJag==
X-Gm-Message-State: AOUpUlElnoPBE4qTpK1OYOKI6Pc26rsLfI6jfOagfvAhnpq3Fxe9wPuM
	El8fiHCZKvwF/NhHrhqqxhLufGlV/lBmw9VSDLvmKiZE
X-Google-Smtp-Source: AA+uWPyI7DHl/hGk6dLjD3Ajm2VWC9UDJYwkQq51nl8ymA72BLo2rbT5HnTHiwjjJfoLa0+f20qf5ezRIAyLlz8zYe8=
X-Received: by 2002:a6b:515:: with SMTP id 21-v6mr2141584iof.135.1533830331083;
	Thu, 09 Aug 2018 08:58:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:92a3:0:0:0:0:0 with HTTP;
	Thu, 9 Aug 2018 08:58:50 -0700 (PDT)
From: Mackey ME <mackeyme9@gmail.com>
Date: Thu, 9 Aug 2018 10:58:50 -0500
Message-ID: <CAON=kTCVuf87Qh3Gmsn1EvXJsKvwp3FRF5M=YdvbSCpBt5Nhaw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: upgrade openssl to 1.1.0h (open embedded yocto project)
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
X-List-Received-Date: Thu, 09 Aug 2018 15:58:50 -0000
Content-Type: multipart/alternative; boundary="00000000000007aeaa057302b4b4"

--00000000000007aeaa057302b4b4
Content-Type: text/plain; charset="UTF-8"

 Hi,

I am writing this email with reference to upgrading openssl to 1.1 in
open-embedded packages in yocto project.
I am using older version of open embedded (yocto project version:
2.3872.08518) for one of my projects and would like to upgrade openssl only.

Please help me identify the dependencies and let me know the changes
required for a successful upgrade.

I am building this project for linux arm7 platform.

Thanks,

Manoj Enaganti

--00000000000007aeaa057302b4b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Aria=
l,sans-serif;font-size:12.8px;text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">Hi,</span><div style=3D"font-fami=
ly:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:1=
2.8px;text-decoration-style:initial;text-decoration-color:initial"><br styl=
e=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if"></div><div style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif;font-size:12.8px;text-decoration-style:initial;text-d=
ecoration-color:initial">I am writing this email with reference to upgradin=
g openssl to 1.1 in open-embedded packages in yocto project.</div><div styl=
e=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if;font-size:12.8px;text-decoration-style:initial;text-decoration-color:ini=
tial">I am using older version of open embedded (yocto project version: 2.3=
872.08518) for one of my projects and would like to upgrade openssl only.</=
div><div style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,A=
rial,sans-serif;font-size:12.8px;text-decoration-style:initial;text-decorat=
ion-color:initial"><br style=3D"font-family:Roboto,&quot;Helvetica Neue&quo=
t;,Helvetica,Arial,sans-serif"></div><div style=3D"font-family:Roboto,&quot=
;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:12.8px;text-deco=
ration-style:initial;text-decoration-color:initial">Please help me identify=
 the dependencies and let me know the changes required for a successful upg=
rade.</div><div style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helv=
etica,Arial,sans-serif;font-size:12.8px;text-decoration-style:initial;text-=
decoration-color:initial"><br style=3D"font-family:Roboto,&quot;Helvetica N=
eue&quot;,Helvetica,Arial,sans-serif"></div><div style=3D"font-family:Robot=
o,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:12.8px;te=
xt-decoration-style:initial;text-decoration-color:initial">I am building th=
is project for linux arm7 platform.</div><div style=3D"font-family:Roboto,&=
quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:12.8px;text-=
decoration-style:initial;text-decoration-color:initial"><br style=3D"font-f=
amily:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"></div><=
div style=3D"font-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif;font-size:12.8px;text-decoration-style:initial;text-decoration-c=
olor:initial">Thanks,</div><div style=3D"font-family:Roboto,&quot;Helvetica=
 Neue&quot;,Helvetica,Arial,sans-serif;font-size:12.8px;text-decoration-sty=
le:initial;text-decoration-color:initial"><br style=3D"font-family:Roboto,&=
quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif"></div><div style=3D"f=
ont-family:Roboto,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;fon=
t-size:12.8px;text-decoration-style:initial;text-decoration-color:initial">=
Manoj Enaganti</div>

<br></div>

--00000000000007aeaa057302b4b4--
