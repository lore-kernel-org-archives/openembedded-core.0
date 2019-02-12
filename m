Return-Path: <freakforever@gmail.com>
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
	[209.85.222.42])
	by mail.openembedded.org (Postfix) with ESMTP id 55BF66D6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 17:54:20 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id p9so1183088uaa.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=3weRH/mhiPSbreOqUdoOQ8UwEsORc6nNXlAJEzjPy54=;
	b=X1y4WDIFcXR9L8MVpiEUYSo1/dRKEZm76FapWVUCQPxzNjrxAlYBBNvKyZjIETX63Z
	QrVm3eQkISWaOxKndoWYbZymot7cS9VAb/WpMepIoOpRvNe2Z+hUgIOPiIiZBAWTwehk
	WljfP6a/BTorHUytPdXimjlVz7A1J8Z9YSCMsucZGDsYcVfEASUMtyQEqVSBkt2/s0P7
	KWaUzTEnepL2ZsO10CuVZ2d3f7/BRjY4bRrltRuVB3d9LE2Fx0AxwCQC5aw28lbM6ghO
	2zCkVVen3bPtwKUDio08w3ib9XLGz9F+DCYSQfV+XApJlbisnLnWuwpi9iULd0HR1P2l
	X1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=3weRH/mhiPSbreOqUdoOQ8UwEsORc6nNXlAJEzjPy54=;
	b=mm5nTZB4lICU7ly/6LFErq8Gq+HxSRABD58uuF/qaoArSrcMftFRi5THVwaQtVqFI4
	eZTHoWsq65IxfNSljYkU8EwDH55QKftjpK8inLHLsQTvAV8LgmJPckcc0t52FZJBkAJH
	re4eb8n7QS+ATUxBCfrcqRT9KXGrhsTNA2r8bNLVee0sD+oWHeGHpVqwuJHdIxedZkUT
	QoxgTG6YFs4pgxHDP5+RseMTXWykvR0/vqi2CvDiZAw+eChAxYts8P1TZSFqGuQTe/Wj
	dXfwK5yFrfgqI0glca4SX6o3IyRkyahpGu4P5dhtSJjaqBeR1XYYnblasgqZC2Kpg+7E
	siew==
X-Gm-Message-State: AHQUAuaYx80DPGJzvApQG+/5czEhzb5LEe2ZHp+iCFxH8cllIl4gXf12
	NXOtzMme9E+O5RzXUDy9FLoXIvM0WrVYbcUTts6C3lBx
X-Google-Smtp-Source: AHgI3IbRO4HpHlmxBvnfI5Kq46dzFvuvl1aWuaxnQyxvw1IXxJoIERDooHFut517sfSmBhnBciPnLFuv+NpiV2NcAK4=
X-Received: by 2002:ab0:70b7:: with SMTP id q23mr1868161ual.15.1549994061148; 
	Tue, 12 Feb 2019 09:54:21 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jo=C3=A3o_Rasta?= <freakforever@gmail.com>
Date: Tue, 12 Feb 2019 17:54:10 +0000
Message-ID: <CAHN4dxphUCH+QvMFStdoPe_6BJYUKpzfQy-iR8vEZMUJ+k41LA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: gl support for qemuaarch64
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
X-List-Received-Date: Tue, 12 Feb 2019 17:54:20 -0000
Content-Type: multipart/alternative; boundary="0000000000006b372e0581b61d2d"

--0000000000006b372e0581b61d2d
Content-Type: text/plain; charset="UTF-8"

Hi,

I was trying to build virgl-gtk branch for ARM qemu target, but I'm not
completely sure if it's possible as it generally seems to require KVM.

qemu-system-aarch64 has the virtio-gpu-pci device, which i'd assume to
support GL forwarding to the host if compiled with libvirglrenderer. I've
also been able to run a cross-compiled image reporting [drm] 3d
Acceleration enabled. However, I was not able to start any graphics
application on the guest.

Could someone pls clarify this?

Thanks.

--0000000000006b372e0581b61d2d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>I was trying to bu=
ild virgl-gtk branch for ARM qemu target, but I&#39;m not completely sure i=
f it&#39;s possible as it generally seems to require KVM.</div><div><br></d=
iv><div>qemu-system-aarch64 has the virtio-gpu-pci device, which i&#39;d as=
sume to support GL forwarding to the host if compiled with libvirglrenderer=
. I&#39;ve also been able to run a cross-compiled image reporting [drm] 3d =
Acceleration enabled. However, I was not able to start any graphics applica=
tion on the guest.</div><div><br></div><div>Could someone pls clarify this?=
</div><div><br></div><div>Thanks.</div></div></div>

--0000000000006b372e0581b61d2d--
