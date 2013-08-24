Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 234656B8D5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:56:15 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id ma3so1921828pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=SKLSeh4oAI48Q0VNlZgHvsFQUeC29lwpZRVlD3ULGMI=;
	b=YJ2R1zuXG+6HsI7Qr8klEwaMXNpB9iAEg8tlyGSuIkUC0dglc0MZJKTMzM5+OsAn+d
	pMSih0O/hIcqwVYr6eln7j5sjn5WyeNcfaBICEqVyXN65znratzbiiAtJkGDMlq4It9Y
	HM1zP7nefNX6Y5OhhTwUGD+AAPCWAct9VuRBolwUkBWC58lJcpYyYwiuCdFIs71s1kR3
	CLZZsF/XEluNbG0KqLKZajPVwCg7whj9kfU0bAOBb/20oSSkbpvA2iwMm1ZX5T9Qz6Ih
	LIrtTFOHH49xa7wBVYLijBVL77Po96q3X2UGsXdK5Qjpf5vHS9uaQAgzKfUeDjw3NYek
	FEIg==
X-Gm-Message-State: ALoCoQk5TM6WHOuDKD0cJf7xKdfZIKzUKU0g04e97rf1FnUkQvmBRLHa2Y6oyggc6Deu9T/Y8T3X
MIME-Version: 1.0
X-Received: by 10.66.233.195 with SMTP id ty3mr5849799pac.70.1377374176123;
	Sat, 24 Aug 2013 12:56:16 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Sat, 24 Aug 2013 12:56:16 -0700 (PDT)
In-Reply-To: <52190ED2.8090605@boundarydevices.com>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
	<521905BF.4010908@linux.intel.com>
	<CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
	<52190895.3010208@boundarydevices.com>
	<CAOMwXhM+U5gQvgKcPXoovsxuCTfhKqb+PBH_F85j9v0KksuE=g@mail.gmail.com>
	<52190ED2.8090605@boundarydevices.com>
Date: Sat, 24 Aug 2013 20:56:16 +0100
X-Google-Sender-Auth: _-aBornpXRK-Dmmmmz41hJJKSvc
Message-ID: <CAOMwXhMcVHwOGa51Dv7SkZ0coattU9z+FAoS3ZR0wd9PMfxpUw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Eric Nelson <eric.nelson@boundarydevices.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-qt: add fix for QWSLock on qt4e
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
X-List-Received-Date: Sat, 24 Aug 2013 19:56:15 -0000
Content-Type: multipart/alternative; boundary=047d7b111e357db12204e4b6eae6

--047d7b111e357db12204e4b6eae6
Content-Type: text/plain; charset=ISO-8859-1

I replied in there.


On Sat, Aug 24, 2013 at 8:51 PM, Eric Nelson <
eric.nelson@boundarydevices.com> wrote:

> Thanks Laszlo,
>
>
> On 08/24/2013 12:28 PM, Laszlo Papp wrote:
>
>> Well, you should ask upstream about it... maybe it ended up in a
>> decision it is the wrong way, and something better went in, or being
>> planned to go in. I think a change should not be integrated like this in
>> grey area.
>>
>>
> I just posted to development@qt-project.org. Is that the right place?
>
>

--047d7b111e357db12204e4b6eae6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I replied in there.</div><div class=3D"gmail_extra"><br><b=
r><div class=3D"gmail_quote">On Sat, Aug 24, 2013 at 8:51 PM, Eric Nelson <=
span dir=3D"ltr">&lt;<a href=3D"mailto:eric.nelson@boundarydevices.com" tar=
get=3D"_blank">eric.nelson@boundarydevices.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Thanks Laszlo,<div class=3D"im"><br>
<br>
On 08/24/2013 12:28 PM, Laszlo Papp wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Well, you should ask upstream about it... maybe it ended up in a<br>
decision it is the wrong way, and something better went in, or being<br>
planned to go in. I think a change should not be integrated like this in<br=
>
grey area.<br>
<br>
</blockquote>
<br></div>
I just posted to <a href=3D"mailto:development@qt-project.org" target=3D"_b=
lank">development@qt-project.org</a>. Is that the right place?<br>
<br>
</blockquote></div><br></div>

--047d7b111e357db12204e4b6eae6--
