Return-Path: <chai18740449846@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id C215B6FF76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 16:26:25 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id m198so194745099lfm.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 08:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=UUTGiZDoJg7gdrflTpqiF6tI4MIxqX5gX+21tmt+jps=;
	b=D3VW0ykqkSvhV87CK0BS/5tFIMmz8wIdB7hG9AjsiOK1hOR9ScpX5a/lchTzWfc4pt
	vO1Xt4v5ksEcocnrsNaxLsvzCVEzF5bRN5LGHV3b9Qi2ARVkztHN+iFkPZgqcie8s00T
	swqLmJAfTMnEYwlxtlT7JD5SVH5hUGEFWIXRzfBwryvgXvncYPsDPYG0p1mfrHKogeT+
	L1PCs2nK9mFSdBMV09Hg1SPHbbtolBHiVnMvYXyAGGKhYnGPkh5CYIekxVT3jTw5cKfU
	qxRY2OGgyfYnR/Wj1hwn/s9gxviblY1QWwxkulThJQh6m9CcKFCusoA2+nddiUXAJyye
	SbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=UUTGiZDoJg7gdrflTpqiF6tI4MIxqX5gX+21tmt+jps=;
	b=AyGEzLCvPX9NrB7yoY2OTy1kA2c2UDZU2Si3hPz+FzaXVyCYSUfK5dj9PR8IRbpy+6
	8xNVkJv9ym9eW5HloJrToBY5PwDk45T7sphQaUcdytu/MweWUk2qRy5zzy/C2C4j6q8j
	y61SX+VU/vqJ+fjTxXS4+JYEFbiwLsQLoSVS4K399UemtiNTz+/Lnednshw8gj0IYVN1
	dpNi/1v9lGXJtsMi8s6fHGDGZB0H5s92Sh1Wj/u5yP/q0l7wvacDtfs1+Q+R9icufNkM
	QKzeqGt5amaiEv/VI2kcHO/u+L3c84rdwpJJMEaNXOvbGHQuNcaH4y0XOdi71kYQMdfC
	R6Lw==
X-Gm-Message-State: ALoCoQlDFJoF1TD64tBZsemcge0JSpth67AU+upBhqTRa1P21TrPGVOIaK6quHHDkUzDk5AwNuPfP/bZ0YDN7ezmUUYWR19NEg==
MIME-Version: 1.0
X-Received: by 10.25.18.89 with SMTP id h86mr9024140lfi.165.1453220784883;
	Tue, 19 Jan 2016 08:26:24 -0800 (PST)
Received: by 10.114.177.106 with HTTP; Tue, 19 Jan 2016 08:26:24 -0800 (PST)
Date: Wed, 20 Jan 2016 00:26:24 +0800
Message-ID: <CAGgoB6YiR0qqeWwe3hNnQZ8GRXpdyh0EEYWMPaSXZRis1mb4xw@mail.gmail.com>
From: Ekko <chai18740449846@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: question about system on usrp E310
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
X-List-Received-Date: Tue, 19 Jan 2016 16:26:26 -0000
Content-Type: multipart/alternative; boundary=001a113fb96aa9d0540529b25462

--001a113fb96aa9d0540529b25462
Content-Type: text/plain; charset=UTF-8

hello all
i am using a image of usrp e310.
this device is using the openembedded core.and i want to know
1>>>>>>>..the details on waht happens during booting of the linux system,
2>>>>>>> and a depth explanation of the way ARM in Zynq gets initialized
until it loads the bootloader from the SD card


i want to know what file i need to read so that i can fingure those two
problems,and how can i find it


thank you

---Ekko

--001a113fb96aa9d0540529b25462
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hello all=C2=A0<div>i am using a image of usrp e310.</div>=
<div>this device is using the openembedded core.and i want to know=C2=A0</d=
iv><div>1&gt;&gt;&gt;&gt;&gt;&gt;&gt;..the details on waht happens during b=
ooting of the linux system,</div><div>2&gt;&gt;&gt;&gt;&gt;&gt;&gt; and a d=
epth explanation of the way ARM in Zynq gets initialized until it loads the=
 bootloader from the SD card</div><div><br></div><div><br></div><div>i want=
 to know what file i need to read so that i can fingure those two problems,=
and how can i find it</div><div><br></div><div><br></div><div>thank you=C2=
=A0</div><div><br></div><div>---Ekko</div></div>

--001a113fb96aa9d0540529b25462--
