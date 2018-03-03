Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 457F378A27
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Mar 2018 22:45:49 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id l12so11872157otj.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 14:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=VhpKX2mKN2i/7iL5dygpcGSVzpiLDtBBpA7B3mfzWuo=;
	b=vtpxSfcCurgD7HZEmt3FhUfq4gb2UYh/U0hZyZfq98qFrY6fR8ElxNF1yYNO+mLqyv
	FzInSADef9DVYRS247xD3vfPmfbpYbDS+FTGNB7CR1mqdeoskBB8PYh8p/jvSbEZxzSg
	nyvRTg9HyLFxHa/ptXb0sK48AbPJYC3fjlfxZvKJeE0T9WlDNX1iC4F/npKJQEablwka
	CmfZYU8Qhv2tsopHJBIq3DlJ9GFt+U0qHhZNuEJ+L7K2Wmgz7JGh8g/ok4NCP/ygdBl9
	X0XuK7DZzOW5T1E3wSCOIdMaiWJL98NJGOBYH72+7SNug/Y/gf4hdFTIVtCrUXcedzcU
	7aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=VhpKX2mKN2i/7iL5dygpcGSVzpiLDtBBpA7B3mfzWuo=;
	b=A4iW1BPdN+P0E7H/am7vIPQ5buvu/plPGmpHYb+zC1aBoG2N+z/zF7EoBo7b2uSZ8/
	gjEBMd3PTGYdPgsFpQKf6spgf9hZuDPGDXleZeuGvKHDx2H0BRX214MCr9rYvwDq7vin
	yH4mtIde1ur+0rSmbYo4GbpIS0/jg0xMJQpbs4SlXr0uLijDYQYOyARcrM+1UDgv+KZE
	V6OSMiqGooySBVPiwsITV9Iu8baRIJ7nfvqPLlLmQVUTlci5OKMVY5SyYq6WB2Ke51HE
	wfvK4TXqoxaIvI5Q/zFOCB4DhjDygOYDSyohmQsbQ8DfETsJsTszZw+W6Sia1QdlB4+R
	iVLQ==
X-Gm-Message-State: APf1xPA8aJLUomtyJ/r2qDmyYEumCzVTR4ANTH4YF9JD+8uAZLo3P2KW
	maoIbEb5MfPyBxoR7KuKvh/uYAPx
X-Google-Smtp-Source: AG47ELuHuJDyMQClSG1NZIGq+ut3ToGnvC6vhs62ZI3oz7SI44SWULBYYJsl6711Sqm+r4XJ6Nkybw==
X-Received: by 10.157.75.130 with SMTP id k2mr7353127otf.244.1520117150614;
	Sat, 03 Mar 2018 14:45:50 -0800 (PST)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	u203sm4507317oie.24.2018.03.03.14.45.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 14:45:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id c18so9564153oiy.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 14:45:48 -0800 (PST)
X-Received: by 10.202.179.214 with SMTP id c205mr6793474oif.315.1520117148266; 
	Sat, 03 Mar 2018 14:45:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Sat, 3 Mar 2018 14:45:47 -0800 (PST)
In-Reply-To: <CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
	<CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
	<CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
Date: Sat, 3 Mar 2018 19:45:47 -0300
X-Gmail-Original-Message-ID: <CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
Message-ID: <CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sat, 03 Mar 2018 22:45:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 3, 2018 at 9:44 AM, Matt Madison <matt@madison.systems> wrote:
>> Since it looks like I'll have to do a v5 on my series anyway, I can
>> pull in that backport for the aarch64 issue.
>
> sure,  I would suggest we keep 1.9 around as well.

I am against. Go is good to provide backward compatibility and keeping
both just causes people to delay the update. We have some time to
April release and thus any regression will be ironed out. Possibly
wait until 1.10.1 is out but keeping two releases I am unsure it is
needed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

