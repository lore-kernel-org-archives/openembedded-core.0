Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8866578E59
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 12:38:12 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k12-v6so2498055oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 05:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VTusi5MUXzG8vfhFuzDjWXGUNR+oBmmbsSY2OtxnU3g=;
	b=kxdK7HkzJKt3L+F8CQ8BSghaukg6X0V1K2sFsyJ8afQMQsKhC/y+/ia2dBlxl3rCLJ
	vMRggu2A9X4IGIS+hQtD043m4sJTxPH0+f7e4Q7T/KlZxx0KJ949qjOi9AztVJQ7wRIb
	dcW7wR5WDRPn91NBOZQMlGnALlZ/mekhbvUK1PXRra3rXYYOZm14TmWWGOxZyUXqLsdK
	3Rnnd3Sb8sRgBEf31ztpTNTPb3uCFlHr08huMkdTb7RT6n8Rq+EGQTe/OSQtz/5HnVtB
	R/butE8aIUAcHUWOOt/1TuyTrx7fuGiG8OF56/cJy+Bk5/dv9OenbLvmeYgvsFbrjVC9
	VZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VTusi5MUXzG8vfhFuzDjWXGUNR+oBmmbsSY2OtxnU3g=;
	b=n2aqp46KxuUjWi1GHd8/tA517HpDf1eJyBD/kykGQIZbKdC4PLSqGv2WTLebLNbJih
	CdW4N8WxfQQrgRfW+ZP6Do94XEyNWFAO3u3N9aHiyMmcA6lzu/llJtGU5fIGKfQQzfie
	2GXz25qVJkosF0fdYZqtr4bFKL8fUJz4CKi0hyqz2H2hhs/QC9HE18GFXw1ESYRysEp8
	AosZgyN+Qm/FGiIk/be60sa1jzWL9NKvQf2eBtFGi3RgApgKI8HTTbEqPsQocrp+aC4O
	HvN2S6EvdaT8EcuH7bqbY7NPuAzMU00uvS+2TsKMjprPAONQn7tKGetAyCLRWJMicGpK
	pC7g==
X-Gm-Message-State: APzg51Bjawny+rlhtOeC7vuE10AZsc+McDoQjMYgt28HQc4qCNufNeHy
	S7UP5ktyIbqXYWrMtB8Fm9S2IxdhI0X/rHnx934+MQ==
X-Google-Smtp-Source: ANB0VdbyoS/jM9dU5q/pT+HgfXSoA2yVH2sivdnVcTe1I/UwrHgLzG31lL+02lpCUZPvxv1vPymM8Qq7eOh6eLwf6Uw=
X-Received: by 2002:aca:edd8:: with SMTP id
	l207-v6mr1239118oih.65.1535459893503; 
	Tue, 28 Aug 2018 05:38:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90ed:0:0:0:0:0 with HTTP; Tue, 28 Aug 2018 05:38:13
	-0700 (PDT)
In-Reply-To: <2b3b5c60-8c1a-325d-37cb-f29987f6737f@innovatrieste.it>
References: <2f3b7c17-9233-5159-59bb-73e6858eebca@innovatrieste.it>
	<CANNYZj_V1UfEQMWFJhbGy41+8j4rQWiCeZSA-Unpi=LDFzEyQQ@mail.gmail.com>
	<2b3b5c60-8c1a-325d-37cb-f29987f6737f@innovatrieste.it>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 28 Aug 2018 14:38:13 +0200
Message-ID: <CANNYZj8oBQciQKVnk1OriAtPsh4Ar_OsOgc2kqfSWN7UB2EW0w@mail.gmail.com>
To: Marco Oman <marco.oman@innovatrieste.it>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: devtool recipe not working outside workspace
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
X-List-Received-Date: Tue, 28 Aug 2018 12:38:12 -0000
Content-Type: multipart/alternative; boundary="00000000000084ec0805747e1d3b"

--00000000000084ec0805747e1d3b
Content-Type: text/plain; charset="UTF-8"

2018-08-28 14:29 GMT+02:00 Marco Oman <marco.oman@innovatrieste.it>:

>
> That's from version 2.2 (morty), right?
>  Any alternative option for version 2.1?
>


I don't know - devtool is constantly evolving. I know best how it works in
the master branch, I'd suggest you try from there if possible.


Alex

--00000000000084ec0805747e1d3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2018-08-28 14:29 GMT+02:00 Marco Oman <span dir=3D"ltr">&l=
t;<a href=3D"mailto:marco.oman@innovatrieste.it" target=3D"_blank">marco.om=
an@innovatrieste.it</a>&gt;</span>:<br><div class=3D"gmail_extra"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF"><div><div class=3D"h5"><br><blo=
ckquote type=3D"cite">
    </blockquote></div></div>
    That&#39;s from version 2.2 (morty), right?<br>
    =C2=A0Any alternative option for version 2.1?<br></div></blockquote></d=
iv></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">I don&#39;t know - devtool is constantly=
 evolving. I know best how it works in the master branch, I&#39;d suggest y=
ou try from there if possible.<br></div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Alex<br><=
/div></div>

--00000000000084ec0805747e1d3b--
