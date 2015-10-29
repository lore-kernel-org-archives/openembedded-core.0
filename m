Return-Path: <logan.buchy@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4D55D755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 22:19:21 +0000 (UTC)
Received: by ykft191 with SMTP id t191so58023044ykf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=KfmYrSnV1A3LQa6MzkudYy6LeOQCGkT7pGK533JobNE=;
	b=AcV7bV3fug7ZD5dJk+taiKAMLACS8KVUN7vYdOJvWCsoFG+K3aUFReK/zA1EAzpjHO
	K9jv/+GCBiRJZK1ZQobCtGwH+tnVwq1tuhHD1sQEZXFMOEmE96xmGPfm6TSyTc/9LPQo
	+qyrU72/QSEOWnjOc+Kuh3jZhlAk0vq0OKLrgYmTPRc4YBkzOFw41j+BVN1I/XqXLEP8
	jGjKGECBRSSX8mdp9JM4UpVpQkEDEthOcPEHVIzosD3ZzEsUYHKJFJFPlRDOf8xBTt9X
	16ob0xZroSLHjpb260C4Cql7P/S+eaUPnUZDgJWMSC8IP7zrX7b3lUKToVdRkyrcywgg
	Vj3A==
MIME-Version: 1.0
X-Received: by 10.129.61.14 with SMTP id k14mr3889511ywa.301.1446157161538;
	Thu, 29 Oct 2015 15:19:21 -0700 (PDT)
Received: by 10.13.233.199 with HTTP; Thu, 29 Oct 2015 15:19:21 -0700 (PDT)
Date: Thu, 29 Oct 2015 15:19:21 -0700
Message-ID: <CAH=96PEUtXUaqskW86+bexfU6weUV7NxLsG=vsNitU8E2vkmUw@mail.gmail.com>
From: Logan Buchy <logan.buchy@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Building firmware recipe with different toolchain
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
X-List-Received-Date: Thu, 29 Oct 2015 22:19:24 -0000
Content-Type: multipart/alternative; boundary=001a11429142e735a6052345b3de

--001a11429142e735a6052345b3de
Content-Type: text/plain; charset=UTF-8

Hi guys,

I have a board which has both a Cortex-A9 and a Cortex-m0+,  The Cortex-A9
is running the main application with the Linux kernel while the cortex-m0+
is present to handle some real-time control tasks.

Currently, I am building the cortex-m0+ firmware separately and saving the
artifacts to an ftp server.  A bb recipe grabs the correct binary from the
server and incorporates it into the rootfs of the cortex-a9 image.

This works for now, however it makes it a bit more difficult to do
development on the cortex-m0+ firmware.  I am looking at augmenting the
recipe so that it will pull the source and build the firmware.  The
complication is that since it is a completely different architecture, I
will need to use a different toolchain, CFLAGS and complier options.  I am
not even sure if this is possible or where to start.

Anyone have any ideas?

Thanks
Logan

--001a11429142e735a6052345b3de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi guys,<br><br></div>I have=
 a board which has both a Cortex-A9 and a Cortex-m0+,=C2=A0 The Cortex-A9 i=
s running the main application with the Linux kernel while the cortex-m0+ i=
s present to handle some real-time control tasks.<br><br></div>Currently, I=
 am building the cortex-m0+ firmware separately and saving the artifacts to=
 an ftp server.=C2=A0 A bb recipe grabs the correct binary from the server =
and incorporates it into the rootfs of the cortex-a9 image.<br><br></div>Th=
is works for now, however it makes it a bit more difficult to do developmen=
t on the cortex-m0+ firmware.=C2=A0 I am looking at augmenting the recipe s=
o that it will pull the source and build the firmware.=C2=A0 The complicati=
on is that since it is a completely different architecture, I will need to =
use a different toolchain, CFLAGS and complier options.=C2=A0 I am not even=
 sure if this is possible or where to start.<br><br></div>Anyone have any i=
deas?<br><br></div>Thanks<br></div>Logan<br></div>

--001a11429142e735a6052345b3de--
