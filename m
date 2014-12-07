Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 762A3723EE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Dec 2014 15:07:44 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id pn19so2791012lab.23
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Dec 2014 07:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=c8fUovyu9NlmA/4Ue1VzVO4YG+ZaF+hoam1RupdZKyg=;
	b=m9iBG4FuUk8oqsns6a2Rn2V9L1ViWVe+Y5zztMotE5A9qo2xNU72q9CudKijtoL/oK
	u3XRdMH8pNOyUPkOOwm6kOs5TLR8FYCDi9MiYPXmml1Gb45G1kj4nO3eQBMY4pFb9GFI
	vIunA+5gcHIp5an3+R9iI4TOCODeO7yH1KZ5Q0o336K9u4pGgA4I83JOvMK4E7T9YDox
	ISboluIcIHT46oEF78FYzoIBcEBlrecXNmYkt2Wtixx5+rygIu85Ksh+0+F1STWb9hDH
	GPxslP6LNwL/0DugxwnUjPFrR9zQBfktQ/Wjym0j19Ssm50errfPavJ/NjsO0gmVtOAL
	t13A==
MIME-Version: 1.0
X-Received: by 10.152.20.193 with SMTP id p1mr12116083lae.35.1417964864211;
	Sun, 07 Dec 2014 07:07:44 -0800 (PST)
Received: by 10.25.155.18 with HTTP; Sun, 7 Dec 2014 07:07:44 -0800 (PST)
Date: Sun, 7 Dec 2014 16:07:44 +0100
Message-ID: <CAPbeDCmcdS36_2anNvZpT2aO2Vft6so3MmTqsjtFo65itxyOXw@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: perl installation in the SDK references $OECORE_NATIVE_SYSROOT ?
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
X-List-Received-Date: Sun, 07 Dec 2014 15:07:46 -0000
Content-Type: multipart/alternative; boundary=089e0141a9a409114e0509a1ac41

--089e0141a9a409114e0509a1ac41
Content-Type: text/plain; charset=UTF-8

Hi,

Like the topic says, I grepped for "OECORE" in the native sysroot of my SDK
installation, and the only hit I got was this:

usr/bin/perl:export
PERL5LIB=$PERL5LIB:$OECORE_NATIVE_SYSROOT//usr/lib/perl:$OECORE_NATIVE_SYSROOT//usr/lib/perl/5.20.0

I'm wondering if this reference is intentional, or if its something that
should have been sed:ed out during sdk installation ?

Jacob

--089e0141a9a409114e0509a1ac41
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi,<br><br></div>Like the topic says, I gre=
pped for &quot;OECORE&quot; in the native sysroot of my SDK installation, a=
nd the only hit I got was this:<br><br>usr/bin/perl:export PERL5LIB=3D$PERL=
5LIB:$OECORE_NATIVE_SYSROOT//usr/lib/perl:$OECORE_NATIVE_SYSROOT//usr/lib/p=
erl/5.20.0<br><br></div>I&#39;m wondering if this reference is intentional,=
 or if its something that should have been sed:ed out during sdk installati=
on ?<br><br></div>Jacob<br><br></div>

--089e0141a9a409114e0509a1ac41--
