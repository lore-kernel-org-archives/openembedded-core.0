Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UX71i-0006eT-GA
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 11:39:22 +0200
Received: by mail-we0-f179.google.com with SMTP id u7so244765wey.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2013 02:21:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ujcQog5nFKUmt/engvVPD90SIJrnAie8yK6UiwjXJ2c=;
	b=RosEv9QxTO4osMDbgP2xNVqXsu6SEZChzUwo1BvJfNErWs2odMUlXl/3WEjB6dRspU
	iw5rAjEBchgZ8J6BtOctFCmObPD6HDyMhxdZq1bunMbc1DwbzzjBHVO0LE3FH0TS2UzU
	lphuUO3TMG03SwFd3D9uo4MHwYLUmXudx15nX7NgPHnxW2SMyK3vpf2RS330TVt9BPbU
	tz1uoQo+oeTrs/OHymoeBYUZcPFVd/E9GYugeXA7Za+u1cWgt7TdFIre2Yn2HYg+nBsr
	QpNPnVnlmwDVbWvRt3WGNnOMgVzsMDitq6yema61at1hPGb8r6Zsadu//asMx83IHgqD
	AfFA==
X-Received: by 10.180.87.170 with SMTP id az10mr23229320wib.3.1367313680332;
	Tue, 30 Apr 2013 02:21:20 -0700 (PDT)
Received: from [172.20.0.3] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id dj7sm25061944wib.6.2013.04.30.02.21.18
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 02:21:19 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0La_jjN2COZzdcst99Cutm5uNER4Yqu8ayc3YXuHYAfJDw@mail.gmail.com>
Date: Tue, 30 Apr 2013 11:21:18 +0200
Message-Id: <0898467A-BB4A-4301-BEA9-696BBE5CE889@dominion.thruhere.net>
References: <1367307108-18479-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0Lb-RNvd85JO6O0iTZSiuJ3HMe6=rpGdgqa4QF4Xv0SE_g@mail.gmail.com>
	<CAJTo0La_jjN2COZzdcst99Cutm5uNER4Yqu8ayc3YXuHYAfJDw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQn0wEaLm3Wj977US1jVxAqQN7aUqlAciy9r0B1tYMvd+Q54Ab4WFNqFlw7IOlADPEtdg4nq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: do not recommend udev-extraconf for udev
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
X-List-Received-Date: Tue, 30 Apr 2013 09:40:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 apr. 2013, om 11:11 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 30 April 2013 10:09, Burton, Ross <ross.burton@intel.com> wrote:
>> On 30 April 2013 08:31, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:
>>> * adding this extra functionality is an image- or distro-decision
>>> * at least automount-rule/script breaks other automount solutions =
causing
>>>  misleading kernel messages as 'VFS: could not find a valid V7 on =
sda'
>>>=20
>>> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>>=20
>> If you're going to do this, please also do udev at the same time.
>=20
> Oh, and the images in oe-core need to be fixed to bring in
> udev-extraconf as required.  The initramfs does already, but then we
> need to have the debate on what other images should.  core-image-sato
> certainly should depend on it, but what about core-image-minimal and
> so on?

If you want people to use those images as a base for their own image: =
don't drag in udev-extraconf




