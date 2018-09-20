Return-Path: <mhm.dawod@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id A7F92797A4;
	Thu, 20 Sep 2018 10:35:13 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id h4-v6so7946226qtj.7;
	Thu, 20 Sep 2018 03:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=bN/KD0PxMJtvDfW1JPqho5DGv1GaZtEIom1b3CE1H9w=;
	b=GvChDwKpXZ55ruZuXGnEbihacKVLqtglNP76fEUXUjlGH4Au2JXcJ4fkhknk22uJQo
	tZoGTgoICCnV/Trw0mQh1kNyZaWRJW0ro93fltHwe+tjeU6V+dlD1R0qfHFEFPHHq2CC
	caRu6+5saVijazugnid5YcygPRkdKZf1bnqdrVZDEjPPZ0KeQOaiJRNdbC25SuHAWa7k
	1Swu4wBeeSENvcDLeydxskQEaE2CftI5ScrM7TZFoVE5GZe+MfVz7rvNELqOra7I80Vj
	N3iXMUarNywxk6snMF/k2qm+79VnzwxY9LFyM4GE2zsruL5RGEsc1o5zzvJIgb6GOyDE
	EQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=bN/KD0PxMJtvDfW1JPqho5DGv1GaZtEIom1b3CE1H9w=;
	b=oAoDeR5Y21GIxY0yoMTrMFnY2ICtjUEeaPLCrIdJH+Hwr1knBR9TknOSaLJwXbNro4
	RnG3ncUjn//Gp/IRRK9AffUBRLMrta1cXgfSntllysXzA4Pmj7pjGzxD2XAIoCtAOJSj
	DKmhCAbXijRCUn4lkUQbiTuhlziV0E0jaqMgWYgb+z9ieg7KFbblARLbCwvQBi+JT+aR
	qAJFGiSXsZ0ovfCxFJWxclka0PXxHdF51XfFrrEgsu2dZqgNWWONybpyIAsZry6KNnbL
	KU8qlHZjWlkzzujhR9C/WVrJDpm1h/5gwLTpvdMFMlsFpAZyW6HzTx6Lbb55WZY4tbEu
	4+sg==
X-Gm-Message-State: APzg51BvNaBi5vwPOH6JZL5Eyc1oB9V5w0pFY2eoYOY9CT3sDb9orytO
	h/zhSQAi18YXBmidzEq8vl6LXVv/VGPmon93Cr0lBw==
X-Google-Smtp-Source: ANB0VdZm/USRpCDdut5gc3y3GCSpKu357LY0UeI8rLKO16z6yYD1mgJ5YToov+n7KZrRUIQDYh87PlSwmsapmA2hbfo=
X-Received: by 2002:a0c:9557:: with SMTP id
	m23-v6mr27571242qvm.138.1537439714470; 
	Thu, 20 Sep 2018 03:35:14 -0700 (PDT)
MIME-Version: 1.0
From: Mohamed Dawod <mhm.dawod@gmail.com>
Date: Thu, 20 Sep 2018 12:35:02 +0200
Message-ID: <CAGCTLNTiG78-7WeRWXm+QBRtiHOY0DRegLFz=HkU6tD0=zgzAw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Subject: [openembedded][qtwayland][weston]: Small text in text fields QML and keyboard problem
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
X-List-Received-Date: Thu, 20 Sep 2018 10:35:14 -0000
Content-Type: multipart/alternative; boundary="0000000000000b714905764b1418"

--0000000000000b714905764b1418
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I built an image with wayland weston and removed x11,
I added meta-qt5 layer to run qt5 apps,
I could run qt5 apps but there is two problems:
1- text font is too small in text fields and app title bar
2- keyboard not response! I can not type any thing.
Keyboard is working well with the image and the terminal
but not working with qt5 apps.

can anyone help me to solve this problem ?
Thanks,
Regards,


-- 

Mohamed Dawod
Computer Engineering Department
Faculty of Engineering
Cairo University

--0000000000000b714905764b1418
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello everyone,</div><div><br></div><div>I built an i=
mage with wayland weston and removed x11,</div><div>I added meta-qt5 layer =
to run qt5 apps,</div><div>I could run qt5 apps but there is two problems:<=
/div><div>1- text font is too small in text fields and app title bar</div><=
div>2- keyboard not response! I can not type any thing.</div><div>Keyboard =
is working well with the image and the terminal</div><div>but not working w=
ith qt5 apps.</div><div><br></div><div>can anyone help me to solve this pro=
blem ?</div><div>Thanks,</div><div>Regards,</div><div><br></div><div><br>--=
 <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sig=
nature"><div dir=3D"ltr"><div>=C2=A0<br>Mohamed Dawod<br></div><div>
Computer Engineering Department=C2=A0<br>
Faculty of Engineering=C2=A0<br>
Cairo University</div></div></div></div></div>

--0000000000000b714905764b1418--
