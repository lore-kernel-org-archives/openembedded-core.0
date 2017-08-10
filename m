Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id EB9E1781C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 13:58:41 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id f11so7389517oic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jmjQZ015jsDO0u3zprxjcmgX25hkyroPv3FrKz2jEqY=;
	b=YrEMiH2SzfFPrqCRQ5Iv49FXgQBG8PlRIdoZmah4zfFwJ1jeDBjsM26wUxJAIvPndH
	d0snmDlwB1kTP9PsIeov++3aFQ9CKWh3YobovP/wp8igdoTbSp6Gm5a1jkeytHhPRx7r
	0q3dZu9A4DAz7QKUWG1TPn1H0Bz6Rtp0F815sN3A5n92NY73f91PwM84jYDH+dXF4NRv
	392sEJGJDnTfxjLFOFTIssah4dYtqdJu9/MatMz1EnCYhU+AfVeEaphcx24V19xvYBRD
	sJBXknRhpgbwXIHTaabMgo6/iUNEaVne5DjfEbGfk6YB2xH3/kGTuhHQH8B/aWqRaeZB
	wfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jmjQZ015jsDO0u3zprxjcmgX25hkyroPv3FrKz2jEqY=;
	b=mhNaxqB8wulXoQQSPXBwVe2o9geW3iAV9ulWyPVC3UxzvJQLOAKLKw+gERa4MNGqLs
	aw5nd/KNCv7ny3soQTAPaSXORmOmzb96Q6MncUO8v6ms5I9LeAGIO+J/lrGVVL1RuGPp
	Hv8JOvcLpyvrXa5qF8eL8bWZZVJMlZM5n9RKpeOs8Wcxm858jwhY42MrGI37en8gq/7G
	PisF52G9+6Hf2ioSddO5YzXgmiWsKwYM4EaSO9fbDdEHeZ9/jmy9KSHnIGTt6/bHnxXf
	h8e3V0bfySjhZNT/UhbS6GLeultDMYNuCSlB/zYUSS8qzVLm5OJh4j16U3BV4WYRKZo/
	QO3w==
X-Gm-Message-State: AHYfb5g6FzEAZ0pIqFNB0gdV0LdRJikD1rzAY29LsuoNTVvEMSNkIbFO
	O6Cggt5L5gbXhgt6jfM=
X-Received: by 10.202.62.4 with SMTP id l4mr13987924oia.109.1502373522434;
	Thu, 10 Aug 2017 06:58:42 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	l206sm6128389oia.46.2017.08.10.06.58.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Aug 2017 06:58:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id f11so7388447oic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 06:58:40 -0700 (PDT)
X-Received: by 10.202.78.200 with SMTP id c191mr13752204oib.171.1502373520419; 
	Thu, 10 Aug 2017 06:58:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.247.10 with HTTP; Thu, 10 Aug 2017 06:58:39 -0700 (PDT)
In-Reply-To: <20170810093755.6342-1-schnitzeltony@googlemail.com>
References: <20170810093755.6342-1-schnitzeltony@googlemail.com>
Date: Thu, 10 Aug 2017 10:58:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpv1DoPGP=eYm5moYKV9W1hLDBohUW31rvvJmiUFJ=9Fg@mail.gmail.com>
Message-ID: <CAP9ODKpv1DoPGP=eYm5moYKV9W1hLDBohUW31rvvJmiUFJ=9Fg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: update to 17.1.6
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
X-List-Received-Date: Thu, 10 Aug 2017 13:58:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2017 at 6:37 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Optional installation of khrplatform.h was implemented upstream by a slig=
htly
> different approach -> 0001-mapi-Only-install-khrplatform.h-with-EGL-or-GL=
ES.patch
> can be removed.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

