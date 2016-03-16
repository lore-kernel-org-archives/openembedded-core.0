Return-Path: <theodor@resin.io>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id CC2566AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 21:16:08 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id e6so78568167vkh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=resin.io; s=googledkim;
	h=mime-version:date:message-id:subject:from:to;
	bh=DkJQiqMdxvt/xDgdce/U8ZJUM6QRK6Ik5klusl7qzfs=;
	b=YQUsX3n9dbyGg8KFmFivIBZymTgn86LHsuu5DWYRNqOGSQG5L5ob70oMSHIjWwgFwI
	xmuyA1DjI7TDzsmZXy1ijBKbipyJ2sM+zlFziJ7cBJIdCLyWvJipElIDPzslkFoV+Pi/
	VnagsHWQu4mEEGviNpRWRhbB//xPKf61/Y5JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=DkJQiqMdxvt/xDgdce/U8ZJUM6QRK6Ik5klusl7qzfs=;
	b=BDt4uhFACo04rZDBBKOGSdLuFQm0raG7GWkXZPzVbHKop9J0ue/UoYJ/CfPNrIzUd2
	UQ32po+QhBp75bcFDorgVlKxRfjbzovA94PhzkAFcjC51qDazt2uF2+N+On17GMqxOdX
	/SMTXYpvlGa/vKyla8PT1xpi8i33P2JGsPvdT3XsKED/tvG+SZ3NN9jZB24FXY6/42yE
	V/jdX4s3i2VtLvkZURpWAa9Zt2A8aKBHkVOj/+YClqCpnQqtT+CTniiVNAM8X0VtN3Vd
	7Y/5OxN7ylIt3ZxxuWlOL1LO3GhL+Zw9iFdltMp/Sr6GYrmCoHoX3zfzOmXOEdNpZ7gp
	7xgw==
X-Gm-Message-State: AD7BkJIbKm4gjNYlGjbAaPmgDxvF/Lffed4WpGazY+c+eChtjyoo1NbKlsWyeS/RMRsLHHyidoJsQI8PR2i58w==
MIME-Version: 1.0
X-Received: by 10.31.172.135 with SMTP id v129mr6970694vke.154.1458162969173; 
	Wed, 16 Mar 2016 14:16:09 -0700 (PDT)
Received: by 10.159.55.141 with HTTP; Wed, 16 Mar 2016 14:16:09 -0700 (PDT)
Date: Wed, 16 Mar 2016 21:16:09 +0000
Message-ID: <CABORvUhgtDxtTtHspJbOx6LLbMXxoyg5PaxBCmyzsKFcxR0WgA@mail.gmail.com>
From: Theodor Gherzan <theodor@resin.io>
To: openembedded-core@lists.openembedded.org
Subject: Enable GO in gcc-cross
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
X-List-Received-Date: Wed, 16 Mar 2016 21:16:09 -0000
Content-Type: multipart/alternative; boundary=001a1143e3dccd79fa052e310528

--001a1143e3dccd79fa052e310528
Content-Type: text/plain; charset=UTF-8

Hello everyone,

I would like to build gcc-cross with GO enabled (i.e.
--enable-languages=c,c++,go). My naive approach to this problem was to
set the flag through the LANGUAGE variable inside gcc-cross, but as
expected it needs more work. Is anybody aware of patches that enable
the go language? Any hints on the matter would help.

Best regards,
Theodor

--001a1143e3dccd79fa052e310528
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" style=3D"font-size:12.8px"><span style=3D=
"font-size:12.8px">Hello everyone,</span><br style=3D"font-size:12.8px"><br=
 style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">I would like t=
o build gcc-cross with GO enabled (i.e.</span><br style=3D"font-size:12.8px=
"><span style=3D"font-size:12.8px">--enable-languages=3Dc,c++,go). My naive=
 approach to this problem was to</span><br style=3D"font-size:12.8px"><span=
 style=3D"font-size:12.8px">set the flag through the LANGUAGE variable insi=
de gcc-cross, but as</span><br style=3D"font-size:12.8px"><span style=3D"fo=
nt-size:12.8px">expected it needs more work. Is anybody aware of patches th=
at enable</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.=
8px">the go language? Any hints on the matter would help.</span><br style=
=3D"font-size:12.8px"><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">Best regards,</span><br style=3D"font-size:12.8px"><span style=
=3D"font-size:12.8px">Theodor</span></div></div>

--001a1143e3dccd79fa052e310528--
