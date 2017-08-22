Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E089D78279
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 15:41:03 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t138so8876591wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 08:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=D7Y40wCTOxJLxxEgmH5QCE3QbCk3B8Qt9i2qr8MaVeY=;
	b=mDyLeRc7TJwCoz89VwZj8+yNmqgE6QVGEEG33IbUJZtsLhvimF6jdQIQxJZKWrMuo7
	9BkPRZPzjtJaqFfIyCm9rzLTHgqSOxabfLh9KOEbl3IYB2yJoeTd/ZH4ihqBeeu6OzPG
	FaWcuIv15hA4DyvwVF1zso5xAdjLVG4ixwRkTR/nTd+R0Jl0sH10Kls01jMiWS1JEEVA
	HDWIIVEHTjHYiZXCgK0s4CCKw6MRjSNUHkg4ze2ZREx3cb3V1Eo6qt3+k9ioaiXq80p0
	OYu3QRmQYrqpUrXE6nj3GmP5XQXX2bsJtSh1s9kpiVDGVES5TfwoxE0QFFxs1JONHBxP
	QkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=D7Y40wCTOxJLxxEgmH5QCE3QbCk3B8Qt9i2qr8MaVeY=;
	b=OzEZZnrZAQwMfJvnVgwa1i8xwLCAGZ+4oLjK8A9KHlbUxGMa8kCx8p3VytmdZe6M03
	aIIldlChH0GpMRNKv+lA5mXChhWvPIXEi8gKFlRZmo5n2ORm4Sa0HvZSwtUaTd+2sbXL
	96A9Ron5JNlmrk/syaiLLU6zspTM3Gg53Bi1dPYRcRbPrlbk2FGGLfq/PvMLhp8ON1k7
	hRT0hIqWxdfdqL56ukYvHbiAYcPo6Vj50xKMMHho8vW7iDfskRwC3LyoX1s5ellertbz
	amN3zZRdkpRMyR4cVzw4IlDMEx9SvvgIkNS87OytUQ/IiEh7i/aG3m8b6P5TpaYEzOck
	lfMA==
X-Gm-Message-State: AHYfb5jq/nP+qHS2W7k2GSGOMNrmzR2B4si3qhSMIygM5JzlUOUg+4bX
	QurfBa/g+RvDyQ==
X-Received: by 10.28.10.131 with SMTP id 125mr44721wmk.132.1503416464521;
	Tue, 22 Aug 2017 08:41:04 -0700 (PDT)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id
	h190sm8603052wmd.4.2017.08.22.08.41.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Aug 2017 08:41:03 -0700 (PDT)
From: David Vincent <freesilicon@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 22 Aug 2017 17:40:59 +0200
Message-ID: <4839097.lYi3dlrNZm@crde-port-20.cahors.local>
In-Reply-To: <CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
References: <20170816181539.5327-1-otavio@ossystems.com.br>
	<CAP9ODKpOcrd7h5AcgW2zxPHPvkhrgAByZEvF-tzsb-iOGxh_PA@mail.gmail.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kernel: Fix symlinks"
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
X-List-Received-Date: Tue, 22 Aug 2017 15:41:04 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On vendredi 18 ao=C3=BBt 2017 14:44:30 CEST Otavio Salvador wrote:
> On Wed, Aug 16, 2017 at 3:15 PM, Otavio Salvador
>=20
> <otavio@ossystems.com.br> wrote:
> > This reverts commit c7bc46b9bc29dd0953ab8d63b50fa105bb66892e.
> >=20
> > The commit has broken the alternatives concept as it is managed by
> > links controlled by the alternatives system. That said the failing
> > case identified (which some bootloaders fail to load the file) seems
> > to be due a misuse of the alternative system.
> >=20
> > Cc: Christopher Larson <chris_larson@mentor.com>
> > Cc: Ross Burton <ross.burton@intel.com>
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
> I ended forgetting to add the commit author on Cc. Adding now :-)

This issue has been discussed here : http://lists.openembedded.org/pipermai=
l/
openembedded-core/2017-April/135923.html

Reverting this patch to solve the alternative problem cannot be a definitiv=
e=20
solution as it breaks boot on some boards. IMHO, I'd rather break the=20
alternative system than boot (full disclosure : I use opkg's update-
alternatives).

As already said, absolute paths cannot be used in bootloaders since it may=
=20
point to an invalid location (rootfs may not be mounted). I do not have=20
another solution with plain 'ls', but I think we should find a way to bette=
r=20
handle all cases than going back and forth on this patch.

=46YI, this is my use case : I have a bootloader which resides in EEPROM, b=
ut=20
needs to boot kernels that can be upgraded. Therefore, I rely on a fixed pa=
th=20
to the last kernel / devicetree on a specific partition outside rootfs.

=2D-
David

