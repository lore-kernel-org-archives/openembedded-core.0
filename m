Return-Path: <sadlife1990@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id E1001738ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 10:29:59 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so18815329wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 03:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=zV+4M/lzeqaoP7eF2e6/v/sjrIbli4dRDn08DKEOg+s=;
	b=u4WtOuX7qIJ7exmplGXds1CGLav+KvtUPLd+DsPni7GtZj0N+dujmBqAsgq+KdfnI+
	mTqXshs0ErVASlcLNwVXIpmkGyq+K1JUIpNNoVmVU6Zrfa0lL0v6HcjMAY25n7EysZsB
	j8b1ro30uM6YU62ZHCZt+X07dGsdvEIOrdt2vjnb0pt6i28iN9W4krD3JyPjdjiEjc96
	/yh85oKozIRu2p9Y2J+j4VFPh62V2N1NJRKTy+6XwcBQvWbTm5szdN63j03zmOagft3c
	pxY+09q8DUPoWOCwR6izOQu0yC4rtxPfxKtcdocQc+Hsk2UF9lhg/Ke23ZJPCSfYB+7+
	delw==
MIME-Version: 1.0
X-Received: by 10.180.219.102 with SMTP id pn6mr57333350wic.50.1425897000414; 
	Mon, 09 Mar 2015 03:30:00 -0700 (PDT)
Received: by 10.194.36.196 with HTTP; Mon, 9 Mar 2015 03:30:00 -0700 (PDT)
Date: Mon, 9 Mar 2015 12:30:00 +0200
Message-ID: <CAAHuHfxzC86bfWMeehHSXnNwNNvNeCVOGOH6h18agfwbR=D42A@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: cups filters bannertopdf
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
X-List-Received-Date: Mon, 09 Mar 2015 10:30:02 -0000
Content-Type: multipart/alternative; boundary=001a1135ecea3234ed0510d884f5

--001a1135ecea3234ed0510d884f5
Content-Type: text/plain; charset=UTF-8

Hello,

I'm try to add cups filter for  yocto 1.6.2 daisy I add to Ghostscrip bb
this line is not work.
 ${exec_prefix}/lib/cups/filter/bannertopdf

But I add to this lines its work.

FILES_${PN}-cups += "${exec_prefix}/lib/cups/filter/gstoraster \
                     ${exec_prefix}/lib/cups/filter/gstopxl \

create cups filter folder and gstopxl and gstoraster filter was created.

Could you give me help how to add cups filter bannertopdf thanks.

--001a1135ecea3234ed0510d884f5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Hello,<br><br></div>I&#39;m try to add=
 cups filter for=C2=A0 yocto 1.6.2 daisy I add to Ghostscrip bb this line i=
s not work.<br>=C2=A0${exec_prefix}/lib/cups/filter/bannertopdf<br><br></di=
v>But I add to this lines its work.<br><br>FILES_${PN}-cups +=3D &quot;${ex=
ec_prefix}/lib/cups/filter/gstoraster \<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ${exec_prefix}/lib/cups/filter/gstopxl \<br><br></div>creat=
e cups filter folder and gstopxl and gstoraster filter was created.<br><br>=
</div>Could you give me help how to add cups filter bannertopdf thanks.<br>=
</div>

--001a1135ecea3234ed0510d884f5--
