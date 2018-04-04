Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A0B7974D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 16:46:19 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id q71-v6so19847430oic.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 09:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9Crit87jfVdzweHGGpUV74Ws7cYL5Z5SdnEoefunGXI=;
	b=yqydq3DTAJDNJCQ+zeIk/0PTh3GnHKvdwAuTtCCK8Ry4pKyc/ZWoscPdDw4xQqqHtJ
	7iqe2esGxI1avrvRc0aGtfXqZxR8qowsHgHROG5rl16hMANu8CHcj9qpUJw7WNvy7fL4
	F8jw6OwF1iWdc4Vl6exwotdSy3Al6Bsttb/Nx++cUQ8IzbVDcbqfEb6FkpHE0X9UdQ0H
	S8LEoTu/pWnvKmhVGUBvD4Jp/BuEBmv9oE0bZiWeiN9EnkldsCfx5kXOiCZX9MQPsK+C
	mxtI/Xly+j/RgM4QpiD5diobumQwyPlGXtRjcYU5r3IVm3nNV81yIXDcPIeJl1PRirtS
	p3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9Crit87jfVdzweHGGpUV74Ws7cYL5Z5SdnEoefunGXI=;
	b=hBEoqBiQAanyLK4GX5qKOBksa/EqGur1DgZddNosWPknmObjA+5rBe4jeirWi1Bq8v
	VDQfU8hyjEj96piXzkEXzNwL8k5Q9lArkDU0aXCAME0RiD9E5w4pwvva5lv/Nn4UDLf1
	q3Mb32OEdWixHEGSq3EbGOkCs1HMmfhhH6dl59BjFAybuO/dde6pJ8aaOnMWqIxOvmuC
	42j9MWRbtr9BVclP9kelcaHX8nOdbIPmQvqmveHldMqueCibUL6mfKXyTTe+F1ao/nf7
	SwJLhOfOu7rfox3lkrXBSXDhFBwijzbT0KV+tlQKWE+vyx0JNA0/OxS2N7AZbml2ctIa
	4JCQ==
X-Gm-Message-State: ALQs6tB3VNi97pMQENE7GYAUUZx68+t0+vfXE7eEt8B7R5cY23mattaQ
	Ml4ZvLci5KCOEQp3j//K5HgTKo0t
X-Google-Smtp-Source: AIpwx49Blro70WL4LNDNH2dfLGXIZjZX55AikOr9N0jWRcENw1bSK166OCWB74x4uukKTBTUzVW6Tg==
X-Received: by 2002:aca:a948:: with SMTP id
	s69-v6mr10910557oie.127.1522860380043; 
	Wed, 04 Apr 2018 09:46:20 -0700 (PDT)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182]) by smtp.gmail.com with ESMTPSA id
	o206-v6sm3127496oif.34.2018.04.04.09.46.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 09:46:18 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id i28-v6so24075152otf.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 09:46:18 -0700 (PDT)
X-Received: by 2002:a9d:5186:: with SMTP id
	y6-v6mr2654703otg.125.1522860377847; 
	Wed, 04 Apr 2018 09:46:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:58ca:0:0:0:0:0 with HTTP;
	Wed, 4 Apr 2018 09:46:17 -0700 (PDT)
In-Reply-To: <CALbNGRQ=-xQsYDEjpxex6uscd=5rVgnETFkgVYRJPV_WZ5Reag@mail.gmail.com>
References: <20180403210146.6040-1-otavio@ossystems.com.br>
	<20180403213259.2391.8021@do.openembedded.org>
	<CAP9ODKr9yxFHc0SEzCiN5ekGNKUL8Z3LA_AWsY6DYn3tTYkFtA@mail.gmail.com>
	<CALbNGRQ=-xQsYDEjpxex6uscd=5rVgnETFkgVYRJPV_WZ5Reag@mail.gmail.com>
Date: Wed, 4 Apr 2018 13:46:17 -0300
X-Gmail-Original-Message-ID: <CAP9ODKo90vJdt4ZkMYRsg88-7qtCHMAPz4aOw+V+3YEuzoSggg@mail.gmail.com>
Message-ID: <CAP9ODKo90vJdt4ZkMYRsg88-7qtCHMAPz4aOw+V+3YEuzoSggg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2E6IFVwZ3JhZGUgMTcuMy43IC0+IDE3LjMuOA==?=
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
X-List-Received-Date: Wed, 04 Apr 2018 16:46:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2018 at 9:43 AM, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> On Wed, Apr 4, 2018 at 1:11 AM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Tue, Apr 3, 2018 at 6:32 PM, Patchwork
>> <patchwork@patchwork.openembedded.org> wrote:
>>> =3D=3D Series Details =3D=3D
>>>
>>> Series: mesa: Upgrade 17.3.7 -> 17.3.8
>> ...
>>> * Issue             Series does not apply on top of target branch [test=
_series_merge_on_head]
>>>   Suggested fix    Rebase your series on top of targeted branch
>>>   Targeted branch  master (currently at 4cedddb836)
>>
>> I based the patch on top of sumo-next to avoid the need of rebasing it
>> for Ross and Richard. If it is indeed need to redo this on top of
>> current sumo/master please let me know and I can do it promptly.
>>
> Hi Otavio,
>
> * It is likely that my two mesa patches (dri2/dri3 related) bug you
> * just checked: master-(next) and sumo(-next) are all identical from
> mesa perspective - so rebase against master should do
>
> Hope that helps

It rebased without conflicts but in any case I sent a v2.


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

