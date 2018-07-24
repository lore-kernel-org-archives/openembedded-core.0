Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1C55878911
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 13:52:11 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id x10-v6so1635155ybl.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 06:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CHBUTUS2GWIhAkZVlZHcI8gH8SeTuz+IibU33Rvb6ow=;
	b=klIyFzqE7xusHOV+hZ3qycIuGb9fCey1TqjqlO422hPWS8/I2ggBvV5Tw18Ez4WSO6
	Q068REgcXbhP78jDAU6Zhr6Euh68kw5KP2m7BqJCVY/q2hzKxN8bXiRZSJ1etxC3f61D
	PmKU5z5k8J2kf5XwURTceFee4LV4D8+kQLVfYS4lCwcFRjuTiGFrWXDrJL4VubZvapHq
	XNuBzRAFDXk8N2xR5krNHA6MNnusKlhuL+eqvKlOtloUx7/XevIrZiyTm1bouIEoc5L8
	pStXuqy4nNcDLJ44XVrFiApuOBXr/QfO4FnCqL5Lxa4R4ducj9HRNczXysi4aWkSLmOA
	OP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CHBUTUS2GWIhAkZVlZHcI8gH8SeTuz+IibU33Rvb6ow=;
	b=pGX9hz4FuRk4diDu//O11OaJuwHU8NPG+3mm4XD8FMosGpDHyj3nZpFnqG1cmnfjkq
	G+MfI7cjujgnU1E7joHbsP3UkDZjvoZWWpdT/xRnPef5mdT0d2PRI2ei75OFbOi4d8Rf
	Z/6/OUz0D/CbUp4EAXK/TimHyztcaAtb6gmESfg927mC/CtxkYhXQzNSSInOjn03DPl3
	/g3U/sIhLwBeZX6kRVFHgF1qizc6M2zmKff3bXrv/Reofh//UcVpHCszNXGs7QFkeSja
	1iIQyal5KlZV5QyPYK1tP7GR4i+PQiVOalFJzy/ccBZdI3rSkj1sUFRhMBdLs8W/NBOs
	l/Zg==
X-Gm-Message-State: AOUpUlG3bpLMpGgqnJ1rTAEcf9gJFp2lA17hm/O8yzny1d6LUjQI/OcA
	Wf82NpOu3PTMHvaZAl8FCnTblbHGnjXe6g+7cqL94A==
X-Google-Smtp-Source: AAOMgpdWjKNN2cgwhD+74QLldvy8GWfy2OIUTo1JpS7Rft1UyDxZ3TBv6uwzqcri10y5RzE0rPcWSZ1cpINpy0dL9So=
X-Received: by 2002:a25:ae0d:: with SMTP id a13-v6mr9308610ybj.2.1532440332631;
	Tue, 24 Jul 2018 06:52:12 -0700 (PDT)
MIME-Version: 1.0
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Tue, 24 Jul 2018 09:52:02 -0400
Message-ID: <CAFeBWL4WvT2CJkd25BVwje6_KvKZ5wquM6+YyPeHzywdMTT_iA@mail.gmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Setting include path in a recipe
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
X-List-Received-Date: Tue, 24 Jul 2018 13:52:12 -0000
Content-Type: multipart/alternative; boundary="000000000000aa83d60571bf111d"

--000000000000aa83d60571bf111d
Content-Type: text/plain; charset="UTF-8"

How do I defined a custom include path for an autotools recipe?

This may as well be explained somewhere in the reference manual, but I
can't seem to find it.

Thank you,

Adam

--000000000000aa83d60571bf111d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>How do I defined a custom include path=
 for an autotools recipe?</div><br class=3D"inbox-inbox-Apple-interchange-n=
ewline">This may as well be explained somewhere in the reference manual, bu=
t I can&#39;t seem to find it.<div><br></div><div>Thank you,</div><div><br>=
</div><div>Adam</div></div>

--000000000000aa83d60571bf111d--
