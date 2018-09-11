Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id B51FF79660;
	Tue, 11 Sep 2018 15:58:19 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id t5-v6so28783578qtn.3;
	Tue, 11 Sep 2018 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=eJQenhguI8d+BODUVA9hBwZPNBJ7vd+vWKcPyuZ21T4=;
	b=qMhOCpUqv7Ii+GBLS7dtP+PzprDy2BbYYQ49OFDjaHIshoqAweMtmVu0UuKUYN+NYU
	Vu1EEvvaEXGxzMrZoVPaVWldISb49g6P58nXlwYfGV8dez9xqxUPO7QTBkEk0lQGSCBM
	HeQdK9RHtSmkGseVCHSdwrWtC8SOe/AyqL22OKHWP4T/wjd0d54yLlIFGw7LHAZ/HBxC
	hYOpT+YJxsWmFOKBz8Xcm4WUIAoWE/4udijie5isan8ON8W6gP8lpc9kNJiGZoNqRNCv
	idq0Zd12azumhUkav6wDGMohGtGCi5qwUdBXJY50dSOiiWtu/22UvKcFPc8c8D4zp7fq
	E5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=eJQenhguI8d+BODUVA9hBwZPNBJ7vd+vWKcPyuZ21T4=;
	b=lWmBGsbRwrgvxhmlNiK642qBU8PmScHw1ZgIGTYmmEsElvou+bgvUbkJDFUJbx8i5d
	rEomYjgr+wzLBJhqai7gfV/JIeSOJDunIRTFrz3DWW5KjzNHrGNB3/roM6NilF1iU0Qr
	iZJXOvv0nTAgwYTfbnvLZmV0pIAE0KGuF36u9WP33HHCy6tZarNcblZ3dWDUjc9NRkpT
	Ybtb62arTjOWwSpw0NlHSFekgkmufItRuilY3o/9rtMUuWUVPcMporo2ESkd+C+OBfQ6
	9qyKA8rzATun2ELR62zGok1tLPanw1/Roav6C4mY4Jl1XQLoi+QkA/KNLU4Y/9mBznL5
	C66Q==
X-Gm-Message-State: APzg51AsuEvkA90hiQOaV27X5HclNXpGvsAiwQY44o1LBD5GwY2xCgrJ
	qn0oc9ZFAPBd7UIklhJSPASH9ytX1uWpA7m8i6IZwA==
X-Google-Smtp-Source: ANB0VdaA3W7Q90L15FBGPHaz7NwKtWhlw426SPZG/r1almoOrSqETUE8xfAqGrVVb7xBKb97yFMgMSKLAGdpoURhJ/A=
X-Received: by 2002:ac8:32ea:: with SMTP id
	a39-v6mr20894658qtb.234.1536681500181; 
	Tue, 11 Sep 2018 08:58:20 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Tue, 11 Sep 2018 17:58:06 +0200
Message-ID: <CAGCTLNSFu5uE2K0c0JiarGyBJ1somNjsx_jZ2mf7+8NozCMfrQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][wayland][weston]
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
X-List-Received-Date: Tue, 11 Sep 2018 15:58:20 -0000
Content-Type: multipart/alternative; boundary="000000000000f388c605759a8af7"

--000000000000f388c605759a8af7
Content-Type: text/plain; charset="UTF-8"

Hi,
I need to change the screen resolution of weston in my new custom image.
I used weston.ini file and installed it to the image in the path
"/etc/xdg/weston"
and i also installed the file to this path "/home/root/.config"

This way worked well with Jethro release of openembedded
but with sumo release it didn't work at all !!!

Thanks in advance,
-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--000000000000f388c605759a8af7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I need to change the screen resolution =
of weston in my new custom image.</div><div>I used weston.ini file and inst=
alled it to the image in the path &quot;/etc/xdg/weston&quot;</div><div>and=
 i also installed the file to this path &quot;/home/root/.config&quot;<br><=
/div><div><br></div><div>This way worked well with Jethro release of openem=
bedded</div><div>but with sumo release it didn&#39;t work at all !!!</div><=
div><br></div><div>Thanks in advance,<br></div><div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--000000000000f388c605759a8af7--
