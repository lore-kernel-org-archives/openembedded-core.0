Return-Path: <hi@andrew.im>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6719177E89
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 22:03:32 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r62so12386300qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=andrew-im.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=ib3hWRufS7WrqtIe+5DvlrMk89Q4/Lbj6OBVkipDud4=;
	b=XoLSu+jgCNHT0wqc/lrfPXAecCsu9wZrKKnhQXuOfH6znLCz4VWc/E1E1Lj5PvZgZK
	fWbBevTyGU3YMBMuWfsc2r2jd6Pdx2tzVzBVayKx7Zxgl9x+zuV+ZDJedRq1By9Gdnlx
	evRr2ovSZPQzzCM+NnEzepZn71PFGpKlNAKf+GZKvrWa/qma+xMYqXsrnFncmJBWWRA0
	IcpQQGBXb3reeNJzi+wHu0RCmtzwpGJRbm2qxWeGc8+pKHEM5OErPhX9BxhRBxZA2yai
	pAEvr4qFAqslQUp33ekPQRxQM8Gz2pAZmXfy+IhmVDWWOGrw5wrqX27sDgXUn6b6oalI
	uNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ib3hWRufS7WrqtIe+5DvlrMk89Q4/Lbj6OBVkipDud4=;
	b=jLBjGlwEq28jSTgz1YzRMPz6BRyoqN3jZoQlzvpI73TEuo7I4e4rsyr40p4PrECoUN
	cm78YwxvHH5GgLFsnmLadFLTTDuBfMuMp+td7mzusSfRzAnYesvZcoAu92LNOBVVxk6H
	YNpMsIbvZvq7hDgaMz2c4kygTq2YszDo3VvQ67tuAmCoxT+kzu5Oi/xJLhdmoFxpSODN
	sVpx4KvTlfcAw++TFkOQwcclFoaAAwax0vviCyI+Qh7SQ5KFAnkCHDl9o88ZazYPc9FZ
	2QYi2/al4bvIem7YJzPaFAPWviQLG+S66wKlXGOqBYzZTsCZF9n7wgLzsoLIi18RPz+4
	UEtg==
X-Gm-Message-State: AKS2vOy5M6y4785H/1PC0VC8im/tptxGyt26+GECPF2l7/NqxNZZrkvj
	wKSnGKTwYsDEbdax4ocn6L5KcQe1kgmWgYxr4Q==
X-Received: by 10.55.198.66 with SMTP id b63mr2846436qkj.224.1498514613671;
	Mon, 26 Jun 2017 15:03:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.201 with HTTP; Mon, 26 Jun 2017 15:03:33 -0700 (PDT)
From: Andrew Sampson <hi@andrew.im>
Date: Mon, 26 Jun 2017 18:03:33 -0400
Message-ID: <CAKDhf7WqrrodexvZKQmyGJ2Zr2j2-jRKJfnDnMQOtMv6UJN-=A@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Package Manager Conflicts
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
X-List-Received-Date: Mon, 26 Jun 2017 22:03:33 -0000
Content-Type: multipart/alternative; boundary="001a11499c043d28730552e41f16"

--001a11499c043d28730552e41f16
Content-Type: text/plain; charset="UTF-8"

I'm attempting to setup a package feed for a board which I don't have the
ability to flash nor do I have access to the original image that is on it.

The image on the board comes with Smart installed.

I build an image using the information in this guide:
https://www.openembedded.org/wiki/OE-Core_Standalone_Setup


and add my dependencies before doing: bitbake core-image-minimal and
bitbake package-feed

However when I attempt to install a package via smart I get this error

Committing transaction...
error: update-alternatives-opkg-0.3.4+git0+1a708fd73d-r0 conflicts with
update-alternatives-cworth

I can't find any information referencing this issue, is there a way I can
completely strip opkg from the oe-core layer or a solution to this problem?

--001a11499c043d28730552e41f16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m attempting to setup a package feed for a board whi=
ch I don&#39;t have the ability to flash nor do I have access to the origin=
al image that is on it.=C2=A0<div><br></div><div>The image on the board com=
es with Smart installed.</div><div><br></div><div>I build an image using th=
e information in this guide:=C2=A0<a href=3D"https://www.openembedded.org/w=
iki/OE-Core_Standalone_Setup">https://www.openembedded.org/wiki/OE-Core_Sta=
ndalone_Setup</a></div><div><br></div><div><br></div><div>and add my depend=
encies before doing:=C2=A0bitbake core-image-minimal and bitbake package-fe=
ed</div><div><br></div><div>However when I attempt to install a package via=
 smart I get this error=C2=A0</div><div><span style=3D"color:rgb(37,37,37);=
font-family:monospace,Courier;font-size:14px"><br></span></div><div><span s=
tyle=3D"color:rgb(37,37,37);font-family:monospace,Courier;font-size:14px">C=
ommitting transaction...</span><br></div><div><div><font color=3D"#252525" =
face=3D"monospace, Courier"><span style=3D"font-size:14px">error: update-al=
ternatives-opkg-0.3.4+git0+1a708fd73d-r0 conflicts with update-alternatives=
-cworth</span></font></div></div><div><font color=3D"#252525" face=3D"monos=
pace, Courier"><span style=3D"font-size:14px"><br></span></font></div><div>=
<font color=3D"#252525" face=3D"monospace, Courier"><span style=3D"font-siz=
e:14px">I can&#39;t find any information referencing this issue, is there a=
 way I can completely strip opkg from the oe-core layer or a solution to th=
is problem?=C2=A0</span></font></div></div>

--001a11499c043d28730552e41f16--
