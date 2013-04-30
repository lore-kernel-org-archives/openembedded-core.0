Received: from mail-wi0-f182.google.com ([209.85.212.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UX6sq-0005nm-BU
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:30:08 +0200
Received: by mail-wi0-f182.google.com with SMTP id m6so284227wiv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ulz5L84xzlGne2CIXlXSGzCfz5ftVgum13QRV6P3ynY=;
	b=iaD/zJ2q99WZFwt3g4JNxzKsiBcwi3/tY0wkctjEjn6tfWy/9E2aFCKPyMTTLM25qF
	oLaAyvr1S5I0UwTWf8SpmCafAdlmTgacG2X11suHcoxOxN+KrHP2IVc5r8by4xPeYk+3
	/pGgk1x2HxoTl64YHCinnkdCsIOrX7kvy8xcboN1+4VrXB+k5ZgPs2RzHzVQWn3aUd6W
	TOi+kHi7zJykmT1AGEfcWc5aqBcPL/SECfZWOb1o4b4i8uaZOSWmO5ho6IuzNkVUONIo
	k/5r31zC44XuLmzUxn/pXUjXwv+c+ybuxjZNvzZmNLrnyWeaz1p2l+BS7w6MQfUqyglA
	OWTw==
X-Received: by 10.180.88.33 with SMTP id bd1mr22913065wib.18.1367313122015;
	Tue, 30 Apr 2013 02:12:02 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id bu18sm1079220wib.1.2013.04.30.02.11.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 02:12:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
Date: Tue, 30 Apr 2013 11:11:59 +0200
Message-Id: <ABE1F3FA-9C6C-4B22-88CB-860E6311BD13@dominion.thruhere.net>
References: <CALbNGRRndfF8dvQhtnSgzcE-72KGOP4tb5BQx_Z-205Dr2prGw@mail.gmail.com>
To: =?iso-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkJkB8E0LGNpH42N2fjwumSU0N0nivfpZLhQ3YlfJNtQDJ2YjWrd53rkgNpO0NfZ9LJy2e5
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: udev-extraconf conflicts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2013 09:30:29 -0000
X-List-Received-Date: Tue, 30 Apr 2013 09:30:29 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 29 apr. 2013, om 23:03 heeft Andreas M=FCller =
<schnitzeltony@googlemail.com> het volgende geschreven:

> Hi,
>=20
> is it really necessary to add udev-extraconf to systemd RRECOMMENDs?

Most certainly not!

> For me automount.rules turn gvfs/gio (auto)mount to unusable state.
> I bet there are others (see autonet.rules) failing for hidden =
'helpers'

Indeed, it's fun to see the flurry of patches trying to fix things up =
for 'xuser'. I'm fond of the saying "If you find yourself in a hole, =
stop digging".=20

So: http://patches.openembedded.org/patch/48139/=


