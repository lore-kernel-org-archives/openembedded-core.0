Return-Path: <pespin.shar@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id A45C5731D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 15:35:24 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id j11so139029005lfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2016 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=x3c6/S32r3Zf9XZBxBOUqiFRCX6eNIs/w9d92axvyPA=;
	b=TOocCUgFw24/hxLDlz/oYVndLQqHjup+UzN97VTCDuxHByR6sonlAdfD0poDVzdj/i
	Q4CQjOy5bjNKPbU0aJfBg6JSjXY95oSnoZeEqAmmtSSSvo5Ld8byM8V/NPHHpeZ/KIX/
	9pwlbZa9V//BgkgrI3+xZPIx74Hp7an7+1UMs1lKpmP+yKMgAigpxZZc5hQd2N1/F9om
	n8tdg7QqinfxAetr/OUsQZHFZihpnpUlnNiQS+9X/6gfZdGddC9C4C3hczmiHdQ7Iq36
	Bz9Kn1KOXcU8OiW2v17M60Zkrra82uYdTfOEty3ZXS9kbXaSGrGBZE7QbUGk2x6BNEmE
	XeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=x3c6/S32r3Zf9XZBxBOUqiFRCX6eNIs/w9d92axvyPA=;
	b=XycbIqgeibHGt4F68AynkBfBNphjkYyellEn8lqDV284Mzs+XVpkKeM6OFfJ+B69Yj
	0yKWz6Kad8DxISApB4Jyobv0ZKZ5tP9xOP5WH9NGBG8HIgUdvlb21vf9MQb49gGpoZd3
	gbf/hsV5ncXe5ZaM20ql8ISiGeK7Y2d2MyW+9EQnMO4XHpVmjapjTItmPrYlTPMAWj2j
	vvi78WZKDsJQAkSIsg21ifuSZuWklt4NQKyTxb9DM0O8QJD56019pg+N59TIQIDEUvMF
	nxrqgiYNDgAN9wAONwYqp5IRrkWbaJLpChjmm916fOmLho8LN3EY4DbtN+NXpy+MwdVS
	Na5A==
X-Gm-Message-State: AOPr4FWcfEIEJ85YqpSQaH7MVxY412KNrOu3Z7E4vcxH/DaSBpK1NjkvIFGWilJRNOEd3IhbHEBedEF5LIkSoQ==
MIME-Version: 1.0
X-Received: by 10.112.162.36 with SMTP id xx4mr1697709lbb.8.1461944123603;
	Fri, 29 Apr 2016 08:35:23 -0700 (PDT)
Received: by 10.25.160.139 with HTTP; Fri, 29 Apr 2016 08:35:23 -0700 (PDT)
In-Reply-To: <1461746074-1830-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAEGpDuZdDjKoWa3oDGUjmYSDEnKX=T+9CKd4dGG7xXiDnNOyfg@mail.gmail.com>
	<1461746074-1830-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 29 Apr 2016 17:35:23 +0200
Message-ID: <CAEGpDuaj29ciwevzMPUwHkzeEgRyheE8rB=JQ_Ft67Fr9gAeWg@mail.gmail.com>
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: Li Xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] mdadm: add systemd support
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
X-List-Received-Date: Fri, 29 Apr 2016 15:35:24 -0000
Content-Type: multipart/alternative; boundary=089e012292642b40ab0531a16418

--089e012292642b40ab0531a16418
Content-Type: text/plain; charset=UTF-8

2016-04-27 10:34 GMT+02:00 Li Xin <lixin.fnst@cn.fujitsu.com>:

> +               ${D}${systemd_unitdir}/system/mdadm.service


Hi, could you please use "${D}${systemd_system_unitdir}/mdadm.service"
instead of "${D}${systemd_unitdir}/system/mdadm.service" in here?

Pau Espin Pedrol
mail/jabber: pespin.shar@gmail.com
http://blog.espeweb.net

--089e012292642b40ab0531a16418
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
2016-04-27 10:34 GMT+02:00 Li Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:l=
ixin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&g=
t;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${systemd_unitdir}/system/=
mdadm.service</blockquote></div><br></div><div class=3D"gmail_extra">Hi, co=
uld you please use &quot;${D}${systemd_system_unitdir}/mdadm.service&quot; =
instead of &quot;${D}${systemd_unitdir}/system/mdadm.service&quot; in here?=
<br></div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"g=
mail_signature">Pau Espin Pedrol<br>mail/jabber: <a href=3D"mailto:pespin.s=
har@gmail.com" target=3D"_blank">pespin.shar@gmail.com</a><br><a href=3D"ht=
tp://blog.espeweb.net" target=3D"_blank">http://blog.espeweb.net</a><br></d=
iv></div>
</div></div>

--089e012292642b40ab0531a16418--
