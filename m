Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 115BA6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 08:45:47 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id e9so3984801pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 00:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1jnTXvnVrEkeZi4uIxjzmI2UczGFcHCmqEJmLdwMPqo=;
	b=rNaL4284tqIeZ7aoE8+o90kc5itS2RsrISOUxix8MVYd6YEUddEix8eRq6YjkVFMcD
	FbJZHjMUGhjTDci3vqszbAEnQHtGqLQNdQqPnB6F3X9GBVYV1AhjLDShYa2Qh2e1X4v6
	cNzUDSx/OpPF3g2n2OZjbaq5xDiVJRJF2XPyqHYux0tz3feA5EsB5oBAHVgA2lZ+AQzM
	YvkmORXdM4VzJshFI2RQgDy5Iy48rhtwbVJ+sez5axRVgIlJSLu7tREumd6Ild4cDgzo
	PcKrqwLoVEOtj41hjFgmixvsm6lhsuobFwaLEvOW5HhBAAnhTLlJX6lVSk9VdlKEghpB
	h4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=1jnTXvnVrEkeZi4uIxjzmI2UczGFcHCmqEJmLdwMPqo=;
	b=jnB3YnQsDgiklrrMWKDUxyXHgphR5jWex8qIg2hsimhtGPteFyOzZ5rE8mBujKr6E0
	Qqr7CODlu34Tb9SEL7kRXZzJy6ZYzkdHUCx2j/mQodqgw0OnZLXlotddIX3qC4IKMknC
	c4/U3cb4nU9/AN2D77iCZ2FPHg74J/H2+I05asYigeAZ1AMiLSTjzcjb9ym+5rD5KTto
	Ai60PRLepRKTW54rr8NNLqr6D0t4vweVhbO9nTQ1JsHJbnAXhQWHq2PK/sYlF9cnpTS+
	OX6KCW1hSP1kTMI4zvNVm19qhp/Pb5bRWcsVGawJNaltK30hXlksWjotgEjE6QA1STpN
	mUhA==
X-Gm-Message-State: AKaTC00rrSOb5wH8WV2fv6qK+pr0g7n55TKDarFagLn2YuyLnT0DUT1imC6fQL2ht57WxQ==
X-Received: by 10.98.158.155 with SMTP id f27mr37446236pfk.165.1480581949537; 
	Thu, 01 Dec 2016 00:45:49 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:b12d:319:cff6:775c?
	([2601:646:8882:b8c:b12d:319:cff6:775c])
	by smtp.gmail.com with ESMTPSA id
	c142sm108602336pfb.23.2016.12.01.00.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Dec 2016 00:45:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
Date: Thu, 1 Dec 2016 00:45:47 -0800
Message-Id: <E6E3DC4A-4DBF-4326-AEBD-CDA9C76CCA04@gmail.com>
References: <20161130073953.18166-1-raj.khem@gmail.com>
	<CAJTo0LYHeb28My6Ek5wBr-dv8budpprpXwZ84T5TYqW_Uj3SFQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Upgrade to 1.10.1
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
X-List-Received-Date: Thu, 01 Dec 2016 08:45:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 30, 2016, at 7:17 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Breaks if built from a empty sysroot with wayland enabled:
>=20
> gst-plugins-bad:
> | make[3]: *** No rule to make target 'viewporter-protocol.c', needed =
by 'all'.  Stop.

This one I was able to reproduce and fix. Sent the fix to ml.

>=20
> Also rtsp-server gains various runtime dependencies on util-linux, can =
you verify that these are expected and in the depends?
>=20

Can you be more specific about this ? how to reproduce it ? what kind of =
diagnostics do you see ?

> Ross


