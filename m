Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 75A6A6B54F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:06:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id f14so6165413wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=hZEhlDTqDvmQEWPGySEfqeu5gjYIjtepy8SS+Kkrb+g=;
	b=gNKLvYOCZxHmJmHPzqVO20tYmdeAwqHrwy8e6PACH658Yjsh/jmWXsIWb0n2mhy2Ku
	MKM0Wfqh72k6+lrQYopv1gKlhdPFrrvrZ+6fo+23UM3PoHhjWsRctN2GTsvSEBMNAbS6
	7Lkfxl4eL0n4UbXJszuKvgfQP6TOJrpGiW0MU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hZEhlDTqDvmQEWPGySEfqeu5gjYIjtepy8SS+Kkrb+g=;
	b=rIXKIZesMM8PGip/muQeRgwfj4J7IkieGKqYdEbTk9L3MMnp7UkujwxxDdXfQm7LLx
	AiA68zuImgCsDtqnWMOPwr/aGcLsna2deFA+h/IZhN63YuDNdmkIPQFEMmqMm7ISdZG9
	W0bvaBgoCvoxQuk0UgcDNG1Z7sYOrCIj9flaCkkHjeqa6jx/O93yujRYKqeW7nsisclT
	lozd7jV6QuynE+QjdSjuyIvGzgxl6jkq1p9yMAIb/VF7wfKnLeognUW39f/CKoXEZPFj
	9eyFT6gTFeOOGC7/5Zr618uRnI9sqJsq/OI8Z+mjZIaEqn+l3Nzl/aK2O7eGMqSkxG6N
	+BGA==
X-Gm-Message-State: APjAAAUX3KVWZlVayxI+NCaSLm9lws9bLEl2FfUXahh3ifECmB7SzliC
	NrNHbXGA0K0FC17gV7H+R+xXgw==
X-Google-Smtp-Source: APXvYqzfsY5jivDbiBypaSJ675lnR/dqD4Yyht3Ua7NxHa7sjN2AGEf7wSMHeUv/2N6oPtTkibQ0+Q==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr13184682wro.283.1551715609847;
	Mon, 04 Mar 2019 08:06:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p6sm25043839wre.63.2019.03.04.08.06.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Mar 2019 08:06:49 -0800 (PST)
Message-ID: <c35172f8efc2e7d16a7915037f4b0d412d1707c0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>, Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 04 Mar 2019 16:06:47 +0000
In-Reply-To: <20190304155845.GP5026@bill-the-cat>
References: <20190303204731.GK5026@bill-the-cat>
	<CAJdd5GYLLN4OB+wRsFGN10Cs2ybvKNcM_TP5pMHRdycf0M_Lsg@mail.gmail.com>
	<20190303212515.GL5026@bill-the-cat>
	<CAJdd5GbdpUCenci29Pk16vzhFDR=rMb_sd9CWD15pHreFPQfDw@mail.gmail.com>
	<20190304155845.GP5026@bill-the-cat>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: sstate hash equivalence breaks rm_work
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
X-List-Received-Date: Mon, 04 Mar 2019 16:06:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-03-04 at 10:58 -0500, Tom Rini wrote:
> Ah, so "poky" got me thinking this morning.  I was just on bitbake
> v1.40
> (since I usually use thud, and that's the version for that).  Moving
> to
> bitbake master/tip and I don't see the problem anymore.
> 
> Is it possible to have some logic within OE to check the version of
> bitbake and throw an error / warning?

You mean like the BB_MIN_VERSION variable:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/sanity.conf#n6

?

:)

The changes were intended to be backwards compatible hence it wasn't
bumped. Clearly something isn't playing as intended...

Cheers,

Richard


