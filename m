Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id BDA6D71641
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 02:43:22 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id x13so11465616wgg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Nov 2014 18:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=fCQibWmicgpS7JP31DDsFzm2pvwIAUgHhCWmhMF3n1k=;
	b=eAHSudZyjImOvGjOYiJqyLPF7Wz/22jggYZggjMe86BTdX9h9stjSamQVufGDFJ8P1
	6Gy7uS8PAi2IXNqqh50HADg1eMcUmIXnrAXllkteYHt2wptMAAOlY5AbVexGrp3XFDfo
	8v9FzYnjvnsMWx9Zn3coy1FUaj162b5ziXlC3r01SxyfhNVuJzVNKwTWeSt3izNsAYxF
	IN6RdaOmmIcoX/0aMbvdYmERWQ8alg8bSCBg38Cra7XQlSi75JIR9AIPHAW4b3qvblHM
	nP+bdJTcTS21oBDGEwnyMsBvXjwvBIojkvQixImlYv1AEEVXNzpTb06BaYLHeC0dZon6
	n7IA==
MIME-Version: 1.0
X-Received: by 10.180.100.129 with SMTP id ey1mr13414232wib.28.1414982602953; 
	Sun, 02 Nov 2014 18:43:22 -0800 (PST)
Received: by 10.217.141.70 with HTTP; Sun, 2 Nov 2014 18:43:22 -0800 (PST)
Date: Mon, 3 Nov 2014 10:43:22 +0800
Message-ID: <CADwFkYdjkNrBGCJRMfc4JVg5j31461djp2sc9q9crSezHHzSUA@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: where is the 'libGL.so.*"?
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
X-List-Received-Date: Mon, 03 Nov 2014 02:43:28 -0000
Content-Type: multipart/alternative; boundary=f46d0444eefd699a0f0506eb4f76

--f46d0444eefd699a0f0506eb4f76
Content-Type: text/plain; charset=UTF-8

Hello,
    I'm using poky with 'meta-qt5'. when compiling qtbase, it said that
can't find 'libGL.so'.
    the mesa is the default provider of virtual/libgl, but there isn't
'libGL.so.*' in package 'libgl-mesa'.
    any idea? thanks!

Yi Qingliang

--f46d0444eefd699a0f0506eb4f76
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>=C2=A0 =C2=A0 I&#39;m using poky with &#39;meta=
-qt5&#39;. when compiling qtbase, it said that can&#39;t find &#39;libGL.so=
&#39;.<br></div><div>=C2=A0 =C2=A0 the mesa is the default provider of virt=
ual/libgl, but there isn&#39;t &#39;libGL.so.*&#39; in package &#39;libgl-m=
esa&#39;.</div><div>=C2=A0 =C2=A0 any idea? thanks!</div><div><br></div><di=
v>Yi Qingliang</div></div>

--f46d0444eefd699a0f0506eb4f76--
