Return-Path: <george.mccollister@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 955A37F7B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 20:16:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 94so2895849oty.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y4r3MQVO22vqYdgK+MeeImAUDZxsDz8BXR+6XTVtgx8=;
	b=BGdQCzDQcdJH0rgr8gAB0YGbkVjkillAN+/OI+20MPIJmf7549QwTZRolHJNd0dXHq
	Y5C0G7piyYYiuz97WA/ilWQrmI/FUKSGKwyueqwqBRQU5f8hbLTZcv5RpNgAClAbQEwo
	4jXtz9kpXvgC9MZePxavg3Ov6e2W/n1P55a2QhDeCvrnswUWlg/wMRx5erWX9Q6xaTks
	TgCJZCJO9Lezs2PgY52Wzq5kzxqdfJM9wgJTxUeMC9pG1dPcY3meJyEtmuHrTcMBD8t6
	RFi+5KJocQq2W4V0IFFzWSXqiZ9sinkWylRAaUOz93lCcT8fnM94Al7MFWx8D+mREqxT
	ks7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y4r3MQVO22vqYdgK+MeeImAUDZxsDz8BXR+6XTVtgx8=;
	b=h0k1f3A3jK9bGJ+Sz5X5fnrvkg2N0LdQYzqIBdJIC7hLwhWHC0kIEBblHiqTe6IGEO
	IeY0GngwyWdTWcz21H1MVrSRZDFrSWXqWHxreTkjTsTJEb+qAat6/VplpE5e+XGBZguv
	AGGTarsmY93Py7VYHVSzD3E9B9pzM7JNUKcaFgGzjKN3gOUlKlliYDfLMYrg6NZfVc61
	nhRjMqf4QkZPzIngO0Y7uwagbKlSJzbj6KbUop/ZGKmYIeh2FKFt7yKGTeJHPevEZyKg
	DmPFxxSHdPe/rd1KySQ9ruWxaGeDaDHaVrYzb8vMyHiph4xzCGsQw0yX/UEPa6IU2Uw5
	j2gw==
X-Gm-Message-State: APjAAAXfItX6amyfkzYQ2seY+41K1uQ+KaA7pdf7VIN6YUsoBNhh0PSp
	C6PMTf8ypla0W5+McQooROO8OpF0R8wyiYiDI/LwqpY=
X-Google-Smtp-Source: APXvYqyrrtS/CGBC+GT5XrZ5oIT09aZKix2EUGsq2lne6AcJbIGTpQxNnd63dCnKF4+4nNUktgfoCKQCNA4tRFMpI+E=
X-Received: by 2002:a05:6830:10cc:: with SMTP id
	z12mr4408047oto.110.1572034613608; 
	Fri, 25 Oct 2019 13:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190925115259.26437-1-george.mccollister@gmail.com>
	<20190925115259.26437-2-george.mccollister@gmail.com>
In-Reply-To: <20190925115259.26437-2-george.mccollister@gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Fri, 25 Oct 2019 15:16:41 -0500
Message-ID: <CAFSKS=OQQNyi-f1tir1ZPjZd-VDROxM7F5herSQkUcNQt_6GeQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] openssl: make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Fri, 25 Oct 2019 20:16:53 -0000
Content-Type: text/plain; charset="UTF-8"

Can we get 59565fec0b3f3e24eb01c03b671913599cd3134d cherry-picked to
warrior now that this has landed in master?

Thanks,
George

