Return-Path: <kkobru@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0206FF0E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 08:53:11 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b199so55590645lfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=QJKDvgsaOxnIFthThQi8O/JNQjWmI2A5AIHMcBcxmlM=;
	b=bYc40xzJLHWo7c8hq1URFbRTWUPkD7WnRkl2I82luFaWB9bmXbBGVLDMFgnH0s8OnT
	QyaM1mp1Lkn6vXbYhc1vCJmHlUW3NWMxGZoRx61/m0R5om4Dy3nI0MTY7RzjZGJb9e6r
	U5/5UTrfGmNSjlRd+6zBY1oWOFAV3UImjni/FevUcqhziacmeAGpcDBbBl+71Igbh3jC
	NAyHRlr6pyTwCN0ljHWlIXuY57YSBJiVemxIqjN/fXbmNigEJ/gCAPTYVTURDZhbjq3t
	mamqvW1kfaENYHxdXdy8iiYu5ctv+sLY5lXNjzIKaGdUmzBwCRiXUs52VQKIJ2a3oJ4p
	pspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=QJKDvgsaOxnIFthThQi8O/JNQjWmI2A5AIHMcBcxmlM=;
	b=iCEArK4BLSwA6iMA9wDx1d7vKkxfS/lT4zcLI8Y2iIx0BuxA9Hi6Okob/PY2lhsoud
	jEtRHyBQcxY9JobjxINhQW8YhpCv7RDbAJNOZpK5H5D1+8Huli5FgRAvPTWNkMTdLiGK
	Gdm+dd8a/L88/9GzNqQeetsoLo/hai7rdRWQnh4f4AI+YkkdmTw581JNmQVxxNX+pa2z
	/6695DTr6Oxpi+s36ehRK1ElgElVjA8wCXFVUZELloBvF7snpLKPjtwoUpeylud8sorU
	KWk5YcqSRju1Ly1Jnsm1FypU2ozfq/RbVnNjCzPR67LQV3YjlHw8ksS1KHrxQyiml0F5
	CjAw==
X-Gm-Message-State: ALyK8tIJNxc+6wYCIyNzL4uCtyfdakaZtO3Kj/e8scArvgskn3BJJeZC2KWTV3ciGJKXTEJW30FRjTo2Ld/5Mw==
X-Received: by 10.46.5.68 with SMTP id 65mr21663622ljf.16.1469091191780; Thu,
	21 Jul 2016 01:53:11 -0700 (PDT)
MIME-Version: 1.0
Sender: kkobru@gmail.com
Received: by 10.114.82.40 with HTTP; Thu, 21 Jul 2016 01:53:11 -0700 (PDT)
From: "Oleg V. Kobrin" <oleg@portlab.ru>
Date: Thu, 21 Jul 2016 11:53:11 +0300
X-Google-Sender-Auth: jbsh7pnZhvVCKCjQxDBiWLg6u8k
Message-ID: <CAP1eXm6yhgsweLn8x5w2J4j1y6_qJeeunOmmy1-HeEfo54TYOg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Cannot find the information on sdk
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
X-List-Received-Date: Thu, 21 Jul 2016 08:53:13 -0000
Content-Type: multipart/alternative; boundary=001a114a8dcaa0fa080538217294

--001a114a8dcaa0fa080538217294
Content-Type: text/plain; charset=UTF-8

Good day!

I am using the OE to build my application for Beaglebone Black, and it
works fine, as I installed the sysrooted sdk on my machine and use it for
build. The problem is that I need to add some libs (i.e. orbit2) to my
project and cannot find the information how to add them to sysroot.

For now I have sdk installed in /usr/local/oecore-x86_64/sysroots/. The
opkg is not working in the sdk environment - opkg list is empty.

I see full sysroot with all the libraries in build/sysroots/x86_64-linux in
my local OE directory, and it seems to be functional, but I have no idea
how to transfer its contents to installed sysroot.

Any help? Thank you!

-- 
_____________
Oleg V. Kobrin

--001a114a8dcaa0fa080538217294
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">Good day!</span><div styl=
e=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">I am using=
 the OE to build my application for Beaglebone Black, and it works fine, as=
 I installed the sysrooted sdk on my machine and use it for build. The prob=
lem is that I need to add some libs (i.e. orbit2) to my project and cannot =
find the information how to add them to sysroot.</div><div style=3D"font-si=
ze:12.8px"><br></div><div style=3D"font-size:12.8px">For now I have sdk ins=
talled in=C2=A0/usr/local/oecore-x86_64/sysroots/. The opkg is not working =
in the sdk environment - opkg list is empty.</div><div style=3D"font-size:1=
2.8px"><br></div><div style=3D"font-size:12.8px">I see full sysroot with al=
l the libraries in build/sysroots/x86_64-linux in my local OE directory, an=
d it seems to be functional, but I have no idea how to transfer its content=
s to installed sysroot.</div><div style=3D"font-size:12.8px"><br></div><div=
 style=3D"font-size:12.8px">Any help? Thank you!</div><div><br></div>-- <br=
><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">________=
_____<br>Oleg V. Kobrin</div>

</div>

--001a114a8dcaa0fa080538217294--
