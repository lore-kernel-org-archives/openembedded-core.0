Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 09F9461883
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 18:03:04 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rr4so2564603pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LP18jTasEVKPEdL1ctdbP197gQK1tdvQ+n0RusHmvZs=;
	b=JON91pJYi4QH9ouB0nR1T0HrMqwBHc0utzGXjXL8zjSJSx3qe0lgNiwqb4/TNhhVRW
	+FQkpk/sBY/6jVoJkSKQVQFZorNUYNSy+5vZXrZPaNgkVybK0ahetgEn/7FUnga5oIlQ
	lyEMmdWOwXaLUsU+pQcU61qLmZZiP7BPg7ssZOPQrvm5uI7HPJvy5qXOj512xGXAp6Br
	FRIo5k4F+SQjcJugpQ2svibPdh64gA4YInlL+HIV/0PXO9ZqTlJxvo0or1A/Ev/J6qg2
	tT0GzYx3+KSOID1Ia32UdWrHiDKnB79Ns+ac777ui+8wg/JHltqZW/VFobGMwxY1fDR/
	dnwA==
X-Received: by 10.66.161.138 with SMTP id xs10mr10502694pab.56.1377453784129; 
	Sun, 25 Aug 2013 11:03:04 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id
	qv4sm13107224pbc.16.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 11:03:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
Date: Sun, 25 Aug 2013 22:02:56 +0400
Message-Id: <835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
To: rewitt@declaratino.com
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Sun, 25 Aug 2013 18:03:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Aug 25, 2013, at 9:43 PM, rewitt@declaratino.com wrote:

>>=20
>> Thanks! Any idea why the qemu with hard float configuration has a =
kernel panic with linux-yocto?
>=20
> init is going away so the kernel panics. Usually this means it =
couldn't
> run the init on the rootfilesystem. Try adding keep_bootcon to your
> kernel command line and see if that gives anymore debug.

I ran bitbake linux-yocto -c menuconfig

and noticed that the wrong ARM architecture was selected (it was using =
the same one set using tune-arm926ejs.inc)

The thing is I don't see a defconfig anywhere, and I was wondering how =
the linux-yocto kernel picks up the defconfig from the standard/base =
branch.

A TI OMAP 4430 Pandaboard or i.MX6 quad-core SABRE development kit =
platform would do, but not sure how the linux-yocto kernel works, in =
terms of pre-selecting the correct defconfig file.

Best regards,

Elvis Dowson=

