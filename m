Return-Path: <mans.zigher@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7E2AF74FD5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 09:35:29 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id t68-v6so19219495oie.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=Sk6C3vFwEfX5GuAr/3p9OLDwyhI0pZ+OAf8W+qcqxTA=;
	b=lor1kKfakr0uw/F9l6zi1dzLmNyEmI3Ppv3iqj0/N2Dt1BkbADAyBDIn5ls4BozLTJ
	WcE/8UAsy/S/yCnXXDHIi3RwzBis8dF1yA+Gh7i5YjfdIT2XvvrbpOp+zgnjEXaAiOGm
	29YwtD1clCGbtBtscX9VTNr1UWwLj398bG4M+BpdEdo8tmTeXeYpfyxdTYEp6RUmvF2U
	R7P76vW5mm9+oDEhFroSwlaXwuGDt80AffY6hRxA/pHN97IocRSSRc/waWWAN0VV958o
	wopKMrEuglDv+luiqxMR3KzPOuRSW2aM93jwAiT6CDrSoBzH0WNQCeLfG9oRyCYqqtog
	LdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Sk6C3vFwEfX5GuAr/3p9OLDwyhI0pZ+OAf8W+qcqxTA=;
	b=pyi5wHdEz4lzaRiftDdRi50qaFxULB+BAyujHEqM5IIuNIsXbUv+mGUenkdsiJut+5
	EiarzbMKQj2J67kdiv1UNuycKaV9HK29QWj3zz2AKxnwYcPdIgqArR/PhVK/aUxJXYiH
	90AvCtwveg5RS+Te4b9Hm86B+qCvU8awDJ8UNUhIPGsgjj+KM0o1OQFVJlZQ+vrxOBbs
	Kv7bbTJJmNqUqNEwVEo0CKfNyvq5Bj6pM4IWWBK3EqSY3ikkrFi42lA6ddrVuUq6Y4iy
	i3WPDD9djJ6xWR9fo+RxIecaqBX1Khmugt/kuAst1fn23tQPalwDxKqpyGlxj1A6wnsi
	SYAQ==
X-Gm-Message-State: APzg51Aj8qO1S4fQmN3rAgwNh2fOnqXoHBTIXdLA+tydsHAvbQ2d43qF
	uWlb67ZM0rgrb+WgJElexEXC0hSjsyfm9jXa5NkucZVDqKg=
X-Google-Smtp-Source: ANB0VdYuO0IHIYK0NZBPB0ZdYKibmLEDecYLEKc8ur/3TQm3hL7K4gjIdxdNYv/lKDNXv8mVEtKq35FG+CRztRZXLbw=
X-Received: by 2002:aca:b208:: with SMTP id
	b8-v6mr1947281oif.144.1536226530253; 
	Thu, 06 Sep 2018 02:35:30 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Thu, 6 Sep 2018 11:35:19 +0200
Message-ID: <CAEhQi8=0vP0=ubyPM_i9a24YBfnOj4UY9CbqOHfQQwEhY71N4w@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: bitbake cannot find git
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
X-List-Received-Date: Thu, 06 Sep 2018 09:35:29 -0000
Content-Type: multipart/alternative; boundary="000000000000a162550575309c07"

--000000000000a162550575309c07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have maybe a a bit unusual project that is causing some headache. The
project is a Cmake project and is including ExternalProject_Add which is
then using git to checkout these external projects this is failing because
it cannot find git. When trying to add dependency to git-native to get it
included into the sysroot it is ignored because of ASSUME_PROVIDED which
includes git. I assume that the problem is that the actual git clone is
called from inside of the configure task and when running this bitbake
assume any tool dependencies should be in sysroot so it will not check for
it on the build host. Is this not a supported use case or is there a
workaround for this?

BR
M=C3=A5ns Zigher

--000000000000a162550575309c07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I have maybe a a bit unusual projec=
t that is causing some headache. The project is a Cmake project and is incl=
uding ExternalProject_Add which is then using git to checkout these externa=
l projects this is failing because it cannot find git. When trying to add d=
ependency to git-native to get it=C2=A0 included into the sysroot it is ign=
ored because of ASSUME_PROVIDED which includes git. I assume that the probl=
em is that the actual git clone is called from inside of the configure task=
 and when running this bitbake assume any tool dependencies should be in sy=
sroot so it will not check for it on the build host. Is this not a supporte=
d use case or is there a workaround for this?</div><div><br></div><div>BR</=
div><div>M=C3=A5ns Zigher</div></div>

--000000000000a162550575309c07--
