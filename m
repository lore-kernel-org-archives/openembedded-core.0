Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB6E75894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 21:06:09 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id hb3so86007180igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=s8a2FdmKMEeirOrz7mg2JTo305a0CydrkfrWSbAs+Nk=;
	b=e/22AuqwbRG315hPUBvWXGuwYaJa+3NYzzW9t1pMr7yx25KD1/0tmhFcSAJqOBJaGh
	4N3/fQi3qgw8E3n4YE7l9IlC7wyTtQD1+N3YJpCMLEl8XNdF7hTAWvY+SFip0hdCtcNB
	1+mrM36Ogy7LvaVqqvTwzH8M3NHbwujygPvfw8SzQ8raD6dloVLm6aW5e02ifqjyo3Kc
	Z3IWgQOCqcCai+CyMDNYBdO6LvFdDtpfS+LqiNmE0M6Nu30qt26wOqkE2ZDfYEl+S/9i
	hmS2gsRmKIpbimn+OiXKdFeOWLYWU4+NyGUB/J0EAUuARdakX9+kfVDV7175aBzKAqPo
	TByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=s8a2FdmKMEeirOrz7mg2JTo305a0CydrkfrWSbAs+Nk=;
	b=aVyH3Y5/nh+C/lJee7pZZnWcelUMmazHlmL28bDtwCl3OPcxQC2L2yNv1Vf17a7StX
	cnUNQJgQKtNuSUPROAUPhYahB47F+eb6CbAfKjWsRzqR4aRy/IRb5p9rLW3WdkBTz5sQ
	aieT8fi7kvvqtuv2yPxatUGPfNMPV+QtyT1m28Oi/RimlX1TJ98Yo0ah7Bpkze4K5FZs
	uudhBWz8Ypc7x/TrF7OSZBO4qIZQ5yqTgWstdY4Lb3O74IKFdWDGIjJBF9vEvBEjmzSY
	GDELdZ9S6/5JAV0TbMFEvrR4Tga7wceImghRdWKC0OD9J5M1yGOqPE+J8QMNL6jQJeLh
	WAZw==
X-Gm-Message-State: AG10YOSyMieXAYxg4a4QDyxPsPmg9zTytYOMNWT70mg8OhTgvtBVosIzVUSPALrBQYJttzBV6YDxxv0I7niwAA==
MIME-Version: 1.0
X-Received: by 10.50.43.226 with SMTP id z2mr14014707igl.78.1456175170550;
	Mon, 22 Feb 2016 13:06:10 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 22 Feb 2016 13:06:10 -0800 (PST)
Date: Mon, 22 Feb 2016 22:06:10 +0100
Message-ID: <CALbNGRTeReXBitXWMQJ=ZbY-C2wayOaJJdDA4KSxQcRv8Kpnkw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Fetcher broken?
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
X-List-Received-Date: Mon, 22 Feb 2016 21:06:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

after all these scary changes in master oe-core I wanted to see what's
left over working since jethro for my images.

On thing noticed immediately: I see

WARNING: flex-native-2.6.0-r0 do_fetch: Checksum failure encountered
with download of
http://downloads.sourceforge.net/flex/flex-2.6.0.tar.bz2 - will
attempt other sources if available
WARNING: flex-native-2.6.0-r0 do_fetch: Renaming
/home/superandy/data/download/flex-2.6.0.tar.bz2 to
/home/superandy/data/download/flex-2.6.0.tar.bz2_bad-checksum_0103b909e19ca9c6497a7ae696c16480

but flex-native is build happily. Same for freetype-2.6.3. Are the
messages wrong positives or does oe build sources with wrong
checksums?

Andreas

