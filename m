Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8F66204F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 10:31:26 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so4781024wgh.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 03:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=a4otr0P4i4Lezc3qU2OjqF+a+6Ccz11qocyOSybBgq0=;
	b=BkxCJLp2DPw8VjGNmr8e1Js/g27uyJSrc0gyNsKzJ5A0np45iEW7NC9VIDUwtuPwi6
	5IUSsVJcpXRQdXFsr8yRgIcEd8poqcTL13pFcGvtcVzsvttjalPrMj29gyM7UIn1koaq
	q/pTImVfQBaFuBdwabHVs8fTTqBxpchlQ7iHDx32kWijdjvEDWZdC/ZTUxfJs0zj0tya
	QR2HxGnNh4YeMKv1StM50FmmE7h6e0y4kyBEYXk43dD4eqNoM9POxSi51S6sft47UruG
	qCgdZZNb75a3t29oc/Jh5SNbRhh7OA8NjLXWcIZq9azRf37pqsZHEOS5ulnGZIBFfWF+
	eWaQ==
MIME-Version: 1.0
X-Received: by 10.194.174.38 with SMTP id bp6mr1107301wjc.83.1370860286932;
	Mon, 10 Jun 2013 03:31:26 -0700 (PDT)
Received: by 10.194.121.229 with HTTP; Mon, 10 Jun 2013 03:31:26 -0700 (PDT)
Date: Mon, 10 Jun 2013 11:31:26 +0100
Message-ID: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 10:31:27 -0000
Content-Type: multipart/alternative; boundary=089e0141aa2a707d5904deca4854

--089e0141aa2a707d5904deca4854
Content-Type: text/plain; charset=ISO-8859-1

I've successfully built qt4-embedded (oe-core, denzil, beaglebone) and have
got a Qt/QML application running (on a beaglebone)

The image size is quite big however and I notice there a load of
examples/demos etc that I don't need on the filesystem.

I presume I am probably just building the wrong thing ? Can someone advise
the recommended way to get Qt built without all the demos etc  ?

This is what I added to our image -

IMAGE_INSTALL += " \
  qt4-embedded \
  "

Thanks
John

--089e0141aa2a707d5904deca4854
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
3px;background-color:rgb(255,255,255)">I&#39;ve successfully built qt4-embe=
dded (oe-core, denzil, beaglebone) and have got a Qt/QML application runnin=
g (on a beaglebone)</span><div style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:13px;background-color:rgb(255,255,255)">
<br></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:13px;background-color:rgb(255,255,255)">The image size is quite big=
 however and I notice there a load of examples/demos etc that I don&#39;t n=
eed on the filesystem.</div>
<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13=
px;background-color:rgb(255,255,255)"><br></div><div style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255=
,255,255)">
<div>I presume I am probably just building the wrong thing ? Can someone ad=
vise the recommended way to get Qt built without all the demos etc =A0?</di=
v><div><br></div><div>This is what I added to our image -</div><div><br></d=
iv>
<div>IMAGE_INSTALL +=3D &quot; \</div><div>=A0 qt4-embedded \</div><div>=A0=
 &quot;</div></div><div style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:13px;background-color:rgb(255,255,255)"><br></div><div sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px;backg=
round-color:rgb(255,255,255)">
Thanks</div><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;=
font-size:13px;background-color:rgb(255,255,255)">John</div>

--089e0141aa2a707d5904deca4854--
