Return-Path: <john.carter@taitradio.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA24758DA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 22:23:35 +0000 (UTC)
Received: by obbqz1 with SMTP id qz1so22457383obb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 15:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=taitradio.com; s=google;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=G2LuHyHpNpKGhvSrtknRi/viMjj75wJIR6h6bvX6Ztw=;
	b=MD+Jl9SM/hEzymzJgB4E78dds23MfvgnMQzaQWhEiIxZcx3HxfIzhf7CJvfAx6EP2x
	AjYR29xxDqMfAmQ3kRp0UHHP1EzmeS4r344/EDPaYyNnNnAHy2RsBEo+9k3fGsHVUR9y
	UWUR94dGndB1x2/nkmdkWCVRlZA4MjHZvapt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=G2LuHyHpNpKGhvSrtknRi/viMjj75wJIR6h6bvX6Ztw=;
	b=UiQHiVkNy9aeAGVX4Gxea/nVpnstIbeW0gr0z1qqNJH1XpuFBcBXnTo+afEZGNKNoW
	tROAl+zrfFE1RosqyhjBrdvl4lYAjvOJ2E8zyv9NBdopWXBs1Sn/PzQc/w3ADmWnvPTf
	smoC7s8R0XkqtZi07eiTQWAl9VgiqWYiWTbqfHRsot/VCcva4OMatV5V3cZOUCtw/2q3
	W8/F8cfavU9+gQa3thePgea773wmmUDdAnT9w85Tv5T/gj42+m3UyPJ3xAAjGneKi2qK
	VpXncWg1G57VfuZlUlC19RfcOMJzw0webN9OdWhJpBYPZzF3R4P+db9aecYOuHnyeKmi
	BCqA==
X-Gm-Message-State: ALoCoQlyMpc3ag3kPTcztsygsGRDQsVsU2IxiMqhT39XygWGSmZvcB3PSa23ku9Qe7q5t6nccJr1cSDwL5nvbhu2M695dktTwJ5g7LNXsjjOVAHV0mkRKnAhTzJcQnFTeVZq6AYwcUH9PXAGL4aCO59gYfsSmM2LIw==
X-Received: by 10.202.81.23 with SMTP id f23mr20463265oib.29.1433888616494;
	Tue, 09 Jun 2015 15:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.19.10 with HTTP; Tue, 9 Jun 2015 15:23:16 -0700 (PDT)
From: John Carter <john.carter@taitradio.com>
Date: Wed, 10 Jun 2015 10:23:16 +1200
Message-ID: <CAFD1m3HTYXqNtyO4xs6dphqGHVyBLR0d9VyDRMhFfFS4j09PhQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: linux-yocto: Any known issues blocking 4.1 kernel?
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
X-List-Received-Date: Tue, 09 Jun 2015 22:23:37 -0000
Content-Type: multipart/alternative; boundary=001a113b041ca2557805181d350d

--001a113b041ca2557805181d350d
Content-Type: text/plain; charset=UTF-8

So apparently the driver support for the TI wl18xx I need is on the 4.1
kernel.....

http://e2e.ti.com/support/wireless_connectivity/f/307/p/429401/1534799#1534799

Are there any known or expected showstoppers in terms of (in my own layer)
just bumping the version numbers in linux-yocto recipe on the fido branch
to 4.1?

Anybody done this?

Thanks!

-- 
John Carter
Phone : (64)(3) 358 6639
Tait Electronics
PO Box 1645 Christchurch
New Zealand

-- 

------------------------------
This email, including any attachments, is only for the intended recipient. 
It is subject to copyright, is confidential and may be the subject of legal 
or other privilege, none of which is waived or lost by reason of this 
transmission.
If you are not an intended recipient, you may not use, disseminate, 
distribute or reproduce such email, any attachments, or any part thereof. 
If you have received a message in error, please notify the sender 
immediately and erase all copies of the message and any attachments.
Unfortunately, we cannot warrant that the email has not been altered or 
corrupted during transmission nor can we guarantee that any email or any 
attachments are free from computer viruses or other conditions which may 
damage or interfere with recipient data, hardware or software. The 
recipient relies upon its own procedures and assumes all risk of use and of 
opening any attachments.
------------------------------

--001a113b041ca2557805181d350d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>So apparently the driver support for the TI wl18xx I =
need is on the 4.1 kernel.....<br><br><a href=3D"http://e2e.ti.com/support/=
wireless_connectivity/f/307/p/429401/1534799#1534799">http://e2e.ti.com/sup=
port/wireless_connectivity/f/307/p/429401/1534799#1534799</a><br><br></div>=
Are there any known or expected showstoppers in terms of (in my own layer) =
just bumping the version numbers in linux-yocto recipe on the fido branch t=
o 4.1?<br clear=3D"all"><div><div><br></div><div>Anybody done this?<br></di=
v><div><br></div><div>Thanks!<br></div><div><br>-- <br><div class=3D"gmail_=
signature"><div dir=3D"ltr">John Carter<br>Phone : (64)(3) 358 6639<br>Tait=
 Electronics=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 <br>PO Box 1645 Christchurch<br>New Zealan=
d<br><br></div></div>
</div></div></div>

<br>
<hr><font color=3D"#808080">This email, including any attachments, is only
 for the intended recipient. It is subject to copyright, is confidential
 and may be the subject of legal or other privilege, none of which is=20
waived or lost by reason of this transmission.</font><div><font color=3D"#8=
08080">If
 you are not an intended recipient, you may not use, disseminate,=20
distribute or reproduce such email, any attachments, or any part=20
thereof. If you have received a message in error, please notify the=20
sender immediately and erase all copies of the message and any=20
attachments.</font></div><div><font color=3D"#808080">Unfortunately, we=20
cannot warrant that the email has not been altered or corrupted during=20
transmission nor can we guarantee that any email or any attachments are=20
free from computer viruses or other conditions which may damage or=20
interfere with recipient data, hardware or software. The recipient=20
relies upon its own procedures and assumes all risk of use and of=20
opening any attachments.</font></div><div><hr></div>

--001a113b041ca2557805181d350d--
