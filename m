Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 193CD77BCD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 22:16:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 77so48436723wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=SwtV2uEjeb7UCowK6ptqYuLeL34wmo956rmT7cdjbSo=;
	b=EtQHb2Y/p00kOTummpH6HJFMIZ80amLhE9aQpDVZTpweDyzr0ThTGFFk4p7R+44aON
	7ELjMmQ7BwOwS6ELWNlgwHo/ZQegcEaSAVtykMsbggg4cvc4zsMeqVRlMKDTR5t86vLh
	pWg6+RtkHSQzUwrPh+ZiycEkD8Xj3XujdmMpf2pjZgd0W2xqTuV8N2gRUEedALEle+zu
	xDD1TMIL2ex7mBxcAzFGG4OhpEGDdsfWmX2A3bKpAEXtkQ3U9vEMFidAIC/cg5uJOTUS
	gjhVDvZmFGXet3uSvUQ6sRzPeISd7TwhgDVo4ptNdo8FugJHkej0k/r4/jQRJUX+JTg1
	IZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=SwtV2uEjeb7UCowK6ptqYuLeL34wmo956rmT7cdjbSo=;
	b=NHuZYPvTdmPZzS5wbSC6lloVNHY6fUZTmjPAhAMR7DPRJDmCrg6BQasiMspB3kapzV
	qWKNxlDv+7SEbovdWM6R5eyFPeCXgrL5mq/ZZ1NolFxSLEavSW5N6FEfUcSNbpHvNU5o
	L/TsE65b+XczfMFf68Dp48j41fyhDr02rAOftoT/0PGvLEPasn55ZX+od1LNFBdC9GCJ
	C1rLg2T0oZvid3wAR0IDhtwtuUfmP7EVTEPadH9P0rjNETaILojeCxExUFgrpNi+kdS6
	nkHmzENXFckyUilMuJEnVs2i1bpV9KbxkcE+cEiAtgwQ5JpieCUsIYXdXxfzuTJzvQWu
	lNjw==
X-Gm-Message-State: AKS2vOwcCdQBrDNK6CL4XHNdwaGbfUyEJN/a6xFwPPNn+91guMdxH37I
	9iQ5m9GKvkB0I24euX0=
X-Received: by 10.223.164.83 with SMTP id e19mr39819285wra.101.1499206617560; 
	Tue, 04 Jul 2017 15:16:57 -0700 (PDT)
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com.
	[74.125.82.53]) by smtp.gmail.com with ESMTPSA id
	92sm21288233wrb.55.2017.07.04.15.16.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jul 2017 15:16:56 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f53.google.com with SMTP id f67so95725124wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 15:16:56 -0700 (PDT)
X-Received: by 10.28.18.144 with SMTP id 138mr4342144wms.118.1499206616112;
	Tue, 04 Jul 2017 15:16:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.209.14 with HTTP; Tue, 4 Jul 2017 15:16:55 -0700 (PDT)
In-Reply-To: <CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
References: <CAJTo0LZ85U2djZGW4rzK7uumBkutYb91yXY40irYyAVvCKOBRQ@mail.gmail.com>
	<20170704153229.6628-1-sledz@dresearch-fe.de>
	<CAP9ODKqtEV8B1MqKMhZbG0mY7DTfK7EVi-M39roTqp5dvPeS1g@mail.gmail.com>
	<CAJTo0LbK1brj7Xd_LeOZNf8ZkCHfRHXVujtKeAXGDxvJnT0cfw@mail.gmail.com>
Date: Tue, 4 Jul 2017 19:16:55 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
Message-ID: <CAP9ODKrfKZqLkcb+c4Yk8CHtPMCrLQqgwiNN7ad4O__ZzuNgAg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Tue, 04 Jul 2017 22:16:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 4, 2017 at 7:11 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 July 2017 at 23:08, Otavio Salvador <otavio.salvador@ossystems.com.br>
> wrote:
>>
>> Ross, please apply it as it has been causing problems for many users.
>> It is applied in master
>> OE-Core:5d3df78367be0afbfe001b4fa776a98a82e6ce54
>
> I would, but I'm not Pyro maintainer ...

Sorry, who is? I must have missed the announcement.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

