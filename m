Return-Path: <tarek.elsherbiny@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE6460144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 11:04:31 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id i57so4003905yha.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 04:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gOo3OWYeeW4LbdUeHcUcoUJhJxx20ktT7ziRwIcv3TQ=;
	b=EdiW5FOHbF9iUouYd7nzzIZjqNHxkk4OTeNwYyjKOhK4GRhlwWoBRUK3KKmrYUZx+2
	0ZiOn/OJQKrcrufgjKq0eFiv9wemQp2OZhtKMKHf0WOy43yynSd2zE1IOA3DsQz3P1+I
	QRifozRd4Nyz1QaRAWbJ2Cg7m7HfHoq1i41cw5fwpEiuw/dCYlzdSsMk82Fy8cqKNNBu
	WL6mIRbVABafbvBvEk8obzzQ+6i5gG2QQqGS/wZVsa5TvBdw6sq6nyYOeuWg4dJR0DG0
	oBuJQpuvnRNACLocH89bDkPXwjxYt99gndG4wYlbR0QmQM12VnwbFxM97cBUxgiixg20
	mUqg==
MIME-Version: 1.0
X-Received: by 10.236.209.68 with SMTP id r44mr3946753yho.152.1399028672203;
	Fri, 02 May 2014 04:04:32 -0700 (PDT)
Received: by 10.170.71.65 with HTTP; Fri, 2 May 2014 04:04:32 -0700 (PDT)
Date: Fri, 2 May 2014 12:04:32 +0100
Message-ID: <CAB3sqtZbtJGsh_jMUnvJAyFmXJVHZT2bvZ=DJ0N-fSB-VYu4Tg@mail.gmail.com>
From: Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
To: yocto@yoctoproject.org, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: DNS when using Static IP
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
X-List-Received-Date: Fri, 02 May 2014 11:04:32 -0000
Content-Type: multipart/alternative; boundary=001a11c2a77e099a7b04f868bfdc

--001a11c2a77e099a7b04f868bfdc
Content-Type: text/plain; charset=UTF-8

Hi.

I'm trying to set my IP config to a static address.

iface eth0 inet static
     address 192.168.55.45
     network 192.168.55.0
     netmask 255.255.255.0
     broadcast 192.168.55.255
     gateway 192.168.55.1
     dns-nameservers 192.168.10.2

But I don't get the DNS server address to be included in /etc/resolv.conf

If I run in dchp mode, then the resolv.conf is updated with my DNS address.
Is there something I'm missing here in my setup?


-- 
*Tarek*

--001a11c2a77e099a7b04f868bfdc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi.</div><div><br></div><div>I&#39;m trying to set my=
 IP config to a static address.</div><div><br></div><div>iface eth0 inet st=
atic</div><div>=C2=A0 =C2=A0 =C2=A0address 192.168.55.45</div><div>=C2=A0 =
=C2=A0 =C2=A0network 192.168.55.0</div>
<div>=C2=A0 =C2=A0 =C2=A0netmask 255.255.255.0</div><div>=C2=A0 =C2=A0 =C2=
=A0broadcast 192.168.55.255</div><div>=C2=A0 =C2=A0 =C2=A0gateway 192.168.5=
5.1</div><div>=C2=A0 =C2=A0 =C2=A0dns-nameservers 192.168.10.2</div><div><b=
r></div><div>But I don&#39;t get the DNS server address to be included in /=
etc/resolv.conf</div>
<div><br></div><div>If I run in dchp mode, then the resolv.conf is updated =
with my DNS address.</div><div>Is there something I&#39;m missing here in m=
y setup?</div><div><br></div><div><br></div>-- <br><div dir=3D"ltr"><i><fon=
t color=3D"#666666" face=3D"arial, helvetica, sans-serif">Tarek</font></i><=
/div>

</div>

--001a11c2a77e099a7b04f868bfdc--
