Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0E278F72
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 22:44:54 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w8so533052plq.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ajAU3NwI1aHYHvPxj+ajEbo4Gk/8xjGj76Goy7Olo3o=;
	b=jbgxRg8LabXLSIe7EzeRDbE6TrE4sYlKbxgLF3p5Ug2zdKiHGngFYfYAN9hWShiuWx
	zvB4lrk1v25MuBdGw6HQ0k74UNEcqpTmsglX1Uzy8l4Kcaen0IWGOe9cfcBNXs04FIRf
	0Na0HMAUnS54lMhHfaAt/IjisQE2Js3iSEwvym8codSnn4ivGhSNC2QfoWggueG4h3S4
	8o7DClNrojklJxWFa+vWbYKEAzd4N7KlWdqM4IIeY6cB1Hdjo2gG7FZKT8IhTF8nItYg
	TbhccivBRqgZT/spZJ/AFTstxopXISOx9vW9jNg0lcLmAZ0CkLiVA12Trf2v7rcVZ+OB
	pyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=ajAU3NwI1aHYHvPxj+ajEbo4Gk/8xjGj76Goy7Olo3o=;
	b=Hb+BLalqiAn20ZNRBWC/izY4sRz+9Z6WEzntzv2C6VT1sZ2uUXvL9x8kcLNT7ANFYU
	8V94rR+R26RMOk+XlOpXiAGSjVjdG9iYYUFR0jed4jZEj6cfHZ3INklGheGmvB4hYgOh
	toSVFJA5d2Gy5TEqiS10GvX/idaDAK4BYpulbxhRp53k5k6M4xuGJIfdtMlIvSJ8ZHpb
	/NZpeKm2G7RJb55ImeNPT+zVZJMV5kMvNc5hChBnlFYdwjLAZfHPSTHhPpaWBG5MunDk
	YS6Co9VL/5g3gdqLYoyXWCiRT/x5dQrp6HywSv+0P1/uNNYvnp9D+LAhRyjCgA6NedLe
	HwjQ==
X-Gm-Message-State: APjAAAX4UDFquCCFPYUcpgbPYjohN4goCecKBBH8S4mAL8QL+5gUNj5c
	gNrxd0hHNFOZmjnllVdnN3o=
X-Google-Smtp-Source: APXvYqwNYoAlU4kvTQ2ZMg9cOCNoUo7XZRCDj2Fbotsed05YBMUaMa+OsHudkoPdE3SKi+qiNaoo2w==
X-Received: by 2002:a17:902:4c:: with SMTP id 70mr2443205pla.30.1570056295467; 
	Wed, 02 Oct 2019 15:44:55 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:2c5e:3326:62f0:95f9?
	([2601:202:4180:a5c0:2c5e:3326:62f0:95f9])
	by smtp.gmail.com with ESMTPSA id q14sm395497pgf.74.2019.10.02.15.44.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Oct 2019 15:44:54 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
References: <4192571.iDR9UPTnyj@localhost.localdomain>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <93d8fa4a-c6ee-a529-5dec-f2b9857c0228@gmail.com>
Date: Wed, 2 Oct 2019 15:44:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4192571.iDR9UPTnyj@localhost.localdomain>
Subject: Re: 3.0 release notes / migration guide
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
X-List-Received-Date: Wed, 02 Oct 2019 22:44:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


Paul,

On 10/2/19 3:20 PM, Paul Eggleton wrote:
> Hi folks
>
> So it's that time again - we need to start building up the raw material=
 for=20
> the release notes and migration guide for the upcoming 3.0 release, and=
 I'd=20
> like to request some help with some parts of it - read on for details.
>
> For the migration guide we have a wiki page serving as a staging area:
>
>   https://wiki.yoctoproject.org/wiki/FutureMigrationGuide

Thanks for putting this together.

>
> Things that should go in the migration guide: *anything* in the release=
 that=20
> would require someone who is upgrading to take some form of action (i.e=
=2E=20
> change their configuration / recipes / etc.) Help with this from people=
 who=20
> implemented the changes or have already thought about / dealt with thei=
r=20
> impact would be much appreciated.
>
> There is a process where I look through all the commits since the last =
release=20
> and pull out the ones that need to be mentioned in some form - other th=
an the=20
> migration guide items, the following needs to be gathered for the relea=
se=20
> notes:
>
> 1) Features - new functionality. We need to capture what the feature is=
 and=20
> hopefully express the impact to the user succinctly.
We remove LSB support.

> 2) Recipe upgrades - straightforward
>
> 3) CVE fixes - fairly straightforward, I just look for commits that exp=
licitly=20
> mention "CVE". If I can easily do so I'll also note where a recipe upgr=
ade=20
> fixes a CVE, but that isn't often readily available information.
So how can the community help in this case? Better commit messages?

>
> 4) Known issues - generally this is difficult to get from the commits s=
ince we=20
> either find out about them after the commit that introduced the issue, =
or we=20
> don't know that they aren't addressed until right at the end of the rel=
ease.=20
> We don't want to note *all* open bugs, but if there's something that th=
e user=20
> is likely to hit that wasn't an issue in the previous release then we s=
hould=20
> note it.

Well, aren't open defects not fixed by the time we release time but we
intend on fixing after release a form of known issues ?

- armin


> For the release notes I need help with #4 and #1 in particular, so if y=
ou know=20
> about anything in this release that falls into these categories then le=
t me=20
> know - just a pointer to the commit and any extra comments that you wou=
ld want=20
> to make would be helpful. In the mean time I will start the process of =
looking=20
> through the commits and will add things to the migration guide page, bu=
t bear=20
> in mind I don't always have all of the context for every change.
>
> Thanks!
> Paul
>



