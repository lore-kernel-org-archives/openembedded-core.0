Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id E33A278726
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 13:34:02 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id t8so13114808oie.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=/ItZd4YGlcprsr+LWis1sblV0hpwbLWgFQAfcrruoSg=;
	b=CL1x3A5TaujvoP8ri7rX7yUkjcw8uj/vqrugWZuGNccAYaSXJ91V2O71YVxSajvyv6
	RLEbvuNJuVN4Ogldb6QbCOSNSGxvaXAQfp2V+NEq7Yq+CYs4GMbo+BlKBjYyonMwEfD7
	smMM+THTQci1Y8zH3rNHoYtlRdQl0+N9lzUWVqySBL31dh6xArPgCHmnpNaynEw03Na0
	yPLPSK68E9G/sr5qu+nEk4nQNOJDMgtcnYuZawKrZUwijNGCavUCCgVLOX+qiaFR7RYV
	/LzSiKnnRO2r3lu2WAR2NecVIdc+Spl9WZAsh3Ttfj07k88kg4SyJOAj7FZS8yLJZy3M
	6Zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=/ItZd4YGlcprsr+LWis1sblV0hpwbLWgFQAfcrruoSg=;
	b=r5rFj8/YM50DAETo9gqgeT3YmcXuExdAolzB22xUxv6p5yPQupkLW9ITzldZZMNyyU
	ERUiIo2d2ogNyR854pSi6X2fUAjZTDM63wfksnSW86VjHJ+TH9blGoNWYJ+K7soXr0Bc
	X7vhkRSUlnw0GX1sQAAmGr+6BnEIj0PRnQhXF8ZrhwAO6TaKDTKKqyPo7H3Ok8JddVFC
	vMpXDmp9DkLl0hFhDsQxpJvbOp4cjE+NgZFn+dKKvn6Zc0MNzRHJJJzs/tj10WkWNWBi
	hR06CR+DF/ejMNfeJOZLm2toAaFKfe295t1eUs2mHdKl+/sWSExXUXFkUsX/kXylZTV8
	7f2A==
X-Gm-Message-State: AKwxytcknK1tjej5QvhHtC8hO4t6PQk9KQPJQbHRsA11ENL4LpbF9G1U
	jP+op0ffg9urt5fTPFmZR4RWVmYq
X-Google-Smtp-Source: ACJfBotUCrhzXko2/CiNXmgJ49VEU3ql31oJYgsFLNdqLRwF/F19AFYx2RxrptLjlXIBr3SGUWeMJg==
X-Received: by 10.202.74.3 with SMTP id x3mr1029916oia.199.1516196043580;
	Wed, 17 Jan 2018 05:34:03 -0800 (PST)
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com.
	[74.125.82.171]) by smtp.gmail.com with ESMTPSA id
	j67sm2074279otc.39.2018.01.17.05.34.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jan 2018 05:34:02 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f171.google.com with SMTP id 37so16791017otv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 05:34:02 -0800 (PST)
X-Received: by 10.157.85.18 with SMTP id l18mr1068580oth.177.1516196041758;
	Wed, 17 Jan 2018 05:34:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Wed, 17 Jan 2018 05:34:01 -0800 (PST)
In-Reply-To: <CAJTo0LaMzcg4uWMDO8kQw2-OVuGAAAg6MF4m6E-mz4kJJRAxuw@mail.gmail.com>
References: <20180117131155.2297-1-otavio@ossystems.com.br>
	<20180117131155.2297-3-otavio@ossystems.com.br>
	<CAJTo0LYONEvXNkEYzanBQXseap_vG=5BA9sRbRtXsK+PdwLwHA@mail.gmail.com>
	<CAP9ODKrpR3c2a-8rwoCQOV_RztL_SJFDDgU6qvhZwQBB-5wnWg@mail.gmail.com>
	<CAJTo0LaMzcg4uWMDO8kQw2-OVuGAAAg6MF4m6E-mz4kJJRAxuw@mail.gmail.com>
Date: Wed, 17 Jan 2018 11:34:01 -0200
X-Gmail-Original-Message-ID: <CAP9ODKovqG0rzUPTrv4gHgCJCRH16vpY8bOQeUxPHKtoUNH3RQ@mail.gmail.com>
Message-ID: <CAP9ODKovqG0rzUPTrv4gHgCJCRH16vpY8bOQeUxPHKtoUNH3RQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/3] cmake: upgrade 3.9.5 -> 3.10.1
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
X-List-Received-Date: Wed, 17 Jan 2018 13:34:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 17, 2018 at 11:28 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 17 January 2018 at 13:22, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> I believe it is looking for the utils inside sysroot now. Do you think
>> it makes sense to avoid the dependency?
>
>
> Yes, we don't need to build it as make is in HOSTTOOLS.
>
> Can you just tell it where to find the make, or even better just tell it to
> run "make"?
>
> (also, I've patches to switch cmake from make to ninja)

Please send me your patches (or branch) so I send it all together. I
will see if I find the change.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

