Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 624F77950F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 20:08:37 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b15-v6so17106055oib.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 13:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=wFDoXWWbboo+vev4dVLirZtPCHVH2DnzveuuUITgRFc=;
	b=jMs9meDd9bDliU8OnBh6gR8QK6AYBtgg8xPjy0oV+q6GyEAZxrZBkw6u1QgRjE/n5x
	tH6wnGdFKvk2pw98COKJax3w/wcI4WTQXwDwHAvcNwCj5IRongj0r7thuiB95m5KySw4
	4ohx8/zBcrnAzgZ3d21MIARJTX/LqBImpR9dvj4ciDTJknnW4NtRxZZwHbZPIqUpoDiZ
	NA1F71uiHBrzIcY/MA/QsBtoQ7Hu7YxkNxEjt3bN19/0HqMeGBgRwXNQSHmwpRxvC2oB
	6Lw7qFuutfpyCEkBzmNINdygbJX9Jun+JhRaSWeHwgF/2Zsv45EUXtlEFCSXh70jeU0w
	401Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=wFDoXWWbboo+vev4dVLirZtPCHVH2DnzveuuUITgRFc=;
	b=hSnOl6qPf8VLOaJqsXXVlnjuxJKFaPEyjSdZycploFikrp5QDfcPE5nCghtWD+haWb
	kDE82b2DolE8/6jBFynWLdVgf1tcERwkxa33bs0FZacKMPn1FCAnkY9ST+kjWw8KVJD6
	6YZfsrSG69Fo4p47u9gqaOex/RLZufuvaAh/BmlIb148VU5qtW8ghcP1D7J3GhTBOTzG
	W/Wvgn6vZY717rrIk0S1Zsv6nKsWIdq9448Y5nFV0N3Yy4pqmdcElYTk1G9tRHdz4V4a
	T2NGD3fE8Mry8iz0pKwrDA3cz1M94+uEQasWuD6nIdID1J+29OQT8dU//0OpZzpM+qIx
	0/+Q==
X-Gm-Message-State: APzg51BMiDEY+PVSKU7dJohTT6hjD8+O92F9brOa9dtKmM0SMkdmIoY9
	5Co/32wOE+PGQeUV1jLEBllEui0eYW3Nmg==
X-Google-Smtp-Source: ANB0VdY/zY1chGoudo03qISDuGD3BS3oYNaZO5DGuw/+44+SjY8GNy8gu/CnEbiEndroXXdahC4ZQw==
X-Received: by 2002:aca:bec2:: with SMTP id
	o185-v6mr14480711oif.22.1537128517786; 
	Sun, 16 Sep 2018 13:08:37 -0700 (PDT)
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com.
	[209.85.218.46]) by smtp.gmail.com with ESMTPSA id
	u68-v6sm3968670otb.81.2018.09.16.13.08.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 13:08:36 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f46.google.com with SMTP id v198-v6so17125637oif.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 13:08:36 -0700 (PDT)
X-Received: by 2002:aca:42c4:: with SMTP id
	p187-v6mr15197880oia.315.1537128515852; 
	Sun, 16 Sep 2018 13:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20180916135629.ADFDE440002@auh.yoctoproject.org>
In-Reply-To: <20180916135629.ADFDE440002@auh.yoctoproject.org>
Date: Sun, 16 Sep 2018 17:08:20 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqoMe7jc45fW5Q0YVgYnvSTqgxSXPrKvMF6=NE2NS1H0Q@mail.gmail.com>
Message-ID: <CAP9ODKqoMe7jc45fW5Q0YVgYnvSTqgxSXPrKvMF6=NE2NS1H0Q@mail.gmail.com>
To: auh@auh.yoctoproject.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] linux-firmware: upgrading to 44d4fca9922a252a0bd81f6307bcc072a78da54a SUCCEEDED
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
X-List-Received-Date: Sun, 16 Sep 2018 20:08:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 16, 2018 at 10:56 AM <auh@auh.yoctoproject.org> wrote:
> You are receiving this email because you are the maintainer
> of *linux-firmware* recipe and this is to let you know that the automatic attempt
> to upgrade the recipe to *44d4fca9922a252a0bd81f6307bcc072a78da54a* has Succeeded.

Pending, will send it soon.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

